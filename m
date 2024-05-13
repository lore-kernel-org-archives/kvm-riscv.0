From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 13 May 2024 15:09:15 +0200
Subject: [PATCH 01/12] mm, arm64: Rename ARM64_CONTPTE to THP_CONTPTE
In-Reply-To: <CAGsJ_4xayC4D4y0d7SPXxCvuW4-rJQUCa_-OUDSsOGm_HyPm1w@mail.gmail.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
 <20240508191931.46060-2-alexghiti@rivosinc.com> <CAGsJ_4xayC4D4y0d7SPXxCvuW4-rJQUCa_-OUDSsOGm_HyPm1w@mail.gmail.com>
Message-ID: <CAHVXubiOo3oe0=-qU2kBaFXebPJvmnc+-1UOPEHS2spcCeMzsw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Barry,

On Thu, May 9, 2024 at 2:46?AM Barry Song <21cnbao@gmail.com> wrote:
>
> On Thu, May 9, 2024 at 7:20?AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >
> > The ARM64_CONTPTE config represents the capability to transparently use
> > contpte mappings for THP userspace mappings, which will be implemented
> > in the next commits for riscv, so make this config more generic and move
> > it to mm.
> >
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >  arch/arm64/Kconfig               | 9 ---------
> >  arch/arm64/include/asm/pgtable.h | 6 +++---
> >  arch/arm64/mm/Makefile           | 2 +-
> >  mm/Kconfig                       | 9 +++++++++
> >  4 files changed, 13 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index ac2f6d906cc3..9d823015b4e5 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2227,15 +2227,6 @@ config UNWIND_PATCH_PAC_INTO_SCS
> >         select UNWIND_TABLES
> >         select DYNAMIC_SCS
> >
> > -config ARM64_CONTPTE
> > -       bool "Contiguous PTE mappings for user memory" if EXPERT
> > -       depends on TRANSPARENT_HUGEPAGE
> > -       default y
> > -       help
> > -         When enabled, user mappings are configured using the PTE contiguous
> > -         bit, for any mappings that meet the size and alignment requirements.
> > -         This reduces TLB pressure and improves performance.
> > -
> >  endmenu # "Kernel Features"
> >
> >  menu "Boot options"
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 7c2938cb70b9..1758ce71fae9 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -1369,7 +1369,7 @@ extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
> >                                     unsigned long addr, pte_t *ptep,
> >                                     pte_t old_pte, pte_t new_pte);
> >
> > -#ifdef CONFIG_ARM64_CONTPTE
> > +#ifdef CONFIG_THP_CONTPTE
>
> Is it necessarily THP? can't be hugetlb or others? I feel THP_CONTPTE
> isn't a good name.

This does not target hugetlbfs (see my other patchset for that here
https://lore.kernel.org/linux-riscv/7504a525-8211-48b3-becb-a6e838c1b42e at arm.com/T/#m57d273d680fc531b3aa1074e6f8558a52ba5badc).

What could be "others" here?

Thanks for your comment,

Alex

>
> >
> >  /*
> >   * The contpte APIs are used to transparently manage the contiguous bit in ptes
> > @@ -1622,7 +1622,7 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
> >         return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
> >  }
> >
> > -#else /* CONFIG_ARM64_CONTPTE */
> > +#else /* CONFIG_THP_CONTPTE */
> >
> >  #define ptep_get                               __ptep_get
> >  #define set_pte                                        __set_pte
> > @@ -1642,7 +1642,7 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
> >  #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> >  #define ptep_set_access_flags                  __ptep_set_access_flags
> >
> > -#endif /* CONFIG_ARM64_CONTPTE */
> > +#endif /* CONFIG_THP_CONTPTE */
> >
> >  int find_num_contig(struct mm_struct *mm, unsigned long addr,
> >                     pte_t *ptep, size_t *pgsize);
> > diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
> > index 60454256945b..52a1b2082627 100644
> > --- a/arch/arm64/mm/Makefile
> > +++ b/arch/arm64/mm/Makefile
> > @@ -3,7 +3,7 @@ obj-y                           := dma-mapping.o extable.o fault.o init.o \
> >                                    cache.o copypage.o flush.o \
> >                                    ioremap.o mmap.o pgd.o mmu.o \
> >                                    context.o proc.o pageattr.o fixmap.o
> > -obj-$(CONFIG_ARM64_CONTPTE)    += contpte.o
> > +obj-$(CONFIG_THP_CONTPTE)      += contpte.o
> >  obj-$(CONFIG_HUGETLB_PAGE)     += hugetlbpage.o
> >  obj-$(CONFIG_PTDUMP_CORE)      += ptdump.o
> >  obj-$(CONFIG_PTDUMP_DEBUGFS)   += ptdump_debugfs.o
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index c325003d6552..fd4de221a1c6 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -984,6 +984,15 @@ config ARCH_HAS_CACHE_LINE_SIZE
> >  config ARCH_HAS_CONTPTE
> >         bool
> >
> > +config THP_CONTPTE
> > +       bool "Contiguous PTE mappings for user memory" if EXPERT
> > +       depends on ARCH_HAS_CONTPTE && TRANSPARENT_HUGEPAGE
> > +       default y
> > +       help
> > +         When enabled, user mappings are configured using the PTE contiguous
> > +         bit, for any mappings that meet the size and alignment requirements.
> > +         This reduces TLB pressure and improves performance.
> > +
> >  config ARCH_HAS_CURRENT_STACK_POINTER
> >         bool
> >         help
> > --
> > 2.39.2
>
> Thanks
> Barry

