From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Mar 2022 11:30:07 -0700
Subject: [PATCH v2 03/26] KVM: x86/mmu: Derive shadow MMU page role from
 parent
In-Reply-To: <YjBLFZWtdfwhNosG@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-4-dmatlack@google.com>
 <YjBLFZWtdfwhNosG@xz-m1.local>
Message-ID: <CALzav=dAW999FKid08Ry0YxPA+3Dt8HERrbn6YMkAnk0h+4h_A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 15, 2022 at 1:15 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:05AM +0000, David Matlack wrote:
> > Instead of computing the shadow page role from scratch for every new
> > page, we can derive most of the information from the parent shadow page.
> > This avoids redundant calculations and reduces the number of parameters
> > to kvm_mmu_get_page().
> >
> > Preemptively split out the role calculation to a separate function for
> > use in a following commit.
> >
> > No functional change intended.
> >
> > Signed-off-by: David Matlack <dmatlack@google.com>
>
> Looks right..
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> Two more comments/questions below.
>
> > +static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
> > +{
> > +     struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
> > +     union kvm_mmu_page_role role;
> > +
> > +     role = parent_sp->role;
> > +     role.level--;
> > +     role.access = access;
> > +     role.direct = direct;
> > +
> > +     /*
> > +      * If the guest has 4-byte PTEs then that means it's using 32-bit,
> > +      * 2-level, non-PAE paging. KVM shadows such guests using 4 PAE page
> > +      * directories, each mapping 1/4 of the guest's linear address space
> > +      * (1GiB). The shadow pages for those 4 page directories are
> > +      * pre-allocated and assigned a separate quadrant in their role.
> > +      *
> > +      * Since we are allocating a child shadow page and there are only 2
> > +      * levels, this must be a PG_LEVEL_4K shadow page. Here the quadrant
> > +      * will either be 0 or 1 because it maps 1/2 of the address space mapped
> > +      * by the guest's PG_LEVEL_4K page table (or 4MiB huge page) that it
> > +      * is shadowing. In this case, the quadrant can be derived by the index
> > +      * of the SPTE that points to the new child shadow page in the page
> > +      * directory (parent_sp). Specifically, every 2 SPTEs in parent_sp
> > +      * shadow one half of a guest's page table (or 4MiB huge page) so the
> > +      * quadrant is just the parity of the index of the SPTE.
> > +      */
> > +     if (role.has_4_byte_gpte) {
> > +             BUG_ON(role.level != PG_LEVEL_4K);
> > +             role.quadrant = (sptep - parent_sp->spt) % 2;
> > +     }
>
> This made me wonder whether role.quadrant can be dropped, because it seems
> it can be calculated out of the box with has_4_byte_gpte, level and spte
> offset.  I could have missed something, though..

I think you're right that we could compute it on-the-fly. But it'd be
non-trivial to remove since it's currently used to ensure the sp->role
and sp->gfn uniquely identifies each shadow page (e.g. when checking
for collisions in the mmu_page_hash).

>
> > +
> > +     return role;
> > +}
> > +
> > +static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
> > +                                              u64 *sptep, gfn_t gfn,
> > +                                              bool direct, u32 access)
> > +{
> > +     union kvm_mmu_page_role role;
> > +
> > +     role = kvm_mmu_child_role(sptep, direct, access);
> > +     return kvm_mmu_get_page(vcpu, gfn, role);
>
> Nit: it looks nicer to just drop the temp var?
>
>         return kvm_mmu_get_page(vcpu, gfn,
>                                 kvm_mmu_child_role(sptep, direct, access));

Yeah that's simpler. I just have an aversion to line wrapping :)

>
> Thanks,
>
> --
> Peter Xu
>

