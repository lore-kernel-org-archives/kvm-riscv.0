From: Xiaoyao Li <xiaoyao.li@intel.com>
Date: Tue, 31 Oct 2023 10:27:56 +0800
Subject: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20231027182217.3615211-17-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-17-seanjc@google.com>
Message-ID: <aecdc915-8541-4933-b8cd-04ce0ade68e6@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10/28/2023 2:21 AM, Sean Christopherson wrote:
...
> +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
> +allows mapping guest_memfd memory into a guest.  All fields shared with
> +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVATE in
> +flags to have KVM bind the memory region to a given guest_memfd range of
> +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
> +must point at a file created via KVM_CREATE_GUEST_MEMFD on the current VM, and
> +the target range must not be bound to any other memory region.  All standard
> +bounds checks apply (use common sense).
> +
>   ::
>   
>     struct kvm_userspace_memory_region2 {
> @@ -6087,9 +6096,24 @@ applied.
>   	__u64 guest_phys_addr;
>   	__u64 memory_size; /* bytes */
>   	__u64 userspace_addr; /* start of the userspace allocated memory */
> +  __u64 guest_memfd_offset;

missing a tab

> +	__u32 guest_memfd;
> +	__u32 pad1;
> +	__u64 pad2[14];
>     };
>   


