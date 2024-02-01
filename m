From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 1 Feb 2024 16:24:43 +0100
Subject: [kvm-unit-tests PATCH v2 08/24] riscv: Add riscv32 support
In-Reply-To: <20240126142324.66674-34-andrew.jones@linux.dev>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
 <20240126142324.66674-34-andrew.jones@linux.dev>
Message-ID: <20240201-89bb062a591a3a65313f4cba@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 26, 2024 at 03:23:33PM +0100, Andrew Jones wrote:
...
> diff --git a/lib/ldiv32.c b/lib/ldiv32.c
> index 897a4b9cd39e..9ce2a6a1faf0 100644
> --- a/lib/ldiv32.c
> +++ b/lib/ldiv32.c
> @@ -1,5 +1,21 @@
>  #include <stdint.h>
>  
> +#if __riscv_xlen == 32
> +int __clzdi2(unsigned long);
> +
> +int __clzdi2(unsigned long a)
> +{
> +	int n = 0;
> +
> +	while (a) {
> +		++n;
> +		a >>= 1;
> +	}
> +
> +	return 32 - n;
> +}
> +#endif
> +

On riscv32, when attempting to do printf("%llx\n", x), where x is a 64-bit
type, I found a bug with the above. It turns out that despite [1] stating
that __clzdi2() takes an unsigned long, libgcc code which generates calls
to it expect it to take an unsigned long long. I've fixed this for v3 by
renaming the above function to __clzsi2() and adding

 int __clzdi2(uint64_t num)
 {
     return num >> 32 ? __clzsi2(num >> 32) : __clzsi2(num) + 32;
 }

[1] https://gcc.gnu.org/onlinedocs/gccint/Integer-library-routines.html

Thanks,
drew

