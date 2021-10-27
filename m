From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 27 Oct 2021 14:29:46 +0300
Subject: [PATCH v2 07/43] KVM: Reconcile discrepancies in halt-polling
 stats
In-Reply-To: <20211009021236.4122790-8-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-8-seanjc@google.com>
Message-ID: <62231cec8a62db6bf2baba24cc55e0ec2515d0b1.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> Move the halt-polling "success" and histogram stats update into the
> dedicated helper to fix a discrepancy where the success/fail "time" stats
> consider polling successful so long as the wait is avoided, but the main
> "success" and histogram stats consider polling successful if and only if
> a wake event was detected by the halt-polling loop.
> 
> Move halt_attempted_poll to the helper as well so that all the stats are
> updated in a single location.  While it's a bit odd to update the stat
> well after the fact, practically speaking there's no meaningful advantage
> to updating before polling.
> 
> Note, there is a functional change in addition to the success vs. fail
> change.  The histogram updates previously called ktime_get() instead of
> using "cur".  But that change is desirable as it means all the stats are
> now updated with the same polling time, and avoids the extra ktime_get(),
> which isn't expensive but isn't free either.
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 35 ++++++++++++++++-------------------
>  1 file changed, 16 insertions(+), 19 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 4dfcd736b274..1292c7876d3f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3204,12 +3204,23 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
>  static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
>  					  ktime_t end, bool success)
>  {
> +	struct kvm_vcpu_stat_generic *stats = &vcpu->stat.generic;
>  	u64 poll_ns = ktime_to_ns(ktime_sub(end, start));
>  
> -	if (success)
> -		vcpu->stat.generic.halt_poll_success_ns += poll_ns;
> -	else
> -		vcpu->stat.generic.halt_poll_fail_ns += poll_ns;
> +	++vcpu->stat.generic.halt_attempted_poll;
> +
> +	if (success) {
> +		++vcpu->stat.generic.halt_successful_poll;
> +
> +		if (!vcpu_valid_wakeup(vcpu))
> +			++vcpu->stat.generic.halt_poll_invalid;
> +
> +		stats->halt_poll_success_ns += poll_ns;
> +		KVM_STATS_LOG_HIST_UPDATE(stats->halt_poll_success_hist, poll_ns);
> +	} else {
> +		stats->halt_poll_fail_ns += poll_ns;
> +		KVM_STATS_LOG_HIST_UPDATE(stats->halt_poll_fail_hist, poll_ns);
> +	}
>  }
>  
>  /*
> @@ -3230,30 +3241,16 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  	if (do_halt_poll) {
>  		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
>  
> -		++vcpu->stat.generic.halt_attempted_poll;
>  		do {
>  			/*
>  			 * This sets KVM_REQ_UNHALT if an interrupt
>  			 * arrives.
>  			 */
> -			if (kvm_vcpu_check_block(vcpu) < 0) {
> -				++vcpu->stat.generic.halt_successful_poll;
> -				if (!vcpu_valid_wakeup(vcpu))
> -					++vcpu->stat.generic.halt_poll_invalid;
> -
> -				KVM_STATS_LOG_HIST_UPDATE(
> -				      vcpu->stat.generic.halt_poll_success_hist,
> -				      ktime_to_ns(ktime_get()) -
> -				      ktime_to_ns(start));
> +			if (kvm_vcpu_check_block(vcpu) < 0)
>  				goto out;
> -			}
>  			cpu_relax();
>  			poll_end = cur = ktime_get();
>  		} while (kvm_vcpu_can_poll(cur, stop));
> -
> -		KVM_STATS_LOG_HIST_UPDATE(
> -				vcpu->stat.generic.halt_poll_fail_hist,
> -				ktime_to_ns(ktime_get()) - ktime_to_ns(start));
>  	}
>  
>  

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



