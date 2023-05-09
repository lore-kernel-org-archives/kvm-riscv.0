From: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 9 May 2023 13:34:31 +0100
Subject: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
In-Reply-To: <20230509103033.11285-24-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-24-andy.chiu@sifive.com>
Message-ID: <20230509-resilient-lagoon-265e851e5bf8@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andy,

On Tue, May 09, 2023 at 10:30:32AM +0000, Andy Chiu wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This patch adds a config which enables vector feature from the kernel
> space.

This commit message probably needs to change, it's not exactly doing
that anymore!

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>

> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Atish Patra <atishp@atishpatra.org>

And I suspect that these two are also likely inaccurate at this point,
but IDC.

> Co-developed-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog V19:
>  - Add RISCV_V_DISABLE to set compile-time default.
> 
>  arch/riscv/Kconfig  | 31 +++++++++++++++++++++++++++++++
>  arch/riscv/Makefile |  6 +++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 1019b519d590..fa256f2e23c1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -466,6 +466,37 @@ config RISCV_ISA_SVPBMT
>  
>  	   If you don't know what to do here, say Y.
>  
> +config TOOLCHAIN_HAS_V
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64iv)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32iv)
> +	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
> +	depends on AS_HAS_OPTION_ARCH
> +
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
> +config RISCV_V_DISABLE
> +	bool "Disable userspace Vector by default"
> +	depends on RISCV_ISA_V
> +	default n
> +	help
> +	  Say Y here if you want to disable default enablement state of Vector
> +	  in u-mode. This way userspace has to make explicit prctl() call to
> +	  enable Vector, or enable it via sysctl interface.

If we are worried about breaking userspace, why is the default for this
option not y? Or further,

config RISCV_ISA_V_DEFAULT_ENABLE
	bool "Enable userspace Vector by default"
	depends on RISCV_ISA_V
	help
	  Say Y here to allow use of Vector in userspace by default.
	  Otherwise, userspace has to make an explicit prctl() call to
	  enable Vector, or enable it via the sysctl interface.

	  If you don't know what to do here, say N.

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230509/e33b4631/attachment-0001.sig>
