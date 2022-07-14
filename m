From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Thu, 14 Jul 2022 14:13:05 -0700 (PDT)
Subject: [PATCH -fixes v2] riscv: Fix missing PAGE_PFN_MASK
In-Reply-To: <CAAhSdy3_EvAZJtHxFH=ihrfUaPUmp5EbXNY4eD+CRsiqNkYx9w@mail.gmail.com>
Message-ID: <mhng-0f4afa61-94cd-4471-9768-3a86c8a4678a@palmer-ri-x1c9>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 07 Jul 2022 07:56:31 PDT (-0700), anup at brainfault.org wrote:
> Hi Palmer,
>
> On Mon, Jun 13, 2022 at 3:01 PM Anup Patel <anup@brainfault.org> wrote:
>>
>> On Mon, Jun 13, 2022 at 2:23 PM Alexandre Ghiti
>> <alexandre.ghiti@canonical.com> wrote:
>> >
>> > There are a bunch of functions that use the PFN from a page table entry
>> > that end up with the svpbmt upper-bits because they are missing the newly
>> > introduced PAGE_PFN_MASK which leads to wrong addresses conversions and
>> > then crash: fix this by adding this mask.
>> >
>> > Fixes: 100631b48ded ("riscv: Fix accessing pfn bits in PTEs for non-32bit variants")
>> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>>
>> Looks good to me.
>>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>>
>> @Palmer let me know if you want me to take this through the KVM repo.
>
> This patch is required for KVM Svpbmt support so I have included it
> in my KVM RISC-V Svpbmt series.
>
> Let me know if you plan to send this as fix for Linux-5.19-rcX

Sorry I missed this one.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

as it sounds like you already have it in a tree, but LMK if you wanted 
me to.

>
> Regards,
> Anup
>
>>
>> Regards,
>> Anup
>>
>> > ---
>> >  arch/riscv/include/asm/pgtable-64.h | 12 ++++++------
>> >  arch/riscv/include/asm/pgtable.h    |  6 +++---
>> >  arch/riscv/kvm/mmu.c                |  2 +-
>> >  3 files changed, 10 insertions(+), 10 deletions(-)
>> >
>> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
>> > index 5c2aba5efbd0..dc42375c2357 100644
>> > --- a/arch/riscv/include/asm/pgtable-64.h
>> > +++ b/arch/riscv/include/asm/pgtable-64.h
>> > @@ -175,7 +175,7 @@ static inline pud_t pfn_pud(unsigned long pfn, pgprot_t prot)
>> >
>> >  static inline unsigned long _pud_pfn(pud_t pud)
>> >  {
>> > -       return pud_val(pud) >> _PAGE_PFN_SHIFT;
>> > +       return __page_val_to_pfn(pud_val(pud));
>> >  }
>> >
>> >  static inline pmd_t *pud_pgtable(pud_t pud)
>> > @@ -278,13 +278,13 @@ static inline p4d_t pfn_p4d(unsigned long pfn, pgprot_t prot)
>> >
>> >  static inline unsigned long _p4d_pfn(p4d_t p4d)
>> >  {
>> > -       return p4d_val(p4d) >> _PAGE_PFN_SHIFT;
>> > +       return __page_val_to_pfn(p4d_val(p4d));
>> >  }
>> >
>> >  static inline pud_t *p4d_pgtable(p4d_t p4d)
>> >  {
>> >         if (pgtable_l4_enabled)
>> > -               return (pud_t *)pfn_to_virt(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
>> > +               return (pud_t *)pfn_to_virt(__page_val_to_pfn(p4d_val(p4d)));
>> >
>> >         return (pud_t *)pud_pgtable((pud_t) { p4d_val(p4d) });
>> >  }
>> > @@ -292,7 +292,7 @@ static inline pud_t *p4d_pgtable(p4d_t p4d)
>> >
>> >  static inline struct page *p4d_page(p4d_t p4d)
>> >  {
>> > -       return pfn_to_page(p4d_val(p4d) >> _PAGE_PFN_SHIFT);
>> > +       return pfn_to_page(__page_val_to_pfn(p4d_val(p4d)));
>> >  }
>> >
>> >  #define pud_index(addr) (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
>> > @@ -347,7 +347,7 @@ static inline void pgd_clear(pgd_t *pgd)
>> >  static inline p4d_t *pgd_pgtable(pgd_t pgd)
>> >  {
>> >         if (pgtable_l5_enabled)
>> > -               return (p4d_t *)pfn_to_virt(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
>> > +               return (p4d_t *)pfn_to_virt(__page_val_to_pfn(pgd_val(pgd)));
>> >
>> >         return (p4d_t *)p4d_pgtable((p4d_t) { pgd_val(pgd) });
>> >  }
>> > @@ -355,7 +355,7 @@ static inline p4d_t *pgd_pgtable(pgd_t pgd)
>> >
>> >  static inline struct page *pgd_page(pgd_t pgd)
>> >  {
>> > -       return pfn_to_page(pgd_val(pgd) >> _PAGE_PFN_SHIFT);
>> > +       return pfn_to_page(__page_val_to_pfn(pgd_val(pgd)));
>> >  }
>> >  #define pgd_page(pgd)  pgd_page(pgd)
>> >
>> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> > index 1d1be9d9419c..5dbd6610729b 100644
>> > --- a/arch/riscv/include/asm/pgtable.h
>> > +++ b/arch/riscv/include/asm/pgtable.h
>> > @@ -261,7 +261,7 @@ static inline pgd_t pfn_pgd(unsigned long pfn, pgprot_t prot)
>> >
>> >  static inline unsigned long _pgd_pfn(pgd_t pgd)
>> >  {
>> > -       return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
>> > +       return __page_val_to_pfn(pgd_val(pgd));
>> >  }
>> >
>> >  static inline struct page *pmd_page(pmd_t pmd)
>> > @@ -590,14 +590,14 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
>> >         return __pmd(pmd_val(pmd) & ~(_PAGE_PRESENT|_PAGE_PROT_NONE));
>> >  }
>> >
>> > -#define __pmd_to_phys(pmd)  (pmd_val(pmd) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
>> > +#define __pmd_to_phys(pmd)  (__page_val_to_pfn(pmd_val(pmd)) << PAGE_SHIFT)
>> >
>> >  static inline unsigned long pmd_pfn(pmd_t pmd)
>> >  {
>> >         return ((__pmd_to_phys(pmd) & PMD_MASK) >> PAGE_SHIFT);
>> >  }
>> >
>> > -#define __pud_to_phys(pud)  (pud_val(pud) >> _PAGE_PFN_SHIFT << PAGE_SHIFT)
>> > +#define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
>> >
>> >  static inline unsigned long pud_pfn(pud_t pud)
>> >  {
>> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
>> > index 1c00695ebee7..9826073fbc67 100644
>> > --- a/arch/riscv/kvm/mmu.c
>> > +++ b/arch/riscv/kvm/mmu.c
>> > @@ -54,7 +54,7 @@ static inline unsigned long gstage_pte_index(gpa_t addr, u32 level)
>> >
>> >  static inline unsigned long gstage_pte_page_vaddr(pte_t pte)
>> >  {
>> > -       return (unsigned long)pfn_to_virt(pte_val(pte) >> _PAGE_PFN_SHIFT);
>> > +       return (unsigned long)pfn_to_virt(__page_val_to_pfn(pte_val(pte)));
>> >  }
>> >
>> >  static int gstage_page_size_to_level(unsigned long page_size, u32 *out_level)
>> > --
>> > 2.34.1
>> >

