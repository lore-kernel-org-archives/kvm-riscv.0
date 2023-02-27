From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 27 Feb 2023 10:19:12 -0000
Subject: [PATCH -next v14 19/19] riscv: Enable Vector code to be built
In-Reply-To: <20230224170118.16766-20-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-20-andy.chiu@sifive.com>
Message-ID: <Y/yDeurep0ZBnLdR@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andy,

On Fri, Feb 24, 2023 at 05:01:18PM +0000, Andy Chiu wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This patch adds a config which enables vector feature from the kernel
> space.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Atish Patra <atishp@atishpatra.org>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

At this point, you've basically re-written this patch and should be
listed as a co-author at the very least!

> ---
>  arch/riscv/Kconfig  | 18 ++++++++++++++++++
>  arch/riscv/Makefile |  3 ++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 81eb031887d2..19deeb3bb36b 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -418,6 +418,24 @@ config RISCV_ISA_SVPBMT
>  
>  	   If you don't know what to do here, say Y.
>  
> +config TOOLCHAIN_HAS_V
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
> +	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
> +
> +config RISCV_ISA_V
> +	bool "VECTOR extension support"
> +	depends on TOOLCHAIN_HAS_V
> +	select DYNAMIC_SIGFRAME

So, nothing here makes V depend on CONFIG_FPU...

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
> index 76989561566b..375a048b11cb 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -56,6 +56,7 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
>  riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd

...but march only contains fd if CONFIG_FPU is enabled...

>  riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
> +riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
>  
>  # Newer binutils versions default to ISA spec version 20191213 which moves some
>  # instructions from the I extension to the Zicsr and Zifencei extensions.
> @@ -65,7 +66,7 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
>  
> -KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
> +KBUILD_CFLAGS += -march=$(subst fdv,,$(riscv-march-y))

...so I think this will not work if !CONFIG_FPU && RISCV_ISA_V.
IIRC, vector uses some floating point opcodes, but does it (or Linux's
implementation) actually depend on having floating point support in the
kernel?
If not, this cannot be done in a oneliner. Otherwise, CONFIG_RISCV_ISA_V
should explicitly depend on CONFIG_FPU.

>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>  
>  KBUILD_CFLAGS += -mno-save-restore
> -- 
> 2.17.1
> 
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230227/cc0bb616/attachment-0001.sig>
