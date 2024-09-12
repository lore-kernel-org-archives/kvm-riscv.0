From: Quan Zhou <zhouquan@iscas.ac.cn>
Date: Thu, 12 Sep 2024 17:03:20 +0800
Subject: [PATCH] RISC-V: KVM: Redirect instruction access fault trap to
 guest
In-Reply-To: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
References: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
Message-ID: <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


On 2024/8/29 14:20, zhouquan at iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The M-mode redirects an unhandled instruction access
> fault trap back to S-mode when not delegating it to
> VS-mode(hedeleg). However, KVM running in HS-mode
> terminates the VS-mode software when back from M-mode.
> 
> The KVM should redirect the trap back to VS-mode, and
> let VS-mode trap handler decide the next step.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>   arch/riscv/kvm/vcpu_exit.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index fa98e5c024b2..696b62850d0b 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -182,6 +182,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>   	ret = -EFAULT;
>   	run->exit_reason = KVM_EXIT_UNKNOWN;
>   	switch (trap->scause) {
> +	case EXC_INST_ACCESS:

A gentle ping, the instruction access fault should be redirected to
VS-mode for handling, is my understanding correct?

>   	case EXC_INST_ILLEGAL:
>   	case EXC_LOAD_MISALIGNED:
>   	case EXC_STORE_MISALIGNED:
> 
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba


