From: Nicholas Piggin <npiggin@gmail.com>
Date: Thu, 29 Feb 2024 13:31:52 +1000
Subject: [kvm-unit-tests PATCH 03/13] treewide: lib/stack: Fix backtrace
In-Reply-To: <20240228150416.248948-18-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
 <20240228150416.248948-18-andrew.jones@linux.dev>
Message-ID: <CZH8V1T0Z3QN.1ZVFAXR4B96BZ@wheely>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu Feb 29, 2024 at 1:04 AM AEST, Andrew Jones wrote:
> We should never pass the result of __builtin_frame_address(0) to
> another function since the compiler is within its rights to pop the
> frame to which it points before making the function call, as may be
> done for tail calls. Nobody has complained about backtrace(), so
> likely all compilations have been inlining backtrace_frame(), not
> dropping the frame on the tail call, or nobody is looking at traces.
> However, for riscv, when built for EFI, it does drop the frame on the
> tail call, and it was noticed. Preemptively fix backtrace() for all
> architectures.
>
> Fixes: 52266791750d ("lib: backtrace printing")
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  lib/arm/stack.c   | 13 +++++--------
>  lib/arm64/stack.c | 12 +++++-------
>  lib/riscv/stack.c | 12 +++++-------
>  lib/s390x/stack.c | 12 +++++-------
>  lib/stack.h       | 24 +++++++++++++++++-------
>  lib/x86/stack.c   | 12 +++++-------
>  6 files changed, 42 insertions(+), 43 deletions(-)
>
> diff --git a/lib/arm/stack.c b/lib/arm/stack.c
> index 7d081be7c6d0..66d18b47ea53 100644
> --- a/lib/arm/stack.c
> +++ b/lib/arm/stack.c
> @@ -8,13 +8,16 @@
>  #include <libcflat.h>
>  #include <stack.h>
>  
> -int backtrace_frame(const void *frame, const void **return_addrs,
> -		    int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	static int walking;
>  	int depth;
>  	const unsigned long *fp = (unsigned long *)frame;
>  
> +	if (current_frame)
> +		fp = __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -33,9 +36,3 @@ int backtrace_frame(const void *frame, const void **return_addrs,
>  	walking = 0;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/arm64/stack.c b/lib/arm64/stack.c
> index 82611f4b1815..f5eb57fd8892 100644
> --- a/lib/arm64/stack.c
> +++ b/lib/arm64/stack.c
> @@ -8,7 +8,8 @@
>  
>  extern char vector_stub_start, vector_stub_end;
>  
> -int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	const void *fp = frame;
>  	static bool walking;
> @@ -17,6 +18,9 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  	bool is_exception = false;
>  	unsigned long addr;
>  
> +	if (current_frame)
> +		fp = __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -54,9 +58,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  	walking = false;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
> index 712a5478d547..d865594b9671 100644
> --- a/lib/riscv/stack.c
> +++ b/lib/riscv/stack.c
> @@ -2,12 +2,16 @@
>  #include <libcflat.h>
>  #include <stack.h>
>  
> -int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	static bool walking;
>  	const unsigned long *fp = (unsigned long *)frame;
>  	int depth;
>  
> +	if (current_frame)
> +		fp = __builtin_frame_address(0);
> +
>  	if (walking) {
>  		printf("RECURSIVE STACK WALK!!!\n");
>  		return 0;
> @@ -24,9 +28,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  	walking = false;
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/s390x/stack.c b/lib/s390x/stack.c
> index 9f234a12adf6..d194f654e94d 100644
> --- a/lib/s390x/stack.c
> +++ b/lib/s390x/stack.c
> @@ -14,11 +14,15 @@
>  #include <stack.h>
>  #include <asm/arch_def.h>
>  
> -int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
> +int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +			 int max_depth, bool current_frame)
>  {
>  	int depth = 0;
>  	struct stack_frame *stack = (struct stack_frame *)frame;
>  
> +	if (current_frame)
> +		stack = __builtin_frame_address(0);
> +
>  	for (depth = 0; stack && depth < max_depth; depth++) {
>  		return_addrs[depth] = (void *)stack->grs[8];
>  		stack = stack->back_chain;
> @@ -28,9 +32,3 @@ int backtrace_frame(const void *frame, const void **return_addrs, int max_depth)
>  
>  	return depth;
>  }
> -
> -int backtrace(const void **return_addrs, int max_depth)
> -{
> -	return backtrace_frame(__builtin_frame_address(0),
> -			       return_addrs, max_depth);
> -}
> diff --git a/lib/stack.h b/lib/stack.h
> index 10fc2f793354..6edc84344b51 100644
> --- a/lib/stack.h
> +++ b/lib/stack.h
> @@ -11,17 +11,27 @@
>  #include <asm/stack.h>
>  
>  #ifdef HAVE_ARCH_BACKTRACE_FRAME
> -extern int backtrace_frame(const void *frame, const void **return_addrs,
> -			   int max_depth);
> +extern int arch_backtrace_frame(const void *frame, const void **return_addrs,
> +				int max_depth, bool current_frame);
> +
> +static inline int backtrace_frame(const void *frame, const void **return_addrs,
> +				  int max_depth)
> +{
> +	return arch_backtrace_frame(frame, return_addrs, max_depth, false);
> +}
> +
> +static inline int backtrace(const void **return_addrs, int max_depth)
> +{
> +	return arch_backtrace_frame(NULL, return_addrs, max_depth, true);
> +}
>  #else
> -static inline int
> -backtrace_frame(const void *frame __unused, const void **return_addrs __unused,
> -		int max_depth __unused)
> +extern int backtrace(const void **return_addrs, int max_depth);
> +
> +static inline int backtrace_frame(const void *frame, const void **return_addrs,
> +				  int max_depth)
>  {
>  	return 0;
>  }
>  #endif
>  
> -extern int backtrace(const void **return_addrs, int max_depth);
> -
>  #endif

Is there a reason to add the inline wrappers rather than just externs
and drop the arch_ prefix?

Do we want to just generally have all arch specific functions have an
arch_ prefix? Fine by me.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

I'm fine to rebase the powerpc patch on top of this if it goes in first.
Thanks for the heads up.

Thanks,
Nick

