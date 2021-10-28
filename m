From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Thu, 28 Oct 2021 18:45:49 +0300
Subject: [PATCH v2 33/43] KVM: x86: Unexport LAPIC's
 switch_to_{hv,sw}_timer() helpers
In-Reply-To: <20211009021236.4122790-34-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-34-seanjc@google.com>
Message-ID: <3de5e09ed40b96bcea1267c0e55bcbe552a91d85.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Unexport switch_to_{hv,sw}_timer() now that common x86 handles the
> transitions.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/lapic.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
> index 0cd7ed21b205..cfb64bd4a1c1 100644
> --- a/arch/x86/kvm/lapic.c
> +++ b/arch/x86/kvm/lapic.c
> @@ -1948,7 +1948,6 @@ void kvm_lapic_switch_to_hv_timer(struct kvm_vcpu *vcpu)
>  {
>  	restart_apic_timer(vcpu->arch.apic);
>  }
> -EXPORT_SYMBOL_GPL(kvm_lapic_switch_to_hv_timer);
>  
>  void kvm_lapic_switch_to_sw_timer(struct kvm_vcpu *vcpu)
>  {
> @@ -1960,7 +1959,6 @@ void kvm_lapic_switch_to_sw_timer(struct kvm_vcpu *vcpu)
>  		start_sw_timer(apic);
>  	preempt_enable();
>  }
> -EXPORT_SYMBOL_GPL(kvm_lapic_switch_to_sw_timer);
>  
>  void kvm_lapic_restart_hv_timer(struct kvm_vcpu *vcpu)
>  {

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


