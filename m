Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD424CCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4qu2oAq64z3TNDCIlGat33m5nAV/cLGewsCIetqAPc=; b=LeWEtN4z/EYzh+
	6tqS4nq/YstYGOncy6uQa8Jso5FP+Te+THxKxP7a0xOiI4dvHTjC1Siw/MCWF/1gp6G6w8iwSxvia
	aKriB+OtqXX7BbYaBabvl0ze1Rp2MursaU6DZb8Nwa7gtIB1bMugWGlpzbtV2+QaI3Xixt3jevy3t
	roH+ztrKnkQk56WykX5dkFNc7eV85QIdaqC72RIu/As7KaV+Rx3SkvXDMlVl40+Hvs+su8S87MqL1
	2GvUJbAToe1Z6GlqBSZvrxxyyEj2gK7m8IxjqJVkqFKf5wyMaQl7147HExBspcrijwLGYdYCKo2cu
	T2ZD3piTkWyMSZ4twI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYz0-00000004kEj-08OJ;
	Thu, 30 Oct 2025 20:10:54 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyT-00000004jYg-0aw3
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:23 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3408d2c733cso57356a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855019; x=1762459819; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=sAFIK0l3RMhPR7pmj5tjYrChp81q6H152HYKl+MHkyE=;
        b=pvXS7HAV5ikQVlfwnvmyJSCWO3gR/zt+DKG88BWxju6l2nr+1PdCUklX+adgmM1GRk
         lpx0q+WgUucg2o0UjiwHo+nyQB+GQAeTDiaRF3Re9CBGLql915ahy3LQ+I2NzpUW5L4X
         QBaH13fuAbJ+9UkmYQEVnH6kzSYyP9aWeLjL0mxY5xdrDNJaIuDPSEQ8XOUpWIbi2WTE
         OqfmaCigbJUqXx2KfDsKVgkc8v5EKj4n79ANwAHAsg98iKdKHEbY8TKaSfA4D/i2JCTv
         h1QyH2CuFKfYPgbPPF3GlH4Ho0MMe+ILUwZS7rqH75748uoxyOzkkNpUgFdq3WskC0f4
         7+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855019; x=1762459819;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAFIK0l3RMhPR7pmj5tjYrChp81q6H152HYKl+MHkyE=;
        b=OCNKhJpC63paSSeUSFrvwQSPniR7Im9TUMF/MTPe1oTqtj9S9RONHJUYq2SyTt8ccm
         B4B98Kl14iVrafAVqRAGrMnf66xKso+nSOlduVn6lHT4m6/gR4zQEDr/qkMx/YtJas5N
         zvaEIJiPPL7L8JOXpYEMb0tPTtj1c/IyFRBvK1fb8uOvZ8mIfeqcg/3RicDNfBI7KfnB
         ZPNwMX/aJgQ8Xa+lUoX9kKH6+Kz22wm4yY3ARfGkloIL9jt/jHBvgBOtdmsEJ9lXFill
         zcq+EhW8xFxAWScFGt4p4cf+2tNDQ57zGosXUT6hiFZD9bY8g24dxh3OSnWXsTioqMtQ
         Ev7Q==
X-Forwarded-Encrypted: i=1; AJvYcCU5sQJPsMyR9Ug2FBZtBO4NpjkxNfbztIBT5hkZNIhLEE6U6PrbmamrWDcC2Jc+zps2HwnFJI4Bcg0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyH3or4u//JZpSP1r1+hdITLMztJe1BBDF1+ToYoBnaHAJOknEE
	FE0pYB3GAB0STDYzRNp3E0kKGYdAGDfXAQMB9maYVsZeh0LZuERfRI2SOJfucXoUtGUuty5B/Df
	oR34aIA==
