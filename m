Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746AFD232EE
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 08:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=11STFVHpDh1JzOq0pBsMM9+JozsijTcPW7WyMzDpoxA=; b=fziYGn0miIuIqTjwD6V6ZaYcVi
	zj9XCPrVTDwn7BFZa26F36huaytRK/ccbl3bzOg6juq6f/xMNQvR0G/eMgkFz7uBUOD8xE3Q81Usd
	VOwQ4lHzuFzC+p4FnDtbxo9q17fJshSHiS5U2wrYIELGB+f24WISzqeGxxk+SmHauov9YtzTChhZW
	NjFp8lZ7I4u3AoclORqlRmB+XgLle6smzQBBC3HVbaA5zaOzLAW6Aq3mh2XE94tLrmtVEP/6eT76Y
	ypl5/zGxLUlbtcsDkCzWN+EPPLli3QscQUz9mZoOe9RYIBaQSLAU/nk4D+xCTNnLpbAxFaYViI0G9
	/7X3madg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lV-00000001smf-0CTO;
	Fri, 09 Jan 2026 08:22:37 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7lJ-00000001sYY-3Wo9
	for kvm-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 08:22:30 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-430fc153d50so2906961f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 09 Jan 2026 00:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767946944; x=1768551744; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pq9O7d6wzhTity1EvTGcuuOU01Kl/XBUCmwyUjTCy1A=;
        b=yud1y1A6vS38bbZomLDj33CBcWvlOXhfleDsCfjw4IeVWxdv4b8JTh6AiWaMsfOQbi
         K9sLgyjINwtLUIOb2lccNt5yzP4C3suaquCAHL4UFAP6LOuA5hspOcmE4uS3I7Q2/z4b
         oSCESCbofWKeaKju32QEsKF5UgIih0Yhx+bzzM+Zn0ZJ4Q1d/M0ybzmY3twitV8PZRtp
         geLDMMA8T0uHfBOIFjMlMgiU3I0aA3BIHQXEgT3D0txkK/Tteo+ZkKt3tjhFX5hrY0Sz
         u+P2N8DDcPqegNk0xmd4bSAfkmxoL5bXNNBliGRtE0ePZ+m2Dc3Eij2ZpxsgKtE0kreX
         P/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946944; x=1768551744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pq9O7d6wzhTity1EvTGcuuOU01Kl/XBUCmwyUjTCy1A=;
        b=MUuL5O6noP1VyPlZ5L7cvNaPI6AC9xZ2wx41UPYwMuvG0HCBZCpRdyVJ3pCKNLHOFC
         uAtQe4jTaQdm+UhSc26ajxzsY+jVh9IVGTIA28/qQQSQC+2PWgYAqF5bKv+hK8j7NJR9
         IIVosJfrenX6g3c1bAQdT5s2Wtpk2S4b6nuJNpy9s1HLaXW+FtCxKKWyal5aNjneLcyj
         PA0nBr/ehmU+92fpt7NzkCcq/HgO5Q0c55H4Kl+7fWQENhLP3J9xxadM2d+8mL6aCLJs
         UlFPFIL9RmMt8P/v8gOXZTjca9D2Ci7QIhbbrNXBEbgOMi8C7AzsnUPT355/cIy2PJzs
         Ul0A==
X-Forwarded-Encrypted: i=1; AJvYcCX7mmmXnV54XNycs7FYt7FqnnlxXBy7n8ZeSORzXPIk82Jq11lPJSyqWE0L8lKmoAYuReV/xJfAay8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaplQx3eJ1BgnhCxrc7TXsGIzC9e/W5Vac7UDaitCgrcvfKAf2
	/wNBsnxod0q4iKpt65drz0D44cVF9THpPTLoGEKHxWUNLO6GDp1wBQ0O+vH7IRv1CBVkmhnBsBu
	u4Q==
