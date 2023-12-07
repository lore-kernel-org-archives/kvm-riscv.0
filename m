From: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 7 Dec 2023 12:11:48 +0000
Subject: [RFC 3/9] RISC-V: Add FIRMWARE_READ_HI definition
In-Reply-To: <20231205024310.1593100-4-atishp@rivosinc.com>
References: <20231205024310.1593100-1-atishp@rivosinc.com>
 <20231205024310.1593100-4-atishp@rivosinc.com>
Message-ID: <20231207-jailbreak-kinsman-7353788a9a40@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 04, 2023 at 06:43:04PM -0800, Atish Patra wrote:
> SBI v2.0 added another function to SBI PMU extension to read
> the upper bits of a counter with width larger than XLEN.

This definition here is quite a lot less specific than that in 11/1 of
the spec. I don't think that really matters much in reality since we
only support exactly one XLEN where that is the case.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Add the definition for that function.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 0892f4421bc4..f3eeca79a02d 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -121,6 +121,7 @@ enum sbi_ext_pmu_fid {
>  	SBI_EXT_PMU_COUNTER_START,
>  	SBI_EXT_PMU_COUNTER_STOP,
>  	SBI_EXT_PMU_COUNTER_FW_READ,
> +	SBI_EXT_PMU_COUNTER_FW_READ_HI,
>  };
>  
>  union sbi_pmu_ctr_info {
> -- 
> 2.34.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20231207/269cdc85/attachment.sig>
