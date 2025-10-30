Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFC0CCFA00
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCl51w+3Ae03hlckztT08cAmtYLOsPUqsCySDU2iTaw=; b=3kQigYo4aM5RUc
	8jQguXWui9yUM0m5pIQDCnI/22GwzGSb+cYcNxuA/3jJbmpbM5W2Aco/ikhBjCvEGXVGwO13S47Le
	JMHZyDuIEBeeNkA7JIvOXuuieRka4tkWxVbBRF7nemgLeXJlKZcZ5pKSSYWtbwwVXf/qoi3Qmz++2
	Gw31HYwkyfUMibq5PHFVhihN+BzUF1qOP4Qy8RbdNoR78nlxiYmh6RVVYT8e/UIjfV3CiRHUcfOqR
	sr61mojcUZKAdxF+TqUN0mturxMSv8K78pRbcW/BD12YPXPF1p9nm4+JoOcoyJ8ZUAWZZwuXT46xf
	QohrePold5CYDZqw9ZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzg-00000004l4y-2O87;
	Thu, 30 Oct 2025 20:11:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyh-00000004jrK-2nvP
	for kvm-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KH8ZMUFkaBzXjpSahKr3XCuyUdT65ecO9/HP1PAb4RI=; b=Wvmg9cT9khmI7CFrGcfnsrLHRG
	icRVAGfszwoWKJG+NtXGQVkHCoU9mEPTyHEgo3as3nQToIeYVTZFZuhgHqEGN0sBYAnwPenWJyyiL
	t/tgbI44v88xco6ZNx24JV73IhHpQh9JPBsKmc4DpfgCzpQCE86V1ZlXUonPrmASbAhmH9P+KRw58
	gFuzFSTCx+JwbKUxzbS9tvOwfTf/U3ffUri/pUOs+oIbPwrMz+toziOrEoOoGlwNWrSeMLg7WBoq8
	EupskPQwQGbSCwvTBTuJO6Y+mBGt/4sRWT1ZdK+M0JVHAPagYz97LuG1LJRHWqxtKw2Jd90ACvCiy
	imILm1JA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY6u-00000009tiM-10Fq
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:03 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3408686190eso460988a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855028; x=1762459828; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KH8ZMUFkaBzXjpSahKr3XCuyUdT65ecO9/HP1PAb4RI=;
        b=NaG8Mj13BW6YqxXKxcTduYvnGaAN8JhGo7wuVEIAscXDr/VtSlTcvNcN69A5hnCZoY
         4azGj5fmdnYmNa/5AjBSTEvC1BqumQ4PZEeAQr4fDBnhu/C6Jac9H0yPJKEq/sSGjil3
         MldiMKTMOt7o6wRLnZJq98ZqyxmQSZhP4IppI8uXSfXI4xOnuKU9UM3JkQNZ4MUEDUMl
         0UVykVkuhXs84U8ZODHXndO/6264Nm6n2BSfoT1Juxy4H6wtrWcQveMCno8DcTeMR4b+
         bI9bMNfEOjzlDDxX1OTVCqH60aBqL4oUR1DIw7KoM9sQDkJYlVj40+Z5o6SwqbReXbEb
         D4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855028; x=1762459828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KH8ZMUFkaBzXjpSahKr3XCuyUdT65ecO9/HP1PAb4RI=;
        b=MBJEdTl/SugNRcwu3df5R+CGxDk4Fwp4olz7fb6b78YyFKhT3LnP6DOFLCaucs6PQz
         c6bbD43Knkt6jsz7R7PIm9P9mIeaZtBnZmm1MyeL7RIjgSkfSQyXrQFJ3GY4lKGM7Cuy
         z0obfAsy2MjpwZMNSw3CyvK229WEIRZOTdB4SbDJPu5BPMWmvSGI/zkQ66UQt3XMipqf
         OdgcdlOyciimQ7SvZmBJ4a5ZRd75ClbfBt+cvc1tWwKrQH4ThSOiGNP2+5Y/iX/U+QBF
         zZjM5cHnvlhYA8m3tuhRvBU8OxJ2J6KfZuBFlYBtQSuMruQqmgiviE5vSvenzgeGCb0c
         bttw==
