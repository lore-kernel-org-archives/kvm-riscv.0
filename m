From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 27 Oct 2021 12:50:30 +0300
Subject: [PATCH v2 02/43] KVM: SVM: Ensure target pCPU is read once when
 signalling AVIC doorbell
In-Reply-To: <20211009021236.4122790-3-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-3-seanjc@google.com>
Message-ID: <aa1656c01ea5d46dd22c66da4a5eaa27f58810a2.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:11 -0700, Sean Christopherson wrote:
> Ensure vcpu->cpu is read once when signalling the AVIC doorbell.  If the
> compiler rereads the field and the vCPU is migrated between the check and
> writing the doorbell, KVM would signal the wrong physical CPU.

Since vcpu->cpu can change any moment anyway, adding READ_ONCE I think can't really fix anything
but I do agree that it makes this more readable.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>



> 
> Functionally, signalling the wrong CPU in this case is not an issue as
> task migration means the vCPU has exited and will pick up any pending
> interrupts on the next VMRUN.  Add the READ_ONCE() purely to clean up the
> code.
> 
> Opportunistically add a comment explaining the task migration behavior,
> and rename cpuid=>cpu to avoid conflating the CPU number with KVM's more
> common usage of CPUID.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/svm/avic.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> index 8052d92069e0..208c5c71e827 100644
> --- a/arch/x86/kvm/svm/avic.c
> +++ b/arch/x86/kvm/svm/avic.c
> @@ -675,10 +675,17 @@ int svm_deliver_avic_intr(struct kvm_vcpu *vcpu, int vec)
>  	smp_mb__after_atomic();
>  
>  	if (avic_vcpu_is_running(vcpu)) {
> -		int cpuid = vcpu->cpu;
> +		int cpu = READ_ONCE(vcpu->cpu);
>  
> -		if (cpuid != get_cpu())
> -			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpuid));
> +		/*
> +		 * Note, the vCPU could get migrated to a different pCPU at any
> +		 * point, which could result in signalling the wrong/previous
> +		 * pCPU.  But if that happens the vCPU is guaranteed to do a
> +		 * VMRUN (after being migrated) and thus will process pending
> +		 * interrupts, i.e. a doorbell is not needed (and the spurious)
> +		 */
> +		if (cpu != get_cpu())
> +			wrmsrl(SVM_AVIC_DOORBELL, kvm_cpu_get_apicid(cpu));
>  		put_cpu();
>  	} else
>  		kvm_vcpu_wake_up(vcpu);



