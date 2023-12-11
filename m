From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Mon, 11 Dec 2023 09:06:33 -0300
Subject: [PATCH] RISC-V: KVM: remove a redundant condition in
 kvm_arch_vcpu_ioctl_run()
In-Reply-To: <20231211094014.4041-1-duchao@eswincomputing.com>
References: <20231211094014.4041-1-duchao@eswincomputing.com>
Message-ID: <94bcaa6d-fe18-4eed-b2d4-a6a5521230bf@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/11/23 06:40, Chao Du wrote:
> The latest ret value is updated by kvm_riscv_vcpu_aia_update(),
> the loop will continue if the ret is less than or equal to zero.
> So the later condition will never hit. Thus remove it.

Good catch. There's another potential optimization to be done a little above
this change:


	while (ret > 0) {
		(...)

		/* Update AIA HW state before entering guest */
		ret = kvm_riscv_vcpu_aia_update(vcpu);
		if (ret <= 0) {
			preempt_enable();
			continue; <------------------
		}
		(...)

Note that this 'continue' isn't doing much - we'll restart the loop with ret <= 0
while requiring ret > 0 to do another iteration. I.e. this 'continue' can be
replaced for 'break' without compromising the logic.

(of course, testing it to be sure is always advised :D )

> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   arch/riscv/kvm/vcpu.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e087c809073c..bf3952d1a621 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -757,8 +757,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   		/* Update HVIP CSR for current CPU */
>   		kvm_riscv_update_hvip(vcpu);
>   
> -		if (ret <= 0 ||
> -		    kvm_riscv_gstage_vmid_ver_changed(&vcpu->kvm->arch.vmid) ||
> +		if (kvm_riscv_gstage_vmid_ver_changed(&vcpu->kvm->arch.vmid) ||
>   		    kvm_request_pending(vcpu) ||
>   		    xfer_to_guest_mode_work_pending()) {
>   			vcpu->mode = OUTSIDE_GUEST_MODE;

