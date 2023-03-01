From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 18:27:31 +0000
Subject: [PATCH -next v14 13/19] riscv: signal: Add sigcontext
 save/restore for vector
In-Reply-To: <20230224170118.16766-14-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-14-andy.chiu@sifive.com>
Message-ID: <Y/+ZE1j2usg5C1Uv@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:12PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch facilitates the existing fp-reserved words for placement of
> the first extension's context header on the user's sigframe. A context
> header consists of a distinct magic word and the size, including the
> header itself, of an extension on the stack. Then, the frame is followed
> by the context of that extension, and then a header + context body for
> another extension if exists. If there is no more extension to come, then
> the frame must be ended with a null context header. A special case is
> rv64gc, where the kernel support no extensions requiring to expose
> additional regfile to the user. In such case the kernel would place the
> null context header right after the first reserved word of
> __riscv_q_ext_state when saving sigframe. And the kernel would check if
> all reserved words are zeros when a signal handler returns.
> 
> __riscv_q_ext_state---->|	|<-__riscv_extra_ext_header
> 			~	~
> 	.reserved[0]--->|0	|<-	.reserved
> 		<-------|magic	|<-	.hdr
> 		|	|size	|_______ end of sc_fpregs
> 		|	|ext-bdy|
> 		|	~	~
> 	+)size	------->|magic	|<- another context header
> 			|size	|
> 			|ext-bdy|
> 			~	~
> 			|magic:0|<- null context header
> 			|size:0	|
> 
> The vector registers will be saved in datap pointer. The datap pointer
> will be allocated dynamically when the task needs in kernel space. On
> the other hand, datap pointer on the sigframe will be set right after
> the __riscv_v_ext_state data structure.
> 
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---

> +static long save_v_state(struct pt_regs *regs, void **sc_vec)
> +{
> +	/*
> +	 * Put __sc_riscv_v_state to the user's signal context space pointed
> +	 * by sc_vec and the datap point the address right
> +	 * after __sc_riscv_v_state.
> +	 */

AFAIU, this comment describes the assignments here. I think it would be
significantly clearer if you defined the variables here & moved the
assignment and comment further down the function.

> +	struct __riscv_ctx_hdr __user *hdr = (struct __riscv_ctx_hdr *)(*sc_vec);
> +	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)(hdr + 1);
> +	void __user *datap = state + 1;
> +	long err;
> +
> +	/* datap is designed to be 16 byte aligned for better performance */
> +	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
> +
> +	riscv_v_vstate_save(current, regs);
> +	/* Copy everything of vstate but datap. */
> +	err = __copy_to_user(&state->v_state, &current->thread.vstate,
> +			     offsetof(struct __riscv_v_ext_state, datap));
> +	/* Copy the pointer datap itself. */
> +	err |= __put_user(datap, &state->v_state.datap);
> +	/* Copy the whole vector content to user space datap. */
> +	err |= __copy_to_user(datap, current->thread.vstate.datap, riscv_v_vsize);
> +	/* Copy magic to the user space after saving  all vector conetext */
> +	err |= __put_user(RISCV_V_MAGIC, &hdr->magic);
> +	err |= __put_user(riscv_v_sc_size, &hdr->size);
> +	if (unlikely(err))
> +		return err;
> +
> +	/* Only progress the sv_vec if everything has done successfully  */
> +	*sc_vec += riscv_v_sc_size;
> +	return 0;
> +}
>  static long restore_sigcontext(struct pt_regs *regs,
>  	struct sigcontext __user *sc)
>  {
> +	void *sc_ext_ptr = &sc->sc_extdesc.hdr;
> +	__u32 rsvd;
>  	long err;
> -	size_t i;
> -
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
>  	if (unlikely(err))
> -		return err;
> +		goto done;
>  	/* Restore the floating-point state. */
>  	if (has_fpu()) {
>  		err = restore_fp_state(regs, &sc->sc_fpregs);
>  		if (unlikely(err))
> -			return err;
> +			goto done;
>  	}
>  
> -	/* We support no other extension state at this time. */
> -	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
> -		u32 value;
> -
> -		err = __get_user(value, &sc->sc_fpregs.q.reserved[i]);
> -		if (unlikely(err))
> +	/* Check the reserved word before extensions parsing */
> +	err = __get_user(rsvd, &sc->sc_extdesc.reserved);
> +	if (unlikely(err))
> +		goto done;
> +	if (unlikely(rsvd))
> +		goto invalid;
> +
> +	while (1 && !err) {

This is just while (!err), no?

> +		__u32 magic, size;
> +		struct __riscv_ctx_hdr *head = (struct __riscv_ctx_hdr *)sc_ext_ptr;
> +
> +		err |= __get_user(magic, &head->magic);
> +		err |= __get_user(size, &head->size);
> +		if (err)
> +			goto done;
> +
> +		sc_ext_ptr += sizeof(struct __riscv_ctx_hdr);
> +		switch (magic) {
> +		case END_MAGIC:
> +			if (size != END_HDR_SIZE)
> +				goto invalid;
> +			goto done;
> +		case RISCV_V_MAGIC:
> +			if (!has_vector() || !riscv_v_vstate_query(regs))
> +				goto invalid;
> +			if (size != riscv_v_sc_size)
> +				goto invalid;
> +			err = __restore_v_state(regs, sc_ext_ptr);
>  			break;
> -		if (value != 0)
> -			return -EINVAL;
> +		default:
> +			goto invalid;

Why does this need a goto, rather than returning -EINVAL directly?

> +		}
> +		sc_ext_ptr = ((void *)(head) + size);
>  	}
> +done:
>  	return err;
> +invalid:
> +	return -EINVAL;
> +}
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/77380d28/attachment-0001.sig>
