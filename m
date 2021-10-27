From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 27 Oct 2021 13:56:43 +0300
Subject: [PATCH v2 06/43] KVM: Refactor and document halt-polling stats
 update helper
In-Reply-To: <20211009021236.4122790-7-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-7-seanjc@google.com>
Message-ID: <4acc8c7fb3751be07953322a8334be140c2b153e.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:11 -0700, Sean Christopherson wrote:
> Add a comment to document that halt-polling is considered successful even
> if the polling loop itself didn't detect a wake event, i.e. if a wake
> event was detect in the final kvm_vcpu_check_block().  Invert the param
> to update helper so that the helper is a dumb function that is "told"
> whether or not polling was successful, as opposed to determining success
> based on blocking behavior.
> 
> Opportunistically tweak the params to the update helper to reduce the
> line length for the call site so that it fits on a single line, and so
> that the prototype conforms to the more traditional kernel style.
> 
> No functional change intended.
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 6156719bcbbc..4dfcd736b274 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3201,13 +3201,15 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
>  	return ret;
>  }
>  
> -static inline void
> -update_halt_poll_stats(struct kvm_vcpu *vcpu, u64 poll_ns, bool waited)
> +static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
> +					  ktime_t end, bool success)
>  {
> -	if (waited)
> -		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
> -	else
> +	u64 poll_ns = ktime_to_ns(ktime_sub(end, start));
> +
> +	if (success)
>  		vcpu->stat.generic.halt_poll_success_ns += poll_ns;
> +	else
> +		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
>  }
>  
>  /*
> @@ -3277,9 +3279,13 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  	kvm_arch_vcpu_unblocking(vcpu);
>  	block_ns = ktime_to_ns(cur) - ktime_to_ns(start);
>  
> +	/*
> +	 * Note, halt-polling is considered successful so long as the vCPU was
> +	 * never actually scheduled out, i.e. even if the wake event arrived
> +	 * after of the halt-polling loop itself, but before the full wait.
> +	 */
>  	if (do_halt_poll)
> -		update_halt_poll_stats(
> -			vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
> +		update_halt_poll_stats(vcpu, start, poll_end, !waited);
>  
>  	if (halt_poll_allowed) {
>  		if (!vcpu_valid_wakeup(vcpu)) {
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


