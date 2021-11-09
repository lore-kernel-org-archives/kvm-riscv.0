From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:38:02 +0100
Subject: [PATCH v5.5 02/30] KVM: Disallow user memslot with size that
 exceeds "unsigned long"
In-Reply-To: <20211104002531.1176691-3-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-3-seanjc@google.com>
Message-ID: <2f451590-bf89-d447-d92a-fe9f3f41ca74@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Reject userspace memslots whose size exceeds the storage capacity of an
> "unsigned long".  KVM's uAPI takes the size as u64 to support large slots
> on 64-bit hosts, but does not account for the size being truncated on
> 32-bit hosts in various flows.  The access_ok() check on the userspace
> virtual address in particular casts the size to "unsigned long" and will
> check the wrong number of bytes.
> 
> KVM doesn't actually support slots whose size doesn't fit in an "unsigned
> long", e.g. KVM's internal kvm_memory_slot.npages is an "unsigned long",
> not a "u64", and misc arch specific code follows that behavior.
> 
> Fixes: fa3d315a4ce2 ("KVM: Validate userspace_addr of memslot when registered")
> Cc: stable at vger.kernel.org
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   virt/kvm/kvm_main.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 99e69375c4c9..83287730389f 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1689,7 +1689,8 @@ int __kvm_set_memory_region(struct kvm *kvm,
>   	id = (u16)mem->slot;
>   
>   	/* General sanity checks */
> -	if (mem->memory_size & (PAGE_SIZE - 1))
> +	if ((mem->memory_size & (PAGE_SIZE - 1)) ||
> +	    (mem->memory_size != (unsigned long)mem->memory_size))
>   		return -EINVAL;
>   	if (mem->guest_phys_addr & (PAGE_SIZE - 1))
>   		return -EINVAL;
> 

Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

