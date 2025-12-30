Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B905AEE57C7
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bM5gGAhdxxrbgNQc501tweoKaNqJxWMXdagIPQ6xUfo=; b=LuJ4WxI/kp9gQF
	AP8rFFFkyCiooErOLe5WkGOM80DeueTemQr9kLrNBJbQb/e9itD88QB+u9z1UMxzwgZJ6whSYiphu
	VNC2j1Nvz/PomaY8JJIk1VH2y62vYrn0yeEAHx3b5dz7gv9RxcFiusXfXNZpswaGk7VCFYeQm+t8w
	8XwFVTCfg9srv8e1Em5wzUTqMqMGACYzqeb8p0z+IREFQxj0wpFbEkGcvm3KVe9A1GgxjlJDnuSfn
	zvAbhjdpRnCp6YKGbB9hhYXUW5Bs4Y3zbiCxTW4wwKtKe1q648k3hJ40PNTx1L6LwiYs6ws7PP78/
	XncYYTFPTLDAPPtvsMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vailV-00000005Pla-0VbG;
	Tue, 30 Dec 2025 23:04:33 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijY-00000005NBb-157o
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:36 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so19431475b3a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135751; x=1767740551; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lvDGtOJlZOshVNKy7HhFV38ObB7SdC2/7YpvR2O0iOs=;
        b=mn4nNZLs2tDBz7GoZ1gCpqCDxWX9QcVEIUPuIAMFHy+AqXgugQA+qgQ4sg9LaKDIP0
         JV0uqEVB4KXI2JaL/E1uS/kxwpNnO1PV8aKiTpPJxAiiPfCThIIU/dGE4wNTG8sJpPBt
         mW+EDQKKqo9qGr4SrERgGlZVUepshO+3eGG3lAfcu0ZT7xVzl4DIMrLKmvbvq2I+ftNP
         P1PXI43DgThiJpn52yjNxpDPSBRAXtQ1nxo/pGF8HT7mdthtmLE4168QX0awBalHzIfb
         cpC5yiGXxGkc3IQyoDp+kNfCq+ZL4KFPKBy+U2+8ScquPekQgeWTtXiDmp+L864zCETH
         kYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135751; x=1767740551;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvDGtOJlZOshVNKy7HhFV38ObB7SdC2/7YpvR2O0iOs=;
        b=tGig9HaHUFuP6JKojlUEWJIaQpQLLlNP9TgIazf4JZyR6UrY5RzfQjOk/HMFgRR2+B
         fAWmrhmIPN/PBI0eaZuhnZ38GdzYc7zI6GgjM3LLyGmefDO5oIVbdhBCkJKCwl5gMixB
         hCGdhffygUMvWqMpwydqpyHTYPetu3ZVK/p0x8TyAzIE1xQjSOIeM3aR7qqiPlrzNL8H
         fiNNBiGP6boHFwsND29IBdFVFlILOuABGZlKhnQTb1iQRGB+iW/EWkfzSACjMz5Uw0pe
         pxOke4Exx620iHApSJhDBb32VZCdxSzOS8aPdC6F2UCwkVo6YWCZx5puKa5W+Y1jbYR1
         K/Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWukJLTZ0ltzVDxOoWWgIBBvqaDghtifjfENgTmzqjUdxgg4AVx/g5KA4hDLfhUkSiFweIHCstTv2E=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqD/CTcz7LC9cAKl0C+fNKcnzLnGM0hJ1o0rg584OrdsCEtlxv
	FNrDaOBW0YRE+on8+afJJ+hMltIFeDEiHpZaq/dhhAweDScJKsYC1mVI0jrYZG8HAxkvLvieGG1
	gxNefnw==
