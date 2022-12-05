From: Heiko Stübner <heiko@sntech.de>
Date: Mon, 05 Dec 2022 16:31:08 +0100
Subject: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
In-Reply-To: <20221204174632.3677-2-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-2-jszhang@kernel.org>
Message-ID: <4764569.GXAFRqVoOG@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Sonntag, 4. Dezember 2022, 18:46:20 CET schrieb Jisheng Zhang:
> Alternatives live in a different section, so offsets used by jal
> instruction will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/alternative.h |  2 ++
>  arch/riscv/kernel/alternative.c      | 38 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c       |  3 +++
>  3 files changed, 43 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index c58ec3cc4bc3..33eae9541684 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -29,6 +29,8 @@ void apply_module_alternatives(void *start, size_t length);
>  
>  void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
>  				      int patch_offset);
> +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> +			       int patch_offset);
>  
>  struct alt_entry {
>  	void *old_ptr;		 /* address of original instruciton or data  */
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 292cc42dc3be..9d88375624b5 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -125,6 +125,44 @@ void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
>  	}
>  }
>  
> +#define to_jal_imm(value)						\
> +	(((value & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) | \
> +	 ((value & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) | \
> +	 ((value & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) | \
> +	 ((value & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF))
> +
> +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> +			       int patch_offset)
> +{

I think we might want to unfiy this into a common function like

	riscv_alternative_fix_offsets(...)

so that we only run through the code block once

	for (i = 0; i < num_instr; i++) {
		if (riscv_insn_is_auipc_jalr(inst1, inst2)) {
			riscv_alternative_fix_auipc_jalr(...)
			continue;
		}

		if (riscv_insn_is_jal(inst)) {
			riscv_alternative_fix_jal(...)
			continue;
		}
	}

This would also remove the need from calling multiple functions
after patching alternatives.

Thoughts?


Heiko

> +	int num_instr = len / sizeof(u32);
> +	unsigned int call;
> +	int i;
> +	int imm;
> +
> +	for (i = 0; i < num_instr; i++) {
> +		u32 inst = riscv_instruction_at(alt_ptr, i);
> +
> +		if (!riscv_insn_is_jal(inst))
> +			continue;
> +
> +		/* get and adjust new target address */
> +		imm = RV_EXTRACT_JTYPE_IMM(inst);
> +		imm -= patch_offset;
> +
> +		/* pick the original jal */
> +		call = inst;
> +
> +		/* drop the old IMMs, all jal imm bits sit at 31:12 */
> +		call &= ~GENMASK(31, 12);
> +
> +		/* add the adapted IMMs */
> +		call |= to_jal_imm(imm);
> +
> +		/* patch the call place again */
> +		patch_text_nosync(alt_ptr + i * sizeof(u32), &call, 4);
> +	}
> +}
> +
>  /*
>   * This is called very early in the boot process (directly after we run
>   * a feature detect on the boot CPU). No need to worry about other CPUs
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ba62a4ff5ccd..c743f0adc794 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -324,6 +324,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
>  							 alt->alt_len,
>  							 alt->old_ptr - alt->alt_ptr);
> +			riscv_alternative_fix_jal(alt->old_ptr,
> +						  alt->alt_len,
> +						  alt->old_ptr - alt->alt_ptr);
>  		}
>  	}
>  }
> 





