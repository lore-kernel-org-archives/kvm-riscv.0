From: Randy Dunlap <rdunlap@infradead.org>
Date: Fri, 3 Dec 2021 16:40:26 -0800
Subject: [RFC 5/6] RISC-V: Move spinwait booting method to its own config
In-Reply-To: <20211204002038.113653-6-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-6-atishp@atishpatra.org>
Message-ID: <d88c18e4-b2d6-e071-7007-bb5f2b5a042c@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi--

On 12/3/21 16:20, Atish Patra wrote:
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 821252b65f89..4afb42d5707d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -403,6 +403,20 @@ config RISCV_SBI_V01
>  	  This config allows kernel to use SBI v0.1 APIs. This will be
>  	  deprecated in future once legacy M-mode software are no longer in use.
>  
> +config RISCV_BOOT_SPINWAIT
> +	bool "Spinwait booting method"
> +	depends on SMP
> +	default y
> +	help
> +	  This enables support for booting Linux via spinwait method. In the
> +	  spinwait method, all cores randomly jump to Linux. One of the core

	                                                                cores

> +	  gets chosen via lottery and all other keeps spinning on a percpu

	                                  others keep

> +	  variable. This method can not support cpu hotplug and sparse hartid

	                        cannot support CPU hotplug and sparse hartid

> +	  scheme. It should be only enabled for M-mode Linux or platforms relying
> +	  on older firmware without SBI HSM extension. All other platform should

	                                                         platforms

> +	  rely on ordered booing via SBI HSM extension which gets chosen

	                  booting

> +          dynamically at runtime if the firmware supports it.

	  dynamically at runtime if the firmware supports it.

(Last line should be indented with tab + 2 spaces, not 10 spaces.)


-- 
~Randy

