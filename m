Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12781C54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Rytl5fybT8QDGvqVjbzcl7+fi5cssnrK7zEkNDUduc=; b=kohjlc1D+28IE3
	SMnJJh6+vADD6P2yUDkAINuAyWe09m4UObg+EatFINMAkqXbntv1LXQi/V90YoBeMD4mo6uP4lhvo
	f8tnYhc8pKF1n1sbn+LF8Lj9837iYOWqeAfNI4OK7QNNcdYsXaR5Z5nFxGcgtdxg+eUVwJyT8emqY
	XuH4jvReGaSlb3/Wx+2dwR5dqSn9+9OtaruZuu2qa/iyR8T3x7C6AAWhWuK0ebcSEQZpWXNlAr7Hl
	FNkiEi7ao0cm7rXZQYAIQNybTN+RyNIXwcJ9BFCxL2b9gz/07bDkQk3CKD+Y9k2skOV8BDOXuiXQT
	Vxk0AAZkI+GHot8djLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woz5y-00000007Aeb-36Ed;
	Wed, 29 Jul 2026 07:52:54 +0000
Received: from mail-pj2-x09.google.com ([2607:f8b0:4864:39::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woz5v-00000007Adi-3f74
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 07:52:52 +0000
Received: by mail-pj2-x09.google.com with SMTP id 98e67ed59e1d1-38f0f8ab050so527461a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 00:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785311571; x=1785916371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+S7Jp8AiRPMxLwArOeWjXj5fI/6HZ3Xr4zn06sU+Ak=;
        b=JQhVeFyyP5dXd/UEpb/V7JZPVaF+07Lcg1bB6SYV/H8s0hMjwGHAwaYBWkOtDsYq5m
         coWFtqZrLTID7nQdHS5ZyjEtrH6ichKa/n4RIhqV4CyTxjqHDGaIpZZeWhGEficFZE5I
         ragCrbt3yYLwRs4rCqbP5gDULcQtONfxPXzII92In0mv4Oz537+zLs9NGnXVQzEqkKyI
         BOpqENlR18sGztl7nSBPW0mLs9otTX7KhM7OYnz7QcDH93NwkBe14a/KuNHuLACQN9ia
         I2X/QHE1T7wTHqrndulCp+ZioK0yhOeZ+6i0afKPRcfV8TZVk1LItvsYq7o8u+nEmiXD
         ffXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785311571; x=1785916371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+S7Jp8AiRPMxLwArOeWjXj5fI/6HZ3Xr4zn06sU+Ak=;
        b=lhN+XwyUDWezW6/ZLf9LP/AEq9IoEPS1xRmfiN/xMLqIODbbVYje4Qk4hOkF7g1ZYr
         ULgxSOx3ZeosiL/OpAH9pwwZknICPHl63LcC4P+vqoIu/4QwugqZm528taTlWr7rafSr
         PhazzC7T3z66pY9jj2B5fM3ZiO/PNwbtU01M8I5SPXGYHCFjb515BwzBZ4DSUPsEmabS
         k+bM+2eQvFWZPfA5toY5++QzR1QhKvU7A6BWPGikOEH/VEDlSF6hl3awZR+l+g2h8lPb
         BXLZErT2myoOWIwTVnqCQ0SZxHKsU62/Gnl6zwlSPVJEfuJTs1yMVheNNvi/svUr9roV
         W4oQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFOuLZkMqyowKqzMqX00unBbiaki++T/ZLq5LhON1oEPi1fZR+q3TJa4F72NMvcFTq0rzR627BhzM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwITYOaFy19srYVKzGhSbEvxUwoZBfVGEhSTyXA++9TisHAcTf
	4beIlMgLSRNjMmnu2DO+PFFphRwA4ZE9JrR4lR6oknZhTpYi/4Mkyge6
X-Gm-Gg: AR+sD12NLRCdXMv+pLrqm47vNF27snFZ2ufqU0eD4byd7pgg96tNJzxo3aB+9IKRa4H
	eSE1JqAyJAcZW2K5sI+Vj8m+afmTwupDV9yiJ1DRWNgmsWTmiS6J4N6GmCYYMDJjAOyFzwE+vpt
	eP146XpgmLHHnxHCJbhMgBxz0988zEVoUNvV/Fe9IxMGz4ygEbAopzFt20oC7KHOwxVKitGx9zc
	h1RVrMmmVc23grbFERNeQho980TOwkzc3Gc6Ovbm3J4FUrQPDnkhSgBIt6dERr5yM+wbd9fKTa5
	Ll4Rca5WyHMx5Rd5FOUymftpxUKmccJAlPFFlipmbXXDwPn6zcMWJSqgcB+QRhvGboHcXD++Lgw
	5XjEb+FsPmyri30ExmoWCYfKdo9eHcDE/tDBBOqYjjJrS/eb1e71dqiEExRhELDVigm4uzqr570
	L5N8OHVnALS7C7VJx87mhzaicgNGkwz20AVNeyKfq1oBzrVI8Z6KBE2fN0NNSgQPGhC8sxO9Bhv
	n8=
X-Received: by 2002:a17:90a:d888:b0:38d:f096:a1dc with SMTP id 98e67ed59e1d1-38f6a40bd71mr5502911a91.11.1785311570796;
        Wed, 29 Jul 2026 00:52:50 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0edd51sm960739a91.2.2026.07.29.00.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 00:52:50 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [PATCH v2] RISC-V: KVM: Fix spurious -EEXIST and clean up gstage fault path types
Date: Wed, 29 Jul 2026 15:52:30 +0800
Message-ID: <20260729075230.743030-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729070749.730218-1-shanbeeyoo@gmail.com>
References: <20260729070749.730218-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_005251_919850_2CD908B8 
X-CRM114-Status: GOOD (  19.69  )
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

Two small fixes to the RISC-V G-stage page fault path, both suggested
during review of the in-progress KVM Userfault port.

1. Treat -EEXIST from kvm_riscv_gstage_map_page() as a quiet success.

   When a concurrent vCPU installs the same G-stage mapping while we
   are waiting for mmu_lock, gstage_map_page() returns -EEXIST.  This
   is not an error -- the page is correctly mapped and the faulting
   vCPU can simply retry the guest instruction -- but KVM was treating
   it as one: printing "Failed to map in G-stage" to dmesg and
   propagating -EEXIST all the way to userspace.

   Align RISC-V with x86 and arm64, which already swallow -EEXIST in
   their respective fault handlers.  This also lets
   kvm_release_faultin_page() drop its "ret && ret != -EEXIST" special
   case: with ret normalized to 0 the regular release path is correct.

2. Clean up fault path types.

   - vma_pageshift: short -> unsigned int.  Bit widths and shift counts
     conventionally use unsigned int in the kernel.

   - fault_addr: unsigned long -> gpa_t.  RV32 with Sv32x4 has 34-bit
     guest physical addresses.  fault_addr is widened to gpa_t (u64) to
     hold the full address, and the shift reconstructing it,
     (trap->htval << 2), is cast to gpa_t before the shift: htval is
     unsigned long, so on RV32 the shift would otherwise be evaluated in
     32-bit arithmetic and drop bits 32/33 before the result is widened.
     No functional change on RV64.

   These type changes are in preparation for sharing a common
   struct kvm_page_fault across architectures, as requested during
   review.

No functional change on RV64 beyond silencing the spurious -EEXIST.

These are independent fixes with no dependencies; they can be merged
on their own.  The KVM_MEM_USERFAULT port that motivated them will be
sent separately as an RFC once the generic userfault series lands.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
Changes since v1:
- Cast trap->htval to gpa_t before the <<2 shift so the 34-bit guest
  physical address is not truncated by 32-bit arithmetic on RV32.  v1
  only widened the destination (fault_addr -> gpa_t); the shift itself
  still dropped bits 32/33 before the result was widened.

 arch/riscv/kvm/mmu.c       | 8 +++++---
 arch/riscv/kvm/vcpu_exit.c | 5 +++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 8a0aa5e0e216..d2a06a54be17 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -541,7 +541,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 	kvm_pfn_t hfn;
 	bool is_hugetlb;
 	bool writable;
-	short vma_pageshift;
+	unsigned int vma_pageshift;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct vm_area_struct *vma;
 	struct kvm *kvm = vcpu->kvm;
@@ -652,11 +652,13 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 						vma_pagesize, true, true, out_map);
 	}
 
-	if (ret)
+	if (ret == -EEXIST)
+		ret = 0;
+	else if (ret)
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
-	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
+	kvm_release_faultin_page(kvm, page, ret, writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6c8530b9f29e..28cf9b27bb07 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -17,12 +17,13 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_gstage_mapping host_map;
 	struct kvm_memory_slot *memslot;
-	unsigned long hva, fault_addr;
+	unsigned long hva;
+	gpa_t fault_addr;
 	bool writable;
 	gfn_t gfn;
 	int ret;
 
-	fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
+	fault_addr = ((gpa_t)trap->htval << 2) | (trap->stval & 0x3);
 	gfn = fault_addr >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
 	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
