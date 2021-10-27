From: Maxim Levitsky <mlevitsk@redhat.com>
Date: Wed, 27 Oct 2021 13:18:24 +0300
Subject: [PATCH v2 05/43] KVM: Update halt-polling stats if and only if
 halt-polling was attempted
In-Reply-To: <20211009021236.4122790-6-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-6-seanjc@google.com>
Message-ID: <d13520b7a5a78b26ec994ec66d2fea6deddad40a.camel@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2021-10-08 at 19:11 -0700, Sean Christopherson wrote:
> Don't update halt-polling stats if halt-polling wasn't attempted.  This
> is a nop as @poll_ns is guaranteed to be '0' (poll_end == start), but it
> will allow a future patch to move the histogram stats into the helper to
> resolve a discrepancy in what is considered a "successful" halt-poll.
> 
> No functional change intended.
> 
> Reviewed-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 5d4a90032277..6156719bcbbc 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3217,6 +3217,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  {
>  	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
>  	bool halt_poll_allowed = !kvm_arch_no_poll(vcpu);
> +	bool do_halt_poll = halt_poll_allowed && vcpu->halt_poll_ns;
>  	ktime_t start, cur, poll_end;
>  	bool waited = false;
>  	u64 block_ns;
> @@ -3224,7 +3225,7 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  	kvm_arch_vcpu_blocking(vcpu);
>  
>  	start = cur = poll_end = ktime_get();
> -	if (vcpu->halt_poll_ns && halt_poll_allowed) {
> +	if (do_halt_poll) {
>  		ktime_t stop = ktime_add_ns(ktime_get(), vcpu->halt_poll_ns);
>  
>  		++vcpu->stat.generic.halt_attempted_poll;
> @@ -3276,8 +3277,9 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  	kvm_arch_vcpu_unblocking(vcpu);
>  	block_ns = ktime_to_ns(cur) - ktime_to_ns(start);
>  
> -	update_halt_poll_stats(
> -		vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
> +	if (do_halt_poll)
> +		update_halt_poll_stats(
> +			vcpu, ktime_to_ns(ktime_sub(poll_end, start)), waited);
>  
>  	if (halt_poll_allowed) {
>  		if (!vcpu_valid_wakeup(vcpu)) {
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky


