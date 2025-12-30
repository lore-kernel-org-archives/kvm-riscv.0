Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD07FEE57C6
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFYqJzQwN/GqcIm5b2xssEZJWueFUoVwd1CkxHM5EPU=; b=gYPUREDLc5MB5h
	tFuFWKTgb1cBZlvOeY+eVG7m8Fdz7oeDOkFrHCjIjBAGy/UPx1bnOYdoeU6rLSgSlYuj7mF45jco2
	rgQB4CJ9j7E3xU5F0y9VLjG7T9bTTxw0jKU+KRfccVXjgrsufmlRHKTrnCIo2/uiUQn6DnwJbn5gF
	pQXaA72dE5qsa8k8RjdZ8H/G2XxiwdrkNAGq0YxRd6Grfa9Nl08C0HaNeklMBoF334W1Iq05TDOVA
	HkZnCyaUfXMRD+folouGCbyW+1d4nIAYq5DGgMgsbgmYczJv+xVlR2tkR1h0NKLgqXzOLBUa9nsix
	tcd4/nrnSepbvSc4+Pbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaik3-00000005Nok-3dRN;
	Tue, 30 Dec 2025 23:03:03 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijE-00000005MnV-3hm1
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:16 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34abec8855aso22135868a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135732; x=1767740532; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ja2t3RddJQQ9WtlMGrZPDGGnut4pYDpTPLHSPL1hvlg=;
        b=FK+GrslM2TxdE3Wc6qyKRiBCpKtrOaPvsQSYVjmVK49oL5KNJMLZVrh/WzeSSo4jLn
         HBbBqUgaLewAxgMF6T8h3kQCkOnQnbSqb6DVfIJTLuTn79N2qkIymzqP9zb/Y5BR+GFR
         gZcyjj2znxePLn5Dv/72syQQxcleUf40fMz8XeqO5IEY/yu58PwABfe6PXm0uNx+JCkd
         xAGNlwmwdjo1DLOIsUud9A3RYJG+uu4OVK6PHiQc5tobhG0MbpQuthv0wU26sapmmYoS
         TihcTtreuVz0yV8AuvvUFg9RrJUaUCaGeY2PcIbGgo3h2LbY1j5faMCEvl6BLHVzGTsU
         Y0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135732; x=1767740532;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja2t3RddJQQ9WtlMGrZPDGGnut4pYDpTPLHSPL1hvlg=;
        b=L3hY2wMKsMDrByCPagP1bKV1gCN4Y7IAzf6PrKrLBHe3fD6ZuCKK98FEmmsMkZrZ+w
         +kxP3qVAvfqrz8KK4WdL88P+h74bJW/OLchW/zQrItgtgPEWUJMIipuAuVtENZJqHx3+
         rRY0V6ynO3LXyc4na21ckAmxakJzmzMipVF+Btfxy9V/S+YsVMxZ+qfJnG5IPD7LGnPQ
         LVm80akQAEQ40xro6LgSrkYSI/6iL6zrz0lxlQVkn6sSboVHfNp0efL0jsjByK4F54Ux
         v4iH7UDR/iue43lV5deITaXkfrn581fz4h2Kmc8CW31qNVOQfaWEpUo9ky5ZQEoVMYgn
         Ehsw==
X-Forwarded-Encrypted: i=1; AJvYcCUkLGCswaMdNIwYbm45vTjwZZ60j+mwqG6py6oq9kX16l4iNVDASFGqXMW4XqAH/9K2WF7i5PP20wc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyI+RJA9TKnZsSV3dFVIf/pGQD8bYmu5CbPFSaJQjwarH7n0yrX
	RY1FaSn8D2VtjCVf96ybABw6ylcw2fcPv56Cyy2karAQhqUriB5rhyBz08uqOnav36uZkcaJYXR
	o690aMA==
X-Google-Smtp-Source: AGHT+IFlmvuQfNmiHzFuNq9XlPth424WfhGaGaW+Waxyx9tMx4HEJVVNAsbuKBuWKPaCjxwrIKXmvslHERQ=
X-Received: from pjbnw17.prod.google.com ([2002:a17:90b:2551:b0:34c:30f1:8d54])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3882:b0:340:d511:e167
 with SMTP id 98e67ed59e1d1-34e9207378fmr28865851a91.0.1767135731850; Tue, 30
 Dec 2025 15:02:11 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:40 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-12-seanjc@google.com>
