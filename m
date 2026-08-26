Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAE6C61DCD
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzL+Z6LXKBv488uYXJV9jnANikxuo/L0FumJllMLo9k=; b=FEXjcrvkQSpIiD
	zmtMNLJjROI9GYbRkvao7rAwF0Vuo5+rv7J0oEiZY4rLkU99dlWk/DZYaCPOUL0AXidbaYmnTIOzw
	iLnN53w5GqRwBqxZDBeZ5fib09LCxv0QQUsC5q/ISNbPakoQPIdArKlevVK9YEwtpZ94JC/bAAjCB
	Gjp9oKwOq7XRfPBlvnpDrT0UYp392EvJDz0xMFmKFi6cfyOhMh9rug4dj0f4WZFksDuRw2LppLK4x
	IipxExlSCVwpOFidl4ysAUZJiD8l0mKrq+gP86nrVe1sQRrQAZUjU/Ilc3ieBRW8A4BhXe1IJsWUS
	WUqHpduMXnOpeuatPzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMiE-000000038n1-0EGA;
	Wed, 26 Aug 2026 23:07:18 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgf-000000036RH-0C8v
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:48 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso2911890a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785539; x=1788390339; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yj/O7Wk77mjZvk8cJgP4GcT6ON8eMhR5OMU86FoPEAo=;
        b=lR7PLvz7oUDsFU6q3iTHRT+EkFKSZrSwJZ5AsP4IFWmaO6hgeHK+3x26ifw7Rbit49
         I1JyYAVb0dKu8lLRrFeh5j/hMkf2ta20E16bKWqbLR6u0wjdNaTpFuCCe33IR9xn3KrU
         PEO1QjXB/wo52d7hi+iPTV2Hfc2atRsCZ1xFal901IKZ0s8qG8LTPyOLjV3Jrxm42+kF
         i0g4bi35itrTwdloHC3o7GiuSstIJEcCHD3gWmmGpw29q7NFCDw3WEs9LyMwfqgaksdE
         LDPsHfE6+2RE72TdwlQHZP6JU2qaNzG05xyc4nX7ateyBsxb/K0yjIKp3QV0Iwudntxh
         pzkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785539; x=1788390339;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yj/O7Wk77mjZvk8cJgP4GcT6ON8eMhR5OMU86FoPEAo=;
        b=cKp2czn65D+sBpkjmjiYzpk96SuTJsZmJMLlsED+en6VrqZzU6wEsbXkDVJ5NVSPG6
         Un75r+45mZEDUHHe27aGES2XQNpHJyEy/D7eKiQUT493NYdnHxUaqSLX5TPHq7OyvQ6q
         1iG36nYC67MNqFwaFPi7sFGJdPOgqEtrgeNPDOgvODlRJPZMt2thSyrkWiAT2JvtGPdY
         Os0kJ+TFkq9+lqKQjz7r4asuAvaNBNlwMottJvxuupC5osc44sxUr6fflJLIBJH+Wm8G
         6/I+zJGIJYrMYpnJab1fun882/vabCUC0T0Jsz+rqwRDo+PpzV7K6cbI1wHtQnjnudDU
         Li7w==
X-Forwarded-Encrypted: i=1; AHgh+RrZXF3xarp5S3PY0dqFSq9NYMSUk9/i8AkCrZf8OIMJn51lyZ0+YeVwcR+X0VpsNuePCptJyYDoAws=@lists.infradead.org
X-Gm-Message-State: AFuF++khEF3tIFQGbQ2S1B81irchBsktEn2LYS7joBj16RO82VSK36eI
	d1eT6qSve3L4kyI4YJU9S9iPZ3kwsyPpWCFqoxf2NmrxCct0VqzzO283UWPnfDGtRrWAxtKDBAF
	sH198Uw==
X-Received: from pgak6.prod.google.com ([2002:a05:6a02:6746:b0:cbe:9e80:c394])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6cce:20b0:3d1:39e9:b267
 with SMTP id adf61e73a8af0-3d139e9b38amr1071680637.3.1787785539181; Wed, 26
 Aug 2026 16:05:39 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:10 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-20-seanjc@google.com>
