From: Huang, Kai <kai.huang@intel.com>
Date: Mon, 6 Nov 2023 09:27:06 +0000
Subject: [PATCH 08/34] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <20231105163040.14904-9-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
	 <20231105163040.14904-9-pbonzini@redhat.com>
Message-ID: <f42154178a882e3df7696821c85881f10c724a5b.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 7025b3751027..bdea1423c5f8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -1340,6 +1340,7 @@ yet and must be cleared on entry.
>  	__u64 guest_phys_addr;
>  	__u64 memory_size; /* bytes */
>  	__u64 userspace_addr; /* start of the userspace allocated memory */
> +	__u64 pad[16];

Looks this "pad[16]" should be moved to ...

>    };
>  
>    /* for kvm_userspace_memory_region::flags */
> @@ -6192,6 +6193,27 @@ to know what fields can be changed for the system register described by
>  ``op0, op1, crn, crm, op2``. KVM rejects ID register values that describe a
>  superset of the features supported by the system.
>  
> +4.140 KVM_SET_USER_MEMORY_REGION2
> +---------------------------------
> +
> +:Capability: KVM_CAP_USER_MEMORY2
> +:Architectures: all
> +:Type: vm ioctl
> +:Parameters: struct kvm_userspace_memory_region2 (in)
> +:Returns: 0 on success, -1 on error
> +
> +::
> +
> +  struct kvm_userspace_memory_region2 {
> +	__u32 slot;
> +	__u32 flags;
> +	__u64 guest_phys_addr;
> +	__u64 memory_size; /* bytes */
> +	__u64 userspace_addr; /* start of the userspace allocated memory */
> +  };
> +

... here.

Acked-by: Kai Huang <kai.huang@intel.com>
