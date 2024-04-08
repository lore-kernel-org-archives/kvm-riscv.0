From: Peter Xu <peterx@redhat.com>
Date: Mon, 8 Apr 2024 09:56:20 -0400
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <20240405115815.3226315-2-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com>
Message-ID: <ZhP3hDhe2Qwo9oCL@x1n>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 05, 2024 at 07:58:12AM -0400, Paolo Bonzini wrote:
> The .change_pte() MMU notifier callback was intended as an
> optimization. The original point of it was that KSM could tell KVM to flip
> its secondary PTE to a new location without having to first zap it. At
> the time there was also an .invalidate_page() callback; both of them were
> *not* bracketed by calls to mmu_notifier_invalidate_range_{start,end}(),
> and .invalidate_page() also doubled as a fallback implementation of
> .change_pte().
> 
> Later on, however, both callbacks were changed to occur within an
> invalidate_range_start/end() block.
> 
> In the case of .change_pte(), commit 6bdb913f0a70 ("mm: wrap calls to
> set_pte_at_notify with invalidate_range_start and invalidate_range_end",
> 2012-10-09) did so to remove the fallback from .invalidate_page() to
> .change_pte() and allow sleepable .invalidate_page() hooks.
> 
> This however made KVM's usage of the .change_pte() callback completely
> moot, because KVM unmaps the sPTEs during .invalidate_range_start()
> and therefore .change_pte() has no hope of finding a sPTE to change.
> Drop the generic KVM code that dispatches to kvm_set_spte_gfn(), as
> well as all the architecture specific implementations.

Paolo,

I may miss a bunch of details here (as I still remember some change_pte
patches previously on the list..), however not sure whether we considered
enable it?  Asked because I remember Andrea used to have a custom tree
maintaining that part:

https://github.com/aagit/aa/commit/c761078df7a77d13ddfaeebe56a0f4bc128b1968

Maybe it can't be enabled for some reason that I overlooked in the current
tree, or we just decided to not to?

Thanks,

-- 
Peter Xu


