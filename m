Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE71AEE57C6
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 23:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KF2XY+Dx6W5d54VUa2h82YPfGNKfZ3kNyIB1QaQ48Zg=; b=ImaAkFPbdJuivO
	ANHKeTtig1HrF8lKBMKCTikfEgHaCk9LQA5R6Y61i427wtGAvSyWMqW55ujSonlokbCUY64lWMlIV
	XG4AU2lamMxCdZIBO5274wjdJO/F1ce0V99jI75vjC45l25V+1obXw7eDh0098yjrrs4rmamTYbbz
	vGXrCK7KS3HbK4oqlp6KR5DkiaewWKN6Cy1Stqp+0pEEKlck16QxYYyQKgSRDAgfS2XrwehrrVBV+
	q7x7IiADw+OZuDY9fZHYJyZibFMOzDqjJljdxtN74wdiz1c9V9OLDAO2Y3WUvCHAx9uhkTQIkt9DY
	z5VAs9/imNuboyj5R46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijo-00000005NXK-3xB3;
	Tue, 30 Dec 2025 23:02:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijG-00000005MpY-3OzR
	for kvm-riscv@bombadil.infradead.org;
	Tue, 30 Dec 2025 23:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rp9dO+QiHStaM2noTobEg1WWV0+ff87sBjqkUH1s1So=; b=aa0Aphi5PGusg+latMRuwDcXQg
	0/7ofV9SWpVGI2U2NlahJGmvffQkXayYK3UwRmA9z+A33Y+++tNKGbUHnrWSmDHTXD/Ei6iy3FdeA
	0Yhu6rKrgNMfmNp5dsznrYoAvgWdRqcs/RrXI4Yq0gTKBpNx7MseHIzpRDwDS2MUaUqk3nhl82Fkk
	FhB+160FSBLliXzSzkXD9c+1PbnZB3AAzQ3eNZDh6+XjImcb0qNuLCBmG9s+nVaOHwzXcEhMox4OM
	9tjGfiTO8guC5Pu9sNZ+9u6G2FdxYy0PqyNqoGogFob8TnguRzRWVj7iTuem9Ucdn+iEawT6bLlxY
	4SzWYNzA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaijC-00000004C1p-2Sea
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 23:02:13 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so22827218a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Dec 2025 15:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767135729; x=1767740529; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rp9dO+QiHStaM2noTobEg1WWV0+ff87sBjqkUH1s1So=;
        b=2Nx3tepyX0fFem8yDMGFNSq8q/DhVYCcXQvdxg6qvMcsf9CUSn7WNSM5Zil/FvOpPX
         73pQgSrNAsxYsifXfsOElu70XWVe5fbhpDIJh+9VIjiop6+dVfjhYW8A55FPhtVQRM7R
         gcqljz1tr39fD0Mfni6qyZmZb7vKXoyBQNAIuVaORoqJUYlL0P1VTIsrAMffOFGZVqL/
         /Y84sjdLjzVqm9hY3mUS0/QK6tkgI9BQz8WBZJxE/EbYaNONbQaOOPPzLjX/l+GuigCx
         voeFA/Kzt3Mdj4EhukyQJBWHNof3Zr5S2gRrE1HCzBlAKkwTC4ZceQZZ8NY7S4V5YHaE
         4RkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767135729; x=1767740529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rp9dO+QiHStaM2noTobEg1WWV0+ff87sBjqkUH1s1So=;
        b=Pi0egKTIIhn2tYPTtiqeUnKl5ypxEoJm0o6Fh0fMv5Z1Tz8SZsoSuX9bIMT7DtMau8
         MND5RIPJ8GdN6wBVnmViHtW40JDJOy2YkPYjp9rGyxW255l3rVQNphFdp1oREmQI4mBw
         Z+/zV9aIO7EOZIgzuZ7ObiqYqaC5cOgisgbw3jFoqBW+XmfKlOAd+Y54TKXXj7C49HUR
         iQTyrL/O5kTUtzw/CeGf1D47UXJmRQPM1pUG5hy8b7/2HJgurimQfyXSRgbHID//2c6F
         ReOq8/UUtu19RNEf3WXm3grbYbk8xQtIqbWQLuFZFKvxvmiwtf2YkOaEcwwgmSKThhQ3
         eRfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3fDfOmaRo2l3di3Z1bxRTSS5d8W4+1CwqRfmLwDdBwasvjYjMDAZ74wLfi8B7fj4dHx+en3sQIbM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Bo05CoVjhV5bLKcwNmJ6aMzmc8LfbLurNhmppzzJq3zq94RJ
	J2A7eiZJadlBBnZi/r5dAF20GNGXYtMjUIJGtopxSB1O4ma1ggvgLjr3oRK33FE3VEc1nWe+BZJ
	xmSglKg==
