From: Conor Dooley <conor@kernel.org>
Date: Thu, 26 Jan 2023 23:11:43 +0000
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
In-Reply-To: <20230125142056.18356-11-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
Message-ID: <Y9MIr2iR5rzlIGKQ@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andy!

On Wed, Jan 25, 2023 at 02:20:47PM +0000, Andy Chiu wrote:
> Vector unit is disabled by default for all user processes. Thus, a
> process will take a trap (illegal instruction) into kernel at the first
> time when it uses Vector. Only after then, the kernel allocates V
> context and starts take care of the context for that user process.

I'm mostly ambivalent about the methods you lot discussed for turning v
on when needed, so this WFM :)

> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Link: https://lore.kernel.org/r/3923eeee-e4dc-0911-40bf-84c34aee962d at linaro.org
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/insn.h   | 24 +++++++++
>  arch/riscv/include/asm/vector.h |  2 +
>  arch/riscv/kernel/Makefile      |  1 +
>  arch/riscv/kernel/vector.c      | 89 +++++++++++++++++++++++++++++++++
>  4 files changed, 116 insertions(+)
>  create mode 100644 arch/riscv/kernel/vector.c
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 25ef9c0b19e7..b1ef3617881f 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -133,6 +133,24 @@
>  #define RVG_OPCODE_JALR		0x67
>  #define RVG_OPCODE_JAL		0x6f
>  #define RVG_OPCODE_SYSTEM	0x73
> +#define RVG_SYSTEM_CSR_OFF	20
> +#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)

These ones look good.

> +
> +/* parts of opcode for RVV */
> +#define OPCODE_VECTOR		0x57
> +#define LSFP_WIDTH_RVV_8	0
> +#define LSFP_WIDTH_RVV_16	5
> +#define LSFP_WIDTH_RVV_32	6
> +#define LSFP_WIDTH_RVV_64	7

All of this needs a prefix though, not the almost-postfix you've added.
IOW, move the RVV to the start.

> +
> +/* parts of opcode for RVF, RVD and RVQ */
> +#define LSFP_WIDTH_OFF		12
> +#define LSFP_WIDTH_MASK		GENMASK(3, 0)

These all get an RVG_ prefix, no? Or does the Q prevent that? Either
way, they do need a prefix.

> +#define LSFP_WIDTH_FP_W		2
> +#define LSFP_WIDTH_FP_D		3
> +#define LSFP_WIDTH_FP_Q		4

LSFP isn't something that has hits in the spec, which is annoying for
cross checking IMO. If it were me, I'd likely do something like
RVG_FLW_FSW_WIDTH since then it is abundantly clear what this is the
width of.

> +#define OPCODE_LOADFP		0x07
> +#define OPCODE_STOREFP		0x27

Same comment about prefix here. I'd be tempted to make these names match
the spec too, but it is clear enough to me what this are at the moment.

> +#define EXTRACT_LOAD_STORE_FP_WIDTH(x) \
> +#define EXTRACT_SYSTEM_CSR(x) \

Prefixes again here please!

> +
>  /*
>   * Get the immediate from a J-type instruction.
>   *
> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index f8a9e37c4374..7c77696d704a 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -19,6 +19,7 @@
>  #define CSR_STR(x) __ASM_STR(x)
>  
>  extern unsigned long riscv_vsize;
> +bool rvv_first_use_handler(struct pt_regs *regs);

Please rename to riscv_v_...

> +static bool insn_is_vector(u32 insn_buf)
> +{
> +	u32 opcode = insn_buf & __INSN_OPCODE_MASK;

Newline here please...

> +	/*
> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
> +	 * do not handle if the instruction length is not 4-Byte.
> +	 */
> +	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
> +		return false;

...and one here please too!

> +	if (opcode == OPCODE_VECTOR) {
> +		return true;
> +	}

	if (opcode == OPCODE_LOADFP || opcode == OPCODE_STOREFP) {
The above returns, so there's no need for the else

> +		u32 width = EXTRACT_LOAD_STORE_FP_WIDTH(insn_buf);
> +
> +		if (width == LSFP_WIDTH_RVV_8 || width == LSFP_WIDTH_RVV_16 ||
> +		    width == LSFP_WIDTH_RVV_32 || width == LSFP_WIDTH_RVV_64)
> +			return true;

I suppose you could also add else return false, thereby dropping the
else in the line below too, but that's a matter of preference :)

> +	} else if (opcode == RVG_OPCODE_SYSTEM) {
> +		u32 csr = EXTRACT_SYSTEM_CSR(insn_buf);
> +
> +		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
> +		    (csr >= CSR_VL && csr <= CSR_VLENB))
> +			return true;
> +	}
> +	return false;
> +}

I would like Heiko to take a look at this function!
I know we have the RISCV_INSN_FUNCS stuff that got newly added, but that's
for single, named instructions. I'm just curious if there may be a neater
way to go about doing this. AFAICT, the widths are all in funct3 - but it
is a shame that 0b100 is Q and 0 is vector, as the macro works for matches
and we can't use the upper bit for that.
There's prob something you could do with XORing and XNORing bits, but at
that point it'd not be adding any clarity at all & it'd not be a
RISCV_INSN_FUNCS anymore!
The actual opcode checks probably could be extracted though, but would
love to know what Heiko thinks, even if that is "leave it as is".

> +
> +int rvv_thread_zalloc(void)

riscv_v_... and so on down the file

> +{
> +	void *datap;
> +
> +	datap = kzalloc(riscv_vsize, GFP_KERNEL);
> +	if (!datap)
> +		return -ENOMEM;
> +	current->thread.vstate.datap = datap;
> +	memset(&current->thread.vstate, 0, offsetof(struct __riscv_v_state,
> +						    datap));
> +	return 0;
> +}
> +
> +bool rvv_first_use_handler(struct pt_regs *regs)
> +{
> +	__user u32 *epc = (u32 *)regs->epc;
> +	u32 tval = (u32)regs->badaddr;

I'm dumb, what's the t here? This variable holds an instruction, right?
Why not call it `insn` so it conveys some meaning?

> +	/* If V has been enabled then it is not the first-use trap */
> +	if (vstate_query(regs))
> +		return false;
> +	/* Get the instruction */
> +	if (!tval) {
> +		if (__get_user(tval, epc))
> +			return false;
> +	}
> +	/* Filter out non-V instructions */
> +	if (!insn_is_vector(tval))
> +		return false;
> +	/* Sanity check. datap should be null by the time of the first-use trap */
> +	WARN_ON(current->thread.vstate.datap);

Is a WARN_ON sufficient here? If on the first use trap, it's non-null
should we return false and trigger the trap error too?

> +	/*
> +	 * Now we sure that this is a V instruction. And it executes in the
> +	 * context where VS has been off. So, try to allocate the user's V
> +	 * context and resume execution.
> +	 */
> +	if (rvv_thread_zalloc()) {
> +		force_sig(SIGKILL);
> +		return true;
> +	}
> +	vstate_on(regs);
> +	return true;

Otherwise this looks sane to me!

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230126/4cb5a1fe/attachment-0001.sig>
