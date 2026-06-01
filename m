Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46202CD6E4C
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEwnfywn4hYK2vbUFIR7QkkTpvIClVwQNxPh28ps2fI=; b=s6Zj3DLPo2yovN
	5uPPl8KgxHCLtajjF2lccNMLLvpMq5bilajd0CIjR1Taim5OxbfPQ2S0EurBc2V6oF/YjTDzqwb9p
	dAk68UWMoiJAtj7TjJbHvxkUNWYFMVEqPg6vakNCaAET0+GPWgUEBeC9NH/M0EbGA2TudDsMlbsMN
	pUqa8kUEK+Wa/kXw0vRoYj8DOeSlOaB8M4hCoBA7t0cMpslsOmvWa/PD+r6LTSeDfhfGcfYKro0BJ
	g1Cnp0kkt4LedHId2/Ajp/QORUDhpEQLZr6tCfwR6TsHyZAqKykxWofyXtirQU9SnTVBn+HPvNWj0
	tn2UQI1EYMNl0Gvvp7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxQI-0000000AJxA-1sqF;
	Mon, 01 Jun 2026 07:50:58 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxQF-0000000AJwV-3YlA;
	Mon, 01 Jun 2026 07:50:57 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gTR3G1L8Xz55y2M;
	Mon, 01 Jun 2026 15:50:50 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl2.zte.com.cn with SMTP id 6517oWPM054581;
	Mon, 1 Jun 2026 15:50:32 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp02[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 1 Jun 2026 15:50:34 +0800 (CST)
X-Zmail-TransId: 2b046a1d39ca433-27457
X-Mailer: Zmail v1.0
Message-ID: <20260601155034636JGXXXIkBJCy5tetcmoevj@zte.com.cn>
In-Reply-To: <CAAhSdy1LE+oTMgO_C9SBvpqF=SHLOdDLGms5_ajO8pqDm=fFuA@mail.gmail.com>
References: 20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn,20260429173539941luiwhNDDtflTHOClbNtk4@zte.com.cn,CAAhSdy1LE+oTMgO_C9SBvpqF=SHLOdDLGms5_ajO8pqDm=fFuA@mail.gmail.com
Date: Mon, 1 Jun 2026 15:50:34 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>
Cc: <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAzLzNdIFJJU0MtVjogS1ZNOiBSZWNvdmVyIGdzdGFnZSBodWdlIHBhZ2UgbWFwcGluZ3MgZHVyaW5nwqBkaXNhYmxlLWRpcnR5LWxvZw==?=
X-MAIL: mse-fl2.zte.com.cn 6517oWPM054581
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 01 Jun 2026 15:50:50 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1D39DA.000/4gTR3G1L8Xz55y2M
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_005056_216292_254DDB63 
X-CRM114-Status: GOOD (  26.57  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

> > From: Wang Yechao <wang.yechao255@zte.com.cn>
> >
> > When dirty logging is enabled, the gstage mappings are split into
> > 4K pages to track dirty pages. If the migration fails or is canceled,
> > in order to keep the VM's performance consistent with that before
> > dirty logging was enabled, the gstage huge page mappings are recoverd
> > when dirty logging is disabled.
> >
> > With this patch, dirty_log_perf_test shows a decrease in the number of
> > vCPU faults:
> >
> > $ perf stat -e kvm:kvm_page_fault \
> > /dirty_log_perf_test -s anonymous_hugetlb_1gb -v 1 -e -b 1G
> >
> > Before: 524,819      kvm:kvm_page_fault
> > After : 263,211      kvm:kvm_page_fault
> >
> > Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> > ---
> >  arch/riscv/include/asm/kvm_gstage.h |  4 +++
> >  arch/riscv/kvm/gstage.c             | 42 ++++++++++++++++++++++++++
> >  arch/riscv/kvm/mmu.c                | 47 +++++++++++++++++++++++++++++
> >  3 files changed, 93 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> > index 9c908432bc17..a074493596d1 100644
> > --- a/arch/riscv/include/asm/kvm_gstage.h
> > +++ b/arch/riscv/include/asm/kvm_gstage.h
> > @@ -64,6 +64,10 @@ int kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
> >                                 struct kvm_mmu_memory_cache *pcache,
> >                                 gpa_t addr, u32 target_level, bool flush);
> >
> > +void kvm_riscv_gstage_recover_huge(struct kvm_gstage *gstage, gpa_t addr,
> > +                                  unsigned long taget_page_size,
> > +                                  unsigned long *page_size);
> > +
> >  enum kvm_riscv_gstage_op {
> >         GSTAGE_OP_NOP = 0,      /* Nothing */
> >         GSTAGE_OP_CLEAR,        /* Clear/Unmap */
> > diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> > index d9fe8be2a151..e2c8cbac30d9 100644
> > --- a/arch/riscv/kvm/gstage.c
> > +++ b/arch/riscv/kvm/gstage.c
> > @@ -337,6 +337,48 @@ int kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
> >         return 0;
> >  }
> >
> > +void kvm_riscv_gstage_recover_huge(struct kvm_gstage *gstage, gpa_t addr,
> > +                                  unsigned long target_page_size,
> > +                                  unsigned long *page_size)
> > +{
> > +       u32 current_level = gstage->pgd_levels - 1;
> > +       pte_t *next_ptep = (pte_t *)gstage->pgd;
> > +       u32 target_level, out_level;
> > +       pte_t *ptep, *child_ptep;
> > +       int ret;
> > +
> > +       out_level = 0;
> > +       ret = gstage_page_size_to_level(gstage, target_page_size, &target_level);
> > +       if (ret)
> > +               goto out;
> > +
> > +       while (current_level >= target_level) {
> > +               ptep = (pte_t *)&next_ptep[gstage_pte_index(gstage, addr, current_level)];
> > +
> > +               out_level = current_level;
> > +               if (!pte_val(ptep_get(ptep)))
> > +                       goto out;
> > +
> > +               /* The mapping is already a huge page mapping. */
> > +               if (gstage_pte_leaf(ptep))
> > +                       goto out;
> > +
> > +               next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
> > +               current_level--;
> > +       }
> > +
> > +       /* Replace the huge PTE with the first PTE entry of the child.*/
> > +       child_ptep = (pte_t *)&next_ptep[0];
> > +       if (gstage_pte_leaf(child_ptep)) {
> > +               set_pte(ptep, __pte(pte_val(ptep_get(child_ptep))));
> > +               gstage_tlb_flush(gstage, target_level, addr);
> > +               put_page(virt_to_page(next_ptep));
> > +       }
> > +
> > +out:
> > +       gstage_level_to_page_size(gstage, out_level, page_size);
> > +}
> > +
> >  void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
> >                              pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
> >  {
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index dc6a8efde99e..789e3362144f 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -16,6 +16,8 @@
> >  #include <asm/kvm_mmu.h>
> >  #include <asm/kvm_nacl.h>
> >
> > +static void kvm_mmu_recover_huge_pages(struct kvm *kvm, int slot);
> > +
> >  static void mmu_wp_memory_region(struct kvm *kvm, int slot)
> >  {
> >         struct kvm_memslots *slots = kvm_memslots(kvm);
> > @@ -160,6 +162,17 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
> >                 if (kvm_dirty_log_manual_protect_and_init_set(kvm))
> >                         return;
> >                 mmu_wp_memory_region(kvm, new->id);
> > +       } else {
> > +               /*
> > +                * Recover huge page mappings in the slot now that dirty logging
> > +                * is disabled, i.e. now that KVM does not have to track guest
> > +                * writes at 4KiB granularity.
> > +                *
> > +                * Dirty logging might be disabled by userspace if an ongoing VM
> > +                * live migration is cancelled and the VM must continue running
> > +                * on the source.
> > +                */
> > +               kvm_mmu_recover_huge_pages(kvm, new->id);
> >         }
> >  }
> >
> > @@ -598,3 +611,37 @@ void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
> >         if (!kvm_riscv_gstage_vmid_bits())
> >                 kvm_riscv_local_hfence_gvma_all();
> >  }
> > +
> > +static void kvm_mmu_recover_huge_pages(struct kvm *kvm, int slot)
> > +{
> > +       struct kvm_memslots *slots = kvm_memslots(kvm);
> > +       struct kvm_memory_slot *memslot = id_to_memslot(slots, slot);
> > +       unsigned long hva = gfn_to_hva(kvm, memslot->base_gfn);
> > +       phys_addr_t start = memslot->base_gfn << PAGE_SHIFT;
> > +       phys_addr_t end = (memslot->base_gfn + memslot->npages) << PAGE_SHIFT;
> > +       phys_addr_t addr = start;
> > +       struct kvm_gstage gstage;
> > +       unsigned long page_size;
> > +
> > +       if (!fault_supports_gstage_huge_mapping(memslot, hva))
> > +               return;
> > +
> > +       kvm_riscv_gstage_init(&gstage, kvm);
> > +
> > +       spin_lock(&kvm->mmu_lock);
> > +
> > +       while (addr < end) {
> > +               if (get_hva_mapping_size(kvm, hva) < PMD_SIZE) {
> 
> This is hard-coded to work only for 2MB hugepages.
> 
This does not only apply to 2M hugepages; 1G hugepages can also work. 
However, for 1G hugepages, they will only be recovered into 2M mappings, 
rather than being restored to the original 1G mapping before splitting.

In the next version, for 1G hugepages, I will consider recovering the gstage
mapping into 1G mappings.

Best regards,
Yechao

> > +                       addr += PMD_SIZE;
> > +                       hva  += PMD_SIZE;
> > +                       continue;
> > +               }
> > +
> > +               kvm_riscv_gstage_recover_huge(&gstage, addr, PMD_SIZE, &page_size);
> > +
> > +               addr += page_size;
> > +               hva  += page_size;
> > +               cond_resched_lock(&kvm->mmu_lock);
> > +       }
> > +       spin_unlock(&kvm->mmu_lock);
> > +}
> > --
> > 2.43.5
> 
> Regards,
> Anup

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
