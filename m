From: David Matlack <dmatlack@google.com>
Date: Thu, 12 May 2022 09:10:59 -0700
Subject: [PATCH v4 03/20] KVM: x86/mmu: Derive shadow MMU page role from
 parent
In-Reply-To: <CAJhGHyDQn=atFmn5o2TREW9cSY5Tv1F1vsSekzor6uYQxDgcfQ@mail.gmail.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-4-dmatlack@google.com>
 <75fbbcb6-d9bb-3d30-0bf4-fbf925517d09@gmail.com>
 <CALzav=dmseUw6khErkiSV7T5K88QvaRvWvBpvrb6VNOQTE3bQQ@mail.gmail.com>
 <CAJhGHyDQn=atFmn5o2TREW9cSY5Tv1F1vsSekzor6uYQxDgcfQ@mail.gmail.com>
Message-ID: <CALzav=e0VnYar=jUr+C=uhVf9O6NDXaHx2rW-+yUocdHVk39Mg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 9, 2022 at 7:58 PM Lai Jiangshan <jiangshanlai@gmail.com> wrote:
>
> ()
>
> On Tue, May 10, 2022 at 5:04 AM David Matlack <dmatlack@google.com> wrote:
> >
> > On Sat, May 7, 2022 at 1:28 AM Lai Jiangshan <jiangshanlai@gmail.com> wrote:
> > >
> > >
> > >
> > > On 2022/4/23 05:05, David Matlack wrote:
> > > > Instead of computing the shadow page role from scratch for every new
> > > > page, derive most of the information from the parent shadow page.  This
> > > > avoids redundant calculations and reduces the number of parameters to
> > > > kvm_mmu_get_page().
> > > >
> > > > Preemptively split out the role calculation to a separate function for
> > > > use in a following commit.
> > > >
> > > > No functional change intended.
> > > >
> > > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > > Signed-off-by: David Matlack <dmatlack@google.com>
> > > > ---
> > > >   arch/x86/kvm/mmu/mmu.c         | 96 +++++++++++++++++++++++-----------
> > > >   arch/x86/kvm/mmu/paging_tmpl.h |  9 ++--
> > > >   2 files changed, 71 insertions(+), 34 deletions(-)
> > > >
> > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > index dc20eccd6a77..4249a771818b 100644
> > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > > @@ -2021,31 +2021,15 @@ static void clear_sp_write_flooding_count(u64 *spte)
> > > >       __clear_sp_write_flooding_count(sptep_to_sp(spte));
> > > >   }
> > > >
> > > > -static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
> > > > -                                          gfn_t gfn,
> > > > -                                          gva_t gaddr,
> > > > -                                          unsigned level,
> > > > -                                          bool direct,
> > > > -                                          unsigned int access)
> > > > +static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu, gfn_t gfn,
> > > > +                                          union kvm_mmu_page_role role)
> > > >   {
> > > > -     union kvm_mmu_page_role role;
> > > >       struct hlist_head *sp_list;
> > > > -     unsigned quadrant;
> > > >       struct kvm_mmu_page *sp;
> > > >       int ret;
> > > >       int collisions = 0;
> > > >       LIST_HEAD(invalid_list);
> > > >
> > > > -     role = vcpu->arch.mmu->root_role;
> > > > -     role.level = level;
> > > > -     role.direct = direct;
> > > > -     role.access = access;
> > > > -     if (role.has_4_byte_gpte) {
> > > > -             quadrant = gaddr >> (PAGE_SHIFT + (PT64_PT_BITS * level));
> > > > -             quadrant &= (1 << ((PT32_PT_BITS - PT64_PT_BITS) * level)) - 1;
> > > > -             role.quadrant = quadrant;
> > > > -     }
> > >
> > >
> > > I don't think replacing it with kvm_mmu_child_role() can reduce any calculations.
> > >
> > > role.level, role.direct, role.access and role.quadrant still need to be
> > > calculated.  And the old code is still in mmu_alloc_root().
> >
> > You are correct. Instead of saying "less calculations" I should have
> > said "eliminates the dependency on vcpu->arch.mmu->root_role".
> >
> > >
> > > I think kvm_mmu_get_shadow_page() can keep the those parameters and
> > > kvm_mmu_child_role() is only introduced for nested_mmu_get_sp_for_split().
> > >
> > > Both kvm_mmu_get_shadow_page() and nested_mmu_get_sp_for_split() call
> > > __kvm_mmu_get_shadow_page() which uses role as a parameter.
> >
> > I agree this would work, but I think the end result would be more
> > difficult to read.
> >
> > The way I've implemented it there are two ways the SP roles are calculated:
> >
> > 1. For root SPs: Derive the role from vCPU root_role and caller-provided inputs.
> > 2. For child SPs: Derive the role from parent SP and caller-provided inputs.
> >
> > Your proposal would still have two ways to calculate the SP role, but
> > split along a different dimension:
> >
> > 1. For vCPUs creating SPs: Derive the role from vCPU root_role and
> > caller-provided inputs.
> > 2. For Eager Page Splitting creating SPs: Derive the role from parent
> > SP and caller-provided inputs.
> >
> > With your proposal, it is less obvious that eager page splitting is
> > going to end up with the correct role. Whereas if we use the same
> > calculation for all child SPs, it is immediately obvious.
>
>
> In this patchset, there are still two ways to calculate the SP role
> including the one in mmu_alloc_root() which I dislike.

My point is there will be two ways to calculate the SP role either
way. Can you explain why you dislike calculating the role in
mmu_alloc_root()? As you point out later, that code will disappear
anyway as soon as your series is merged.

>
> The old code is just moved into mmu_alloc_root() even kvm_mmu_child_role()
> is introduced.
>
> >
> > >
> > >
> > >
> > > > -
> > > >       sp_list = &vcpu->kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
> > > >       for_each_valid_sp(vcpu->kvm, sp, sp_list) {
> > > >               if (sp->gfn != gfn) {
> > > > @@ -2063,7 +2047,7 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
> > > >                        * Unsync pages must not be left as is, because the new
> > > >                        * upper-level page will be write-protected.
> > > >                        */
> > > > -                     if (level > PG_LEVEL_4K && sp->unsync)
> > > > +                     if (role.level > PG_LEVEL_4K && sp->unsync)
> > > >                               kvm_mmu_prepare_zap_page(vcpu->kvm, sp,
> > > >                                                        &invalid_list);
> > > >                       continue;
> > > > @@ -2104,14 +2088,14 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
> > > >
> > > >       ++vcpu->kvm->stat.mmu_cache_miss;
> > > >
> > > > -     sp = kvm_mmu_alloc_page(vcpu, direct);
> > > > +     sp = kvm_mmu_alloc_page(vcpu, role.direct);
> > > >
> > > >       sp->gfn = gfn;
> > > >       sp->role = role;
> > > >       hlist_add_head(&sp->hash_link, sp_list);
> > > > -     if (!direct) {
> > > > +     if (!role.direct) {
> > > >               account_shadowed(vcpu->kvm, sp);
> > > > -             if (level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
> > > > +             if (role.level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
> > > >                       kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn, 1);
> > > >       }
> > > >       trace_kvm_mmu_get_page(sp, true);
> > > > @@ -2123,6 +2107,51 @@ static struct kvm_mmu_page *kvm_mmu_get_page(struct kvm_vcpu *vcpu,
> > > >       return sp;
> > > >   }
> > > >
> > > > +static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
> > > > +{
> > > > +     struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
> > > > +     union kvm_mmu_page_role role;
> > > > +
> > > > +     role = parent_sp->role;
> > > > +     role.level--;
> > > > +     role.access = access;
> > > > +     role.direct = direct;
> > > > +
> > > > +     /*
> > > > +      * If the guest has 4-byte PTEs then that means it's using 32-bit,
> > > > +      * 2-level, non-PAE paging. KVM shadows such guests using 4 PAE page
> > > > +      * directories, each mapping 1/4 of the guest's linear address space
> > > > +      * (1GiB). The shadow pages for those 4 page directories are
> > > > +      * pre-allocated and assigned a separate quadrant in their role.
> > >
> > >
> > > It is not going to be true in patchset:
> > > [PATCH V2 0/7] KVM: X86/MMU: Use one-off special shadow page for special roots
> > >
> > > https://lore.kernel.org/lkml/20220503150735.32723-1-jiangshanlai at gmail.com/
> > >
> > > The shadow pages for those 4 page directories are also allocated on demand.
> >
> > Ack. I can even just drop this sentence in v5, it's just background information.
>
> No, if one-off special shadow pages are used.
>
> kvm_mmu_child_role() should be:
>
> +       if (role.has_4_byte_gpte) {
> +               if (role.level == PG_LEVEL_4K)
> +                       role.quadrant = (sptep - parent_sp->spt) % 2;
> +               if (role.level == PG_LEVEL_2M)
> +                       role.quadrant = (sptep - parent_sp->spt) % 4;
> +       }
>
>
> And if one-off special shadow pages are merged first.  You don't
> need any calculation in mmu_alloc_root(), you can just directly use
>     sp = kvm_mmu_get_page(vcpu, gfn, vcpu->arch.mmu->root_role);
> because vcpu->arch.mmu->root_role is always the real role of the root
> sp no matter if it is a normall root sp or an one-off special sp.
>
> I hope you will pardon me for my touting my patchset and asking
> people to review them in your threads.

I see what you mean now. If your series is queued I will rebase on top
with the appropriate changes. But for now I will continue to code
against kvm/queue.

>
> Thanks
> Lai

