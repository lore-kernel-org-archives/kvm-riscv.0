Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23513EE57C2
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYh0bL5foGHegNcjOCAJ+kbMYBfJuEuFoxuecd1uweM=; b=T6TI++JIpstcAK
	ckHqYOTFQ2xrqMfoG3euwx6L5/6meFZIX1XG1QXdCr9PLmBHaYg4jbujsBHcFvydMNecVRKXAWlEz
	vCZWYsv/m22cYT4Ll2Y1zFj9wag5KGJjCbP3SJEj9DK7nXsQ5Z/O4S6J4Y54etgz2bHTHdYvTD/qC
	P5kwbreNxT8Jr04hUl6LuwJpoNrGF/gCgQrECBElrJWK0UrU4RedFKeJtEoOXG9nR3uuwcdcoOSnZ
	LASPCxpd9AaGh6D9j3Y6XLO2jIDNLlLG9JpFoZXgtkVpcB6p5hUJQk0zuf3KuXQec6gzLow+GUBh7
	G211oK7N4X49TwXFwALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaikW-00000005OMS-3sts;
	Tue, 30 Dec 2025 23:03:33 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijI-00000005Ms6-3H2i
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:21 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-bbcf3bd4c8fso6220311a12.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135735; x=1767740535; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A7fpsi0DvuznhTE1Zn3HtOIUiJjnW+9EfXyg1RrLtBE=;
        b=jrT2M0f8V4OAzum1cogFXtu9Pc7L4dc7z/eo0rxtRMWxAgRSDh1CmmfXOEEzTXIgBi
         1Wc33VC+3xdhdQV52/Hu+4/DvcHJdGuAfgSgH9lMBwrgdRYE9bkCDCBu34sSIzYP+BvN
         nh7wLm8tNys04oNUNV6b4fpwHnqJKHH9DJVaXV4CafHBrXoytkN1LnOaHVtguF81HmlE
         li6BqP6kUdtUmq9ZVWw4pkaswSjJ8yXo7Tgatn3zUUaqdTUw+eB3m8zOaGvaBCDhJXtv
         g1r9b9Szh619hnB+1i8AL7Ihpv41GhwCXtozMchrbuANZY1R6jqRLv+/p3MdmFWRCWgO
         qbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135735; x=1767740535;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7fpsi0DvuznhTE1Zn3HtOIUiJjnW+9EfXyg1RrLtBE=;
        b=kueWt9LBzeUxssBJhmuS6xR9kPz5/P6KrvgAjfHovtacrr8K1YfsYU75vN6giDp0+x
         wBObWxb1E+A6O5ex0GsqraoMJNFzty8+EiQCq2wWgM/wah8zW/fBCnsM86IRLglE3QY0
         9EhpfbrU804yHQM+V25cJulCxc/6GlojmQlawkjw/9NmDKDnW2jgsV0lPlHGSJbi326F
         R8qs806sD/bv1dXNTG4kZh64HLDg9MFeolZJ3tZXGKvBJC9OlJZF5sfqChArskF72x+B
         AfSCHPU60cXkH6ha+kn4I4cGyY0L+rR6vJJlGYhdhXaJijh9V77TvDml09wHwY9w6KKs
         Cm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsQPIuc9r+qfin+dobynGUFpKUu7PV5VffqcCj+Jj/4ddHspPshA91N2dj1I8N/GgEvP7kJZSeAZA=@lists.infradead.org
X-Gm-Message-State: AOJu0YztAbp8vtzsfaDYw1x4u/4zdmxjmR7sHL8SaDAL+1lsuWtkILFp
	iTSnrO9ZsvKLZX1G9dFRZdNsZsqXfDZsNkoaikF1cU8WNcDgQ0HwIRAzBrE4r9XEF+igBSpej60
	K79E/UQ==