Subject: [PATCH v4 11/21] KVM: selftests: Stop passing VMX metadata to TDP
 mapping functions
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_150212_985019_0081C0FE 
X-CRM114-Status: GOOD (  13.97  )
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

From: Yosry Ahmed <yosry.ahmed@linux.dev>

The root GPA can now be retrieved from the nested MMU, stop passing VMX
metadata. This is in preparation for making these functions work for
NPTs as well.

Opportunistically drop tdp_pg_map() since it's unused.

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h | 11 ++-----
 .../testing/selftests/kvm/lib/x86/memstress.c | 11 +++----
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 33 +++++++------------
 .../selftests/kvm/x86/vmx_dirty_log_test.c    |  9 +++--
 4 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index 1fd83c23529a..4dd4c2094ee6 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -557,14 +557,9 @@ bool load_vmcs(struct vmx_pages *vmx);
 
 bool ept_1g_pages_supported(void);
 
-void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
-		uint64_t paddr);
-void tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
-	     uint64_t paddr, uint64_t size);
-void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
-				       struct kvm_vm *vm);
-void tdp_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
-			 uint64_t addr, uint64_t size);
+void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
+void tdp_identity_map_default_memslots(struct kvm_vm *vm);
+void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
 bool kvm_cpu_has_ept(void);
 void vm_enable_ept(struct kvm_vm *vm);
 void prepare_virtualize_apic_accesses(struct vmx_pages *vmx, struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/x86/memstress.c b/tools/testing/selftests/kvm/lib/x86/memstress.c
index 00f7f11e5f0e..3319cb57a78d 100644
--- a/tools/testing/selftests/kvm/lib/x86/memstress.c
+++ b/tools/testing/selftests/kvm/lib/x86/memstress.c
@@ -59,7 +59,7 @@ uint64_t memstress_nested_pages(int nr_vcpus)
 	return 513 + 10 * nr_vcpus;
 }
 
-static void memstress_setup_ept_mappings(struct vmx_pages *vmx, struct kvm_vm *vm)
+static void memstress_setup_ept_mappings(struct kvm_vm *vm)
 {
 	uint64_t start, end;
 
@@ -68,16 +68,15 @@ static void memstress_setup_ept_mappings(struct vmx_pages *vmx, struct kvm_vm *v
 	 * KVM can shadow the EPT12 with the maximum huge page size supported
 	 * by the backing source.
 	 */
-	tdp_identity_map_1g(vmx, vm, 0, 0x100000000ULL);
+	tdp_identity_map_1g(vm, 0, 0x100000000ULL);
 
 	start = align_down(memstress_args.gpa, PG_SIZE_1G);
 	end = align_up(memstress_args.gpa + memstress_args.size, PG_SIZE_1G);
-	tdp_identity_map_1g(vmx, vm, start, end - start);
+	tdp_identity_map_1g(vm, start, end - start);
 }
 
 void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vcpus[])
 {
-	struct vmx_pages *vmx;
 	struct kvm_regs regs;
 	vm_vaddr_t vmx_gva;
 	int vcpu_id;
@@ -87,11 +86,11 @@ void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vc
 
 	vm_enable_ept(vm);
 	for (vcpu_id = 0; vcpu_id < nr_vcpus; vcpu_id++) {
-		vmx = vcpu_alloc_vmx(vm, &vmx_gva);
+		vcpu_alloc_vmx(vm, &vmx_gva);
 
 		/* The EPTs are shared across vCPUs, setup the mappings once */
 		if (vcpu_id == 0)
-			memstress_setup_ept_mappings(vmx, vm);
+			memstress_setup_ept_mappings(vm);
 
 		/*
 		 * Override the vCPU to run memstress_l1_guest_code() which will
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 9d4e391fdf2c..ea1c09f9e8ab 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -409,8 +409,8 @@ static void tdp_create_pte(struct kvm_vm *vm,
 }
 
 
-void __tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		  uint64_t nested_paddr, uint64_t paddr, int target_level)
+void __tdp_pg_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
+		  int target_level)
 {
 	const uint64_t page_size = PG_LEVEL_SIZE(target_level);
 	void *eptp_hva = addr_gpa2hva(vm, vm->arch.tdp_mmu->pgd);
@@ -453,12 +453,6 @@ void __tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 	}
 }
 
-void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		uint64_t nested_paddr, uint64_t paddr)
-{
-	__tdp_pg_map(vmx, vm, nested_paddr, paddr, PG_LEVEL_4K);
-}
-
 /*
  * Map a range of EPT guest physical addresses to the VM's physical address
  *
@@ -476,9 +470,8 @@ void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
  * Within the VM given by vm, creates a nested guest translation for the
  * page range starting at nested_paddr to the page range starting at paddr.
  */
-void __tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-	       uint64_t nested_paddr, uint64_t paddr, uint64_t size,
-		  int level)
+void __tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
+	       uint64_t size, int level)
 {
 	size_t page_size = PG_LEVEL_SIZE(level);
 	size_t npages = size / page_size;
@@ -487,23 +480,22 @@ void __tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
 
 	while (npages--) {
-		__tdp_pg_map(vmx, vm, nested_paddr, paddr, level);
+		__tdp_pg_map(vm, nested_paddr, paddr, level);
 		nested_paddr += page_size;
 		paddr += page_size;
 	}
 }
 