X-Google-Smtp-Source: AGHT+IHXiVGp+aLiRnfsWKk0NFKmgA3+F+MNTAgUXfHua357amgtXMsohsm9V2nYhNe7Fz2ha8uNgJNsSiU=
X-Received: from pjbci19.prod.google.com ([2002:a17:90a:fc93:b0:34a:c039:1428])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:524b:b0:32d:f352:f764
 with SMTP id 98e67ed59e1d1-34e9212a45cmr24810424a91.2.1767135728615; Tue, 30
 Dec 2025 15:02:08 -0800 (PST)
Date: Tue, 30 Dec 2025 15:01:38 -0800
In-Reply-To: <20251230230150.4150236-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251230230150.4150236-10-seanjc@google.com>
Subject: [PATCH v4 09/21] KVM: selftests: Move PTE bitmasks to kvm_mmu
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
X-CRM114-CacheID: sfid-20251230_230211_063779_AD450700 
X-CRM114-Status: GOOD (  16.93  )
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

Move the PTE bitmasks into kvm_mmu to parameterize them for virt mapping
functions. Introduce helpers to read/write different PTE bits given a
kvm_mmu.

Drop the 'global' bit definition as it's currently unused, but leave the
'user' bit as it will be used in coming changes. Opportunisitcally
rename 'large' to 'huge' as it's more consistent with the kernel naming.

Leave PHYSICAL_PAGE_MASK alone, it's fixed in all page table formats and
a lot of other macros depend on it. It's tempting to move all the other
macros to be per-struct instead, but it would be too much noise for
little benefit.

Keep c_bit and s_bit in vm->arch as they used before the MMU is
initialized, through  __vmcreate() -> vm_userspace_mem_region_add() ->
vm_mem_add() -> vm_arch_has_protected_memory().

No functional change intended.

Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
[sean: rename accessors to is_<adjective>_pte()]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86/kvm_util_arch.h | 16 ++++-
 .../selftests/kvm/include/x86/processor.h     | 28 +++++---
 .../testing/selftests/kvm/lib/x86/processor.c | 71 +++++++++++--------
 3 files changed, 76 insertions(+), 39 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
index 456e5ca170df..bad381d63b6a 100644
--- a/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86/kvm_util_arch.h
@@ -10,7 +10,21 @@
 
 extern bool is_forced_emulation_enabled;
 
-struct kvm_mmu_arch {};
+struct pte_masks {
+	uint64_t present;
+	uint64_t writable;
+	uint64_t user;
+	uint64_t accessed;
+	uint64_t dirty;
+	uint64_t huge;
+	uint64_t nx;
+	uint64_t c;
+	uint64_t s;
+};
+
+struct kvm_mmu_arch {
+	struct pte_masks pte_masks;
+};
 
 struct kvm_vm_arch {
 	vm_vaddr_t gdt;
diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index cbac9de29074..b2084434dd8b 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -362,16 +362,6 @@ static inline unsigned int x86_model(unsigned int eax)
 	return ((eax >> 12) & 0xf0) | ((eax >> 4) & 0x0f);
 }
 
-/* Page table bitfield declarations */
-#define PTE_PRESENT_MASK        BIT_ULL(0)
-#define PTE_WRITABLE_MASK       BIT_ULL(1)
-#define PTE_USER_MASK           BIT_ULL(2)
-#define PTE_ACCESSED_MASK       BIT_ULL(5)
-#define PTE_DIRTY_MASK          BIT_ULL(6)
-#define PTE_LARGE_MASK          BIT_ULL(7)
-#define PTE_GLOBAL_MASK         BIT_ULL(8)
-#define PTE_NX_MASK             BIT_ULL(63)
-
 #define PHYSICAL_PAGE_MASK      GENMASK_ULL(51, 12)
 
 #define PAGE_SHIFT		12
