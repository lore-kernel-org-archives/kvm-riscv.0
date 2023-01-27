From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Jan 2023 11:08:24 +0530
Subject: [PATCH] KVM: RISC-V: Fix wrong usage of PGDIR_SIZE to check page sizes
In-Reply-To: <CAHVXubjHBu7F9xaERTR6vppsUph2U8JX1DRSrFUAWs-jJ_8ncQ@mail.gmail.com>
References: <20230123092928.808014-1-alexghiti@rivosinc.com>
 <bdabafb1-53f3-403c-ab9c-1c2d00421690@ghiti.fr> <CAAhSdy1grLz2EXEJUicGFZO7md7F=Hbnhv7ZqBFFx-vtnkpmmA@mail.gmail.com>
 <CAHVXubjHBu7F9xaERTR6vppsUph2U8JX1DRSrFUAWs-jJ_8ncQ@mail.gmail.com>
Message-ID: <CAAhSdy1FdXvZQo9+bpfqHUA0FD-6NnxbL59Cs-+7zrw8EBcmJg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 23, 2023 at 8:04 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> On Mon, Jan 23, 2023 at 12:28 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, Jan 23, 2023 at 3:01 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
> > >
> > > @Anup: Sorry, forgot to add -fixes to the patch title, as I think this
> > > should go into your fixes branch for 6.2.
> >
> > Can you provide the Fixes: line here ? I will include it at time of
> > adding this patch to my fixes branch.
>
> It actually fixes 2 commits: 9955371cc014 ("RISC-V: KVM: Implement MMU
> notifiers") and 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page
> table programming"). But they were both part of the first KVM
> patchset, so I only took the oldest one, but tell me if you want me to
> split the patch into 2 different patches that fix one commit at a
> time.
>
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")

The Linux-6.3 merge window is near so I have queued this patch
for Linux-6.3

Thanks,
Anup

>
> Thanks,
>
> Alex
>
> >
> > Regards,
> > Anup
> >
> > >
> > > On 1/23/23 10:29, Alexandre Ghiti wrote:
> > > > At the moment, riscv only supports PMD and PUD hugepages. For sv39,
> > > > PGDIR_SIZE == PUD_SIZE but not for sv48 and sv57. So fix this by changing
> > > > PGDIR_SIZE into PUD_SIZE.
> > > >
> > > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > > ---
> > > >   arch/riscv/kvm/mmu.c | 8 ++++----
> > > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > > > index 34b57e0be2ef..dbc4ca060174 100644
> > > > --- a/arch/riscv/kvm/mmu.c
> > > > +++ b/arch/riscv/kvm/mmu.c
> > > > @@ -585,7 +585,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> > > >       if (!kvm->arch.pgd)
> > > >               return false;
> > > >
> > > > -     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> > > > +     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
> > > >
> > > >       if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
> > > >                                  &ptep, &ptep_level))
> > > > @@ -603,7 +603,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
> > > >       if (!kvm->arch.pgd)
> > > >               return false;
> > > >
> > > > -     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PGDIR_SIZE);
> > > > +     WARN_ON(size != PAGE_SIZE && size != PMD_SIZE && size != PUD_SIZE);
> > > >
> > > >       if (!gstage_get_leaf_entry(kvm, range->start << PAGE_SHIFT,
> > > >                                  &ptep, &ptep_level))
> > > > @@ -645,12 +645,12 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> > > >       if (logging || (vma->vm_flags & VM_PFNMAP))
> > > >               vma_pagesize = PAGE_SIZE;
> > > >
> > > > -     if (vma_pagesize == PMD_SIZE || vma_pagesize == PGDIR_SIZE)
> > > > +     if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
> > > >               gfn = (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_SHIFT;
> > > >
> > > >       mmap_read_unlock(current->mm);
> > > >
> > > > -     if (vma_pagesize != PGDIR_SIZE &&
> > > > +     if (vma_pagesize != PUD_SIZE &&
> > > >           vma_pagesize != PMD_SIZE &&
> > > >           vma_pagesize != PAGE_SIZE) {
> > > >               kvm_err("Invalid VMA page size 0x%lx\n", vma_pagesize);

