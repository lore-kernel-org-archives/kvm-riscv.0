From: Marco Elver <elver@google.com>
Date: Thu, 12 Oct 2023 14:13:44 +0200
Subject: [PATCH 4/5] riscv: Suffix all page table entry pointers with 'p'
In-Reply-To: <20231002151031.110551-5-alexghiti@rivosinc.com>
References: <20231002151031.110551-1-alexghiti@rivosinc.com> <20231002151031.110551-5-alexghiti@rivosinc.com>
Message-ID: <CANpmjNMvQUSNU+U80nWrUWPc4sszvSTGvivJjk0HOw8LRWx1sg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2 Oct 2023 at 17:14, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> That makes it more clear what the underlying type is, no functional
> changes intended.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/kfence.h     |  6 +-
>  arch/riscv/include/asm/kvm_host.h   |  2 +-
>  arch/riscv/include/asm/pgalloc.h    | 86 +++++++++++++-------------
>  arch/riscv/include/asm/pgtable-64.h | 20 +++---
>  arch/riscv/kvm/mmu.c                | 22 +++----
>  arch/riscv/mm/fault.c               | 38 ++++++------
>  arch/riscv/mm/hugetlbpage.c         | 78 +++++++++++------------
>  arch/riscv/mm/init.c                | 30 ++++-----
>  arch/riscv/mm/kasan_init.c          | 96 ++++++++++++++---------------
>  arch/riscv/mm/pageattr.c            | 74 +++++++++++-----------
>  arch/riscv/mm/pgtable.c             | 46 +++++++-------
>  11 files changed, 251 insertions(+), 247 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
> index 0bbffd528096..3b482d0a4633 100644
> --- a/arch/riscv/include/asm/kfence.h
> +++ b/arch/riscv/include/asm/kfence.h
> @@ -15,12 +15,12 @@ static inline bool arch_kfence_init_pool(void)
>
>  static inline bool kfence_protect_page(unsigned long addr, bool protect)
>  {
> -       pte_t *pte = virt_to_kpte(addr);
> +       pte_t *ptep = virt_to_kpte(addr);
>
>         if (protect)
> -               set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> +               set_pte(ptep, __pte(pte_val(*ptep) & ~_PAGE_PRESENT));
>         else
> -               set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
> +               set_pte(ptep, __pte(pte_val(*ptep) | _PAGE_PRESENT));
>
>         flush_tlb_kernel_range(addr, addr + PAGE_SIZE);

As others expressed, this seems unnecessary. It doesn't make the code
any clearer to me.

However, for your subsystem you make the rules. I would just suggest
to keep things consistent with other kernel code, although there are
already stylistic deviations between subsystems (e.g. comment style in
net and rcu vs rest), I'd simply vote for fewer deviations between
subsystems.

Real downsides of stylistic changes that have unclear benefit:
1. stable backports become more difficult.
2. chasing a change with git blame becomes harder.

