From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 21 Jul 2023 17:07:44 +0200
Subject: [RFC PATCH v11 15/29] KVM: Drop superfluous
 __KVM_VCPU_MULTIPLE_ADDRESS_SPACE macro
In-Reply-To: <20230718234512.1690985-16-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-16-seanjc@google.com>
Message-ID: <123035a3-9d0d-70be-9894-f89a84c7e8fd@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/23 01:44, Sean Christopherson wrote:
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h | 1 -
>   include/linux/kvm_host.h        | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index b87ff7b601fa..7a905e033932 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -2105,7 +2105,6 @@ enum {
>   #define HF_SMM_MASK		(1 << 1)
>   #define HF_SMM_INSIDE_NMI_MASK	(1 << 2)
>   
> -# define __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
>   # define KVM_ADDRESS_SPACE_NUM 2
>   # define kvm_arch_vcpu_memslots_id(vcpu) ((vcpu)->arch.hflags & HF_SMM_MASK ? 1 : 0)
>   # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, (role).smm)
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 0d1e2ee8ae7a..5839ef44e145 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -693,7 +693,7 @@ bool kvm_arch_irqchip_in_kernel(struct kvm *kvm);
>   #define KVM_MEM_SLOTS_NUM SHRT_MAX
>   #define KVM_USER_MEM_SLOTS (KVM_MEM_SLOTS_NUM - KVM_INTERNAL_MEM_SLOTS)
>   
> -#ifndef __KVM_VCPU_MULTIPLE_ADDRESS_SPACE
> +#if KVM_ADDRESS_SPACE_NUM == 1
>   static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>   {
>   	return 0;

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


