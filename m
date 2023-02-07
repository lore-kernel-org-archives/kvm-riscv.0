From: Gavin Shan <gshan@redhat.com>
Date: Tue, 7 Feb 2023 11:09:39 +1100
Subject: [PATCH 6/7] KVM: arm64: Change return type of
 kvm_vm_ioctl_mte_copy_tags() to "int"
In-Reply-To: <20230203094230.266952-7-thuth@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-7-thuth@redhat.com>
Message-ID: <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 2/3/23 8:42 PM, Thomas Huth wrote:
> This function only returns normal integer values, so there is
> no need to declare its return value as "long".
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 4 ++--
>   arch/arm64/kvm/guest.c            | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 35a159d131b5..b1a16343767f 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -963,8 +963,8 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>   int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>   			       struct kvm_device_attr *attr);
>   
> -long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> -				struct kvm_arm_copy_mte_tags *copy_tags);
> +int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> +			       struct kvm_arm_copy_mte_tags *copy_tags);
>   
>   /* Guest/host FPSIMD coordination helpers */
>   int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index cf4c495a4321..80e530549c34 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1013,8 +1013,8 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>   	return ret;
>   }
>   
> -long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> -				struct kvm_arm_copy_mte_tags *copy_tags)
> +int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> +			       struct kvm_arm_copy_mte_tags *copy_tags)
>   {
>   	gpa_t guest_ipa = copy_tags->guest_ipa;
>   	size_t length = copy_tags->length;
> 

It's possible for the function to return number of bytes have been copied.
Its type is 'size_t', same to 'unsigned long'. So 'int' doesn't have sufficient
space for it if I'm correct.

long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
                                 struct kvm_arm_copy_mte_tags *copy_tags)
{
         gpa_t guest_ipa = copy_tags->guest_ipa;
         size_t length = copy_tags->length;
         :
         :
out:
         mutex_unlock(&kvm->slots_lock);
         /* If some data has been copied report the number of bytes copied */
         if (length != copy_tags->length)
                 return copy_tags->length - length;
         return ret;
}

Thanks,
Gavin


