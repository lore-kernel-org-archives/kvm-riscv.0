From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 03 Apr 2023 09:40:08 -0000
Subject: [PATCH v3 2/8] RISC-V: Detect AIA CSRs from ISA string
In-Reply-To: <20230403093310.2271142-3-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-3-apatel@ventanamicro.com>
Message-ID: <20230403-80af54e80a34fc70fad04e0c@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 03, 2023 at 03:03:04PM +0530, Anup Patel wrote:

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 59d58ee0f68d..1b13a5823b90 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -221,8 +221,10 @@ void __init riscv_fill_hwcap(void)
>  				}
>  			} else {
>  				/* sorted alphabetically */
                                   ^^^^^^^^^^^^^^^^^^^^^

> +				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
>  				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>  				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
> +				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);

This entry has been added in an incorrect order chief :/

>  				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
>  				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
>  				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230403/261cd622/attachment-0001.sig>
