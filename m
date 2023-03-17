From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 17 Mar 2023 08:46:58 -0700
Subject: [PATCH -next v15 19/19] riscv: Enable Vector code to be built
In-Reply-To: <20230317113538.10878-20-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
 <20230317113538.10878-20-andy.chiu@sifive.com>
Message-ID: <20230317154658.GA1122384@dev-arch.thelio-3990X>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Andy,

On Fri, Mar 17, 2023 at 11:35:38AM +0000, Andy Chiu wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This patch adds a config which enables vector feature from the kernel
> space.
> 
> Support for RISC_V_ISA_V is limited to GNU-assembler for now, as LLVM
> has not acquired the functionality to selectively change the arch option
> in assembly code. This is still under review at
>     https://reviews.llvm.org/D123515
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/Kconfig  | 20 ++++++++++++++++++++
>  arch/riscv/Makefile |  6 +++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c736dc8e2593..bf9aba2f2811 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -436,6 +436,26 @@ config RISCV_ISA_SVPBMT
>  
>  	   If you don't know what to do here, say Y.
>  
> +config TOOLCHAIN_HAS_V
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
> +	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
> +	depends on AS_IS_GNU

Consider hoisting this 'depends on AS_IS_GNU' into its own configuration
option, as the same dependency is present in CONFIG_TOOLCHAIN_HAS_ZBB
for the exact same reason, with no comment as to why. By having a shared
dependency configuration option, we can easily update it when that
change is merged into LLVM proper and gain access to the current and
future options that depend on it. I imagine something like:

config AS_HAS_OPTION_ARCH
    bool
    default y
    # https://reviews.llvm.org/D123515
    depends on AS_IS_GNU

config TOOLCHAIN_HAS_ZBB
    bool
    default y
    depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
    depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
    depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
    depends on AS_HAS_OPTION_ARCH

config TOOLCHAIN_HAS_V
    bool
    default y
    depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
    depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
    depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
    depends on AS_HAS_OPTION_ARCH

It would be nice if it was a hard error for LLVM like GCC so that we
could just dynamically check support via as-instr but a version check is
not the end of the world when we know the versions.

  $ cat test.s
  .option arch, +v

  $ cat test-invalid.s
  .option arch, +vv

  $ clang --target=riscv64-linux-gnu -c -o /dev/null test.s
  test.s:1:13: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax'
  .option arch, +v
              ^

  $ clang --target=riscv64-linux-gnu -c -o /dev/null test-invalid.s
  test-invalid.s:1:13: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax'
  .option arch, +vv
              ^

  $ riscv64-linux-gcc -c -o /dev/null test.s

  $ riscv64-linux-gcc -c -o /dev/null test-invalid.s
  test-invalid.s: Assembler messages:
  test-invalid.s:1: Error: unknown ISA extension `vv' in .option arch `+vv'

As a side note, 'bool + default y' is the same as 'def_bool y', if you
wanted to same some space.

Cheers,
Nathan

> +config RISCV_ISA_V
> +	bool "VECTOR extension support"
> +	depends on TOOLCHAIN_HAS_V
> +	depends on FPU
> +	select DYNAMIC_SIGFRAME
> +	default y
> +	help
> +	  Say N here if you want to disable all vector related procedure
> +	  in the kernel.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 6203c3378922..84a50cfaedf9 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
>  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> +riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
>  
>  # Newer binutils versions default to ISA spec version 20191213 which moves some
>  # instructions from the I extension to the Zicsr and Zifencei extensions.
> @@ -65,7 +66,10 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
>  
> -KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> +# Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
> +# keep non-v and multi-letter extensions out with the filter ([^v_]*)
> +KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed  -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> +
>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>  
>  KBUILD_CFLAGS += -mno-save-restore
> -- 
> 2.17.1
> 

