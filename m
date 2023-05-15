From: Björn Töpel <bjorn@kernel.org>
Date: Mon, 15 May 2023 13:42:56 +0200
Subject: [PATCH -next v19 21/24] riscv: Add sysctl to set the default
 vector rule for new processes
In-Reply-To: <20230509103033.11285-22-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-22-andy.chiu@sifive.com>
Message-ID: <87mt25hlbz.fsf@all.your.base.are.belong.to.us>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andy Chiu <andy.chiu@sifive.com> writes:

> To support Vector extension, the series exports variable-length vector
> registers on the signal frame. However, this potentially breaks abi if
> processing vector registers is required in the signal handler for old
> binaries. For example, there is such need if user-level context switch
> is triggerred via signals[1].
>
> For this reason, it is best to leave a decision to distro maintainers,
> where the enablement of userspace Vector for new launching programs can
> be controlled. Developers may also need the switch to experiment with.
> The parameter is configurable through sysctl interface so a distro may
> turn off Vector early at init script if the break really happens in the
> wild.
>
> The switch will only take effects on new execve() calls once set. This
> will not effect existing processes that do not call execve(), nor
> processes which has been set with a non-default vstate_ctrl by making
> explicit PR_RISCV_V_SET_CONTROL prctl() calls.
>
> Link: https://lore.kernel.org/all/87cz4048rp.fsf at all.your.base.are.belong.to.us/
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/kernel/vector.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 16ccb35625a9..1c4ac821e008 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -233,3 +233,34 @@ unsigned int riscv_v_vstate_ctrl_set_current(unsigned long arg)
>  
>  	return -EINVAL;
>  }
> +
> +#ifdef CONFIG_SYSCTL
> +
> +static struct ctl_table riscv_v_default_vstate_table[] = {
> +	{
> +		.procname	= "riscv_v_default_allow",
> +		.data		= &riscv_v_implicit_uacc,

Now that riscv_v_implicit_uacc can be changed via sysctl, I'd add
explicit READ_ONCE() to the accesses to make race checkers happy.


Bj?rn

