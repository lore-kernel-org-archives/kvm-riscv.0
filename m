Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3B1CCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKKSUZZ/4DewKfZ3Rvaxr8pWx2B6fDSayNsyrRBNbTU=; b=DzmJ7uGj3QYEwX
	UO2NhmmCZDv5x7MjPiyJ3QNm0ZluNWIzKM5SYYIPjCjcNwciWrlwMQ+N8aZbg0q5Moa3eGtBzwP72
	ICsKn0kzNCxCf9e2CVhRANEwESWkxmOo9ov42yAR2IigOcrKuPslNsiLx6egp2BshLtZPOhsBWUCc
	ZwpdNlHagxlIvhWaNh4KvQc/AaAPJhLMYvwC3ETufrQBU0kPTDYBMY9ymV7xSu2EP3fszM/pCGTS/
	CxGDli3qGoCM5qED8ZOGy+RBtw3QMFyvRa6hgpeKgg9WlHGi3SYyzFd0CFVn1r/IRfKySWIYYrfE1
	gvXPRj4lXW9VkpF2ojEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ04-00000004lYM-3i5E;
	Thu, 30 Oct 2025 20:12:00 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyn-00000004jvH-1wWQ
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:44 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33baef12edaso1801061a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855037; x=1762459837; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/Z7Z4VCKxvbeclMBJpiAZWPr8rGnQCyDletBZbiKOLg=;
        b=GSe/BWtrnpnZQo1MtEkXZIaHeU5163NZcbLwHrWI2Y/GDxsmaZNZjzWK+d2qgjZy/y
         4Fc0xw0jsjyyM8jK9O1VbMV9PgkOI6ZwCQ/vyie1VuMWFoUkysRb13eS87dDRJ1pRxjM
         1pnrFTAuFT5NRKeGM4k+dDqP8pBZZn5tRybM7x4yTnH7NXRRkh5bJJeb7Mg2Zz/BI9PW
         G1vXa0Uoa/5JQhAu9xoqnq3aw+Qwp9udmjT7QacCE3ohQ1iqpqoXeDzBmAyH6im24eUp
         3rg5Auth1O6pau1MZANXV4YM1/0brYs6i10cqNHJ+7BbRm3IeSEY9HsqTDPLyAtQbeZ4
         6tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855037; x=1762459837;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Z7Z4VCKxvbeclMBJpiAZWPr8rGnQCyDletBZbiKOLg=;
        b=V/hoJ3I/76uXvsWBagKavlcUpwFo20zL+2/xk8BXFk7b2/fECa5c42/lCqmCqnoApw
         aaG9BciJ5cifp06npWoUzAJNO9tskgIWHNBaAbWKs/HrwgXaxfSJNyxIWzQEfR9m1/CD
         mZKLCM/r0hZ4KNcygIT3vehG334+gJ7inOU9TAgQdOgm8yuoQCb5rpJYRM5v1nrJLsnG
         0UTM3UhMWK6pQCN4D5JMuyV200iixNbWqcvQnwEv3idWLZ/uKHRqb1uHYVnUYTk9bnW8
         exP+bKHk9ynVQugKnh2wSaTMkUeT9wSjq/J+xMEbl6emz16/lCO9kj2r/5kNSe2bxNO/
         c19A==
X-Forwarded-Encrypted: i=1; AJvYcCU5lC298tttlpqEvPiiK6mwp8jznN5X7J+B6niSC3RHLAxd0fCC6YCdw0/XGOQ3dKWlNihQaH4Z2io=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+5wH2DLYg7WwvkuHLr5w/nQ6H+O0S9xPHOi1qDmx8Xvvbp9Xe
	h1zEWDorAAqtDjafrf04ch95B8ISiyFK15WICn6ReWTvPoOuuIs+bYxAi8A0pDHfiKEdDC7uYoB
	uJRNwsg==
X-Google-Smtp-Source: AGHT+IGuQ9tseR+UxrPGQmatIE4dzuj8mufA6J/LivL787A5dSoSjpBpOEZB47eEhvzGXFTpSKaWylv+I0w=
X-Received: from pjqx5.prod.google.com ([2002:a17:90a:b005:b0:32d:dbd4:5cf3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3141:b0:339:a323:30fe
 with SMTP id 98e67ed59e1d1-34082fdc1a5mr1313871a91.14.1761855037257; Thu, 30
 Oct 2025 13:10:37 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:38 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-16-seanjc@google.com>
Subject: [PATCH v4 15/28] KVM: TDX: Fold tdx_mem_page_record_premap_cnt() into
 its sole caller
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
X-CRM114-CacheID: sfid-20251030_131041_670367_5D49FA6A 
X-CRM114-Status: GOOD (  17.45  )
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

Fold tdx_mem_page_record_premap_cnt() into tdx_sept_set_private_spte() as
providing a one-off helper for effectively three lines of code is at best a
wash, and splitting the code makes the comment for smp_rmb()  _extremely_
confusing as the comment talks about reading kvm->arch.pre_fault_allowed
before kvm_tdx->state, but the immediately visible code does the exact
opposite.

Opportunistically rewrite the comments to more explicitly explain who is
checking what, as well as _why_ the ordering matters.

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 49 ++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 99db19e02cf1..a30471c972ba 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1605,29 +1605,6 @@ static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
-/*
- * KVM_TDX_INIT_MEM_REGION calls kvm_gmem_populate() to map guest pages; the
- * callback tdx_gmem_post_populate() then maps pages into private memory.
- * through the a seamcall TDH.MEM.PAGE.ADD().  The SEAMCALL also requires the
- * private EPT structures for the page to have been built before, which is
- * done via kvm_tdp_map_page(). nr_premapped counts the number of pages that
- * were added to the EPT structures but not added with TDH.MEM.PAGE.ADD().
- * The counter has to be zero on KVM_TDX_FINALIZE_VM, to ensure that there
- * are no half-initialized shared EPT pages.
- */
-static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
-					  enum pg_level level, kvm_pfn_t pfn)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-
-	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
-		return -EIO;
-
-	/* nr_premapped will be decreased when tdh_mem_page_add() is called. */
-	atomic64_inc(&kvm_tdx->nr_premapped);
-	return 0;
-}
-
 static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, u64 mirror_spte)
 {
@@ -1642,14 +1619,30 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 		     (mirror_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
 
 	/*
-	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
-	 * barrier in tdx_td_finalize().
+	 * Ensure pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory()
+	 * before kvm_tdx->state.  Userspace must not be allowed to pre-fault
+	 * arbitrary memory until the initial memory image is finalized.  Pairs
+	 * with the smp_wmb() in tdx_td_finalize().
 	 */
 	smp_rmb();
-	if (likely(kvm_tdx->state == TD_STATE_RUNNABLE))
-		return tdx_mem_page_aug(kvm, gfn, level, pfn);
 
-	return tdx_mem_page_record_premap_cnt(kvm, gfn, level, pfn);
+	/*
+	 * If the TD isn't finalized/runnable, then userspace is initializing
+	 * the VM image via KVM_TDX_INIT_MEM_REGION.  Increment the number of
+	 * pages that need to be mapped and initialized via TDH.MEM.PAGE.ADD.
+	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all pre-mapped
+	 * pages have been added to the image, to prevent running the TD with a
+	 * valid mapping in the mirror EPT, but not in the S-EPT.
+	 */
+	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE)) {
+		if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
+			return -EIO;
+
+		atomic64_inc(&kvm_tdx->nr_premapped);
+		return 0;
+	}
+
+	return tdx_mem_page_aug(kvm, gfn, level, pfn);
 }
 
 static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
