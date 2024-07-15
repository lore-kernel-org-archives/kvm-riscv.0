From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 15 Jul 2024 15:57:12 -0500
Subject: [PATCH kvm-unit-tests] riscv: Fix virt_to_phys()
In-Reply-To: <20240706-virt-to-phys-v1-1-7a4dc11f542c@berkeley.edu>
References: <20240706-virt-to-phys-v1-1-7a4dc11f542c@berkeley.edu>
Message-ID: <20240715-259591b706e831a2cf19f618@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 06, 2024 at 04:09:44PM GMT, Cade Richard wrote:
> 

Needs a commit message stating it's currently broken for anything
other than addresses on page boundaries and that this is the fix.

> 
> ---

These dashes shouldn't be here. With them, git will strip the s-o-b on
commit.

Please also add

Fixes: 23100d972705 ("riscv: Enable vmalloc")

> Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
> ---
>  lib/riscv/mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/riscv/mmu.c b/lib/riscv/mmu.c
> index bd006881..c4770552 100644
> --- a/lib/riscv/mmu.c
> +++ b/lib/riscv/mmu.c
> @@ -194,7 +194,7 @@ unsigned long virt_to_phys(volatile void *address)
>  	paddr = virt_to_pte_phys(pgtable, (void *)address);
>  	assert(sizeof(long) == 8 || !(paddr >> 32));
>  
> -	return (unsigned long)paddr;
> +	return (unsigned long)paddr | ((unsigned long) address & 0x00000FFF);

Let's add

  #define offset_in_page(p) ((unsigned long)(p) & ~PAGE_MASK)

to lib/asm-generic/page.h and use it here.

>  }
>  
>  void *phys_to_virt(unsigned long address)
>

Thanks,
drew

