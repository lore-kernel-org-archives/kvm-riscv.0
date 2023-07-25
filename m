From: Sean Christopherson <seanjc@google.com>
Date: Tue, 25 Jul 2023 11:05:29 -0700
Subject: [RFC PATCH v11 01/29] KVM: Wrap kvm_gfn_range.pte in a per-action union
In-Reply-To: <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-2-seanjc@google.com>
 <ZLolA2U83tP75Qdd@yzhao56-desk.sh.intel.com> <ZLphxpSTL9Fpn1ye@yilunxu-OptiPlex-7050>
Message-ID: <ZMAO6bhan9l6ybQM@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 21, 2023, Xu Yilun wrote:
> On 2023-07-21 at 14:26:11 +0800, Yan Zhao wrote:
> > On Tue, Jul 18, 2023 at 04:44:44PM -0700, Sean Christopherson wrote:
> > 
> > May I know why KVM now needs to register to callback .change_pte()?
> 
> I can see the original purpose is to "setting a pte in the shadow page
> table directly, instead of flushing the shadow page table entry and then
> getting vmexit to set it"[1].
> 
> IIUC, KVM is expected to directly make the new pte present for new
> pages in this callback, like for COW.

Yes.

> > As also commented in kvm_mmu_notifier_change_pte(), .change_pte() must be
> > surrounded by .invalidate_range_{start,end}().
> > 
> > While kvm_mmu_notifier_invalidate_range_start() has called kvm_unmap_gfn_range()
> > to zap all leaf SPTEs, and page fault path will not install new SPTEs
> > successfully before kvm_mmu_notifier_invalidate_range_end(),
> > kvm_set_spte_gfn() should not be able to find any shadow present leaf entries to
> > update PFN.
> 
> I also failed to figure out how the kvm_set_spte_gfn() could pass
> several !is_shadow_present_pte(iter.old_spte) check then write the new
> pte.

It can't.  .change_pte() has been dead code on x86 for 10+ years at this point,
and if my assessment from a few years back still holds true, it's dead code on
all architectures.

The only reason I haven't formally proposed dropping the hook is that I don't want
to risk the patch backfiring, i.e. I don't want to prompt someone to care enough
to try and fix it.

commit c13fda237f08a388ba8a0849785045944bf39834
Author: Sean Christopherson <seanjc@google.com>
Date:   Fri Apr 2 02:56:49 2021 +0200

    KVM: Assert that notifier count is elevated in .change_pte()
    
    In KVM's .change_pte() notification callback, replace the notifier
    sequence bump with a WARN_ON assertion that the notifier count is
    elevated.  An elevated count provides stricter protections than bumping
    the sequence, and the sequence is guarnateed to be bumped before the
    count hits zero.
    
    When .change_pte() was added by commit 828502d30073 ("ksm: add
    mmu_notifier set_pte_at_notify()"), bumping the sequence was necessary
    as .change_pte() would be invoked without any surrounding notifications.
    
    However, since commit 6bdb913f0a70 ("mm: wrap calls to set_pte_at_notify
    with invalidate_range_start and invalidate_range_end"), all calls to
    .change_pte() are guaranteed to be surrounded by start() and end(), and
    so are guaranteed to run with an elevated notifier count.
    
    Note, wrapping .change_pte() with .invalidate_range_{start,end}() is a
    bug of sorts, as invalidating the secondary MMU's (KVM's) PTE defeats
    the purpose of .change_pte().  Every arch's kvm_set_spte_hva() assumes
    .change_pte() is called when the relevant SPTE is present in KVM's MMU,
    as the original goal was to accelerate Kernel Samepage Merging (KSM) by
    updating KVM's SPTEs without requiring a VM-Exit (due to invalidating
    the SPTE).  I.e. it means that .change_pte() is effectively dead code
    on _all_ architectures.
    
    x86 and MIPS are clearcut nops if the old SPTE is not-present, and that
    is guaranteed due to the prior invalidation.  PPC simply unmaps the SPTE,
    which again should be a nop due to the invalidation.  arm64 is a bit
    murky, but it's also likely a nop because kvm_pgtable_stage2_map() is
    called without a cache pointer, which means it will map an entry if and
    only if an existing PTE was found.
    
    For now, take advantage of the bug to simplify future consolidation of
    KVMs's MMU notifier code.   Doing so will not greatly complicate fixing
    .change_pte(), assuming it's even worth fixing.  .change_pte() has been
    broken for 8+ years and no one has complained.  Even if there are
    KSM+KVM users that care deeply about its performance, the benefits of
    avoiding VM-Exits via .change_pte() need to be reevaluated to justify
    the added complexity and testing burden.  Ripping out .change_pte()
    entirely would be a lot easier.

