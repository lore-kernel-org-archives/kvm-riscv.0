From: Xu Yilun <yilun.xu@linux.intel.com>
Date: Fri, 3 Nov 2023 12:09:01 +0800
Subject: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
In-Reply-To: <20231027182217.3615211-10-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-10-seanjc@google.com>
Message-ID: <ZURyXWhZDSCBnMV1@yilunxu-OptiPlex-7050>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 27, 2023 at 11:21:51AM -0700, Sean Christopherson wrote:
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6723,6 +6723,26 @@ array field represents return values. The userspace should update the return
>  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
>  spec refer, https://github.com/riscv/riscv-sbi-doc.
>  
> +::
> +
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory;
                  ^

Should update to "memory_fault" to align with other places.

[...]

> @@ -520,6 +521,12 @@ struct kvm_run {
>  #define KVM_NOTIFY_CONTEXT_INVALID	(1 << 0)
>  			__u32 flags;
>  		} notify;
> +		/* KVM_EXIT_MEMORY_FAULT */
> +		struct {
> +			__u64 flags;
> +			__u64 gpa;
> +			__u64 size;
> +		} memory_fault;
>  		/* Fix the size of the union. */
>  		char padding[256];
>  	};

Thanks,
Yilun

> 

