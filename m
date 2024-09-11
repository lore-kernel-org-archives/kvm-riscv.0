From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed, 11 Sep 2024 10:55:34 +1000
Subject: [kvm-unit-tests PATCH] lib/stack: Restrengthen base_address
In-Reply-To: <20240904145107.2447876-2-andrew.jones@linux.dev>
References: <20240904145107.2447876-2-andrew.jones@linux.dev>
Message-ID: <D431NLP0XYPF.F69YFSU98T2G@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu Sep 5, 2024 at 12:51 AM AEST, Andrew Jones wrote:
> commit a1f2b0e1efd5 ("treewide: lib/stack: Make base_address arch
> specific") made base_address() a weak function in order to allow
> architectures to override it. Linking for EFI doesn't seem to figure
> out the right one to use though [anymore?]. It must have worked at
> one point because the commit calls outs EFI as the motivation.
> Anyway, just drop the weakness in favor of another HAVE_ define.

I prefer HAVE_ style than weak so fine by me.

How is the linker not resolving it properly? Some calls still
point to weak symbol despite non-weak symbol also existing?


>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  lib/riscv/asm/stack.h |  1 +
>  lib/riscv/stack.c     |  2 +-
>  lib/stack.c           | 10 ++++++----
>  lib/stack.h           |  2 +-
>  4 files changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/lib/riscv/asm/stack.h b/lib/riscv/asm/stack.h
> index f003ca37c913..708fa4215007 100644
> --- a/lib/riscv/asm/stack.h
> +++ b/lib/riscv/asm/stack.h
> @@ -8,5 +8,6 @@
>  
>  #define HAVE_ARCH_BACKTRACE_FRAME
>  #define HAVE_ARCH_BACKTRACE
> +#define HAVE_ARCH_BASE_ADDRESS
>  
>  #endif
> diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
> index 2cd7f012738b..a143c22a570a 100644
> --- a/lib/riscv/stack.c
> +++ b/lib/riscv/stack.c
> @@ -5,7 +5,7 @@
>  #ifdef CONFIG_RELOC
>  extern char ImageBase, _text, _etext;
>  
> -bool arch_base_address(const void *rebased_addr, unsigned long *addr)
> +bool base_address(const void *rebased_addr, unsigned long *addr)
>  {
>  	unsigned long ra = (unsigned long)rebased_addr;
>  	unsigned long base = (unsigned long)&ImageBase;
> diff --git a/lib/stack.c b/lib/stack.c
> index 086fec544a81..e1c981085176 100644
> --- a/lib/stack.c
> +++ b/lib/stack.c
> @@ -12,9 +12,10 @@
>  #define MAX_DEPTH 20
>  
>  #ifdef CONFIG_RELOC
> +#ifndef HAVE_ARCH_BASE_ADDRESS
>  extern char _text, _etext;
>  
> -bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned long *addr)
> +bool base_address(const void *rebased_addr, unsigned long *addr)
>  {
>  	unsigned long ra = (unsigned long)rebased_addr;
>  	unsigned long start = (unsigned long)&_text;
> @@ -26,8 +27,9 @@ bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned
>  	*addr = ra - start;
>  	return true;
>  }
> +#endif
>  #else
> -bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned long *addr)
> +bool base_address(const void *rebased_addr, unsigned long *addr)
>  {
>  	*addr = (unsigned long)rebased_addr;
>  	return true;

Shouldn't HAVE_ARCH_BASE_ADDRESS also cover this?

Thanks,
Nick