X-Google-Smtp-Source: AGHT+IGWTLfUDmVjhmRk/6xaUs6XXjTDY4nThSKMpmNBWodgPyJb8+1XA5L2Dn6202jXo8K9XP5BtW0DRQ==
X-Received: from wrbew19.prod.google.com ([2002:a05:6000:2413:b0:430:f703:f9cb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4709:b0:479:1348:c614
 with SMTP id 5b1f17b1804b1-47d84b41b2dmr100673355e9.26.1767946943756; Fri, 09
 Jan 2026 00:22:23 -0800 (PST)
Date: Fri,  9 Jan 2026 08:22:17 +0000
In-Reply-To: <20260109082218.3236580-1-tabba@google.com>
Mime-Version: 1.0
References: <20260109082218.3236580-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260109082218.3236580-5-tabba@google.com>
Subject: [PATCH v4 4/5] KVM: selftests: Move page_align() to shared header
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, anup@brainfault.org, 
	atish.patra@linux.dev, itaru.kitayama@fujitsu.com, andrew.jones@linux.dev, 
	seanjc@google.com, tabba@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_002225_945669_B1A953F7 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

To avoid code duplication, move page_align() to the shared `kvm_util.h`
header file. Rename it to vm_page_align(), to make it clear that the
alignment is done with respect to the guest's base page size.

No functional change intended.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h    | 5 +++++
 tools/testing/selftests/kvm/lib/arm64/processor.c | 7 +------
 tools/testing/selftests/kvm/lib/riscv/processor.c | 7 +------
 3 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 81f4355ff28a..747effa614f1 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1258,6 +1258,11 @@ static inline int __vm_disable_nx_huge_pages(struct kvm_vm *vm)
 	return __vm_enable_cap(vm, KVM_CAP_VM_DISABLE_NX_HUGE_PAGES, 0);
 }
 
+static inline uint64_t vm_page_align(struct kvm_vm *vm, uint64_t v)
+{
+	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
+}
+
 /*
  * Arch hook that is invoked via a constructor, i.e. before exeucting main(),
  * to allow for arch-specific setup that is common to all tests, e.g. computing
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index 607a4e462984..1605dc740d1e 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -21,11 +21,6 @@
 
 static vm_vaddr_t exception_handlers;
 
-static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
-{
-	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
-}
-
 static uint64_t pgd_index(struct kvm_vm *vm, vm_vaddr_t gva)
 {
 	unsigned int shift = (vm->pgtable_levels - 1) * (vm->page_shift - 3) + vm->page_shift;
@@ -115,7 +110,7 @@ static uint64_t __maybe_unused ptrs_per_pte(struct kvm_vm *vm)
 
 void virt_arch_pgd_alloc(struct kvm_vm *vm)
 {
-	size_t nr_pages = page_align(vm, ptrs_per_pgd(vm) * 8) / vm->page_size;
+	size_t nr_pages = vm_page_align(vm, ptrs_per_pgd(vm) * 8) / vm->page_size;
 
 	if (vm->pgd_created)
 		return;
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d5e8747b5e69..401245fe31db 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -26,11 +26,6 @@ bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext)
 	return !ret && !!value;
 }
 
-static uint64_t page_align(struct kvm_vm *vm, uint64_t v)
-{
-	return (v + vm->page_size - 1) & ~(vm->page_size - 1);
-}
-
 static uint64_t pte_addr(struct kvm_vm *vm, uint64_t entry)
 {
 	return ((entry & PGTBL_PTE_ADDR_MASK) >> PGTBL_PTE_ADDR_SHIFT) <<
@@ -68,7 +63,7 @@ static uint64_t pte_index(struct kvm_vm *vm, vm_vaddr_t gva, int level)
 
 void virt_arch_pgd_alloc(struct kvm_vm *vm)
 {
-	size_t nr_pages = page_align(vm, ptrs_per_pte(vm) * 8) / vm->page_size;
+	size_t nr_pages = vm_page_align(vm, ptrs_per_pte(vm) * 8) / vm->page_size;
 
 	if (vm->pgd_created)
 		return;
-- 
2.52.0.457.g6b5491de43-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
