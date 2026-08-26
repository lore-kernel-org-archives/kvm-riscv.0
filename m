Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C766C61DC2
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 23:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWlcpWXV/zt3zsaYNtLtVmQIT1vLzL6DzI4MRD85m18=; b=GPGv3CfX68LkWI
	ZB8g4SezwZ1ozEM8NKeGU4rJNE3YHZbw1jCw226vKXbinhn2T6x2BxD34Y91CyQHnnzpFhEBKUWpm
	GIYyg/FPyAblZcrQWRzpZ/hG2S4LtTA1RNu40SIsjT9Sg5406aMBEBEZWibgsSPh0htHcLKfDIz/q
	RKCH8wVXcxUz75FNieW/MX9iOJDRRctp+tMqh4uPZ4Yo+iQcZyV/EqMTjnolye9i9kXm7OMXmkI1a
	JPi9iOdbkHUV3Ldg+qFTkCus3VcFKTH3S0V6rgcvqwMdSv8Oom/J9dLSUz4AAX5kByG+pPJYjMXOF
	BZ3tXWcLflzOreIOwlIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMiB-000000038hE-3hLC;
	Wed, 26 Aug 2026 23:07:15 +0000
Received: from mail-pg1-x546.google.com ([2607:f8b0:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMgd-000000036OM-3yoX
	for kvm-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 23:05:45 +0000
Received: by mail-pg1-x546.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso2817451a12.3
        for <kvm-riscv@lists.infradead.org>; Wed, 26 Aug 2026 16:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787785537; x=1788390337; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QW8eYqOPxy2zOGKaQa10ibF4yoX+KMS8dMg107sn6cY=;
        b=CrwhlUtnKjI5skDpVbs7ZCnxaHFi9lFF/DNgyHRgfLkPbnUAaQZ6hFiLixAwIBUFxx
         zZTXe0lXjouunPw7sMk+iC3DdvNIonNTEcCagwBbGVBZfZJQPIGWla1Wxd7vrgBZqriN
         oQ+oAQhUEtWChQR5kQ5way/O502kh/yCZWDqU9nU+38gcodO5oXWQcCmkHN/NQK5s1zx
         9UgPBrW4bQhHToF7GSSlo5JKMOjfPuDrnCtJ18VoyETSG+y4EDX1FDu/n16TgPEBvDLc
         ssAt2n+bUIlH4V7+9krUfBfIulTdh0KTSYHLvOXhoM93M5Qpef5TcCwS0K7TVzjCPdCf
         07+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785537; x=1788390337;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QW8eYqOPxy2zOGKaQa10ibF4yoX+KMS8dMg107sn6cY=;
        b=C/Yu3uzg1hE2wpSB8e1plh1nX9d9FFLQwEa7VCG6qFa5r2aEURT6D34Oy1Gk/Y3DeR
         3gmy35Te8c1FYLIh82DHTjvmrlFCv+h+tyivYhiZ+w1+t2eYLG+Q9swK+CUgTBtupA9F
         kJeCVEaFtyME9/WnbhwbCetvEZPkreJGuhwdBVkaa2p2kqmocMytuz4JTx9VCKLkq8Db
         WEWjGvnNkmYb8d9kBmtiUv2Rx1C1uopA1pctMNSnfIQxkcdMd5+yBWFXeX7ta+pSYs3a
         NUk+7AeiGzBZ2669rpF1kkgsi3i3D17W/XxZ+6sbipZWD/XdBFK6TNOFRNxHFVjpHcFf
         6igg==
X-Forwarded-Encrypted: i=1; AHgh+Roq6YNuq87ybKge7rWoCMIFUz8HBjqlJMBGLD7cq4TKeNleMCmytAOGNGiTFoSMLs7DfOR/9EBSnhc=@lists.infradead.org
X-Gm-Message-State: AFuF++nQXrGCaY0t13wV5iknO1HBNOBR6NOz6wEVtV0m9RQQthe4UfCp
	TZh+96cqFRvHJ0zNuU0HZl4iPxJNGK1sDath2ax93QlxYI1fkxI7vU5W5r6Ks2qLa7Vg1NOVd5m
	r6IoPwA==
X-Received: from pgbs63.prod.google.com ([2002:a63:5e42:0:b0:cbe:947d:d145])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:680d:b0:3c4:396d:4a6c
 with SMTP id adf61e73a8af0-3cf75e8b237mr24763274637.5.1787785537082; Wed, 26
 Aug 2026 16:05:37 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:05:08 -0700
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826230511.972824-18-seanjc@google.com>
Subject: [PATCH 17/20] KVM: selftests: Take the memory region type, not
 memslot, in page allocators
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
X-CRM114-CacheID: sfid-20260826_160540_158117_7CE264D3 
X-CRM114-Status: GOOD (  13.28  )
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

Take the memory region type instead of the memslot in all page allocator
APIs, except for the innermost quad-underscores function.  This will allow
automatically selecting the minimum GPA based on the allocation type, which
can't be done using the memslot due to all regions sharing a single memslot
by default.  PowerPC support will also leverage the type to ensure that
page table allocations are naturally aligned.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c | 12 ++++++------
 tools/testing/selftests/kvm/include/kvm_util.h      | 13 +++++++------
 tools/testing/selftests/kvm/lib/kvm_util.c          | 10 +++++++---
 tools/testing/selftests/kvm/lib/x86/processor.c     |  2 +-
 .../testing/selftests/kvm/set_memory_region_test.c  |  2 +-
 .../kvm/x86/smaller_maxphyaddr_emulation_test.c     |  2 +-
 6 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
index 9865b204fdeb..a45c0849a47a 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_lpi_stress.c
@@ -192,27 +192,27 @@ static void setup_test_data(void)
 
 	test_data.device_table = vm_phy_pages_alloc(vm, pages_per_64k,
 						    gpa_base,
-						    TEST_MEMSLOT_INDEX);
+						    MEM_REGION_TEST_EXTRA);
 
 	test_data.collection_table = vm_phy_pages_alloc(vm, pages_per_64k,
 							gpa_base,
-							TEST_MEMSLOT_INDEX);
+							MEM_REGION_TEST_EXTRA);
 
 	cmdq_base = vm_phy_pages_alloc(vm, pages_per_64k, gpa_base,
-				       TEST_MEMSLOT_INDEX);
+				       MEM_REGION_TEST_EXTRA);
 	virt_map(vm, cmdq_base, cmdq_base, pages_per_64k);
 	test_data.cmdq_base = cmdq_base;
 	test_data.cmdq_base_va = (void *)cmdq_base;
 
 	test_data.itt_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_devices,
