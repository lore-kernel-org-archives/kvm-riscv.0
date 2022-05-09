From: David Matlack <dmatlack@google.com>
Date: Mon, 9 May 2022 14:18:20 -0700
Subject: [PATCH v4 07/20] KVM: x86/mmu: Move guest PT write-protection to
 account_shadowed()
In-Reply-To: <YnRU+zN9T8Zf91Ei@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-8-dmatlack@google.com>
 <YnRU+zN9T8Zf91Ei@google.com>
Message-ID: <CALzav=cU8dsXjZy2eUdQ-eA7BBsXU6PaPDepNmmF=sp=Z0xJ4A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 5, 2022 at 3:51 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Apr 22, 2022, David Matlack wrote:
> > Move the code that write-protects newly-shadowed guest page tables into
> > account_shadowed(). This avoids a extra gfn-to-memslot lookup and is a
> > more logical place for this code to live. But most importantly, this
> > reduces kvm_mmu_alloc_shadow_page()'s reliance on having a struct
> > kvm_vcpu pointer, which will be necessary when creating new shadow pages
> > during VM ioctls for eager page splitting.
> >
> > Note, it is safe to drop the role.level == PG_LEVEL_4K check since
> > account_shadowed() returns early if role.level > PG_LEVEL_4K.
> >
> > No functional change intended.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
> > ---
>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
>
> >  arch/x86/kvm/mmu/mmu.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index fa7846760887..4f894db88bbf 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -807,6 +807,9 @@ static void account_shadowed(struct kvm *kvm, struct kvm_mmu_page *sp)
> >                                                   KVM_PAGE_TRACK_WRITE);
> >
> >       kvm_mmu_gfn_disallow_lpage(slot, gfn);
> > +
> > +     if (kvm_mmu_slot_gfn_write_protect(kvm, slot, gfn, PG_LEVEL_4K))
> > +             kvm_flush_remote_tlbs_with_address(kvm, gfn, 1);
> >  }
> >
> >  void account_huge_nx_page(struct kvm *kvm, struct kvm_mmu_page *sp)
> > @@ -2100,11 +2103,9 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm_vcpu *vcpu,
> >       sp->gfn = gfn;
> >       sp->role = role;
> >       hlist_add_head(&sp->hash_link, sp_list);
> > -     if (!role.direct) {
> > +
> > +     if (!role.direct)
> >               account_shadowed(vcpu->kvm, sp);
> > -             if (role.level == PG_LEVEL_4K && kvm_vcpu_write_protect_gfn(vcpu, gfn))
>
> Huh.  Two thoughts.
>
> 1. Can you add a patch to drop kvm_vcpu_write_protect_gfn() entirely, i.e. convert
>    mmu_sync_children() to use kvm_mmu_slot_gfn_write_protect?  It's largely a moot
>    point, but only because mmu_sync_children() only operates on shadow pages that
>    are relevant to the current non-SMM/SMM role.  And _that_ holds true only because
>    KVM does kvm_mmu_reset_context() and drops roots for the vCPU on SMM transitions.
>
>    That'd be a good oppurtunity to move this pair into a helper:
>
>         slots = kvm_memslots_for_spte_role(kvm, sp->role);
>         slot = __gfn_to_memslot(slots, gfn);

Sounds reasonable but let's do that in a separate series since this is
already on v4 and I wouldn't say it's obvious that using the role to
get the memslot will give the same result as using the vCPU, although
that does look to be true.

>
> 2. This got me thinking...  Write-protecting for shadow paging should NOT be
>    associated with the vCPU or even the role.  The SMM memslots conceptually
>    operate on the same guest physical memory, SMM is just given access to memory
>    that is not present in the non-SMM memslots.
>
>    If KVM creates SPTEs for non-SMM, then it needs to write-protect _all_ memslots
>    that contain the relevant gfn, e.g. if the guest takes an SMI and modifies the
>    non-SMM page tables, then KVM needs trap and emulate (or unsync) those writes.
>
>    The mess "works" because no sane SMM handler (kind of a contradiction in terms)
>    will modify non-SMM page tables, and vice versa.
>
>    The entire duplicate memslots approach is flawed.  Better would have been to
>    make SMM a flag and hide SMM-only memslots, not duplicated everything...
>
> > -                     kvm_flush_remote_tlbs_with_address(vcpu->kvm, gfn, 1);
> > -     }
> >
> >       return sp;
> >  }
> > --
> > 2.36.0.rc2.479.g8af0fa9b8e-goog
> >

