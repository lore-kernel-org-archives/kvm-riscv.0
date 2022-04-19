From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Tue, 19 Apr 2022 11:55:18 +0300
Subject: [PATCH 1/3] KVM: x86: Don't re-acquire SRCU lock in
 complete_emulated_io()
In-Reply-To: <20220415004343.2203171-2-seanjc@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-2-seanjc@google.com>
Message-ID: <204c7265de2d69ed240d18e30c7595702277cdbb.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2022-04-15 at 00:43 +0000, Sean Christopherson wrote:
> Don't re-acquire SRCU in complete_emulated_io() now that KVM acquires the
> lock in kvm_arch_vcpu_ioctl_run().  More importantly, don't overwrite
> vcpu->srcu_idx.  If the index acquired by complete_emulated_io() differs
> from the one acquired by kvm_arch_vcpu_ioctl_run(), KVM will effectively
> leak a lock and hang if/when synchronize_srcu() is invoked for the
> relevant grace period.
> 
> Fixes: 8d25b7beca7e ("KVM: x86: pull kvm->srcu read-side to kvm_arch_vcpu_ioctl_run")
> Cc: stable at vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/x86.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index ab336f7c82e4..f35fe09de59d 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -10450,12 +10450,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
>  
>  static inline int complete_emulated_io(struct kvm_vcpu *vcpu)
>  {
> -	int r;
> -
> -	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
> -	r = kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
> -	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
> -	return r;
> +	return kvm_emulate_instruction(vcpu, EMULTYPE_NO_DECODE);
>  }
>  
>  static int complete_emulated_pio(struct kvm_vcpu *vcpu)

I wonder how this did work....

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