-						  gpa_base, TEST_MEMSLOT_INDEX);
+						  gpa_base, MEM_REGION_TEST_EXTRA);
 
 	test_data.lpi_prop_table = vm_phy_pages_alloc(vm, pages_per_64k,
-						      gpa_base, TEST_MEMSLOT_INDEX);
+						      gpa_base, MEM_REGION_TEST_EXTRA);
 	configure_lpis();
 
 	test_data.lpi_pend_tables = vm_phy_pages_alloc(vm, pages_per_64k * nr_cpus,
-						       gpa_base, TEST_MEMSLOT_INDEX);
+						       gpa_base, MEM_REGION_TEST_EXTRA);
 
 	sync_global_to_guest(vm, test_data);
 }
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index f4f4f360a10b..783f060faf9e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -1052,30 +1052,31 @@ const char *exit_reason_str(unsigned int exit_reason);
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
-			   u32 memslot, bool protected);
+			   enum kvm_mem_region_type type, bool protected);
 
 static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
-				       gpa_t min_gpa, u32 memslot)
+				       gpa_t min_gpa,
+				       enum kvm_mem_region_type type)
 {
 	/*
 	 * By default, allocate memory as protected for VMs that support
 	 * protected memory, as the majority of memory for such VMs is
 	 * protected, i.e. using shared memory is effectively opt-in.
 	 */
-	return __vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot,
+	return __vm_phy_pages_alloc(vm, nr_pages, min_gpa, type,
 				    vm_arch_has_protected_memory(vm));
 }
 
 static inline gpa_t vm_phy_page_alloc(struct kvm_vm *vm, gpa_t min_gpa,
-				      u32 memslot)
+				      enum kvm_mem_region_type type)
 {
-	return vm_phy_pages_alloc(vm, 1, min_gpa, memslot);
+	return vm_phy_pages_alloc(vm, 1, min_gpa, type);
 }
 
 static inline gpa_t vm_alloc_page_table_pages(struct kvm_vm *vm, size_t nr_pages)
 {
 	return vm_phy_pages_alloc(vm, nr_pages, KVM_GUEST_PAGE_TABLE_MIN_PADDR,
-				  vm->memslots[MEM_REGION_PT]);
+				  MEM_REGION_PT);
 }
 
 static inline gpa_t vm_alloc_page_table(struct kvm_vm *vm)
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 781af2928d04..e500d1799151 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1475,7 +1475,7 @@ static gva_t ____vm_alloc(struct kvm_vm *vm, size_t sz, gva_t min_gva,
 	virt_pgd_alloc(vm);
 	gpa_t gpa = __vm_phy_pages_alloc(vm, pages,
 					   KVM_UTIL_MIN_PFN * vm->page_size,
-					   vm->memslots[type], protected);
+					   type, protected);
 
 	/*
 	 * Find an unused range of virtual page addresses of at least
@@ -2088,9 +2088,13 @@ gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 }
 
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
-			   u32 memslot, bool protected)
+			   enum kvm_mem_region_type type, bool protected)
 {
-	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, memslot, protected, false);
+	TEST_ASSERT(type < NR_MEM_REGIONS,
+		    "Invalid memory region type '%u'", type);
+
+	return ____vm_phy_pages_alloc(vm, nr_pages, min_gpa, vm->memslots[type],
+				      protected, false);
 }
 
 /*
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b988eea373ad..39d9ca6ceb1d 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1475,7 +1475,7 @@ void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
 			       smram_gpa, SMRAM_MEMSLOT, SMRAM_PAGES);
 
 	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, smram_gpa,
-				       SMRAM_MEMSLOT) == smram_gpa,
+				       MEM_REGION_TEST_EXTRA) == smram_gpa,
 		    "Could not allocate guest physical addresses for SMRAM");
 
 	memset(addr_gpa2hva(vm, smram_gpa), 0x0, SMRAM_SIZE);
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 9d21594e2f81..160bbe3d7203 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -124,7 +124,7 @@ static struct kvm_vm *spawn_vm(struct kvm_vcpu **vcpu, pthread_t *vcpu_thread,
 	 * Allocate and map two pages so that the GPA accessed by guest_code()
 	 * stays valid across the memslot move.
 	 */
