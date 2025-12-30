Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA62EE57C8
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6R/AMVUmvNyHETQfr3GL6cQkXnHK8C1AsfWzTFpi1w=; b=PU6OgPT7Yh8Sy2
	mNdlmAqZ9gh7GjQ3GYEtMxTkyoIall3Jn1XE1DicF5O89cRWuMt59ANJKXpyHj4C1101CsnQk/5yG
	/2ZY7XkRkGLiud7kvMCn6FPNp6joKmJLLzkGXwUfWTfjBSDMg1IwKy0izWMjWY6qi8/loXS2SbILh
	4/BPIWHyVX6mhe73la7vohhlM3QfeiXXIikVon5LjAAhLs6fuQ33Kv4zCedSyD2bdlXjk6h404KOZ
	BRLWCpRsyQrQS9SswNucImLeJEuCuPuU5Zat52Yrx16DQH0o5oo5H1aAVBXBAMQKW+ryHoSzs7UGE
	T9KOT85pAmNXphoafiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijQ-00000005N2Q-3Aih;
	Tue, 30 Dec 2025 23:02:24 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaij0-00000005Mh2-3Z5H
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:12 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34ea5074935so9470869a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135717; x=1767740517; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yWDCaLTCIbcQO/h6zTAUUdpMSrBY0ICbFLNvpCPkE/c=;
        b=qAgECZaASOx9It2iCGhXq2CHGKvIevsVG2u+0iK82QorZ+DznVnh5+gEX/UK6LfsV6
         QruVuyGaC7VI4znaf8XfQJihAYOQzeVDR0iqW4CzOlnuVz6XA2V8ahkzT+0VeKXD0SaO
         ZtWPiMb1z2K5NAsv8fk+x/P1qqaDmm3MVLxz+eZsoHJiocmf8DH5ZzogiMK7v7ROHSaf
         Iy9FRtVjszelo4bINxVjaE0jhBgtqn4p2RLDtNBQPMTL0PLWFwps+lvLdmeJrV8kFEnt
         NJ68ZsClJ4AC6s5u0yjLwV3s1s6rvZ1ueq1VEyYQighcoeYqEe7+Ygm7KCG1yrsscOvo
         nR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135717; x=1767740517;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yWDCaLTCIbcQO/h6zTAUUdpMSrBY0ICbFLNvpCPkE/c=;
        b=WfxTcKWqiAB0hA0NvRUGyeIrZh8eG2TwqYpd8icm8HW0LOslTq623pd3k9p1nAmrMS
         esX+IsQUMEIV+HSi2qdl1LnGXDB9wq7yrdQthcX93BhnB4bBPIOBv/nhMcTn9srt2N9z
         NU2SQGIQ59JbZ2ha0EMrs+hSBfNoEVK4PQYFd/uSnI9IlFeiNx+2aQV1JT2jO68iDb6r
         9j0kabziohIZUDCm5hmhrD+2gCIB/v8bjh40bDGBOBF9mS83zfa5Nd028WPLTcRDiW46
         lpIU/1TvZE/ZPHWRutz7WnPtcjBRXCj+zF30pYXOWLVm4BqGzTdNePwbGULhjm8cMaWY
         cvvg==
X-Forwarded-Encrypted: i=1; AJvYcCWpjEsfIBW0wab+FK7MXDA5pv+6LuP7eNYk7/iaOFpsAv/bUk0bKNwcdot/mTZAMl3jQ7quXln73C0=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc1IQkbOmpmNC6regu1K8yuhZ8IwhQA7DR7Kl/fP5Ntc/6tqGE
	a7bRpIOg6DIygi8GEqm/HCGKeRZ7IolBOETPhZm3ctEZss/dbYv+rYm0D130Yg5k/eqx7GTbeK9
	zU4P6aQ==
