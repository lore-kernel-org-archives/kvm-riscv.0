From: David Matlack <dmatlack@google.com>
Date: Mon, 9 May 2022 14:29:38 -0700
Subject: [PATCH v4 15/20] KVM: x86/mmu: Cache the access bits of shadowed
 translations
In-Reply-To: <Ynk84xydEn4/3xkT@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-16-dmatlack@google.com>
 <Ynk84xydEn4/3xkT@google.com>
Message-ID: <CALzav=daCnHcUV7ffwvpMGcpdvV5vqHg0JD7Wfs-F6jfaJnfSA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 9, 2022 at 9:10 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Apr 22, 2022, David Matlack wrote:
> > @@ -2820,7 +2861,10 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
> >
> >       if (!was_rmapped) {
> >               WARN_ON_ONCE(ret == RET_PF_SPURIOUS);
> > -             rmap_add(vcpu, slot, sptep, gfn);
> > +             rmap_add(vcpu, slot, sptep, gfn, pte_access);
> > +     } else {
> > +             /* Already rmapped but the pte_access bits may have changed. */
> > +             kvm_mmu_page_set_access(sp, sptep - sp->spt, pte_access);
> >       }
> >
> >       return ret;
>
> ...
>
> > diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
> > index a8a755e1561d..97bf53b29b88 100644
> > --- a/arch/x86/kvm/mmu/paging_tmpl.h
> > +++ b/arch/x86/kvm/mmu/paging_tmpl.h
> > @@ -978,7 +978,8 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
> >  }
> >
> >  /*
> > - * Using the cached information from sp->gfns is safe because:
> > + * Using the information in sp->shadowed_translation (kvm_mmu_page_get_gfn()
> > + * and kvm_mmu_page_get_access()) is safe because:
> >   * - The spte has a reference to the struct page, so the pfn for a given gfn
> >   *   can't change unless all sptes pointing to it are nuked first.
> >   *
> > @@ -1052,12 +1053,15 @@ static int FNAME(sync_page)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
> >               if (sync_mmio_spte(vcpu, &sp->spt[i], gfn, pte_access))
> >                       continue;
> >
> > -             if (gfn != sp->gfns[i]) {
> > +             if (gfn != kvm_mmu_page_get_gfn(sp, i)) {
> >                       drop_spte(vcpu->kvm, &sp->spt[i]);
> >                       flush = true;
> >                       continue;
> >               }
> >
> > +             if (pte_access != kvm_mmu_page_get_access(sp, i))
>
> I think it makes sense to do this unconditionally, same as mmu_set_spte().  Or
> make the mmu_set_spte() case conditional.  I don't have a strong preference either
> way, but the two callers should be consistent with each other.

I'll make them both unconditional.

>
> > +                     kvm_mmu_page_set_access(sp, i, pte_access);
> > +
> >               sptep = &sp->spt[i];
> >               spte = *sptep;
> >               host_writable = spte & shadow_host_writable_mask;
> > --
> > 2.36.0.rc2.479.g8af0fa9b8e-goog
> >

