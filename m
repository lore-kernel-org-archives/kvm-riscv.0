From: Huang, Kai <kai.huang@intel.com>
Date: Wed, 1 Nov 2023 10:52:47 +0000
Subject: [PATCH v13 09/35] KVM: Add KVM_EXIT_MEMORY_FAULT exit to report
 faults to userspace
In-Reply-To: <20231027182217.3615211-10-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
	 <20231027182217.3615211-10-seanjc@google.com>
Message-ID: <482bfea6f54ea1bb7d1ad75e03541d0ba0e5be6f.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> +7.34 KVM_CAP_MEMORY_FAULT_INFO
> +------------------------------
> +
> +:Architectures: x86
> +:Returns: Informational only, -EINVAL on direct KVM_ENABLE_CAP.
> +
> +The presence of this capability indicates that KVM_RUN will fill
> +kvm_run.memory_fault if KVM cannot resolve a guest page fault VM-Exit, e.g. if
> +there is a valid memslot but no backing VMA for the corresponding host virtual
> +address.
> +
> +The information in kvm_run.memory_fault is valid if and only if KVM_RUN returns
> +an error with errno=EFAULT or errno=EHWPOISON *and* kvm_run.exit_reason is set
> +to KVM_EXIT_MEMORY_FAULT.

IIUC returning -EFAULT or whatever -errno is sort of KVM internal
implementation.  Is it better to relax the validity of kvm_run.memory_fault when
KVM_RUN returns any -errno?

[...]


> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2327,4 +2327,15 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
>  /* Max number of entries allowed for each kvm dirty ring */
>  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
>  
> +static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> +						 gpa_t gpa, gpa_t size)
> +{
> +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> +	vcpu->run->memory_fault.gpa = gpa;
> +	vcpu->run->memory_fault.size = size;
> +
> +	/* Flags are not (yet) defined or communicated to userspace. */
> +	vcpu->run->memory_fault.flags = 0;
> +}
> +

KVM_CAP_MEMORY_FAULT_INFO is x86 only, is it better to put this function to
<asm/kvm_host.h>?

