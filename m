From: Björn Töpel <bjorn@kernel.org>
Date: Thu, 02 Mar 2023 13:42:49 +0100
Subject: [PATCH -next v14 13/19] riscv: signal: Add sigcontext
 save/restore for vector
In-Reply-To: <20230224170118.16766-14-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-14-andy.chiu@sifive.com>
Message-ID: <87bklb494m.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 376d2827e736..b9b3e03b2564 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -262,6 +262,8 @@ static void __init parse_dtb(void)
>  #endif
>  }
>  
> +extern void __init init_rt_signal_env(void);
> +
>  void __init setup_arch(char **cmdline_p)
>  {
>  	parse_dtb();
> @@ -299,6 +301,7 @@ void __init setup_arch(char **cmdline_p)
>  
>  	riscv_init_cbom_blocksize();
>  	riscv_fill_hwcap();
> +	init_rt_signal_env();
>  	apply_boot_alternatives();
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
>  	    riscv_isa_extension_available(NULL, ZICBOM))
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index 0c8be5404a73..76c0480ee4cd 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -18,9 +18,11 @@
>  #include <asm/signal.h>
>  #include <asm/signal32.h>
>  #include <asm/switch_to.h>
> +#include <asm/vector.h>
>  #include <asm/csr.h>
>  
>  extern u32 __user_rt_sigreturn[2];
> +static size_t riscv_v_sc_size;

__ro_after_init?