X-Google-Smtp-Source: AGHT+IFa06BfDwKwW2VMNxuQ8ibpI7ipYGuzW9P9Yv39A5TWMZsjHlQcJLcDxxGMugGfb86zaLcKGL4PNrU=
X-Received: from pjty20.prod.google.com ([2002:a17:90a:ca94:b0:340:4910:738f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2250:b0:340:5c27:a096
 with SMTP id 98e67ed59e1d1-34082faafd2mr1400500a91.6.1761855018548; Thu, 30
 Oct 2025 13:10:18 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:31 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-9-seanjc@google.com>
Subject: [PATCH v4 08/28] KVM: TDX: Drop superfluous page pinning in S-EPT management
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_131021_753256_40AA4073 
X-CRM114-Status: GOOD (  17.21  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Yan Zhao <yan.y.zhao@intel.com>

Don't explicitly pin pages when mapping pages into the S-EPT, guest_memfd
doesn't support page migration in any capacity, i.e. there are no migrate
callbacks because guest_memfd pages *can't* be migrated.  See the WARN in
kvm_gmem_migrate_folio().

Eliminating TDX's explicit pinning will also enable guest_memfd to support
in-place conversion between shared and private memory[1][2].  Because KVM
cannot distinguish between speculative/transient refcounts and the
intentional refcount for TDX on private pages[3], failing to release
private page refcount in TDX could cause guest_memfd to indefinitely wait
on decreasing the refcount for the splitting.

Under normal conditions, not holding an extra page refcount in TDX is safe
because guest_memfd ensures pages are retained until its invalidation
notification to KVM MMU is completed. However, if there're bugs in KVM/TDX
module, not holding an extra refcount when a page is mapped in S-EPT could
result in a page being released from guest_memfd while still mapped in the
S-EPT.  But, doing work to make a fatal error slightly less fatal is a net
negative when that extra work adds complexity and confusion.

Several approaches were considered to address the refcount issue, including
  - Attempting to modify the KVM unmap operation to return a failure,
    which was deemed too complex and potentially incorrect[4].
  - Increasing the folio reference count only upon S-EPT zapping failure[5].
  - Use page flags or page_ext to indicate a page is still used by TDX[6],
    which does not work for HVO (HugeTLB Vmemmap Optimization).
  - Setting HWPOISON bit or leveraging folio_set_hugetlb_hwpoison()[7].

Due to the complexity or inappropriateness of these approaches, and the
fact that S-EPT zapping failure is currently only possible when there are
bugs in the KVM or TDX module, which is very rare in a production kernel,
a straightforward approach of simply not holding the page reference count
in TDX was chosen[8].

When S-EPT zapping errors occur, KVM_BUG_ON() is invoked to kick off all
vCPUs and mark the VM as dead. Although there is a potential window that a
private page mapped in the S-EPT could be reallocated and used outside the
VM, the loud warning from KVM_BUG_ON() should provide sufficient debug
information. To be robust against bugs, the user can enable panic_on_warn
as normal.

Link: https://lore.kernel.org/all/cover.1747264138.git.ackerleytng@google.com [1]
Link: https://youtu.be/UnBKahkAon4 [2]
Link: https://lore.kernel.org/all/CAGtprH_ypohFy9TOJ8Emm_roT4XbQUtLKZNFcM6Fr+fhTFkE0Q@mail.gmail.com [3]
Link: https://lore.kernel.org/all/aEEEJbTzlncbRaRA@yzhao56-desk.sh.intel.com [4]
Link: https://lore.kernel.org/all/aE%2Fq9VKkmaCcuwpU@yzhao56-desk.sh.intel.com [5]
Link: https://lore.kernel.org/all/aFkeBtuNBN1RrDAJ@yzhao56-desk.sh.intel.com [6]
Link: https://lore.kernel.org/all/diqzy0tikran.fsf@ackerleytng-ctop.c.googlers.com [7]
Link: https://lore.kernel.org/all/53ea5239f8ef9d8df9af593647243c10435fd219.camel@intel.com [8]
Suggested-by: Vishal Annapurve <vannapurve@google.com>
Suggested-by: Ackerley Tng <ackerleytng@google.com>
Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
[sean: extract out of hugepage series, massage changelog accordingly]
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 29f344af4cc2..c3bae6b96dc4 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1583,29 +1583,22 @@ void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int pgd_level)
 	td_vmcs_write64(to_tdx(vcpu), SHARED_EPT_POINTER, root_hpa);
 }
 
-static void tdx_unpin(struct kvm *kvm, struct page *page)
-{
-	put_page(page);
-}
-
 static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
-			    enum pg_level level, struct page *page)
+			    enum pg_level level, kvm_pfn_t pfn)
 {
 	int tdx_level = pg_level_to_tdx_sept_level(level);
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	struct page *page = pfn_to_page(pfn);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 entry, level_state;
 	u64 err;
 
 	err = tdh_mem_page_aug(&kvm_tdx->td, gpa, tdx_level, page, &entry, &level_state);
-	if (unlikely(tdx_operand_busy(err))) {
-		tdx_unpin(kvm, page);
+	if (unlikely(tdx_operand_busy(err)))
 		return -EBUSY;
-	}
 
 	if (KVM_BUG_ON(err, kvm)) {
 		pr_tdx_error_2(TDH_MEM_PAGE_AUG, err, entry, level_state);
-		tdx_unpin(kvm, page);
 		return -EIO;
 	}
 
@@ -1639,29 +1632,18 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, kvm_pfn_t pfn)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	struct page *page = pfn_to_page(pfn);
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return -EINVAL;
 
-	/*
-	 * Because guest_memfd doesn't support page migration with
-	 * a_ops->migrate_folio (yet), no callback is triggered for KVM on page
-	 * migration.  Until guest_memfd supports page migration, prevent page
-	 * migration.
-	 * TODO: Once guest_memfd introduces callback on page migration,
-	 * implement it and remove get_page/put_page().
-	 */
-	get_page(page);
-
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
 	 * barrier in tdx_td_finalize().
 	 */
 	smp_rmb();
 	if (likely(kvm_tdx->state == TD_STATE_RUNNABLE))
-		return tdx_mem_page_aug(kvm, gfn, level, page);
+		return tdx_mem_page_aug(kvm, gfn, level, pfn);
 
 	return tdx_mem_page_record_premap_cnt(kvm, gfn, level, pfn);
 }
@@ -1712,7 +1694,6 @@ static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
 		return -EIO;
 	}
 	tdx_quirk_reset_page(page);
-	tdx_unpin(kvm, page);
 	return 0;
 }
 
@@ -1792,7 +1773,6 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
 	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
 		atomic64_dec(&kvm_tdx->nr_premapped);
-		tdx_unpin(kvm, page);
 		return 0;
 	}
 
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
