From: Sean Christopherson <seanjc@google.com>
Date: Fri, 22 Sep 2023 09:35:55 -0700
Subject: [RFC PATCH v12 07/33] KVM: Add KVM_EXIT_MEMORY_FAULT exit to
 report faults to userspace
In-Reply-To: <ZQ3AmLO2SYv3DszH@google.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-8-seanjc@google.com>
 <117db856-9aec-e91c-b1d4-db2b90ae563d@intel.com> <ZQ3AmLO2SYv3DszH@google.com>
Message-ID: <ZQ3CaxXY1uUETsI5@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 22, 2023, Sean Christopherson wrote:
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 7c0e38752526..d13b646188e5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4184,6 +4184,16 @@ static long kvm_vcpu_ioctl(struct file *filp,
>  				synchronize_rcu();
>  			put_pid(oldpid);
>  		}
> +
> +		/*
> +		 * Reset the exit reason if the previous userspace exit was due
> +		 * to a memory fault.  Not all -EFAULT exits are annotated, and
> +		 * so leaving exit_reason set to KVM_EXIT_MEMORY_FAULT could
> +		 * result in feeding userspace stale information.
> +		 */
> +		if (vcpu->run->exit_reason == KVM_EXIT_MEMORY_FAULT)
> +			vcpu->run->exit_reason = KVM_EXIT_UNKNOWN

Darn semicolons.  Doesn't look like I botched anything else though.

> +
>  		r = kvm_arch_vcpu_ioctl_run(vcpu);
>  		trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
>  		break;
> 
> base-commit: 2358793cd9062b068ac25ac9c965c00d685eea92
> -- 
> 2.42.0.515.g380fc7ccd1-goog
> 