Subject: [PATCH 19/20] KVM: selftests: Automatically pick min_gpa for
 allocations based on region type
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160541_165985_7590B7D0 
X-CRM114-Status: GOOD (  17.32  )
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

Automatically choose the minimum GPA for physical page allocations based on
the region type instead of sprinkling the logic over various wrappers and
tests.  All usage falls into three categories: (a) don't care, just use the
bare minimum GPA, (b) page tables, use a slightly higher min to keep low
memory available, (c) custom memslot, use the base of the memslot.  I.e.
there isn't a strong need to allow completely custom minimums.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/arm64/vgic_lpi_stress.c     | 11 ++----
 .../testing/selftests/kvm/include/kvm_util.h  | 12 +++---
 tools/testing/selftests/kvm/lib/kvm_util.c    | 38 ++++++++++++++++---
 .../testing/selftests/kvm/lib/x86/processor.c |  3 +-
 .../selftests/kvm/set_memory_region_test.c    |  2 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |  2 +-
 6 files changed, 44 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index a45c0849a47a..b4c651ea385d 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -191,28 +191,25 @@ static void setup_test_data(void)
 	gpa_t cmdq_base;
 
 	test_data.device_table = vm_phy_pages_alloc(vm, pages_per_64k,
-						    gpa_base,
 						    MEM_REGION_TEST_EXTRA);
 
 	test_data.collection_table = vm_phy_pages_alloc(vm, pages_per_64k,
-							gpa_base,
 							MEM_REGION_TEST_EXTRA);
 
-	cmdq_base = vm_phy_pages_alloc(vm, pages_per_64k, gpa_base,
-				       MEM_REGION_TEST_EXTRA);
+	cmdq_base = vm_phy_pages_alloc(vm, pages_per_64k, MEM_REGION_TEST_EXTRA);
 	virt_map(vm, cmdq_base, cmdq_base, pages_per_64k);
 	test_data.cmdq_base = cmdq_base;
 	test_data.cmdq_base_va = (void *)cmdq_base;
 
 	test_data.itt_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_devices,
-						  gpa_base, MEM_REGION_TEST_EXTRA);
+						  MEM_REGION_TEST_EXTRA);
 
 	test_data.lpi_prop_table = vm_phy_pages_alloc(vm, pages_per_64k,
-						      gpa_base, MEM_REGION_TEST_EXTRA);
+						      MEM_REGION_TEST_EXTRA);
 	configure_lpis();
 
 	test_data.lpi_pend_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_cpus,
-						       gpa_base, MEM_REGION_TEST_EXTRA);
+						       MEM_REGION_TEST_EXTRA);
 
 	sync_global_to_guest(vm, test_data);
 }
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index a0cd1b6598d4..1264cd1a343a 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1052,11 +1052,10 @@ const char *exit_reason_str(unsigned int exit_reason);
 
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 			   enum kvm_mem_region_type type, bool protected);
 
 static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
