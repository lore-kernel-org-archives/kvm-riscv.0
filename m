From: Marc Zyngier <maz@kernel.org>
Date: Fri, 12 Apr 2024 14:07:38 +0100
Subject: [PATCH 0/4] KVM, mm: remove the .change_pte() MMU notifier and set_pte_at_notify()
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
Message-ID: <86le5isp9h.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 05 Apr 2024 12:58:11 +0100,
Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> The .change_pte() MMU notifier callback was intended as an optimization
> and for this reason it was initially called without a surrounding
> mmu_notifier_invalidate_range_{start,end}() pair.  It was only ever
> implemented by KVM (which was also the original user of MMU notifiers)
> and the rules on when to call set_pte_at_notify() rather than set_pte_at()
> have always been pretty obscure.
> 
> It may seem a miracle that it has never caused any hard to trigger
> bugs, but there's a good reason for that: KVM's implementation has
> been nonfunctional for a good part of its existence.  Already in
> 2012, commit 6bdb913f0a70 ("mm: wrap calls to set_pte_at_notify with
> invalidate_range_start and invalidate_range_end", 2012-10-09) changed the
> .change_pte() callback to occur within an invalidate_range_start/end()
> pair; and because KVM unmaps the sPTEs during .invalidate_range_start(),
> .change_pte() has no hope of finding a sPTE to change.
> 
> Therefore, all the code for .change_pte() can be removed from both KVM
> and mm/, and set_pte_at_notify() can be replaced with just set_pte_at().
> 
> Please review!  Also feel free to take the KVM patches through the mm
> tree, as I don't expect any conflicts.
> 
> Thanks,
> 
> Paolo
> 
> Paolo Bonzini (4):
>   KVM: delete .change_pte MMU notifier callback
>   KVM: remove unused argument of kvm_handle_hva_range()
>   mmu_notifier: remove the .change_pte() callback
>   mm: replace set_pte_at_notify() with just set_pte_at()
> 
>  arch/arm64/kvm/mmu.c                  | 34 -----------------
>  arch/loongarch/include/asm/kvm_host.h |  1 -
>  arch/loongarch/kvm/mmu.c              | 32 ----------------
>  arch/mips/kvm/mmu.c                   | 30 ---------------
>  arch/powerpc/include/asm/kvm_ppc.h    |  1 -
>  arch/powerpc/kvm/book3s.c             |  5 ---
>  arch/powerpc/kvm/book3s.h             |  1 -
>  arch/powerpc/kvm/book3s_64_mmu_hv.c   | 12 ------
>  arch/powerpc/kvm/book3s_hv.c          |  1 -
>  arch/powerpc/kvm/book3s_pr.c          |  7 ----
>  arch/powerpc/kvm/e500_mmu_host.c      |  6 ---
>  arch/riscv/kvm/mmu.c                  | 20 ----------
>  arch/x86/kvm/mmu/mmu.c                | 54 +--------------------------
>  arch/x86/kvm/mmu/spte.c               | 16 --------
>  arch/x86/kvm/mmu/spte.h               |  2 -
>  arch/x86/kvm/mmu/tdp_mmu.c            | 46 -----------------------
>  arch/x86/kvm/mmu/tdp_mmu.h            |  1 -
>  include/linux/kvm_host.h              |  2 -
>  include/linux/mmu_notifier.h          | 44 ----------------------
>  include/trace/events/kvm.h            | 15 --------
>  kernel/events/uprobes.c               |  5 +--
>  mm/ksm.c                              |  4 +-
>  mm/memory.c                           |  7 +---
>  mm/migrate_device.c                   |  8 +---
>  mm/mmu_notifier.c                     | 17 ---------
>  virt/kvm/kvm_main.c                   | 50 +------------------------
>  26 files changed, 10 insertions(+), 411 deletions(-)
> 

Reviewed-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