X-Google-Smtp-Source: AGHT+IHV3rTLFIW3Ya/WfGECQ4NGCUq3VWcqeP/2rJnzAJYZRKybcHRTVRGE5PryLt5G6ChfGloqjW0LJ10=
X-Received: from pjbin23.prod.google.com ([2002:a17:90b:4397:b0:34c:f8b8:349b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3f83:b0:340:bb56:79de
 with SMTP id 98e67ed59e1d1-34e921ee80bmr29589802a91.30.1767135717583; Tue, 30
 Dec 2025 15:01:57 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:32 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-4-seanjc@google.com>
Subject: [PATCH v4 03/21] KVM: selftests: Rename nested TDP mapping functions
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
X-CRM114-CacheID: sfid-20251230_150158_885091_045166D9 
X-CRM114-Status: GOOD (  12.01  )
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

Rename the functions from nested_* to tdp_* to make their purpose
clearer.

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h | 16 +++---
 .../testing/selftests/kvm/lib/x86/memstress.c |  4 +-
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 50 +++++++++----------
 .../selftests/kvm/x86/vmx_dirty_log_test.c    |  6 +--
 4 files changed, 37 insertions(+), 39 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index 91916b8aa94b..04b8231d032a 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -559,14 +559,14 @@ bool load_vmcs(struct vmx_pages *vmx);
 
 bool ept_1g_pages_supported(void);
 
-void nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		   uint64_t nested_paddr, uint64_t paddr);
-void nested_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		 uint64_t nested_paddr, uint64_t paddr, uint64_t size);
-void nested_identity_map_default_memslots(struct vmx_pages *vmx,
-					  struct kvm_vm *vm);
-void nested_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
-			    uint64_t addr, uint64_t size);
+void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
+		uint64_t paddr);
+void tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
+	     uint64_t paddr, uint64_t size);
+void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
+				       struct kvm_vm *vm);
+void tdp_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
+			 uint64_t addr, uint64_t size);
 bool kvm_cpu_has_ept(void);
 void prepare_eptp(struct vmx_pages *vmx, struct kvm_vm *vm);
 void prepare_virtualize_apic_accesses(struct vmx_pages *vmx, struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/x86/memstress.c b/tools/testing/selftests/kvm/lib/x86/memstress.c
index 0b1f288ad556..1928b00bde51 100644
--- a/tools/testing/selftests/kvm/lib/x86/memstress.c
+++ b/tools/testing/selftests/kvm/lib/x86/memstress.c
@@ -70,11 +70,11 @@ void memstress_setup_ept(struct vmx_pages *vmx, struct kvm_vm *vm)
 	 * KVM can shadow the EPT12 with the maximum huge page size supported
 	 * by the backing source.
 	 */
-	nested_identity_map_1g(vmx, vm, 0, 0x100000000ULL);
+	tdp_identity_map_1g(vmx, vm, 0, 0x100000000ULL);
 
 	start = align_down(memstress_args.gpa, PG_SIZE_1G);
 	end = align_up(memstress_args.gpa + memstress_args.size, PG_SIZE_1G);
-	nested_identity_map_1g(vmx, vm, start, end - start);
+	tdp_identity_map_1g(vmx, vm, start, end - start);
 }
 
 void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vcpus[])
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index eec33ec63811..1954ccdfc353 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -362,12 +362,12 @@ void prepare_vmcs(struct vmx_pages *vmx, void *guest_rip, void *guest_rsp)
 	init_vmcs_guest_state(guest_rip, guest_rsp);
 }
 
-static void nested_create_pte(struct kvm_vm *vm,
-			      struct eptPageTableEntry *pte,
-			      uint64_t nested_paddr,
-			      uint64_t paddr,
-			      int current_level,
-			      int target_level)
+static void tdp_create_pte(struct kvm_vm *vm,
+			   struct eptPageTableEntry *pte,
+			   uint64_t nested_paddr,
+			   uint64_t paddr,
+			   int current_level,
+			   int target_level)
 {
 	if (!pte->readable) {
 		pte->writable = true;
@@ -394,8 +394,8 @@ static void nested_create_pte(struct kvm_vm *vm,
 }
 
 
-void __nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		     uint64_t nested_paddr, uint64_t paddr, int target_level)
+void __tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
+		  uint64_t nested_paddr, uint64_t paddr, int target_level)
 {
 	const uint64_t page_size = PG_LEVEL_SIZE(target_level);
 	struct eptPageTableEntry *pt = vmx->eptp_hva, *pte;
@@ -428,7 +428,7 @@ void __nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 		index = (nested_paddr >> PG_LEVEL_SHIFT(level)) & 0x1ffu;
 		pte = &pt[index];
 
-		nested_create_pte(vm, pte, nested_paddr, paddr, level, target_level);
+		tdp_create_pte(vm, pte, nested_paddr, paddr, level, target_level);
 
 		if (pte->page_size)
 			break;
@@ -445,10 +445,10 @@ void __nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 
 }
 