-				       gpa_t min_gpa,
 				       enum kvm_mem_region_type type)
 {
 	/*
@@ -1064,20 +1063,19 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 	 * protected memory, as the majority of memory for such VMs is
 	 * protected, i.e. using shared memory is effectively opt-in.
 	 */
-	return __vm_phy_pages_alloc(vm, nr_pages, min_gpa, type,
+	return __vm_phy_pages_alloc(vm, nr_pages, type,
 				    vm_arch_has_protected_memory(vm));
 }
 
-static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
+static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm,
 				      enum kvm_mem_region_type type)
 {
-	return vm_phy_pages_alloc(vm, 1, min_gpa, type);
+	return vm_phy_pages_alloc(vm, 1, type);
 }
 
 static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t nr_pages)
 {
-	return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				  MEM_REGION_PT);
+	return vm_phy_pages_alloc(vm, nr_pages, MEM_REGION_PT);
 }
 
 static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index e500d1799151..8b5b330a5889 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1473,9 +1473,7 @@ static gva_t ____vm_alloc(struct kvm_vm *vm, size_t sz, gva_t min_gva,
 	u64 pages = (sz >> vm->page_shift) + ((sz % vm->page_size) != 0);
 
 	virt_pgd_alloc(vm);
-	gpa_t gpa = __vm_phy_pages_alloc(vm, pages,
-					   KVM_UTIL_MIN_PFN * vm->page_size,
-					   type, protected);
+	gpa_t gpa = __vm_phy_pages_alloc(vm, pages, type, protected);
 
 	/*
 	 * Find an unused range of virtual page addresses of at least
@@ -2087,11 +2085,39 @@ gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 	__builtin_unreachable();
 }
 
-gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
+gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
 			   enum kvm_mem_region_type type, bool protected)
 {
-	TEST_ASSERT(type < NR_MEM_REGIONS,
-		    "Invalid memory region type '%u'", type);
+	struct userspace_mem_region *region = vm_get_mem_region(vm, type);
+	gpa_t min_gpa;
+
+	TEST_ASSERT(region, "No region for type '%u', memslot '%u'",
+		    type, vm->memslots[type]);
+
+	switch (type) {
+	case MEM_REGION_CODE:
+	case MEM_REGION_DATA:
+	case MEM_REGION_TEST_DATA:
+		/*
+		 * If the region is backed by the default memslot (id=0), use
+		 * selftests' hardcoded minimum PFN, otherwise use the base of
+		 * the custom memory slot that backs the region.
+		 */
+		if (!vm->memslots[type])
+			min_gpa = KVM_UTIL_MIN_PFN * vm->page_size;
+		else
+			min_gpa = region->region.guest_phys_addr;
+		break;
+	case MEM_REGION_PT:
+		min_gpa = KVM_GUEST_PAGE_TABLE_MIN_PADDR;
+		break;
+	case MEM_REGION_TEST_EXTRA:
+		min_gpa = region->region.guest_phys_addr;
+		break;
+	default:
+		TEST_FAIL("Invalid memory region type '%u'", type);
+		break;
+	}
 
 	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, vm->memslots[type],
 				      protected, false);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 39d9ca6ceb1d..479e9a481687 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1474,8 +1474,7 @@ void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
 			       smram_gpa, SMRAM_MEMSLOT, SMRAM_PAGES);
 
-	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, smram_gpa,
-				       MEM_REGION_TEST_EXTRA) == smram_gpa,
+	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, MEM_REGION_TEST_EXTRA) == smram_gpa,
 		    "Could not allocate guest physical addresses for SMRAM");
 
 	memset(addr_gpa2hva(vm, smram_gpa), 0x0, SMRAM_SIZE);
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 160bbe3d7203..bfa5ac8ce029 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -124,7 +124,7 @@ static struct kvm_vm *spawn_vm(struct kvm_vcpu **vcpu, pthread_t *vcpu_thread,
 	 * Allocate and map two pages so that the GPA accessed by guest_code()
 	 * stays valid across the memslot move.
 	 */
-	gpa = vm_phy_pages_alloc(vm, 2, MEM_REGION_GPA, MEM_REGION_TEST_EXTRA);
+	gpa = vm_phy_pages_alloc(vm, 2, MEM_REGION_TEST_EXTRA);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc\n");
 
 	virt_map(vm, MEM_REGION_GPA, MEM_REGION_GPA, 2);
diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index 4e125eb5e0cf..8d1822717abd 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -67,7 +67,7 @@ int main(int argc, char *argv[])
 			       MEM_REGION_SIZE / PAGE_SIZE);
 
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
-				 MEM_REGION_GPA, MEM_REGION_TEST_EXTRA);
+				 MEM_REGION_TEST_EXTRA);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
 	virt_map(vm, MEM_REGION_GVA, MEM_REGION_GPA, 1);
 	hva = addr_gpa2hva(vm, MEM_REGION_GPA);
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
