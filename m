From: Marc Zyngier <maz@kernel.org>
Date: Thu, 11 Nov 2021 19:36:34 +0000
Subject: [PATCH 1/5] KVM: arm64: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
In-Reply-To: <20211111162746.100598-2-vkuznets@redhat.com>
References: <20211111162746.100598-1-vkuznets@redhat.com>
 <20211111162746.100598-2-vkuznets@redhat.com>
Message-ID: <a5cdff6878b7157587e92ebe4d5af362@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Vitaly,

On 2021-11-11 16:27, Vitaly Kuznetsov wrote:
> It doesn't make sense to return the recommended maximum number of
> vCPUs which exceeds the maximum possible number of vCPUs.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  arch/arm64/kvm/arm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 7838e9fb693e..391dc7a921d5 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -223,7 +223,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
> long ext)
>  		r = 1;
>  		break;
>  	case KVM_CAP_NR_VCPUS:
> -		r = num_online_cpus();
> +		if (kvm)
> +			r = min_t(unsigned int, num_online_cpus(),
> +				  kvm->arch.max_vcpus);
> +		else
> +			r = min_t(unsigned int, num_online_cpus(),
> +				  kvm_arm_default_max_vcpus());
>  		break;
>  	case KVM_CAP_MAX_VCPUS:
>  	case KVM_CAP_MAX_VCPU_ID:

This looks odd. This means that depending on the phase userspace is
in while initialising the VM, KVM_CAP_NR_VCPUS can return one thing
or the other.

For example, I create a VM on a 32 CPU system, NR_VCPUS says 32.
I create a GICv2 interrupt controller, it now says 8.

That's a change in behaviour that is visible by userspace, which
I'm keen on avoiding. I'd rather have the kvm and !kvm cases
return the same thing.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