X-Google-Smtp-Source: AGHT+IFl+E4iBtLvuy29ZNl15W5f+YM/yuQ6NLYMRsjb6K6O2MuWbmEY/dD/ZgE2AJbg2gFPgmlYtjYuvMQ=
X-Received: from pfbem48.prod.google.com ([2002:a05:6a00:3770:b0:7f9:3450:d9b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:420b:b0:7e8:4471:ae55
 with SMTP id d2e1a72fcca58-7ff6745678amr28709155b3a.33.1767135750526; Tue, 30
 Dec 2025 15:02:30 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:50 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-22-seanjc@google.com>
Subject: [PATCH v4 21/21] KVM: selftests: Test READ=>WRITE dirty logging
 behavior for shadow MMU
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
X-CRM114-CacheID: sfid-20251230_150232_371032_FB10CDA1 
X-CRM114-Status: GOOD (  22.11  )
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

Update the nested dirty log test to validate KVM's handling of READ faults
when dirty logging is enabled.  Specifically, set the Dirty bit in the
guest PTEs used to map L2 GPAs, so that KVM will create writable SPTEs
when handling L2 read faults.  When handling read faults in the shadow MMU,
KVM opportunistically creates a writable SPTE if the mapping can be
writable *and* the gPTE is dirty (or doesn't support the Dirty bit), i.e.
if KVM doesn't need to intercept writes in order to emulate Dirty-bit
updates.

To actually test the L2 READ=>WRITE sequence, e.g. without masking a false
pass by other test activity, route the READ=>WRITE and WRITE=>WRITE
sequences to separate L1 pages, and differentiate between "marked dirty
due to a WRITE access/fault" and "marked dirty due to creating a writable
SPTE for a READ access/fault".  The updated sequence exposes the bug fixed
by KVM commit 1f4e5fc83a42 ("KVM: x86: fix nested guest live migration
with PML") when the guest performs a READ=>WRITE sequence.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86/processor.h     |   1 +
 .../testing/selftests/kvm/lib/x86/processor.c |   7 ++
 .../selftests/kvm/x86/nested_dirty_log_test.c | 115 +++++++++++++-----
 3 files changed, 90 insertions(+), 33 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index ab29b1c7ed2d..8945c9eea704 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1483,6 +1483,7 @@ bool kvm_cpu_has_tdp(void);
 void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
 void tdp_identity_map_default_memslots(struct kvm_vm *vm);
 void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
+uint64_t *tdp_get_pte(struct kvm_vm *vm, uint64_t l2_gpa);
 
 /*
  * Basic CPU control in CR0
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index ab869a98bbdc..fab18e9be66c 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -390,6 +390,13 @@ static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm,
 	return virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
 }
 
+uint64_t *tdp_get_pte(struct kvm_vm *vm, uint64_t l2_gpa)
+{
+	int level = PG_LEVEL_4K;
+
+	return __vm_get_page_table_entry(vm, &vm->stage2_mmu, l2_gpa, &level);
+}
+
 uint64_t *vm_get_pte(struct kvm_vm *vm, uint64_t vaddr)
 {
 	int level = PG_LEVEL_4K;
diff --git a/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
index 89d2e86a0db9..1e7c1ed917e1 100644
--- a/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_dirty_log_test.c
@@ -17,29 +17,39 @@
 
 /* The memory slot index to track dirty pages */
 #define TEST_MEM_SLOT_INDEX		1
-#define TEST_MEM_PAGES			3
+#define TEST_MEM_PAGES			4
 
 /* L1 guest test virtual memory offset */
-#define GUEST_TEST_MEM			0xc0000000
+#define GUEST_TEST_MEM1			0xc0000000
+#define GUEST_TEST_MEM2			0xc0002000
 
 /* L2 guest test virtual memory offset */
 #define NESTED_TEST_MEM1		0xc0001000
-#define NESTED_TEST_MEM2		0xc0002000
+#define NESTED_TEST_MEM2		0xc0003000
 
 #define L2_GUEST_STACK_SIZE 64
 
+#define TEST_SYNC_PAGE_MASK	0xfull
+#define TEST_SYNC_READ_FAULT	BIT(4)
+#define TEST_SYNC_WRITE_FAULT	BIT(5)
+#define TEST_SYNC_NO_FAULT	BIT(6)
+
 static void l2_guest_code(u64 *a, u64 *b)
 {
 	READ_ONCE(*a);
+	GUEST_SYNC(0 | TEST_SYNC_READ_FAULT);
 	WRITE_ONCE(*a, 1);
-	GUEST_SYNC(true);
-	GUEST_SYNC(false);
+	GUEST_SYNC(0 | TEST_SYNC_WRITE_FAULT);
+	READ_ONCE(*a);
+	GUEST_SYNC(0 | TEST_SYNC_NO_FAULT);
 
 	WRITE_ONCE(*b, 1);
-	GUEST_SYNC(true);
+	GUEST_SYNC(2 | TEST_SYNC_WRITE_FAULT);
 	WRITE_ONCE(*b, 1);
-	GUEST_SYNC(true);
-	GUEST_SYNC(false);
+	GUEST_SYNC(2 | TEST_SYNC_WRITE_FAULT);
+	READ_ONCE(*b);
+	GUEST_SYNC(2 | TEST_SYNC_NO_FAULT);
+	GUEST_SYNC(2 | TEST_SYNC_NO_FAULT);
 
 	/* Exit to L1 and never come back.  */
 	vmcall();
@@ -53,7 +63,7 @@ static void l2_guest_code_tdp_enabled(void)
 static void l2_guest_code_tdp_disabled(void)
 {
 	/* Access the same L1 GPAs as l2_guest_code_tdp_enabled() */
-	l2_guest_code((u64 *)GUEST_TEST_MEM, (u64 *)GUEST_TEST_MEM);
+	l2_guest_code((u64 *)GUEST_TEST_MEM1, (u64 *)GUEST_TEST_MEM2);
 }
 
 void l1_vmx_code(struct vmx_pages *vmx)
@@ -72,9 +82,11 @@ void l1_vmx_code(struct vmx_pages *vmx)
 
 	prepare_vmcs(vmx, l2_rip, &l2_guest_stack[L2_GUEST_STACK_SIZE]);
 
-	GUEST_SYNC(false);
+	GUEST_SYNC(0 | TEST_SYNC_NO_FAULT);
+	GUEST_SYNC(2 | TEST_SYNC_NO_FAULT);
 	GUEST_ASSERT(!vmlaunch());
-	GUEST_SYNC(false);
+	GUEST_SYNC(0 | TEST_SYNC_NO_FAULT);
+	GUEST_SYNC(2 | TEST_SYNC_NO_FAULT);
 	GUEST_ASSERT_EQ(vmreadz(VM_EXIT_REASON), EXIT_REASON_VMCALL);
 	GUEST_DONE();
 }
@@ -91,9 +103,11 @@ static void l1_svm_code(struct svm_test_data *svm)
 
 	generic_svm_setup(svm, l2_rip, &l2_guest_stack[L2_GUEST_STACK_SIZE]);
 
-	GUEST_SYNC(false);
+	GUEST_SYNC(0 | TEST_SYNC_NO_FAULT);
+	GUEST_SYNC(2 | TEST_SYNC_NO_FAULT);
 	run_guest(svm->vmcb, svm->vmcb_gpa);
-	GUEST_SYNC(false);
+	GUEST_SYNC(0 | TEST_SYNC_NO_FAULT);
+	GUEST_SYNC(2 | TEST_SYNC_NO_FAULT);
 	GUEST_ASSERT_EQ(svm->vmcb->control.exit_code, SVM_EXIT_VMMCALL);
 	GUEST_DONE();
 }
@@ -106,6 +120,11 @@ static void l1_guest_code(void *data)
 		l1_svm_code(data);
 }
 
+static uint64_t test_read_host_page(uint64_t *host_test_mem, int page_nr)
+{
+	return host_test_mem[PAGE_SIZE * page_nr / sizeof(*host_test_mem)];
+}
+
 static void test_dirty_log(bool nested_tdp)
 {
 	vm_vaddr_t nested_gva = 0;
@@ -133,32 +152,45 @@ static void test_dirty_log(bool nested_tdp)
 
 	/* Add an extra memory slot for testing dirty logging */
 	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
-				    GUEST_TEST_MEM,
+				    GUEST_TEST_MEM1,
 				    TEST_MEM_SLOT_INDEX,
 				    TEST_MEM_PAGES,
 				    KVM_MEM_LOG_DIRTY_PAGES);
 
 	/*
-	 * Add an identity map for GVA range [0xc0000000, 0xc0002000).  This
+	 * Add an identity map for GVA range [0xc0000000, 0xc0004000).  This
 	 * affects both L1 and L2.  However...
 	 */
-	virt_map(vm, GUEST_TEST_MEM, GUEST_TEST_MEM, TEST_MEM_PAGES);
+	virt_map(vm, GUEST_TEST_MEM1, GUEST_TEST_MEM1, TEST_MEM_PAGES);
 
 	/*
-	 * ... pages in the L2 GPA range [0xc0001000, 0xc0003000) will map to
-	 * 0xc0000000.
+	 * ... pages in the L2 GPA ranges [0xc0001000, 0xc0002000) and
+	 * [0xc0003000, 0xc0004000) will map to 0xc0000000 and 0xc0001000
+	 * respectively.
 	 *
 	 * When TDP is disabled, the L2 guest code will still access the same L1
 	 * GPAs as the TDP enabled case.
+	 *
+	 * Set the Dirty bit in the PTEs used by L2 so that KVM will create
+	 * writable SPTEs when handling read faults (if the Dirty bit isn't
+	 * set, KVM must intercept the next write to emulate the Dirty bit
+	 * update).
 	 */
 	if (nested_tdp) {
 		tdp_identity_map_default_memslots(vm);
-		tdp_map(vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
-		tdp_map(vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
+		tdp_map(vm, NESTED_TEST_MEM1, GUEST_TEST_MEM1, PAGE_SIZE);
+		tdp_map(vm, NESTED_TEST_MEM2, GUEST_TEST_MEM2, PAGE_SIZE);
+
+
+		*tdp_get_pte(vm, NESTED_TEST_MEM1) |= PTE_DIRTY_MASK(&vm->stage2_mmu);
+		*tdp_get_pte(vm, NESTED_TEST_MEM2) |= PTE_DIRTY_MASK(&vm->stage2_mmu);
+	} else {
+		*vm_get_pte(vm, GUEST_TEST_MEM1) |= PTE_DIRTY_MASK(&vm->mmu);
+		*vm_get_pte(vm, GUEST_TEST_MEM2) |= PTE_DIRTY_MASK(&vm->mmu);
 	}
 
 	bmap = bitmap_zalloc(TEST_MEM_PAGES);
-	host_test_mem = addr_gpa2hva(vm, GUEST_TEST_MEM);
+	host_test_mem = addr_gpa2hva(vm, GUEST_TEST_MEM1);
 
 	while (!done) {
 		memset(host_test_mem, 0xaa, TEST_MEM_PAGES * PAGE_SIZE);
@@ -169,25 +201,42 @@ static void test_dirty_log(bool nested_tdp)
 		case UCALL_ABORT:
 			REPORT_GUEST_ASSERT(uc);
 			/* NOT REACHED */
-		case UCALL_SYNC:
+		case UCALL_SYNC: {
+			int page_nr = uc.args[1] & TEST_SYNC_PAGE_MASK;
+			int i;
+
 			/*
 			 * The nested guest wrote at offset 0x1000 in the memslot, but the
 			 * dirty bitmap must be filled in according to L1 GPA, not L2.
 			 */
 			kvm_vm_get_dirty_log(vm, TEST_MEM_SLOT_INDEX, bmap);
-			if (uc.args[1]) {
-				TEST_ASSERT(test_bit(0, bmap), "Page 0 incorrectly reported clean");
-				TEST_ASSERT(host_test_mem[0] == 1, "Page 0 not written by guest");
-			} else {
-				TEST_ASSERT(!test_bit(0, bmap), "Page 0 incorrectly reported dirty");
-				TEST_ASSERT(host_test_mem[0] == 0xaaaaaaaaaaaaaaaaULL, "Page 0 written by guest");
+
+			/*
+			 * If a fault is expected, the page should be dirty
+			 * as the Dirty bit is set in the gPTE.  KVM should
+			 * create a writable SPTE even on a read fault, *and*
+			 * KVM must mark the GFN as dirty when doing so.
+			 */
+			TEST_ASSERT(test_bit(page_nr, bmap) == !(uc.args[1] & TEST_SYNC_NO_FAULT),
+				    "Page %u incorrectly reported %s on %s fault", page_nr,
+				    test_bit(page_nr, bmap) ? "dirty" : "clean",
+				    uc.args[1] & TEST_SYNC_NO_FAULT ? "no" :
+				    uc.args[1] & TEST_SYNC_READ_FAULT ? "read" : "write");
+
+			for (i = 0; i < TEST_MEM_PAGES; i++) {
+				if (i == page_nr && uc.args[1] & TEST_SYNC_WRITE_FAULT)
+					TEST_ASSERT(test_read_host_page(host_test_mem, i) == 1,
+						    "Page %u not written by guest", i);
+				else
+					TEST_ASSERT(test_read_host_page(host_test_mem, i) == 0xaaaaaaaaaaaaaaaaULL,
+						    "Page %u written by guest", i);
+
+				if (i != page_nr)
+					TEST_ASSERT(!test_bit(i, bmap),
+						    "Page %u incorrectly reported dirty", i);
 			}
-
-			TEST_ASSERT(!test_bit(1, bmap), "Page 1 incorrectly reported dirty");
-			TEST_ASSERT(host_test_mem[PAGE_SIZE / 8] == 0xaaaaaaaaaaaaaaaaULL, "Page 1 written by guest");
-			TEST_ASSERT(!test_bit(2, bmap), "Page 2 incorrectly reported dirty");
-			TEST_ASSERT(host_test_mem[PAGE_SIZE*2 / 8] == 0xaaaaaaaaaaaaaaaaULL, "Page 2 written by guest");
 			break;
+		}
 		case UCALL_DONE:
 			done = true;
 			break;
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
