From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 27 Oct 2021 18:18:13 +0300
Subject: [PATCH v2 18/43] KVM: x86: Invoke kvm_vcpu_block() directly for
 non-HALTED wait states
In-Reply-To: <20211009021236.4122790-19-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-19-seanjc@google.com>
Message-ID: <796f9a7d553a0e13da5c44597666962620c64303.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Call kvm_vcpu_block() directly for all wait states except HALTED so that
> kvm_vcpu_halt() is no longer a misnomer on x86.
> 
> Functionally, this means KVM will never attempt halt-polling or adjust
> vcpu->halt_poll_ns for INIT_RECEIVED (a.k.a. Wait-For-SIPI (WFS)) or
> AP_RESET_HOLD; UNINITIALIZED is handled in kvm_arch_vcpu_ioctl_run(),
> and x86 doesn't use any other "wait" states.
> 
> As mentioned above, the motivation of this is purely so that "halt" isn't
> overloaded on x86, e.g. in KVM's stats.  Skipping halt-polling for WFS
> (and RESET_HOLD) has no meaningful effect on guest performance as there
> are typically single-digit numbers of INIT-SIPI sequences per AP vCPU,
> per boot, versus thousands of HLTs just to boot to console.
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index cd51f100e906..e0219acfd9cf 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9899,7 +9899,10 @@ static inline int vcpu_block(struct kvm *kvm, struct kvm_vcpu *vcpu)
>  	if (!kvm_arch_vcpu_runnable(vcpu) &&
>  	    (!kvm_x86_ops.pre_block || static_call(kvm_x86_pre_block)(vcpu) == 0)) {
>  		srcu_read_unlock(&kvm->srcu, vcpu->srcu_idx);
> -		kvm_vcpu_halt(vcpu);
> +		if (vcpu->arch.mp_state == KVM_MP_STATE_HALTED)
> +			kvm_vcpu_halt(vcpu);
> +		else
> +			kvm_vcpu_block(vcpu);
>  		vcpu->srcu_idx = srcu_read_lock(&kvm->srcu);
>  
>  		if (kvm_x86_ops.post_block)

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