-void nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		   uint64_t nested_paddr, uint64_t paddr)
+void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
+		uint64_t nested_paddr, uint64_t paddr)
 {
-	__nested_pg_map(vmx, vm, nested_paddr, paddr, PG_LEVEL_4K);
+	__tdp_pg_map(vmx, vm, nested_paddr, paddr, PG_LEVEL_4K);
 }
 
 /*
@@ -468,8 +468,8 @@ void nested_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm,
  * Within the VM given by vm, creates a nested guest translation for the
  * page range starting at nested_paddr to the page range starting at paddr.
  */
-void __nested_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		  uint64_t nested_paddr, uint64_t paddr, uint64_t size,
+void __tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm,
+	       uint64_t nested_paddr, uint64_t paddr, uint64_t size,
 		  int level)
 {
 	size_t page_size = PG_LEVEL_SIZE(level);
@@ -479,23 +479,23 @@ void __nested_map(struct vmx_pages *vmx, struct kvm_vm *vm,
 	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
 
 	while (npages--) {
-		__nested_pg_map(vmx, vm, nested_paddr, paddr, level);
+		__tdp_pg_map(vmx, vm, nested_paddr, paddr, level);
 		nested_paddr += page_size;
 		paddr += page_size;
 	}
 }
 
-void nested_map(struct vmx_pages *vmx, struct kvm_vm *vm,
-		uint64_t nested_paddr, uint64_t paddr, uint64_t size)
+void tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm,
+	     uint64_t nested_paddr, uint64_t paddr, uint64_t size)
 {
-	__nested_map(vmx, vm, nested_paddr, paddr, size, PG_LEVEL_4K);
+	__tdp_map(vmx, vm, nested_paddr, paddr, size, PG_LEVEL_4K);
 }
 
 /* Prepare an identity extended page table that maps all the
  * physical pages in VM.
  */
-void nested_identity_map_default_memslots(struct vmx_pages *vmx,
-					  struct kvm_vm *vm)
+void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
+				       struct kvm_vm *vm)
 {
 	uint32_t s, memslot = 0;
 	sparsebit_idx_t i, last;
@@ -512,18 +512,16 @@ void nested_identity_map_default_memslots(struct vmx_pages *vmx,
 		if (i > last)
 			break;
 
-		nested_map(vmx, vm,
-			   (uint64_t)i << vm->page_shift,
-			   (uint64_t)i << vm->page_shift,
-			   1 << vm->page_shift);
+		tdp_map(vmx, vm, (uint64_t)i << vm->page_shift,
+			(uint64_t)i << vm->page_shift, 1 << vm->page_shift);
 	}
 }
 
 /* Identity map a region with 1GiB Pages. */
-void nested_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
+void tdp_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
 			    uint64_t addr, uint64_t size)
 {
-	__nested_map(vmx, vm, addr, addr, size, PG_LEVEL_1G);
+	__tdp_map(vmx, vm, addr, addr, size, PG_LEVEL_1G);
 }
 
 bool kvm_cpu_has_ept(void)
diff --git a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
index aab7333aaef0..e7d0c08ba29d 100644
--- a/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
+++ b/tools/testing/selftests/kvm/x86/vmx_dirty_log_test.c
@@ -121,9 +121,9 @@ static void test_vmx_dirty_log(bool enable_ept)
 	 */
 	if (enable_ept) {
 		prepare_eptp(vmx, vm);
-		nested_identity_map_default_memslots(vmx, vm);
-		nested_map(vmx, vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
-		nested_map(vmx, vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
+		tdp_identity_map_default_memslots(vmx, vm);
+		tdp_map(vmx, vm, NESTED_TEST_MEM1, GUEST_TEST_MEM, PAGE_SIZE);
+		tdp_map(vmx, vm, NESTED_TEST_MEM2, GUEST_TEST_MEM, PAGE_SIZE);
 	}
 
 	bmap = bitmap_zalloc(TEST_MEM_PAGES);
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