X-Google-Smtp-Source: AGHT+IEDv3PqfDUF2AaKu2cqsZdRy1TYjAx9BPIyTm2+oOAnKpWrJ3J7Os+kj78BhbIr6Dp0qwwHYlrIeMQ=
X-Received: from pfbem48.prod.google.com ([2002:a05:6a00:3770:b0:7f9:3450:d9b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:9309:0:b0:7e8:3fcb:bc41
 with SMTP id d2e1a72fcca58-7ff547df601mr29528623b3a.22.1767135735167; Tue, 30
 Dec 2025 15:02:15 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:42 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-14-seanjc@google.com>
Subject: [PATCH v4 13/21] KVM: selftests: Reuse virt mapping functions for
 nested EPTs
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
X-CRM114-CacheID: sfid-20251230_150216_883077_7162253D 
X-CRM114-Status: GOOD (  22.78  )
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

Rework tdp_map() and friends to use __virt_pg_map() and drop the custom
EPT code in __tdp_pg_map() and tdp_create_pte().  The EPT code and
__virt_pg_map() are practically identical, the main differences are:
  - EPT uses the EPT struct overlay instead of the PTE masks.
  - EPT always assumes 4-level EPTs.

To reuse __virt_pg_map(), extend the PTE masks to work with EPT's RWX and
X-only capabilities, and provide a tdp_mmu_init() API so that EPT can pass
in the EPT PTE masks along with the root page level (which is currently
hardcoded to '4').

Don't reuse KVM's insane overloading of the USER bit for EPT_R as there's
no reason to multiplex bits in the selftests, e.g. selftests aren't trying
to shadow guest PTEs and thus don't care about funnelling protections into
a common permissions check.

Another benefit of reusing the code is having separate handling for
upper-level PTEs vs 4K PTEs, which avoids some quirks like setting the
large bit on a 4K PTE in the EPTs.

For all intents and purposes, no functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86/kvm_util_arch.h |   4 +-
 .../selftests/kvm/include/x86/processor.h     |  16 ++-
 .../testing/selftests/kvm/lib/x86/processor.c |  21 +++-
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 119 +++---------------
 4 files changed, 52 insertions(+), 108 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
index 05a1fc1780f2..1cf84b8212c6 100644
--- a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
@@ -14,6 +14,8 @@ struct pte_masks {
 	uint64_t present;
 	uint64_t writable;
 	uint64_t user;
+	uint64_t readable;
+	uint64_t executable;
 	uint64_t accessed;
 	uint64_t dirty;
 	uint64_t huge;
@@ -37,8 +39,6 @@ struct kvm_vm_arch {
 	uint64_t s_bit;
 	int sev_fd;
 	bool is_pt_protected;
-
-	struct kvm_mmu *tdp_mmu;
 };
 
 static inline bool __vm_arch_has_protected_memory(struct kvm_vm_arch *arch)
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 973f2069cd3b..4c0d2fc83c1c 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1442,6 +1442,8 @@ enum pg_level {
 #define PTE_PRESENT_MASK(mmu)		((mmu)->arch.pte_masks.present)
 #define PTE_WRITABLE_MASK(mmu)		((mmu)->arch.pte_masks.writable)
 #define PTE_USER_MASK(mmu)		((mmu)->arch.pte_masks.user)
+#define PTE_READABLE_MASK(mmu)		((mmu)->arch.pte_masks.readable)
+#define PTE_EXECUTABLE_MASK(mmu)	((mmu)->arch.pte_masks.executable)
 #define PTE_ACCESSED_MASK(mmu)		((mmu)->arch.pte_masks.accessed)
 #define PTE_DIRTY_MASK(mmu)		((mmu)->arch.pte_masks.dirty)
 #define PTE_HUGE_MASK(mmu)		((mmu)->arch.pte_masks.huge)
@@ -1449,13 +1451,23 @@ enum pg_level {
 #define PTE_C_BIT_MASK(mmu)		((mmu)->arch.pte_masks.c)
 #define PTE_S_BIT_MASK(mmu)		((mmu)->arch.pte_masks.s)
 
-#define is_present_pte(mmu, pte)	(!!(*(pte) & PTE_PRESENT_MASK(mmu)))
+/*
+ * For PTEs without a PRESENT bit (i.e. EPT entries), treat the PTE as present
+ * if it's executable or readable, as EPT supports execute-only PTEs, but not
+ * write-only PTEs.
+ */
+#define is_present_pte(mmu, pte)		\
+	(PTE_PRESENT_MASK(mmu) ?		\
+	 !!(*(pte) & PTE_PRESENT_MASK(mmu)) :	\
+	 !!(*(pte) & (PTE_READABLE_MASK(mmu) | PTE_EXECUTABLE_MASK(mmu))))
+#define is_executable_pte(mmu, pte)	\
+	((*(pte) & (PTE_EXECUTABLE_MASK(mmu) | PTE_NX_MASK(mmu))) == PTE_EXECUTABLE_MASK(mmu))
 #define is_writable_pte(mmu, pte)	(!!(*(pte) & PTE_WRITABLE_MASK(mmu)))
 #define is_user_pte(mmu, pte)		(!!(*(pte) & PTE_USER_MASK(mmu)))
 #define is_accessed_pte(mmu, pte)	(!!(*(pte) & PTE_ACCESSED_MASK(mmu)))
 #define is_dirty_pte(mmu, pte)		(!!(*(pte) & PTE_DIRTY_MASK(mmu)))
 #define is_huge_pte(mmu, pte)		(!!(*(pte) & PTE_HUGE_MASK(mmu)))
-#define is_nx_pte(mmu, pte)		(!!(*(pte) & PTE_NX_MASK(mmu)))
+#define is_nx_pte(mmu, pte)		(!is_executable_pte(mmu, pte))
 
 void tdp_mmu_init(struct kvm_vm *vm, int pgtable_levels,
 		  struct pte_masks *pte_masks);
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 8a9298a72897..41316cac94e0 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -165,6 +165,10 @@ static void virt_mmu_init(struct kvm_vm *vm, struct kvm_mmu *mmu,
 		mmu->pgd_created = true;
 		mmu->arch.pte_masks = *pte_masks;
 	}
+
+	TEST_ASSERT(mmu->pgtable_levels == 4 || mmu->pgtable_levels == 5,
+		    "Selftests MMU only supports 4-level and 5-level paging, not %u-level paging",
+		    mmu->pgtable_levels);
 }
 
 void virt_arch_pgd_alloc(struct kvm_vm *vm)
@@ -180,6 +184,7 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 		.dirty		=	BIT_ULL(6),
 		.huge		=	BIT_ULL(7),
 		.nx		=	BIT_ULL(63),
+		.executable	=	0,
 		.c		=	vm->arch.c_bit,
 		.s		=	vm->arch.s_bit,
 	};
@@ -190,10 +195,10 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 void tdp_mmu_init(struct kvm_vm *vm, int pgtable_levels,
 		  struct pte_masks *pte_masks)
 {
-	TEST_ASSERT(!vm->arch.tdp_mmu, "TDP MMU already initialized");
+	TEST_ASSERT(!vm->stage2_mmu.pgtable_levels, "TDP MMU already initialized");
 
-	vm->arch.tdp_mmu = calloc(1, sizeof(*vm->arch.tdp_mmu));
-	virt_mmu_init(vm, vm->arch.tdp_mmu, pte_masks);
+	vm->stage2_mmu.pgtable_levels = pgtable_levels;
+	virt_mmu_init(vm, &vm->stage2_mmu, pte_masks);
 }
 
 static void *virt_get_pte(struct kvm_vm *vm, struct kvm_mmu *mmu,
@@ -223,7 +228,8 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 	paddr = vm_untag_gpa(vm, paddr);
 
 	if (!is_present_pte(mmu, pte)) {
-		*pte = PTE_PRESENT_MASK(mmu) | PTE_WRITABLE_MASK(mmu);
+		*pte = PTE_PRESENT_MASK(mmu) | PTE_READABLE_MASK(mmu) |
+		       PTE_WRITABLE_MASK(mmu) | PTE_EXECUTABLE_MASK(mmu);
 		if (current_level == target_level)
 			*pte |= PTE_HUGE_MASK(mmu) | (paddr & PHYSICAL_PAGE_MASK);
 		else
@@ -269,6 +275,9 @@ void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 	TEST_ASSERT(vm_untag_gpa(vm, paddr) == paddr,
 		    "Unexpected bits in paddr: %lx", paddr);
 
+	TEST_ASSERT(!PTE_EXECUTABLE_MASK(mmu) || !PTE_NX_MASK(mmu),
+		    "X and NX bit masks cannot be used simultaneously");
+
 	/*
 	 * Allocate upper level page tables, if not already present.  Return
 	 * early if a hugepage was created.
@@ -286,7 +295,9 @@ void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 	pte = virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
 	TEST_ASSERT(!is_present_pte(mmu, pte),
 		    "PTE already present for 4k page at vaddr: 0x%lx", vaddr);
-	*pte = PTE_PRESENT_MASK(mmu) | PTE_WRITABLE_MASK(mmu) | (paddr & PHYSICAL_PAGE_MASK);
+	*pte = PTE_PRESENT_MASK(mmu) | PTE_READABLE_MASK(mmu) |
+	       PTE_WRITABLE_MASK(mmu) | PTE_EXECUTABLE_MASK(mmu) |
+	       (paddr & PHYSICAL_PAGE_MASK);
 
 	/*
 	 * Neither SEV nor TDX supports shared page tables, so only the final
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index ea1c09f9e8ab..e3737b3d9120 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -25,21 +25,6 @@ bool enable_evmcs;
 struct hv_enlightened_vmcs *current_evmcs;
 struct hv_vp_assist_page *current_vp_assist;
 
-struct eptPageTableEntry {
-	uint64_t readable:1;
-	uint64_t writable:1;
-	uint64_t executable:1;
-	uint64_t memory_type:3;
-	uint64_t ignore_pat:1;
-	uint64_t page_size:1;
-	uint64_t accessed:1;
-	uint64_t dirty:1;
-	uint64_t ignored_11_10:2;
-	uint64_t address:40;
-	uint64_t ignored_62_52:11;
-	uint64_t suppress_ve:1;
-};
-
 int vcpu_enable_evmcs(struct kvm_vcpu *vcpu)
 {
 	uint16_t evmcs_ver;
@@ -58,13 +43,24 @@ int vcpu_enable_evmcs(struct kvm_vcpu *vcpu)
 
 void vm_enable_ept(struct kvm_vm *vm)
 {
+	struct pte_masks pte_masks;
+
 	TEST_ASSERT(kvm_cpu_has_ept(), "KVM doesn't support nested EPT");
-	if (vm->arch.tdp_mmu)
-		return;
-
-	/* TODO: Drop eptPageTableEntry in favor of PTE masks. */
-	struct pte_masks pte_masks = (struct pte_masks) {
 
+	/*
+	 * EPTs do not have 'present' or 'user' bits, instead bit 0 is the
+	 * 'readable' bit.
+	 */
+	pte_masks = (struct pte_masks) {
+		.present	=	0,
+		.user		=	0,
+		.readable	=	BIT_ULL(0),
+		.writable	=	BIT_ULL(1),
+		.executable	=	BIT_ULL(2),
+		.huge		=	BIT_ULL(7),
+		.accessed	=	BIT_ULL(8),
+		.dirty		=	BIT_ULL(9),
+		.nx		=	0,
 	};
 
 	/* TODO: Add support for 5-level EPT. */
@@ -120,8 +116,8 @@ vcpu_alloc_vmx(struct kvm_vm *vm, vm_vaddr_t *p_vmx_gva)
 	vmx->vmwrite_gpa = addr_gva2gpa(vm, (uintptr_t)vmx->vmwrite);
 	memset(vmx->vmwrite_hva, 0, getpagesize());
 
-	if (vm->arch.tdp_mmu)
-		vmx->eptp_gpa = vm->arch.tdp_mmu->pgd;
+	if (vm->stage2_mmu.pgd_created)
+		vmx->eptp_gpa = vm->stage2_mmu.pgd;
 
 	*p_vmx_gva = vmx_gva;
 	return vmx;
@@ -377,82 +373,6 @@ void prepare_vmcs(struct vmx_pages *vmx, void *guest_rip, void *guest_rsp)
 	init_vmcs_guest_state(guest_rip, guest_rsp);
 }
 
-static void tdp_create_pte(struct kvm_vm *vm,
-			   struct eptPageTableEntry *pte,
-			   uint64_t nested_paddr,
-			   uint64_t paddr,
-			   int current_level,
-			   int target_level)
-{
-	if (!pte->readable) {
-		pte->writable = true;
-		pte->readable = true;
-		pte->executable = true;
-		pte->page_size = (current_level == target_level);
-		if (pte->page_size)
-			pte->address = paddr >> vm->page_shift;
-		else
-			pte->address = vm_alloc_page_table(vm) >> vm->page_shift;
-	} else {
-		/*
-		 * Entry already present.  Assert that the caller doesn't want
-		 * a hugepage at this level, and that there isn't a hugepage at
-		 * this level.
-		 */
-		TEST_ASSERT(current_level != target_level,
-			    "Cannot create hugepage at level: %u, nested_paddr: 0x%lx",
-			    current_level, nested_paddr);
-		TEST_ASSERT(!pte->page_size,
-			    "Cannot create page table at level: %u, nested_paddr: 0x%lx",
-			    current_level, nested_paddr);
-	}
-}
-
-
-void __tdp_pg_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
-		  int target_level)
-{
-	const uint64_t page_size = PG_LEVEL_SIZE(target_level);
-	void *eptp_hva = addr_gpa2hva(vm, vm->arch.tdp_mmu->pgd);
-	struct eptPageTableEntry *pt = eptp_hva, *pte;
-	uint16_t index;
-
-	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
-		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
-
-	TEST_ASSERT((nested_paddr >> 48) == 0,
-		    "Nested physical address 0x%lx is > 48-bits and requires 5-level EPT",
-		    nested_paddr);
-	TEST_ASSERT((nested_paddr % page_size) == 0,
-		    "Nested physical address not on page boundary,\n"
-		    "  nested_paddr: 0x%lx page_size: 0x%lx",
-		    nested_paddr, page_size);
-	TEST_ASSERT((nested_paddr >> vm->page_shift) <= vm->max_gfn,
-		    "Physical address beyond beyond maximum supported,\n"
-		    "  nested_paddr: 0x%lx vm->max_gfn: 0x%lx vm->page_size: 0x%x",
-		    paddr, vm->max_gfn, vm->page_size);
-	TEST_ASSERT((paddr % page_size) == 0,
-		    "Physical address not on page boundary,\n"
-		    "  paddr: 0x%lx page_size: 0x%lx",
-		    paddr, page_size);
-	TEST_ASSERT((paddr >> vm->page_shift) <= vm->max_gfn,
-		    "Physical address beyond beyond maximum supported,\n"
-		    "  paddr: 0x%lx vm->max_gfn: 0x%lx vm->page_size: 0x%x",
-		    paddr, vm->max_gfn, vm->page_size);
-
-	for (int level = PG_LEVEL_512G; level >= PG_LEVEL_4K; level--) {
-		index = (nested_paddr >> PG_LEVEL_SHIFT(level)) & 0x1ffu;
-		pte = &pt[index];
-
-		tdp_create_pte(vm, pte, nested_paddr, paddr, level, target_level);
-
-		if (pte->page_size)
-			break;
-
-		pt = addr_gpa2hva(vm, pte->address * vm->page_size);
-	}
-}
-
 /*
  * Map a range of EPT guest physical addresses to the VM's physical address
  *
@@ -473,6 +393,7 @@ void __tdp_pg_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
 void __tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
 	       uint64_t size, int level)
 {
+	struct kvm_mmu *mmu = &vm->stage2_mmu;
 	size_t page_size = PG_LEVEL_SIZE(level);
 	size_t npages = size / page_size;
 
@@ -480,7 +401,7 @@ void __tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr,
 	TEST_ASSERT(paddr + size > paddr, "Paddr overflow");
 
 	while (npages--) {
-		__tdp_pg_map(vm, nested_paddr, paddr, level);
+		__virt_pg_map(vm, mmu, nested_paddr, paddr, level);
 		nested_paddr += page_size;
 		paddr += page_size;
 	}
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
