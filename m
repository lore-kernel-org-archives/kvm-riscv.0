From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Fri, 12 Nov 2021 00:52:05 +0100
Subject: [PATCH v5.5 24/30] KVM: Use interval tree to do fast hva lookup
 in memslots
In-Reply-To: <20211104002531.1176691-25-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-25-seanjc@google.com>
Message-ID: <d76707b5-8710-b1a6-0cc6-defdaf9e37b7@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> 
> The current memslots implementation only allows quick binary search by gfn,
> quick lookup by hva is not possible - the implementation has to do a linear
> scan of the whole memslots array, even though the operation being performed
> might apply just to a single memslot.
> 
> This significantly hurts performance of per-hva operations with higher
> memslot counts.
> 
> Since hva ranges can overlap between memslots an interval tree is needed
> for tracking them.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> [sean: handle interval tree updates in kvm_replace_memslot()]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/Kconfig   |  1 +
>   arch/mips/kvm/Kconfig    |  1 +
>   arch/powerpc/kvm/Kconfig |  1 +
>   arch/s390/kvm/Kconfig    |  1 +
>   arch/x86/kvm/Kconfig     |  1 +
>   include/linux/kvm_host.h |  3 ++
>   virt/kvm/kvm_main.c      | 60 +++++++++++++++++++++++++++++-----------
>   7 files changed, 52 insertions(+), 16 deletions(-)
> 
(..)
> @@ -1262,22 +1274,32 @@ static void kvm_replace_memslot(struct kvm_memslots *slots,
>   				struct kvm_memory_slot *new)
>   {
>   	/*
> -	 * Remove the old memslot from the hash list, copying the node data
> -	 * would corrupt the list.
> +	 * Remove the old memslot from the hash list and interval tree, copying
> +	 * the node data would corrupt the structures.
>   	 */
>   	if (old) {
>   		hash_del(&old->id_node);
> +		interval_tree_remove(&old->hva_node, &slots->hva_tree);
>   
>   		if (!new)
>   			return;
>   	}
>   
> -	/* Copy the source *data*, not the pointer, to the destination. */
> -	if (old)
> +	/*
> +	 * Copy the source *data*, not the pointer, to the destination.  If
> +	 * @old is NULL, initialize @new's hva range.
> +	 */
> +	if (old) {
>   		*new = *old;
> +	} else if (new) {

Unnecessary check - if "new" is NULL then the code will crash anyway
accessing this pointer unconditionally...

> +		new->hva_node.start = new->userspace_addr;
> +		new->hva_node.last = new->userspace_addr +
> +				     (new->npages << PAGE_SHIFT) - 1;
> +	}
>   
>   	/* (Re)Add the new memslot. */
>   	hash_add(slots->id_hash, &new->id_node, new->id);
> +	interval_tree_insert(&new->hva_node, &slots->hva_tree);

...in these two lines above.

Thanks,
Maciej

