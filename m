From: Huang, Kai <kai.huang@intel.com>
Date: Fri, 24 May 2024 10:47:12 +1200
Subject: [PATCH v2 3/6] KVM: x86: Fold kvm_arch_sched_in() into
 kvm_arch_vcpu_load()
In-Reply-To: <20240522014013.1672962-4-seanjc@google.com>
References: <20240522014013.1672962-1-seanjc@google.com>
 <20240522014013.1672962-4-seanjc@google.com>
Message-ID: <c77f3931-31b2-4695-bd74-c69cba9b96c1@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 22/05/2024 1:40 pm, Sean Christopherson wrote:
> Fold the guts of kvm_arch_sched_in() into kvm_arch_vcpu_load(), keying
> off the recently added kvm_vcpu.scheduled_out as appropriate.
> 
> Note, there is a very slight functional change, as PLE shrink updates will
> now happen after blasting WBINVD, but that is quite uninteresting as the
> two operations do not interact in any way.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---

Acked-by: Kai Huang <kai.huang@intel.com>

[...]

> @@ -1548,6 +1548,9 @@ static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   	struct vcpu_svm *svm = to_svm(vcpu);
>   	struct svm_cpu_data *sd = per_cpu_ptr(&svm_data, cpu);
>   
> +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> +		shrink_ple_window(vcpu);
> +

[...]

> @@ -1517,6 +1517,9 @@ void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>   {
>   	struct vcpu_vmx *vmx = to_vmx(vcpu);
>   
> +	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
> +		shrink_ple_window(vcpu);
> +

Nit:  Perhaps we need a kvm_x86_ops::shrink_ple_window()?  :-)

