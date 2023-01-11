From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 11 Jan 2023 18:56:15 +0100
Subject: [PATCH v3 01/13] riscv: fix jal offsets in patched alternatives
In-Reply-To: <20230111171027.2392-2-jszhang@kernel.org>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-2-jszhang@kernel.org>
Message-ID: <20230111175615.p7vpq6joyrzomcmz@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 01:10:15AM +0800, Jisheng Zhang wrote:
> Alternatives live in a different section, so offsets used by jal
> instruction will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> Co-developed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/insn.h   | 27 +++++++++++++++++++++++++++
>  arch/riscv/kernel/alternative.c | 27 +++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 98453535324a..1d2df245d0bd 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -291,6 +291,33 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
>  	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
>  	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
>  
> +/*
> + * Get the immediate from a J-type instruction.
> + *
> + * @insn: instruction to process
> + * Return: immediate
> + */
> +static inline s32 riscv_insn_extract_jtype_imm(u32 insn)
> +{
> +	return RV_EXTRACT_JTYPE_IMM(insn);
> +}
> +
> +/*
> + * Update a J-type instruction with an immediate value.
> + *
> + * @insn: pointer to the jtype instruction
> + * @imm: the immediate to insert into the instruction
> + */
> +static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
> +{
> +	/* drop the old IMMs, all jal IMM bits sit at 31:12 */
> +	*insn &= ~GENMASK(31, 12);
> +	*insn |= (RV_X(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
> +		 (RV_X(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
> +		 (RV_X(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
> +		 (RV_X(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
> +}
> +
>  /*
>   * Put together one immediate from a U-type and I-type instruction pair.
>   *
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 6212ea0eed72..3d4f1f32c7f6 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -79,6 +79,21 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
>  	patch_text_nosync(ptr, call, sizeof(u32) * 2);
>  }
>  
> +static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> +{
> +	s32 imm;
> +
> +	/* get and adjust new target address */
> +	imm = riscv_insn_extract_jtype_imm(jal_insn);
> +	imm -= patch_offset;
> +
> +	/* update instruction */
> +	riscv_insn_insert_jtype_imm(&jal_insn, imm);
> +
> +	/* patch the call place again */
> +	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> +}
> +
>  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>  				      int patch_offset)
>  {
> @@ -106,6 +121,18 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
>  							 insn, insn2, patch_offset);
>  		}
> +
> +		if (riscv_insn_is_jal(insn)) {
> +			s32 imm = riscv_insn_extract_jtype_imm(insn);
> +
> +			/* Don't modify jumps inside the alternative block */
> +			if ((alt_ptr + i * sizeof(u32) + imm) >= alt_ptr &&
> +			    (alt_ptr + i * sizeof(u32) + imm) < (alt_ptr + len))
> +				continue;
> +
> +			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
> +						  insn, patch_offset);
> +		}
>  	}
>  }
>  
> -- 
> 2.38.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

