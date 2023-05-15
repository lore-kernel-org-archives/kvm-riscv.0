From: Björn Töpel <bjorn@kernel.org>
Date: Mon, 15 May 2023 13:38:20 +0200
Subject: [PATCH -next v19 20/24] riscv: Add prctl controls for userspace
 vector management
In-Reply-To: <20230509103033.11285-21-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-21-andy.chiu@sifive.com>
Message-ID: <87ttwdhljn.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> This patch add two riscv-specific prctls, to allow usespace control the
> use of vector unit:

A more general question; I know that it's only x86 that implements
arch_prctl(), and that arm64 added the SVE prctl kernel/sys.c -- but is
there a reason not to have an arch-specific prctl for riscv?

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
>  arch/riscv/include/asm/processor.h |  13 ++++
>  arch/riscv/include/asm/vector.h    |   4 ++
>  arch/riscv/kernel/process.c        |   1 +
>  arch/riscv/kernel/vector.c         | 108 +++++++++++++++++++++++++++++
>  arch/riscv/kvm/vcpu.c              |   2 +
>  include/uapi/linux/prctl.h         |  11 +++
>  kernel/sys.c                       |  12 ++++
>  7 files changed, 151 insertions(+)
>
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 38ded8c5f207..79261da74cfd 100644
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
> +extern unsigned int riscv_v_vstate_ctrl_set_current(unsigned long arg);
> +extern unsigned int riscv_v_vstate_ctrl_get_current(void);
> +#else /* !CONFIG_RISCV_ISA_V */
> +#define RISCV_V_SET_CONTROL(arg)	(-EINVAL)
> +#define RISCV_V_GET_CONTROL()		(-EINVAL)

The else-clause is not needed (see my comment below for kernel/sys.c),
and can be removed.

> +#endif /* CONFIG_RISCV_ISA_V */
> +
>  #endif /* __ASSEMBLY__ */
>  
>  #endif /* _ASM_RISCV_PROCESSOR_H */

> diff --git a/kernel/sys.c b/kernel/sys.c
> index 339fee3eff6a..412d2c126060 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -140,6 +140,12 @@
>  #ifndef GET_TAGGED_ADDR_CTRL
>  # define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
>  #endif
> +#ifndef PR_RISCV_V_SET_CONTROL
> +# define PR_RISCV_V_SET_CONTROL(a)	(-EINVAL)
> +#endif
> +#ifndef PR_RISCV_V_GET_CONTROL
> +# define PR_RISCV_V_GET_CONTROL()	(-EINVAL)

Both SET/GET above should be RISCV_V_{SET,GET}_CONTROL (without the
prefix "PR_"), and nothing else, otherwise...

> +#endif
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
> +		break;


...the case here will be weird. ;-)


Bj?rn

