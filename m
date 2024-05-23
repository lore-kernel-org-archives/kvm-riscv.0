From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 24 May 2024 10:42:50 +1200
Subject: [PATCH v2 5/6] KVM: x86: Unconditionally set l1tf_flush_l1d
 during vCPU load
In-Reply-To: <20240522014013.1672962-6-seanjc@google.com>
References: <20240522014013.1672962-1-seanjc@google.com>
 <20240522014013.1672962-6-seanjc@google.com>
Message-ID: <7a7a94db-9019-44bb-95b0-dd3ef3560178@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 22/05/2024 1:40 pm, Sean Christopherson wrote:
> Always set l1tf_flush_l1d during kvm_arch_vcpu_load() instead of setting
> it only when the vCPU is being scheduled back in.  The flag is processed
> only when VM-Enter is imminent, and KVM obviously needs to load the vCPU
> before VM-Enter, so attempting to precisely set l1tf_flush_l1d provides no
> meaningful value.  I.e. the flag _will_ be set either way, it's simply a
> matter of when.

Seems reasonable.

> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Acked-by: Kai Huang <kai.huang@intel.com>

>   arch/x86/kvm/x86.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 59aa772af755..60fea297f91f 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -5006,12 +5006,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
>   	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
>   
> -	if (vcpu->scheduled_out) {
> -		vcpu->arch.l1tf_flush_l1d = true;
> -		if (pmu->version && unlikely(pmu->event_count)) {
> -			pmu->need_cleanup = true;
> -			kvm_make_request(KVM_REQ_PMU, vcpu);
> -		}
> +	vcpu->arch.l1tf_flush_l1d = true;
> +
> +	if (vcpu->scheduled_out && pmu->version && pmu->event_count) {
> +		pmu->need_cleanup = true;
> +		kvm_make_request(KVM_REQ_PMU, vcpu);
>   	}

Nit, the unlikely() is lost, but I guess it is OK?

