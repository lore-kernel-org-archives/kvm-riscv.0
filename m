From: Conor Dooley <conor@kernel.org>
Date: Wed, 25 Jan 2023 21:04:45 +0000
Subject: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
In-Reply-To: <20230125142056.18356-20-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-20-andy.chiu@sifive.com>
Message-ID: <Y9GZbVrZxEZAraVu@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andy,

Thanks for respinning this, I think a lot of people will be happy to see
it!

On Wed, Jan 25, 2023 at 02:20:56PM +0000, Andy Chiu wrote:

> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 12d91b0a73d8..67411cdc836f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -52,6 +52,13 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> +riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
> +
> +ifeq ($(CONFIG_RISCV_ISA_V), y)
> +ifeq ($(CONFIG_CC_IS_CLANG), y)
> +        riscv-march-y += -mno-implicit-float -menable-experimental-extensions
> +endif
> +endif

Uh, so I don't think this was actually tested with (a recent version of)
clang:
clang-15: error: unknown argument: '-menable-experimental-extensions_zicbom_zihintpause'

Firstly, no-implicit-float is a CFLAG, so why add it to march?
There is an existing patch on the list for enabling this flag, but I
recall Palmer saying that it was not actually needed?
Palmer, do you remember why that was?

I dunno what enable-experimental-extensions is, but I can guess. Do we
really want to enable vector for toolchains where the support is
considered experimental? I'm not au fait with the details of clang
versions nor versions of the Vector spec, so take the following with a
bit of a pinch of salt...
Since you've allowed this to be built with anything later than clang 13,
does that mean that different versions of clang may generate vector code
that are not compatible?
I'm especially concerned by:
https://github.com/riscv/riscv-v-spec/releases/tag/0.9
which appears to be most recently released version of the spec, prior to
clang/llvm 13 being released.

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e2b656043abf..f4299ba9a843 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -416,6 +416,16 @@ config RISCV_ISA_SVPBMT
>  
>  	   If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_V
> +	bool "VECTOR extension support"
> +	depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000

Are these definitely the versions you want to support?
What are the earliest (upstream) versions that support the frozen
version of the vector spec?

Also, please copy what has been done with "TOOLCHAIN_HAS_FOO" for other
extensions and check this support with cc-option instead. Similarly,
you'll need to gate this support on the linker being capable of
accepting vector:
/stuff/toolchains/gcc-11/bin/riscv64-unknown-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_f2p0_d2p0_c2p0_v1p0_zihintpause2p0_zve32f1p0_zve32x1p0_zve64d1p0_zve64f1p0_zve64x1p0_zvl128b1p0_zvl32b1p0_zvl64b1p0: prefixed ISA extension must separate with _
/stuff/toolchains/gcc-11/bin/riscv64-unknown-linux-gnu-ld: failed to merge target specific data of file arch/riscv/kernel/vdso/vgettimeofday.o

> +	default n

I forget, but is the reason for this being default n, when the others
are default y a conscious choice?
I'm a bit of a goldfish sometimes memory wise, and I don't remember if
that was an outcome of the previous discussions.
If it is intentionally different, that needs to be in the changelog IMO.

> +	help
> +	  Say N here if you want to disable all vector related procedure
> +	  in the kernel.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZICBOM

^ you can use this one here as an example :)

I'll reply here again once the patchwork automation has given the series
a once over and see if it comes up with any other build issues.
Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230125/6467e834/attachment-0001.sig>
