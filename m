From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Oct 2023 17:37:42 +0100
Subject: [PATCH v13 07/35] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to
 CONFIG_KVM_GENERIC_MMU_NOTIFIER
In-Reply-To: <20231027182217.3615211-8-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-8-seanjc@google.com>
Message-ID: <09966596-397a-47c6-8f43-610a1013d34a@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/27/23 20:21, Sean Christopherson wrote:
> Convert KVM_ARCH_WANT_MMU_NOTIFIER into a Kconfig and select it where
> appropriate to effectively maintain existing behavior.  Using a proper
> Kconfig will simplify building more functionality on top of KVM's
> mmu_notifier infrastructure.
> 
> Add a forward declaration of kvm_gfn_range to kvm_types.h so that
> including arch/powerpc/include/asm/kvm_ppc.h's with CONFIG_KVM=n doesn't
> generate warnings due to kvm_gfn_range being undeclared.  PPC defines
> hooks for PR vs. HV without guarding them via #ifdeffery, e.g.
> 
>   bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
>   bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>   bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
>   bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
> 
> Alternatively, PPC could forward declare kvm_gfn_range, but there's no
> good reason not to define it in common KVM.

The new #define should also imply KVM_CAP_SYNC_MMU, or even: 
KVM_CAP_SYNC_MMU should just be enabled by all architectures at this 
point.  You don't need to care about it, I have a larger series for caps 
that are enabled by all architectures and I'll post it for 6.8.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


