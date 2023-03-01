From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 17:56:56 +0000
Subject: [PATCH -next v14 12/19] riscv: signal: check fp-reserved words
 unconditionally
In-Reply-To: <20230224170118.16766-13-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-13-andy.chiu@sifive.com>
Message-ID: <Y/+R6NfBHSGGI3MX@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:11PM +0000, Andy Chiu wrote:
> In order to let kernel/user locate and identify an extension context on
> the existing sigframe, we are going to utilize reserved space of fp and
> encode the information there. And since the sigcontext has already
> preserved a space for fp context w or w/o CONFIG_FPU, we move those
> reserved words checking/setting routine back into generic code.
> 
> This commit also undone an additional logical change carried by the
> refactor commit 007f5c3589578
> ("Refactor FPU code in signal setup/return procedures"). Originally we
> did not restore fp context if restoring of gpr have failed. And it was
> fine on the other side. In such way the kernel could keep the regfiles
> intact, and potentially react at the failing point of restore.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---

> @@ -90,11 +66,29 @@ static long restore_sigcontext(struct pt_regs *regs,
>  	struct sigcontext __user *sc)
>  {
>  	long err;
> +	size_t i;
> +
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
> +	if (unlikely(err))
> +		return err;
>  	/* Restore the floating-point state. */

Please preserve the newline after return from where you moved this from.

> -	if (has_fpu())
> -		err |= restore_fp_state(regs, &sc->sc_fpregs);
> +	if (has_fpu()) {
> +		err = restore_fp_state(regs, &sc->sc_fpregs);
> +		if (unlikely(err))
> +			return err;
> +	}

> @@ -145,11 +139,16 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
>  {
>  	struct sigcontext __user *sc = &frame->uc.uc_mcontext;
>  	long err;
> +	size_t i;
> +
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
>  	/* Save the floating-point state. */
>  	if (has_fpu())
>  		err |= save_fp_state(regs, &sc->sc_fpregs);
> +	/* We support no other extension state at this time. */
> +	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
> +		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
>  	return err;

And one before the return here would not go amiss. Those are nitpick
bits though, so:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/8f551d7f/attachment-0001.sig>