X-Forwarded-Encrypted: i=1; AJvYcCWMdK0Mq81w88wuL2j6XdG9uuBk0lqBsXlpiAPCXyuclcStHkPtkSZyLvhzn1dimit+62CQJcZp89s=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCyYcEp3kf6B/Ak+DZWD9c9hUEuKlgnr6I8ZEXWFebp0plFYcR
	hLq0JLVMoRtd2O1xvIuBjnO7qj76RPoOKHWa1ZiLlR3FA1hztnkkpMOnXKHWKd+/RtfG0T3u5x7
	CMODbzg==
X-Google-Smtp-Source: AGHT+IGrJrKalEV3VAWt2uGzDiDeYhZVGRjeI1LK3deyE8hSeRDQF6nrnXg4JLxn0CpF+AukaegC2zqX/UE=
X-Received: from pjbgj23.prod.google.com ([2002:a17:90b:1097:b0:33b:cfaf:ce3e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1801:b0:330:6d5e:f17b
 with SMTP id 98e67ed59e1d1-34083074dddmr1219299a91.21.1761855028166; Thu, 30
 Oct 2025 13:10:28 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:35 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-13-seanjc@google.com>
Subject: [PATCH v4 12/28] KVM: TDX: WARN if mirror SPTE doesn't have full RWX
 when creating S-EPT mapping
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
X-CRM114-CacheID: sfid-20251030_191500_344446_3CAA6005 
X-CRM114-Status: GOOD (  12.81  )
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

Pass in the mirror_spte to kvm_x86_ops.set_external_spte() to provide
symmetry with .remove_external_spte(), and assert in TDX that the mirror
SPTE is shadow-present with full RWX permissions (the TDX-Module doesn't
allow the hypervisor to control protections).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      | 3 +--
 arch/x86/kvm/vmx/tdx.c          | 6 +++++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b5867f8fe6ce..87a5f5100b1d 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1848,7 +1848,7 @@ struct kvm_x86_ops {
 				void *external_spt);
 	/* Update the external page table from spte getting set. */
 	int (*set_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
-				 kvm_pfn_t pfn_for_gfn);
+				 u64 mirror_spte);
 
 	/* Update external page tables for page table about to be freed. */
 	int (*free_external_spt)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index e1a96e9ea1bb..9c26038f6b77 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -515,7 +515,6 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 	bool was_present = is_shadow_present_pte(old_spte);
 	bool is_present = is_shadow_present_pte(new_spte);
 	bool is_leaf = is_present && is_last_spte(new_spte, level);
-	kvm_pfn_t new_pfn = spte_to_pfn(new_spte);
 	int ret = 0;
 
 	KVM_BUG_ON(was_present, kvm);
@@ -534,7 +533,7 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 	 * external page table, or leaf.
 	 */
 	if (is_leaf) {
-		ret = kvm_x86_call(set_external_spte)(kvm, gfn, level, new_pfn);
+		ret = kvm_x86_call(set_external_spte)(kvm, gfn, level, new_spte);
 	} else {
 		void *external_spt = get_external_spt(gfn, new_spte, level);
 
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 7ab67ad83677..658e0407eb21 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1629,14 +1629,18 @@ static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
 }
 
 static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
-				     enum pg_level level, kvm_pfn_t pfn)
+				     enum pg_level level, u64 mirror_spte)
 {
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
+	kvm_pfn_t pfn = spte_to_pfn(mirror_spte);
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return -EIO;
 
+	WARN_ON_ONCE(!is_shadow_present_pte(mirror_spte) ||
+		     (mirror_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
+
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
 	 * barrier in tdx_td_finalize().
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
