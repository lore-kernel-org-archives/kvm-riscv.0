From: Xu Yilun <yilun.xu@intel.com>
Date: Fri, 21 Jul 2023 18:45:26 +0800
Subject: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a
 per-action union
In-Reply-To: <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-2-seanjc@google.com>
 <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com>
Message-ID: <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2023-07-21 at 14:26:11 +0800, Yan Zhao wrote:
> On Tue, Jul 18, 2023 at 04:44:44PM -0700, Sean Christopherson wrote:
> 
> May I know why KVM now needs to register to callback .change_pte()?

I can see the original purpose is to "setting a pte in the shadow page
table directly, instead of flushing the shadow page table entry and then
getting vmexit to set it"[1].

IIUC, KVM is expected to directly make the new pte present for new
pages in this callback, like for COW.

> As also commented in kvm_mmu_notifier_change_pte(), .change_pte() must be
> surrounded by .invalidate_range_{start,end}().
> 
> While kvm_mmu_notifier_invalidate_range_start() has called kvm_unmap_gfn_range()
> to zap all leaf SPTEs, and page fault path will not install new SPTEs
> successfully before kvm_mmu_notifier_invalidate_range_end(),
> kvm_set_spte_gfn() should not be able to find any shadow present leaf entries to
> update PFN.

I also failed to figure out how the kvm_set_spte_gfn() could pass
several !is_shadow_present_pte(iter.old_spte) check then write the new
pte.


[1] https://lore.kernel.org/all/200909222039.n8MKd4TL002696 at imap1.linux-foundation.org/

Thanks,
Yilun

> 
> Or could we just delete completely
> "kvm_handle_hva_range(mn, address, address + 1, pte, kvm_set_spte_gfn);"
> from kvm_mmu_notifier_change_pte() ?

