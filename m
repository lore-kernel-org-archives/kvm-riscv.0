From: Heiko Stübner <heiko@sntech.de>
Date: Tue, 09 May 2023 13:14:26 +0200
Subject: [PATCH -next v19 20/24] riscv: Add prctl controls for userspace vector
 management
In-Reply-To: <20230509103033.11285-21-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-21-andy.chiu@sifive.com>
Message-ID: <2629220.BddDVKsqQX@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

need to poke this more, but one issue popped up at first compile.

Am Dienstag, 9. Mai 2023, 12:30:29 CEST schrieb Andy Chiu:
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


> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 960a343799c6..16ccb35625a9 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -9,6 +9,7 @@
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/uaccess.h>
> +#include <linux/prctl.h>
>  
>  #include <asm/thread_info.h>
>  #include <asm/processor.h>
> @@ -19,6 +20,8 @@
>  #include <asm/ptrace.h>
>  #include <asm/bug.h>
>  
> +static bool riscv_v_implicit_uacc = !IS_ENABLED(CONFIG_RISCV_V_DISABLE);
> +
>  unsigned long riscv_v_vsize __read_mostly;
>  EXPORT_SYMBOL_GPL(riscv_v_vsize);
>  
> @@ -91,11 +94,51 @@ static int riscv_v_thread_zalloc(void)
>  	return 0;
>  }
>  
> +#define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
> +#define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
> +#define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
> +#define VSTATE_CTRL_GET_INHERIT(x) (!!((x) & PR_RISCV_V_VSTATE_CTRL_INHERIT))
> +static inline int riscv_v_get_cur_ctrl(struct task_struct *tsk)
> +{
> +	return VSTATE_CTRL_GET_CUR(tsk->thread.vstate_ctrl);
> +}
> +
> +static inline int riscv_v_get_next_ctrl(struct task_struct *tsk)
> +{
> +	return VSTATE_CTRL_GET_NEXT(tsk->thread.vstate_ctrl);
> +}
> +
> +static inline bool riscv_v_test_ctrl_inherit(struct task_struct *tsk)
> +{
> +	return VSTATE_CTRL_GET_INHERIT(tsk->thread.vstate_ctrl);
> +}
> +
> +static inline void riscv_v_set_ctrl(struct task_struct *tsk, int cur, int nxt,
> +				    bool inherit)
> +{
> +	unsigned long ctrl;
> +
> +	ctrl = cur & PR_RISCV_V_VSTATE_CTRL_CUR_MASK;
> +	ctrl |= VSTATE_CTRL_MAKE_NEXT(nxt);
> +	if (inherit)
> +		ctrl |= PR_RISCV_V_VSTATE_CTRL_INHERIT;
> +	tsk->thread.vstate_ctrl = ctrl;
> +}
> +
> +bool riscv_v_user_allowed(void)
> +{
> +	return riscv_v_get_cur_ctrl(current) == PR_RISCV_V_VSTATE_CTRL_ON;
> +}

EXPORT_SYMBOL(riscv_v_user_allowed);

kvm is allowed to be built as module, so you could end up with:

ERROR: modpost: "riscv_v_user_allowed" [arch/riscv/kvm/kvm.ko] undefined!
make[2]: *** [../scripts/Makefile.modpost:136: Module.symvers] Fehler 1
make[1]: *** [/home/devel/hstuebner/00_git-repos/linux-riscv/Makefile:1978: modpost] Fehler 2
make[1]: Verzeichnis ?/home/devel/hstuebner/00_git-repos/linux-riscv/_build-riscv64? wird verlassen
make: *** [Makefile:226: __sub-make] Fehler 2


Heiko




