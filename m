Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7229EC624D6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tBm7ohMbuacOun9LJFKQ7qSkYyw7tuE8Kig9yXP9cGk=; b=VO/UyGrhhVjPqg
	eVrc+HjJhtOX8VGVppOlN/m7D2rRxHViMzjQKtxuKWsiMJgtGmUn590rRqvBnSJIW9o16i+Cw6DQ2
	EsQd0wmYZ9IfXf5ASW+uVNRKeRyANWyDledCqF/DPLfWDwd47jHgZO2GHwI96RRee0lK4E2J7y2Y7
	WffvJjx4RSi7uy6nAYRJ/DDhX/BKo70W39RIZGsj9NxhBWSaEJUzYbJmLwo91x4ffIKypM30hBgrF
	I/LciNbsiJlef67a24Avu2VCiXT+txVmeB9COZlIep2ngZD5ZlT99BP3K7JcU2dTm0myLa2uwa3kW
	Xg8G22ISuWDj277816Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o2Z-0000000FG8F-327Z;
	Wed, 02 Sep 2026 16:42:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o26-0000000FEpi-3Gag
	for kvm-riscv@bombadil.infradead.org;
	Wed, 02 Sep 2026 16:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+EtjgHzhg5y+gaNAA1nW+ZiKB252Rwdo4nHhOvgia1M=; b=PANMCbVflJe4nuRwdFuFpAzYgR
	0iY364tHFEHsUy3WS+K8PDZekMfvvdZwlUnyZMo9rPxGIMEpjnaXFqCrCwXLhGBhJqvP4YSQ2sivq
	fADgfbpGeW+h+elk+kP4kIeQU0gx+L7Obp2ZWPT3UVjefqUAhCDMnjffDNvUmQFRAa7YxVnCHkrOy
	wMqSh9dJZKWW+kqpuAkaeu/3binpkhdF2WmLuh3R0cfigT8YxY6jBKj/wOZl6msZWtorf2XDHMyyR
	7fRLoZtMCHD1rl8cTOu+d35aKmXOEq3bm42m3SYi49Haan+g8+QZ2HnmCgSmS9tNUDCUnKTYrdasT
	IbxhOlQA==;
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1o22-0000000CDC1-0kJF
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:53 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1635779a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367308; x=1788972108; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+EtjgHzhg5y+gaNAA1nW+ZiKB252Rwdo4nHhOvgia1M=;
        b=C5kSUcIHeYj6nk6sP4dn6sWZPMvXR0KgM7INDSCC47as/PlpMII8L27ACegt1ijLX6
         fGFJ2N5wZqZF2VZ5UGMdU3usc97VdutVqLqnwoIJZAVvW00kv9kGZmZunfQ3IxGHDQko
         UufUb6tabEjHshArlQwPqibdU6eTlpElCtBZ0H5UjYQmvpgg856JRRA/wJe0Th1iDKr4
         RynqCONL5Ve3FJOfu8qQ6NkiLcEGTRDARvgJUBfJnntENHCG9n0UTFNA2xV3jQf7b87H
         cgUEp9G0VZCJiGy1cqGVkbsdcajPOllaxwcc7TmtWTfnrhYVrWpndiyCP+B6DEB1lDCe
         9ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367308; x=1788972108;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+EtjgHzhg5y+gaNAA1nW+ZiKB252Rwdo4nHhOvgia1M=;
        b=cBZpKDPKEk4iuLOUG8wdY+7GlpRiTtdLS+EG3vX0XwqZ2sh/6O4Wq9hKDSCEWtYFlg
         5Rxe0iBmlj0pEO95NiPgchaPVCRN9TuVf/3ckwTlrkZ0Cbwb8z7c0gHVRb6tKXlDlV6z
         ml89yCk/RHFOwaMATtT/+zs2vILBsNiP46ODGRZppba4dIoS5NnonYpyUq5oSr95/3AS
         6L9XoG59FeT7mglnRNfuaaoXSbxbbCvhgFZC3huDt5rjcH4EbwnCHVfFa+zUBShJy+Od
         S7SGGWmEyLIAw+dJHHNHLDyFcOkfRRT6zX96sghPOK3Oi5tiyAg6YtBmF+DmFc1UorR5
         TTmg==
X-Forwarded-Encrypted: i=1; AKwUvByAhts8J4TTORmDVI/AsekWqTdfEAYNIpXt7yLsh+L3X544JhT5GuDYMDxa+fGJp+xk8xvZG0yKc/I=@lists.infradead.org
X-Gm-Message-State: AFuF++k88b7diu10TiGlqcJechgWiFrTB2hYvUf40a6o6x3baI03OkE4
	nnYsawnXyxBV3h8/awbhphUDleDQeiSEXmQuEkrF5MVbyq4K8IYh+3HY+DWXO8ELxnrSGxfgfxN
	HZtSF4Q==
X-Received: from pjqz14.prod.google.com ([2002:a17:90a:b10e:b0:390:9239:a6dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c4e:b0:398:ba56:b926
 with SMTP id 98e67ed59e1d1-39aee16f658mr8856203a91.25.1788367307392; Wed, 02
 Sep 2026 09:41:47 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:22 -0700
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-20-seanjc@google.com>
Subject: [PATCH v2 19/20] KVM: selftests: Automatically pick min_gpa for
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
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_174150_357067_02BD621A 
X-CRM114-Status: GOOD (  20.15  )
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

Opportunistically move the vGIC LPI stress test's "gpa_base" variable into
setup_memslot() as the only reason it was a global variable was so that it
could be passed as the minimum GPA for allocations from the extra memslot.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/arm64/vgic_lpi_stress.c     | 13 +++----
 .../testing/selftests/kvm/include/kvm_util.h  | 12 +++---
 tools/testing/selftests/kvm/lib/kvm_util.c    | 38 ++++++++++++++++---
 .../testing/selftests/kvm/lib/x86/processor.c |  3 +-
 .../selftests/kvm/set_memory_region_test.c    |  2 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |  2 +-
 6 files changed, 45 insertions(+), 25 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index a45c0849a47a..45a87ba5a737 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -23,7 +23,6 @@
 #define GIC_LPI_OFFSET	8192
 
 static size_t nr_iterations = 1000;
-static gpa_t gpa_base;
 
 static struct kvm_vm *vm;
 static struct kvm_vcpu **vcpus;
@@ -143,6 +142,7 @@ static void guest_code(size_t nr_lpis)
 
 static void setup_memslot(void)
 {
+	gpa_t gpa_base;
 	size_t pages;
 	size_t sz;
 
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
index c166fce4599c..43b49d0ad4eb 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1054,11 +1054,10 @@ const char *exit_reason_str(unsigned int exit_reason);
 
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
@@ -1066,20 +1065,19 @@ static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
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
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
