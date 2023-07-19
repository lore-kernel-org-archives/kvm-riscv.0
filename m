From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 19 Jul 2023 19:34:22 +0200
Subject: [RFC PATCH v11 04/29] KVM: PPC: Drop dead code related to
 KVM_ARCH_WANT_MMU_NOTIFIER
In-Reply-To: <20230718234512.1690985-5-seanjc@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-5-seanjc@google.com>
Message-ID: <cd866d4c-839a-8606-2931-063cca4df514@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/19/23 01:44, Sean Christopherson wrote:
> Signed-off-by: Sean Christopherson<seanjc@google.com>
> ---
>   arch/powerpc/kvm/powerpc.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 7197c8256668..5cf9e5e3112a 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -634,10 +634,11 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_SYNC_MMU:
>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>   		r = hv_enabled;

This could actually be unnecessarily conservative.  Even book3s_pr.c 
knows how to do unmap and set_spte, so it should be able to support 
KVM_CAP_SYNC_MMU.  Alex, Nick, do you remember any of this?  This would 
mean moving KVM_CAP_SYNC_MMU to virt/kvm/kvm_main.c, which is nice.

Paolo

> -#elif defined(KVM_ARCH_WANT_MMU_NOTIFIER)
> -		r = 1;
>   #else
> -		r = 0;
> +#ifndef KVM_ARCH_WANT_MMU_NOTIFIER
> +		BUILD_BUG();
> +#endif
> +		r = 1;
>   #endif
>   		break;
>   #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE


