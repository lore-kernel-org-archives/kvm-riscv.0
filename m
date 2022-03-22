From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Mar 2022 15:51:54 -0700
Subject: [PATCH v2 16/26] KVM: x86/mmu: Cache the access bits of shadowed
 translations
In-Reply-To: <YjGgjTnP/9sG8L+2@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-17-dmatlack@google.com>
 <YjGgjTnP/9sG8L+2@xz-m1.local>
Message-ID: <CALzav=fZQYC7YyTbZqbkYTYVUXCq4skc6pkQ2S59BoSxbkKUhw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 16, 2022 at 1:32 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:18AM +0000, David Matlack wrote:
> > In order to split a huge page we need to know what access bits to assign
> > to the role of the new child page table. This can't be easily derived
> > from the huge page SPTE itself since KVM applies its own access policies
> > on top, such as for HugePage NX.
> >
> > We could walk the guest page tables to determine the correct access
> > bits, but that is difficult to plumb outside of a vCPU fault context.
> > Instead, we can store the original access bits for each leaf SPTE
> > alongside the GFN in the gfns array. The access bits only take up 3
> > bits, which leaves 61 bits left over for gfns, which is more than
> > enough. So this change does not require any additional memory.
>
> I have a pure question on why eager page split needs to worry on hugepage
> nx..
>
> IIUC that was about forbidden huge page being mapped as executable.  So
> afaiu the only missing bit that could happen if we copy over the huge page
> ptes is the executable bit.
>
> But then?  I think we could get a page fault on fault->exec==true on the
> split small page (because when we copy over it's cleared, even though the
> page can actually be executable), but it should be well resolved right
> after that small page fault.
>
> The thing is IIUC this is a very rare case, IOW, it should mostly not
> happen in 99% of the use case?  And there's a slight penalty when it
> happens, but only perf-wise.
>
> As I'm not really fluent with the code base, perhaps I missed something?

You're right that we could get away with not knowing the shadowed
access permissions to assign to the child SPTEs when splitting a huge
SPTE. We could just copy the huge SPTE access permissions and then let
the execute bit be repaired on fault (although those faults would be a
performance cost).

But the access permissions are also needed to lookup an existing
shadow page (or create a new shadow page) to use to split the huge
page. For example, let's say we are going to split a huge page that
does not have execute permissions enabled. That could be because NX
HugePages are enabled or because we are shadowing a guest translation
that does not allow execution (or both). We wouldn't want to propagate
the no-execute permission into the child SP role.access if the
shadowed translation really does allow execution (and vice versa).

>
> >
> > In order to keep the access bit cache in sync with the guest, we have to
> > extend FNAME(sync_page) to also update the access bits.
>
> Besides sync_page(), I also see that in mmu_set_spte() there's a path that
> we will skip the rmap_add() if existed:
>
>         if (!was_rmapped) {
>                 WARN_ON_ONCE(ret == RET_PF_SPURIOUS);
>                 kvm_update_page_stats(vcpu->kvm, level, 1);
>                 rmap_add(vcpu, slot, sptep, gfn);
>         }
>
> I didn't check, but it's not obvious whether the sync_page() change here
> will cover all of the cases, hence raise this up too.

Good catch. I will need to dig into this more to confirm but I think
you might be right.

>
> >
> > Now that the gfns array caches more information than just GFNs, rename
> > it to shadowed_translation.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
> >  arch/x86/include/asm/kvm_host.h |  2 +-
> >  arch/x86/kvm/mmu/mmu.c          | 32 +++++++++++++++++++-------------
> >  arch/x86/kvm/mmu/mmu_internal.h | 15 +++++++++++++--
> >  arch/x86/kvm/mmu/paging_tmpl.h  |  7 +++++--
> >  4 files changed, 38 insertions(+), 18 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index f72e80178ffc..0f5a36772bdc 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -694,7 +694,7 @@ struct kvm_vcpu_arch {
> >
> >       struct kvm_mmu_memory_cache mmu_pte_list_desc_cache;
> >       struct kvm_mmu_memory_cache mmu_shadow_page_cache;
> > -     struct kvm_mmu_memory_cache mmu_gfn_array_cache;
> > +     struct kvm_mmu_memory_cache mmu_shadowed_translation_cache;
>
> I'd called it with a shorter name.. :) maybe mmu_shadowed_info_cache?  No
> strong opinion.
>
> >       struct kvm_mmu_memory_cache mmu_page_header_cache;
> >
> >       /*
>
> [...]
>
> > diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
> > index b6e22ba9c654..c5b8ee625df7 100644
> > --- a/arch/x86/kvm/mmu/mmu_internal.h
> > +++ b/arch/x86/kvm/mmu/mmu_internal.h
> > @@ -32,6 +32,11 @@ extern bool dbg;
> >
> >  typedef u64 __rcu *tdp_ptep_t;
> >
> > +struct shadowed_translation_entry {
> > +     u64 access:3;
> > +     u64 gfn:56;
>
> Why 56?

I was going for the theoretical maximum number of bits for a GFN. But
that would be 64 - 12 = 52... so I'm not sure what I was thinking
here.

I'll switch it to 52 and add a comment.

>
> > +};
>
> Thanks,
>
> --
> Peter Xu
>

