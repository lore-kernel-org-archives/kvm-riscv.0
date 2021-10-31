From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Sun, 31 Oct 2021 16:50:39 +0200
Subject: [PATCH v2 36/43] KVM: SVM: Don't bother checking for "running"
 AVIC when kicking for IPIs
In-Reply-To: <20211009021236.4122790-37-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-37-seanjc@google.com>
Message-ID: <ca017e53bfa81d96dc534e395ff35b6899607fd8.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Drop the avic_vcpu_is_running() check when waking vCPUs in response to a
> VM-Exit due to incomplete IPI delivery.  The check isn't wrong per se, but
> it's not 100% accurate in the sense that it doesn't guarantee that the vCPU
> was one of the vCPUs that didn't receive the IPI.
> 
> The check isn't required for correctness as blocking == !running in this
> context.
> 
> From a performance perspective, waking a live task is not expensive as the
> only moderately costly operation is a locked operation to temporarily
> disable preemption.  And if that is indeed a performance issue,
> kvm_vcpu_is_blocking() would be a better check than poking into the AVIC.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 15 +++++++++------
>  arch/x86/kvm/svm/svm.h  | 11 -----------
>  2 files changed, 9 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index cbf02e7e20d0..b43b05610ade 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -295,13 +295,16 @@ static void avic_kick_target_vcpus(struct kvm *kvm, struct kvm_lapic *source,
>  	struct kvm_vcpu *vcpu;
>  	int i;
>  
> +	/*
> +	 * Wake any target vCPUs that are blocking, i.e. waiting for a wake
> +	 * event.  There's no need to signal doorbells, as hardware has handled
> +	 * vCPUs that were in guest at the time of the IPI, and vCPUs that have
> +	 * since entered the guest will have processed pending IRQs at VMRUN.
> +	 */
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
> -		bool m = kvm_apic_match_dest(vcpu, source,
> -					     icrl & APIC_SHORT_MASK,
> -					     GET_APIC_DEST_FIELD(icrh),
> -					     icrl & APIC_DEST_MASK);
> -
> -		if (m && !avic_vcpu_is_running(vcpu))
> +		if (kvm_apic_match_dest(vcpu, source, icrl & APIC_SHORT_MASK,
> +					GET_APIC_DEST_FIELD(icrh),
> +					icrl & APIC_DEST_MASK))
>  			kvm_vcpu_wake_up(vcpu);
>  	}
>  }
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 0d7bbe548ac3..7f5b01bbee29 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -509,17 +509,6 @@ extern struct kvm_x86_nested_ops svm_nested_ops;
>  
>  #define VMCB_AVIC_APIC_BAR_MASK		0xFFFFFFFFFF000ULL
>  
> -static inline bool (struct kvm_vcpu *vcpu)
> -{
> -	struct vcpu_svm *svm = to_svm(vcpu);
> -	u64 *entry = svm->avic_physical_id_cache;
> -
> -	if (!entry)
> -		return false;
> -
> -	return (READ_ONCE(*entry) & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK);
> -}
> -
>  int avic_ga_log_notifier(u32 ga_tag);
>  void avic_vm_destroy(struct kvm *kvm);
>  int avic_vm_init(struct kvm *kvm);


I guess this makes sense to do, to get rid of the avic_vcpu_is_running.
As you explained in previous patch, waking up a live task isn't that expensive,
so let it be.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky 


