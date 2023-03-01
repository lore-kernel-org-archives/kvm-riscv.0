From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 17:29:56 +0000
Subject: [PATCH -next v14 11/19] riscv: Add ptrace vector support
In-Reply-To: <20230224170118.16766-12-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-12-andy.chiu@sifive.com>
Message-ID: <Y/+LlNjJKA93FM7w@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:10PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch adds ptrace support for riscv vector. The vector registers will
> be saved in datap pointer of __riscv_v_ext_state. This pointer will be set
> right after the __riscv_v_ext_state data structure then it will be put in
> ubuf for ptrace system call to get or set. It will check if the datap got
> from ubuf is set to the correct address or not when the ptrace system call
> is trying to set the vector registers.
> 
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---

> +static int riscv_vr_get(struct task_struct *target,
> +			const struct user_regset *regset,
> +			struct membuf to)
> +{
> +	struct __riscv_v_ext_state *vstate = &target->thread.vstate;
> +
> +	if (!riscv_v_vstate_query(task_pt_regs(target)))
> +		return -EINVAL;
> +	/*

With the tiny nit of a missing newline after the return, both here and
in _get(),  this looks grand to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/423c47ea/attachment-0001.sig>
