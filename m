From: Michael Roth <michael.roth@amd.com>
Date: Mon, 18 Sep 2023 13:07:54 -0500
Subject: [RFC PATCH v12 10/33] KVM: Set the stage for handling only
 shared mappings in mmu_notifier events
In-Reply-To: <20230914015531.1419405-11-seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-11-seanjc@google.com>
Message-ID: <20230918180754.iomoaqnw75j3rrxb@amd.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 13, 2023 at 06:55:08PM -0700, Sean Christopherson wrote:
> Add flags to "struct kvm_gfn_range" to let notifier events target only
> shared and only private mappings, and write up the existing mmu_notifier
> events to be shared-only (private memory is never associated with a
> userspace virtual address, i.e. can't be reached via mmu_notifiers).
> 
> Add two flags so that KVM can handle the three possibilities (shared,
> private, and shared+private) without needing something like a tri-state
> enum.
> 
> Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB at google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  include/linux/kvm_host.h | 2 ++
>  virt/kvm/kvm_main.c      | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index d8c6ce6c8211..b5373cee2b08 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -263,6 +263,8 @@ struct kvm_gfn_range {
>  	gfn_t start;
>  	gfn_t end;
>  	union kvm_mmu_notifier_arg arg;
> +	bool only_private;
> +	bool only_shared;
>  	bool may_block;
>  };
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 174de2789657..a41f8658dfe0 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -635,6 +635,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
>  			 * the second or later invocation of the handler).
>  			 */
>  			gfn_range.arg = range->arg;
> +
> +			/*
> +			 * HVA-based notifications aren't relevant to private
> +			 * mappings as they don't have a userspace mapping.
> +			 */
> +			gfn_range.only_private = false;
> +			gfn_range.only_shared = true;
>  			gfn_range.may_block = range->may_block;

Who is supposed to read only_private/only_shared? Is it supposed to be
plumbed onto arch code and handled specially there?

I ask because I see elsewhere you have:

    /*
     * If one or more memslots were found and thus zapped, notify arch code
     * that guest memory has been reclaimed.  This needs to be done *after*
     * dropping mmu_lock, as x86's reclaim path is slooooow.
     */
    if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
            kvm_arch_guest_memory_reclaimed(kvm);

and if there are any MMU notifier events that touch HVAs, then
kvm_arch_guest_memory_reclaimed()->wbinvd_on_all_cpus() will get called,
which causes the performance issues for SEV and SNP that Ashish had brought
up. Technically that would only need to happen if there are GPAs in that
memslot that aren't currently backed by gmem pages (and then gmem could handle
its own wbinvd_on_all_cpus() (or maybe clflush per-page)). 

Actually, even if there are shared pages in the GPA range, the
kvm_arch_guest_memory_reclaimed()->wbinvd_on_all_cpus() can be skipped for
guests that only use gmem pages for private memory. Is that acceptable? Just
trying to figure out where this only_private/only_shared handling ties into
that (or if it's a separate thing entirely).

-Mike

>  
>  			/*
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 

