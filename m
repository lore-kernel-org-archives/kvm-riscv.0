From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 08 Apr 2024 21:45:18 +1000
Subject: [PATCH 1/4] KVM: delete .change_pte MMU notifier callback
In-Reply-To: <20240405115815.3226315-2-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-2-pbonzini@redhat.com>
Message-ID: <87h6gcaxip.fsf@mail.lhotse>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Paolo Bonzini <pbonzini@redhat.com> writes:
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
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
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

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

