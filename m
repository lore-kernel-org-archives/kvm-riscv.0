Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09B9CCD19A
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnAeORVp92C/N79G2uIgh359crVIt/2ktfSQiGYw3Pw=; b=IRliHaH0ITGANs
	itSIAP+QcOSqlmeHajO6BzHR3X61n+pwgDcsamCtLl4BM3HSzSZOvB0tGxVfyFxmmn/AE1w7Pw/er
	Wv4bl4Z7EhjRZgB1vGYx8XSBiDYfWP+kBuVMFvxU8nkn8K1AsktW96562sVDL9x+PHZ3ZJJd8KbBM
	aJmvuR0fcK1eT3Lp8Z8IvtnIq4oO6yjM8I7paRrddN+oKMqMPmPdB2sernUzQb3BOM8m3PrUuGzYq
	YfeS5S+zrbI5ClzptBPNITrdywr0qB0xKc7pvts7I1tLI4JJADkzdiEe/KkvtzJTSWOmrC/h8U5pI
	9qRdJF5jpbcoxS5kTZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YR5-00000006GD5-3uYD;
	Fri, 17 Oct 2025 00:35:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPy-00000006E54-2maI
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tdDvnnMBi79Itp61RxW2nV56QIHnitcyrtTO64NTOt8=; b=KtZOCGqyfLp9RvrpsS4dn7AY8H
	LpWueXQfwrEiUnKyaYNXAISJprC75pkBI7ZmcwwPYLQh/M2Y8qum8I1Y4vcC9Zoifgeom2vim+SDz
	k75rUXMuRMlpXCdP96Rcst8nuFmrxVl08TED0peYJLHPjwkd9+tnCxYbfGBdcqVXuYwAKKU7eerCB
	8/ZR79AIuaa/cVsBy9Bjm0+PY7Zt4cZiHbsdsghlwhrtzC76LasZaKfQLmLYHQ+LWHaOwBgV7xVMd
	Q7wphwCyjg/ofXBulqnmHi4eFTiR8oYT2nJsVjJEf3dqrr3U0p0R8WAa20gQWcpYkJVGJ87lpPxQj
	sc4Hqxxw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPE-000000078Hh-3nPl
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:52 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so2861429a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661191; x=1761265991; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tdDvnnMBi79Itp61RxW2nV56QIHnitcyrtTO64NTOt8=;
        b=ga+9WLH5HG7ItnAGHXcmpHcFVOOFb99e00cmVi6aGZHHZ3x/3dqdZQdY96pVAdsVyH
         vlTZNc++kLVjoeeNAmG7+dMCsmZDwe/D0VgVsQNERFS9/+Wl7/0OJ2w3iKAtryBIBaCa
         VKYuxhyTCoWmkXC8t9hW04fgs1wOosNuhdmy7YQJqnQseYQspZZB+42nYim3nCYqEua8
         xKxhNtJVWT73D2kSFzkjfpMJuUUowvq2//1ReCJic/yRo6U/oEr/7YrFPPaD3t6D/x27
         lMbZAPTOOjTTiISnY84Df9T5m61H0feEqafZb2HSgEM2mRUKHo8+lhzBH6ycuk1PS4aG
         AOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661191; x=1761265991;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdDvnnMBi79Itp61RxW2nV56QIHnitcyrtTO64NTOt8=;
        b=doZwAztcyhK0pEAPhN7oPcOhgnt+wICB5Kgs/Nnlz7KSJQkXMwdiGhHnhss9CBBihT
         47y+8AbE6Os/HGbwIhuMcrzjjD+ZcdjE5SSGX3BvlExVF88yHEAaHqrr9qzAbqVOMxGI
         A+C8GDeDzp3LFX7ZUybqSqqHKSEK8v557qILWSk3NoIjkqbbStPDgxoFJtD0bY4IO2Ix
         iz+sOtQ01nuW1qzl3+1MMySX7c56rCoR6CnLnbPEyH882/syViz2wq1Rg9RzjCbcixPe
         NEr4U4LUsMoqRHNlZbRRmOcTkxmoAr4jWSFDzWtuzrVd3jGoaI3bZCNtVqL8BY4lgLAS
         nbSA==
X-Forwarded-Encrypted: i=1; AJvYcCWdhrTywPx3zk4KZckecxC9uZodG93j+34Wr9GEIWCBfb4AvsvB44PvBIlSok3pEzoI+ZS8nIiXx9s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxduhLGD3PpE2rqeOFUwmxuf5+ow2Pxvu53rQeJVQKsNnKFK678
	IKFmfUyeXv5nnxoZSy8XtYNlQu0TB3r9kCd5x8wH4GERs2GJQt2ltCRfdDhDYIzFDeMvYfRnFg+
	PZ1+p1w==
X-Google-Smtp-Source: AGHT+IFjbvhuJBf5rM9mXEGAaRcwet/6S3ph7hsVNQrCN7ddhA3ec/NJFjzeh48C6n1kB16/mom5cp7HTgE=
X-Received: from pjso17.prod.google.com ([2002:a17:90a:c091:b0:32e:3830:65f2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1dc4:b0:330:6f13:53fc
 with SMTP id 98e67ed59e1d1-33bcf8f870bmr1842078a91.27.1760661191207; Thu, 16
 Oct 2025 17:33:11 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:31 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-14-seanjc@google.com>
Subject: [PATCH v3 13/25] KVM: TDX: Fold tdx_mem_page_record_premap_cnt() into
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
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013342_047007_56BED835 
X-CRM114-Status: GOOD (  17.52  )
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
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 49 ++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 6c0adc1b3bd5..c37591730cc5 100644
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
 				     enum pg_level level, kvm_pfn_t pfn)
 {
@@ -1638,14 +1615,30 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 		return -EIO;
 
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
+	 * KVM_TDX_FINALIZE_VM checks the counter to ensure all mapped pages
+	 * have been added to the image, to prevent running the TD with a
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
2.51.0.858.gf9c4a03a3a-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