@@ -1449,6 +1439,24 @@ enum pg_level {
 #define PG_SIZE_2M PG_LEVEL_SIZE(PG_LEVEL_2M)
 #define PG_SIZE_1G PG_LEVEL_SIZE(PG_LEVEL_1G)
 
+#define PTE_PRESENT_MASK(mmu)		((mmu)->arch.pte_masks.present)
+#define PTE_WRITABLE_MASK(mmu)		((mmu)->arch.pte_masks.writable)
+#define PTE_USER_MASK(mmu)		((mmu)->arch.pte_masks.user)
+#define PTE_ACCESSED_MASK(mmu)		((mmu)->arch.pte_masks.accessed)
+#define PTE_DIRTY_MASK(mmu)		((mmu)->arch.pte_masks.dirty)
+#define PTE_HUGE_MASK(mmu)		((mmu)->arch.pte_masks.huge)
+#define PTE_NX_MASK(mmu)		((mmu)->arch.pte_masks.nx)
+#define PTE_C_BIT_MASK(mmu)		((mmu)->arch.pte_masks.c)
+#define PTE_S_BIT_MASK(mmu)		((mmu)->arch.pte_masks.s)
+
+#define is_present_pte(mmu, pte)	(!!(*(pte) & PTE_PRESENT_MASK(mmu)))
+#define is_writable_pte(mmu, pte)	(!!(*(pte) & PTE_WRITABLE_MASK(mmu)))
+#define is_user_pte(mmu, pte)		(!!(*(pte) & PTE_USER_MASK(mmu)))
+#define is_accessed_pte(mmu, pte)	(!!(*(pte) & PTE_ACCESSED_MASK(mmu)))
+#define is_dirty_pte(mmu, pte)		(!!(*(pte) & PTE_DIRTY_MASK(mmu)))
+#define is_huge_pte(mmu, pte)		(!!(*(pte) & PTE_HUGE_MASK(mmu)))
+#define is_nx_pte(mmu, pte)		(!!(*(pte) & PTE_NX_MASK(mmu)))
+
 void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 		   uint64_t paddr,  int level);
 void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index f25742a804b0..3800f4ff6770 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -156,12 +156,14 @@ bool kvm_is_tdp_enabled(void)
 		return get_kvm_amd_param_bool("npt");
 }
 
-static void virt_mmu_init(struct kvm_vm *vm, struct kvm_mmu *mmu)
+static void virt_mmu_init(struct kvm_vm *vm, struct kvm_mmu *mmu,
+			  struct pte_masks *pte_masks)
 {
 	/* If needed, create the top-level page table. */
 	if (!mmu->pgd_created) {
 		mmu->pgd = vm_alloc_page_table(vm);
 		mmu->pgd_created = true;
+		mmu->arch.pte_masks = *pte_masks;
 	}
 }
 
@@ -170,7 +172,19 @@ void virt_arch_pgd_alloc(struct kvm_vm *vm)
 	TEST_ASSERT(vm->mode == VM_MODE_PXXVYY_4K,
 		    "Unknown or unsupported guest mode: 0x%x", vm->mode);
 
