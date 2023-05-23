From: Björn Töpel <bjorn@kernel.org>
Date: Tue, 23 May 2023 15:56:15 +0200
Subject: [PATCH -next v20 20/26] riscv: Add prctl controls for userspace
 vector management
In-Reply-To: <20230518161949.11203-21-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-21-andy.chiu@sifive.com>
Message-ID: <87pm6rb18g.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> This patch add two riscv-specific prctls, to allow usespace control the
> use of vector unit:
>
>  * PR_RISCV_V_SET_CONTROL: control the permission to use Vector at next,
>    or all following execve for a thread. Turning off a thread's Vector
>    live is not possible since libraries may have registered ifunc that
>    may execute Vector instructions.
>  * PR_RISCV_V_GET_CONTROL: get the same permission setting for the
>    current thread, and the setting for following execve(s).
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> ---
> Changelog v20:
>  - address build issue when KVM is compile as a module (Heiko)
>  - s/RISCV_V_DISABLE/RISCV_ISA_V_DEFAULT_ENABLE/ (Conor)
>  - change function names to have better scoping
>  - check has_vector() before accessing vstate_ctrl
>  - use proper return type for prctl calls (long instead of uint)
> ---
>  arch/riscv/include/asm/processor.h |  13 ++++
>  arch/riscv/include/asm/vector.h    |   4 +
>  arch/riscv/kernel/process.c        |   1 +
>  arch/riscv/kernel/vector.c         | 118 +++++++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu.c              |   2 +
>  include/uapi/linux/prctl.h         |  11 +++
>  kernel/sys.c                       |  12 +++
>  7 files changed, 161 insertions(+)
>
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 38ded8c5f207..17829c3003c8 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -40,6 +40,7 @@ struct thread_struct {
>  	unsigned long s[12];	/* s[0]: frame pointer */
>  	struct __riscv_d_ext_state fstate;
>  	unsigned long bad_cause;
> +	unsigned long vstate_ctrl;
>  	struct __riscv_v_ext_state vstate;
>  };
>  
> @@ -83,6 +84,18 @@ extern void riscv_fill_hwcap(void);
>  extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
>  
>  extern unsigned long signal_minsigstksz __ro_after_init;
> +
> +#ifdef CONFIG_RISCV_ISA_V
> +/* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
> +#define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
> +#define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()
> +extern long riscv_v_vstate_ctrl_set_current(unsigned long arg);
> +extern long riscv_v_vstate_ctrl_get_current(void);
> +#else /* !CONFIG_RISCV_ISA_V */
> +#define RISCV_V_SET_CONTROL(arg)	(-EINVAL)
> +#define RISCV_V_GET_CONTROL()		(-EINVAL)

This version doesn't fix the issue I pointed out in [1]. Let me try to
be more explicit.

RISCV_V_GET_CONTROL and RISCV_V_SET_CONTROL are a function (if
CONFIG_RISCV_ISA_V is defined), otherwise (-EINVAL). However, they are
redefined below, so you can remove the whole #else to #endif... 

[...]

> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index f23d9a16507f..3c36aeade991 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -294,4 +294,15 @@ struct prctl_mm_map {
>  
>  #define PR_SET_MEMORY_MERGE		67
>  #define PR_GET_MEMORY_MERGE		68
> +
> +#define PR_RISCV_V_SET_CONTROL		69
> +#define PR_RISCV_V_GET_CONTROL		70
> +# define PR_RISCV_V_VSTATE_CTRL_DEFAULT		0
> +# define PR_RISCV_V_VSTATE_CTRL_OFF		1
> +# define PR_RISCV_V_VSTATE_CTRL_ON		2
> +# define PR_RISCV_V_VSTATE_CTRL_INHERIT		(1 << 4)
> +# define PR_RISCV_V_VSTATE_CTRL_CUR_MASK	0x3
> +# define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
> +# define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
> +
>  #endif /* _LINUX_PRCTL_H */
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 339fee3eff6a..d0d3106698a1 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -140,6 +140,12 @@
>  #ifndef GET_TAGGED_ADDR_CTRL
>  # define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
>  #endif
> +#ifndef PR_RISCV_V_SET_CONTROL
> +# define RISCV_V_SET_CONTROL(a)		(-EINVAL)
> +#endif
> +#ifndef PR_RISCV_V_GET_CONTROL
> +# define RISCV_V_GET_CONTROL()		(-EINVAL)
> +#endif

...because they are defined to EINVAL here. Or at least they are
supposed to. Now, the 2nd issue was that #ifndef PR_RISCV_V_SET_CONTROL
should be #ifndef RISCV_V_SET_CONTROL (and dito for GET).

PR_RISCV_V_SET_CONTROL is *always* defined in the uapi header above.

So, change to:

  | #ifndef RISCV_V_SET_CONTROL
  | # define RISCV_V_SET_CONTROL(a)		(-EINVAL)
  | #endif
  | #ifndef RISCV_V_GET_CONTROL
  | # define RISCV_V_GET_CONTROL()		(-EINVAL)
  | #endif

and remove the #else above.

>  
>  /*
>   * this is where the system-wide overflow UID and GID are defined, for
> @@ -2708,6 +2714,12 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
>  		error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
>  		break;
>  #endif
> +	case PR_RISCV_V_SET_CONTROL:
> +		error = RISCV_V_SET_CONTROL(arg2);
> +		break;
> +	case PR_RISCV_V_GET_CONTROL:
> +		error = RISCV_V_GET_CONTROL();

PR_RISCV_V_{GET,SET}_CONTROL is always set!


Bj?rn

[1] https://lore.kernel.org/linux-riscv/87ttwdhljn.fsf at all.your.base.are.belong.to.us/

