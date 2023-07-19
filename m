From: Conor Dooley <conor@kernel.org>
Date: Wed, 19 Jul 2023 17:27:16 +0100
Subject: [PATCH v1 1/6] RISC-V: Detect Smstateen extension
In-Reply-To: <20230719160316.4048022-2-mchitale@ventanamicro.com>
References: <20230719160316.4048022-1-mchitale@ventanamicro.com>
 <20230719160316.4048022-2-mchitale@ventanamicro.com>
Message-ID: <20230719-egomaniac-precook-adf506f2a141@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey,

On Wed, Jul 19, 2023 at 09:33:11PM +0530, Mayuresh Chitale wrote:
> Extend the ISA string parsing to detect the Smstateen extension
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index bdcf460ea53d..41c3aefcc53f 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -301,6 +301,8 @@ void __init riscv_fill_hwcap(void)
>  			} else {
>  				/* sorted alphabetically */
>  				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> +				SET_ISA_EXT_MAP("smstateen",
> +						RISCV_ISA_EXT_SMSTATEEN);

This easily fits on one line & "smstateen" needs to be documented in
riscv/extensions.yaml.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230719/45e5acb5/attachment.sig>