-	virt_mmu_init(vm, &vm->mmu);
+	struct pte_masks pte_masks = (struct pte_masks){
+		.present	=	BIT_ULL(0),
+		.writable	=	BIT_ULL(1),
+		.user		=	BIT_ULL(2),
+		.accessed	=	BIT_ULL(5),
+		.dirty		=	BIT_ULL(6),
+		.huge		=	BIT_ULL(7),
+		.nx		=	BIT_ULL(63),
+		.c		=	vm->arch.c_bit,
+		.s		=	vm->arch.s_bit,
+	};
+
+	virt_mmu_init(vm, &vm->mmu, &pte_masks);
 }
 
 static void *virt_get_pte(struct kvm_vm *vm, struct kvm_mmu *mmu,
@@ -180,7 +194,7 @@ static void *virt_get_pte(struct kvm_vm *vm, struct kvm_mmu *mmu,
 	uint64_t *page_table = addr_gpa2hva(vm, pt_gpa);
 	int index = (vaddr >> PG_LEVEL_SHIFT(level)) & 0x1ffu;
 
-	TEST_ASSERT((*parent_pte == mmu->pgd) || (*parent_pte & PTE_PRESENT_MASK),
+	TEST_ASSERT((*parent_pte == mmu->pgd) || is_present_pte(mmu, parent_pte),
 		    "Parent PTE (level %d) not PRESENT for gva: 0x%08lx",
 		    level + 1, vaddr);
 
@@ -199,10 +213,10 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 
 	paddr = vm_untag_gpa(vm, paddr);
 
-	if (!(*pte & PTE_PRESENT_MASK)) {
-		*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK;
+	if (!is_present_pte(mmu, pte)) {
+		*pte = PTE_PRESENT_MASK(mmu) | PTE_WRITABLE_MASK(mmu);
 		if (current_level == target_level)
-			*pte |= PTE_LARGE_MASK | (paddr & PHYSICAL_PAGE_MASK);
+			*pte |= PTE_HUGE_MASK(mmu) | (paddr & PHYSICAL_PAGE_MASK);
 		else
 			*pte |= vm_alloc_page_table(vm) & PHYSICAL_PAGE_MASK;
 	} else {
@@ -214,7 +228,7 @@ static uint64_t *virt_create_upper_pte(struct kvm_vm *vm,
 		TEST_ASSERT(current_level != target_level,
 			    "Cannot create hugepage at level: %u, vaddr: 0x%lx",
 			    current_level, vaddr);
-		TEST_ASSERT(!(*pte & PTE_LARGE_MASK),
+		TEST_ASSERT(!is_huge_pte(mmu, pte),
 			    "Cannot create page table at level: %u, vaddr: 0x%lx",
 			    current_level, vaddr);
 	}
@@ -255,24 +269,24 @@ void __virt_pg_map(struct kvm_vm *vm, struct kvm_mmu *mmu, uint64_t vaddr,
 	     current_level--) {
 		pte = virt_create_upper_pte(vm, mmu, pte, vaddr, paddr,
 					    current_level, level);
-		if (*pte & PTE_LARGE_MASK)
+		if (is_huge_pte(mmu, pte))
 			return;
 	}
 
 	/* Fill in page table entry. */
 	pte = virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
-	TEST_ASSERT(!(*pte & PTE_PRESENT_MASK),
+	TEST_ASSERT(!is_present_pte(mmu, pte),
 		    "PTE already present for 4k page at vaddr: 0x%lx", vaddr);
-	*pte = PTE_PRESENT_MASK | PTE_WRITABLE_MASK | (paddr & PHYSICAL_PAGE_MASK);
+	*pte = PTE_PRESENT_MASK(mmu) | PTE_WRITABLE_MASK(mmu) | (paddr & PHYSICAL_PAGE_MASK);
 
 	/*
 	 * Neither SEV nor TDX supports shared page tables, so only the final
 	 * leaf PTE needs manually set the C/S-bit.
 	 */
 	if (vm_is_gpa_protected(vm, paddr))
-		*pte |= vm->arch.c_bit;
+		*pte |= PTE_C_BIT_MASK(mmu);
 	else
-		*pte |= vm->arch.s_bit;
+		*pte |= PTE_S_BIT_MASK(mmu);
 }
 
 void virt_arch_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr)
@@ -304,7 +318,7 @@ void virt_map_level(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 static bool vm_is_target_pte(struct kvm_mmu *mmu, uint64_t *pte,
 			     int *level, int current_level)
 {
-	if (*pte & PTE_LARGE_MASK) {
+	if (is_huge_pte(mmu, pte)) {
 		TEST_ASSERT(*level == PG_LEVEL_NONE ||
 			    *level == current_level,
 			    "Unexpected hugepage at level %d", current_level);
@@ -362,12 +376,13 @@ uint64_t *vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr)
 
 void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 {
+	struct kvm_mmu *mmu = &vm->mmu;
 	uint64_t *pml4e, *pml4e_start;
 	uint64_t *pdpe, *pdpe_start;
 	uint64_t *pde, *pde_start;
 	uint64_t *pte, *pte_start;
 
-	if (!vm->mmu.pgd_created)
+	if (!mmu->pgd_created)
 		return;
 
 	fprintf(stream, "%*s                                          "
@@ -375,47 +390,47 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 	fprintf(stream, "%*s      index hvaddr         gpaddr         "
 		"addr         w exec dirty\n",
 		indent, "");
-	pml4e_start = (uint64_t *) addr_gpa2hva(vm, vm->mmu.pgd);
+	pml4e_start = (uint64_t *) addr_gpa2hva(vm, mmu->pgd);
 	for (uint16_t n1 = 0; n1 <= 0x1ffu; n1++) {
 		pml4e = &pml4e_start[n1];
-		if (!(*pml4e & PTE_PRESENT_MASK))
+		if (!is_present_pte(mmu, pml4e))
 			continue;
 		fprintf(stream, "%*spml4e 0x%-3zx %p 0x%-12lx 0x%-10llx %u "
 			" %u\n",
 			indent, "",
 			pml4e - pml4e_start, pml4e,
 			addr_hva2gpa(vm, pml4e), PTE_GET_PFN(*pml4e),
-			!!(*pml4e & PTE_WRITABLE_MASK), !!(*pml4e & PTE_NX_MASK));
+			is_writable_pte(mmu, pml4e), is_nx_pte(mmu, pml4e));
 
 		pdpe_start = addr_gpa2hva(vm, *pml4e & PHYSICAL_PAGE_MASK);
 		for (uint16_t n2 = 0; n2 <= 0x1ffu; n2++) {
 			pdpe = &pdpe_start[n2];
-			if (!(*pdpe & PTE_PRESENT_MASK))
+			if (!is_present_pte(mmu, pdpe))
 				continue;
 			fprintf(stream, "%*spdpe  0x%-3zx %p 0x%-12lx 0x%-10llx "
 				"%u  %u\n",
 				indent, "",
 				pdpe - pdpe_start, pdpe,
 				addr_hva2gpa(vm, pdpe),
-				PTE_GET_PFN(*pdpe), !!(*pdpe & PTE_WRITABLE_MASK),
-				!!(*pdpe & PTE_NX_MASK));
+				PTE_GET_PFN(*pdpe), is_writable_pte(mmu, pdpe),
+				is_nx_pte(mmu, pdpe));
 
 			pde_start = addr_gpa2hva(vm, *pdpe & PHYSICAL_PAGE_MASK);
 			for (uint16_t n3 = 0; n3 <= 0x1ffu; n3++) {
 				pde = &pde_start[n3];
-				if (!(*pde & PTE_PRESENT_MASK))
+				if (!is_present_pte(mmu, pde))
 					continue;
 				fprintf(stream, "%*spde   0x%-3zx %p "
 					"0x%-12lx 0x%-10llx %u  %u\n",
 					indent, "", pde - pde_start, pde,
 					addr_hva2gpa(vm, pde),
-					PTE_GET_PFN(*pde), !!(*pde & PTE_WRITABLE_MASK),
-					!!(*pde & PTE_NX_MASK));
+					PTE_GET_PFN(*pde), is_writable_pte(mmu, pde),
+					is_nx_pte(mmu, pde));
 
 				pte_start = addr_gpa2hva(vm, *pde & PHYSICAL_PAGE_MASK);
 				for (uint16_t n4 = 0; n4 <= 0x1ffu; n4++) {
 					pte = &pte_start[n4];
-					if (!(*pte & PTE_PRESENT_MASK))
+					if (!is_present_pte(mmu, pte))
 						continue;
 					fprintf(stream, "%*spte   0x%-3zx %p "
 						"0x%-12lx 0x%-10llx %u  %u "
@@ -424,9 +439,9 @@ void virt_arch_dump(FILE *stream, struct kvm_vm *vm, uint8_t indent)
 						pte - pte_start, pte,
 						addr_hva2gpa(vm, pte),
 						PTE_GET_PFN(*pte),
-						!!(*pte & PTE_WRITABLE_MASK),
-						!!(*pte & PTE_NX_MASK),
-						!!(*pte & PTE_DIRTY_MASK),
+						is_writable_pte(mmu, pte),
+						is_nx_pte(mmu, pte),
+						is_dirty_pte(mmu, pte),
 						((uint64_t) n1 << 27)
 							| ((uint64_t) n2 << 18)
 							| ((uint64_t) n3 << 9)
@@ -509,7 +524,7 @@ vm_paddr_t addr_arch_gva2gpa(struct kvm_vm *vm, vm_vaddr_t gva)
 	int level = PG_LEVEL_NONE;
 	uint64_t *pte = __vm_get_page_table_entry(vm, &vm->mmu, gva, &level);
 
-	TEST_ASSERT(*pte & PTE_PRESENT_MASK,
+	TEST_ASSERT(is_present_pte(&vm->mmu, pte),
 		    "Leaf PTE not PRESENT for gva: 0x%08lx", gva);
 
 	/*
-- 
2.52.0.351.gbe84eed79e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
