From: Björn Töpel <bjorn@kernel.org>
Date: Tue, 14 Feb 2023 07:43:21 +0100
Subject: [PATCH -next v13 10/19] riscv: Allocate user's vector context
 in the first-use trap
In-Reply-To: <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
 <875ycdy22c.fsf@all.your.base.are.belong.to.us>
 <82551518-7b7e-8ac9-7325-5d99d3be0406@rivosinc.com>
Message-ID: <87sff8ags6.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Vineet Gupta <vineetg@rivosinc.com> writes:

> On 2/7/23 06:36, Bj?rn T?pel wrote:
>>> +bool rvv_first_use_handler(struct pt_regs *regs)
>>> +{
>>> +	__user u32 *epc = (u32 *)regs->epc;
>>> +	u32 tval = (u32)regs->badaddr;
>>> +
>>> +	/* If V has been enabled then it is not the first-use trap */
>>> +	if (vstate_query(regs))
>>> +		return false;
>>> +	/* Get the instruction */
>>> +	if (!tval) {
>>> +		if (__get_user(tval, epc))
>>> +			return false;
>>> +	}
>>> +	/* Filter out non-V instructions */
>>> +	if (!insn_is_vector(tval))
>>> +		return false;
>>> +	/* Sanity check. datap should be null by the time of the first-use trap */
>>> +	WARN_ON(current->thread.vstate.datap);
>>> +	/*
>>> +	 * Now we sure that this is a V instruction. And it executes in the
>>> +	 * context where VS has been off. So, try to allocate the user's V
>>> +	 * context and resume execution.
>>> +	 */
>>> +	if (rvv_thread_zalloc()) {
>>> +		force_sig(SIGKILL);
>>> +		return true;
>>> +	}
>> Should the altstack size be taken into consideration, like x86 does in
>> validate_sigaltstack() (see __xstate_request_perm()).
>
> For a preexisting alternate stack ?

Yes.

> Otherwise there is no 
> "configuration" like x86 to cross-check against and V fault implies 
> large'ish signal stack.
> See below as well.
>
>> Related; Would it make sense to implement sigaltstack_size_valid() for
>> riscv, analogous to x86?
>
> Indeed we need to do that for the case where alt stack is being setup, 
> *after* V fault-on-first use.
> But how to handle an existing alt stack which might not be big enough to 
> handle V state ?

What I'm getting at is a stricter check at the time of fault
(SIGILL/enable V) handling. If the *existing* altstack is not big
enough, kill the process -- similar to the rvv_thread_zalloc() handling
above.

So, two changes:

1. Disallow V-enablement if the existing altstack does not fit a V-sized
   frame.
2. Sanitize altstack changes when V is enabled.

Other than the altstack handling, I think the series is a good state! It
would great if we could see a v14 land in -next...


Bj?rn