-void tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-	     uint64_t nested_paddr, uint64_t paddr, uint64_t size)
+void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
+	     uint64_t size)
 {
-	__tdp_map(vmx, vm, nested_paddr, paddr, size, PG_LEVEL_4K);
+	__tdp_map(vm, nested_paddr, paddr, size, PG_LEVEL_4K);
 }
 
 /* Prepare an identity extended page table that maps all the
  * physical pages in VM.
  */
-void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
-				       struct kvm_vm *vm)
+void tdp_identity_map_default_memslots(struct kvm_vm *vm)
 {
 	uint32_t s, memslot = 0;
 	sparsebit_idx_t i, last;
@@ -520,16 +512,15 @@ void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
 		if (i > last)
 			break;
 
-		tdp_map(vmx, vm, (uint64_t)i << vm->page_shift,
+		tdp_map(vm, (uint64_t)i << vm->page_shift,
 			(uint64_t)i << vm->page_shift, 1 << vm->page_shift);
 	}
 }
 
 /* Identity map a region with 1GiB Pages. */
-void tdp_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
-			    uint64_t addr, uint64_t size)
+void tdp_identity_map_1g(struct kvm_vm *vm, uint64_t addr, uint64_t size)
 {
-	__tdp_map(vmx, vm, addr, addr, size, PG_LEVEL_1G);
+	__tdp_map(vm, addr, addr, size, PG_LEVEL_1G);
 }
 
 bool kvm_cpu_has_ept(void)
diff --git a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
index 5c8cf8ac42a2..370f8d3117c2 100644
--- a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
@@ -80,7 +80,6 @@ void l1_guest_code(struct vmx_pages *vmx)
 static void test_vmx_dirty_log(bool enable_ept)
 {
 	vm_vaddr_t vmx_pages_gva = 0;
-	struct vmx_pages *vmx;
 	unsigned long *bmap;
 	uint64_t *host_test_mem;
 
@@ -96,7 +95,7 @@ static void test_vmx_dirty_log(bool enable_ept)
 	if (enable_ept)
 		vm_enable_ept(vm);
 
-	vmx = vcpu_alloc_vmx(vm, &vmx_pages_gva);
+	vcpu_alloc_vmx(vm, &vmx_pages_gva);
 	vcpu_args_set(vcpu, 1, vmx_pages_gva);
 
 	/* Add an extra memory slot for testing dirty logging */
@@ -120,9 +119,9 @@ static void test_vmx_dirty_log(bool enable_ept)
 	 * GPAs as the EPT enabled case.
 	 */
 	if (enable_ept) {
-		tdp_identity_map_default_memslots(vmx, vm);
-		tdp_map(vmx, vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
-		tdp_map(vmx, vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
+		tdp_identity_map_default_memslots(vm);
+		tdp_map(vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
+		tdp_map(vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
 	}
 
 	bmap = bitmap_zalloc(TEST_MEM_PAGES);
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