-	gpa = vm_phy_pages_alloc(vm, 2, MEM_REGION_GPA, MEM_REGION_SLOT);
+	gpa = vm_phy_pages_alloc(vm, 2, MEM_REGION_GPA, MEM_REGION_TEST_EXTRA);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc\n");
 
 	virt_map(vm, MEM_REGION_GPA, MEM_REGION_GPA, 2);
diff --git a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
index b21798a385ca..4e125eb5e0cf 100644
--- a/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
+++ b/tools/testing/selftests/kvm/x86/smaller_maxphyaddr_emulation_test.c
@@ -67,7 +67,7 @@ int main(int argc, char *argv[])
 			       MEM_REGION_SIZE / PAGE_SIZE);
 
 	gpa = vm_phy_pages_alloc(vm, MEM_REGION_SIZE / PAGE_SIZE,
-				 MEM_REGION_GPA, MEM_REGION_SLOT);
+				 MEM_REGION_GPA, MEM_REGION_TEST_EXTRA);
 	TEST_ASSERT(gpa == MEM_REGION_GPA, "Failed vm_phy_pages_alloc");
 	virt_map(vm, MEM_REGION_GVA, MEM_REGION_GPA, 1);
 	hva = addr_gpa2hva(vm, MEM_REGION_GPA);
-- 
2.55.0.887.g758fc8c411-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