>  
>  #define DEBUG_SIG 0
>  
> @@ -62,34 +64,159 @@ static long save_fp_state(struct pt_regs *regs,
>  #define restore_fp_state(task, regs) (0)
>  #endif
>  
> +#ifdef CONFIG_RISCV_ISA_V
> +
> +static long save_v_state(struct pt_regs *regs, void **sc_vec)
> +{
> +	/*
> +	 * Put __sc_riscv_v_state to the user's signal context space pointed
> +	 * by sc_vec and the datap point the address right
> +	 * after __sc_riscv_v_state.
> +	 */
> +	struct __riscv_ctx_hdr __user *hdr = (struct __riscv_ctx_hdr *)(*sc_vec);
                                             ^^^
Remove unneccery cast and parenthesis.

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
> +
> +/*
> + * Restore Vector extension context from the user's signal frame. This function
> + * assumes a valid extension header. So magic and size checking must be done by
> + * the caller.
> + */
> +static long __restore_v_state(struct pt_regs *regs, void *sc_vec)
> +{
> +	long err;
> +	struct __sc_riscv_v_state __user *state = (struct __sc_riscv_v_state *)(sc_vec);
                                                  ^^^
Remove unneccery cast and parenthesis.

> +	void __user *datap;
> +
> +	/* Copy everything of __sc_riscv_v_state except datap. */
> +	err = __copy_from_user(&current->thread.vstate, &state->v_state,
> +			       offsetof(struct __riscv_v_ext_state, datap));
> +	if (unlikely(err))
> +		return err;
> +
> +	/* Copy the pointer datap itself. */
> +	err = __get_user(datap, &state->v_state.datap);
> +	if (unlikely(err))
> +		return err;
> +	/*
> +	 * Copy the whole vector content from user space datap. Use
> +	 * copy_from_user to prevent information leak.
> +	 */
> +	err = copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
> +	if (unlikely(err))
> +		return err;
> +
> +	riscv_v_vstate_restore(current, regs);
> +
> +	return err;
> +}
> +#else
> +#define save_v_state(task, regs) (0)
> +#define __restore_v_state(task, regs) (0)
> +#endif
> +
>  static long restore_sigcontext(struct pt_regs *regs,
>  	struct sigcontext __user *sc)

This whole function; return in favor of goto, and remove the labels at
the bottom.

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
> +		__u32 magic, size;
> +		struct __riscv_ctx_hdr *head = (struct __riscv_ctx_hdr *)sc_ext_ptr;

Remove unneccery cast.

> +
> +		err |= __get_user(magic, &head->magic);
> +		err |= __get_user(size, &head->size);
> +		if (err)
> +			goto done;
> +
> +		sc_ext_ptr += sizeof(struct __riscv_ctx_hdr);

sizeof(*head);

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
> +		}
> +		sc_ext_ptr = ((void *)(head) + size);

Unneccery parenthesis. "(void *)head + size" is enough

>  	}
> +done:
>  	return err;
> +invalid:
> +	return -EINVAL;
> +}
> +
> +static size_t cal_rt_frame_size(void)
> +{
> +	struct rt_sigframe __user *frame;
> +	size_t frame_size;
> +	size_t total_context_size = 0;
> +
> +	frame_size = sizeof(*frame);
> +
> +	if (has_vector() && riscv_v_vstate_query(task_pt_regs(current)))
> +		total_context_size += riscv_v_sc_size;
> +	/*
> +	 * Preserved a __riscv_ctx_hdr for END signal context header if an
> +	 * extension uses __riscv_extra_ext_header
> +	 */
> +	if (total_context_size)
> +		total_context_size += sizeof(struct __riscv_ctx_hdr);
> +
> +	frame_size += (total_context_size);

Remove unneccery parenthesis.

> +
> +	frame_size = round_up(frame_size, 16);
> +	return frame_size;
> +
>  }
>  
>  SYSCALL_DEFINE0(rt_sigreturn)
> @@ -98,13 +225,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  	struct rt_sigframe __user *frame;
>  	struct task_struct *task;
>  	sigset_t set;
> +	size_t frame_size = cal_rt_frame_size();
>  
>  	/* Always make any pending restarted system calls return -EINTR */
>  	current->restart_block.fn = do_no_restart_syscall;
>  
>  	frame = (struct rt_sigframe __user *)regs->sp;
>  
> -	if (!access_ok(frame, sizeof(*frame)))
> +	if (!access_ok(frame, frame_size))
>  		goto badframe;
>  
>  	if (__copy_from_user(&set, &frame->uc.uc_sigmask, sizeof(set)))
> @@ -138,17 +266,22 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
>  	struct pt_regs *regs)
>  {
>  	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
> +	void *sc_ext_ptr = &sc->sc_extdesc.hdr;

All the casts and parenthesis makes it hard to read. Change to
	struct __riscv_ctx_hdr *sc_ext_ptr = &sc->sc_extdesc.hdr;


>  	long err;
> -	size_t i;
>  
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
>  	/* Save the floating-point state. */
>  	if (has_fpu())
>  		err |= save_fp_state(regs, &sc->sc_fpregs);
> -	/* We support no other extension state at this time. */
> -	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
> -		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
> +	/* Save the vector state. */
> +	if (has_vector() && riscv_v_vstate_query(regs))
> +		err |= save_v_state(regs, &sc_ext_ptr);

...and cast to (void **) after the change above...

> +	/* Write zero to fp-reserved space and check it on restore_sigcontext */
> +	err |= __put_user(0, &sc->sc_extdesc.reserved);
> +	/* And put END __riscv_ctx_hdr at the end. */
> +	err |= __put_user(END_MAGIC, &((struct __riscv_ctx_hdr *)sc_ext_ptr)->magic);
> +	err |= __put_user(END_HDR_SIZE, &((struct __riscv_ctx_hdr *)sc_ext_ptr)->size);

...and change to:
	err |= __put_user(END_MAGIC, &sc_ext_ptr->magic);
	err |= __put_user(END_HDR_SIZE, &sc_ext_ptr->size);


>  	return err;
>  }
>  
> @@ -172,6 +305,13 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
>  	/* Align the stack frame. */
>  	sp &= ~0xfUL;
>  
> +	/*
> +	 * Fail if the size of the altstack is not large enough for the
> +	 * sigframe construction.
> +	 */
> +	if (current->sas_ss_size && sp < current->sas_ss_sp)
> +		return (void __user __force *)(-1UL);

Nit: Remove unneccery parenthesis.


Bj?rn

