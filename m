Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEABF327C2
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 09:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzJIbnT8aDB+NFUPksGx3WrnhDEZU/jEu4f/+2Wx82A=; b=RFi6DW33utavrS
	rUI+wT2JGEMwt9N8XhS5l1DoVO8K55MYEY7XAPU8sZ078dMmfqfIHEXcEq4HR3MoxhaJnWehnsUSy
	bsQ5TjDolbtghUerM966m2jf1v4rN0BOlepDOuoV1gVp5ck7hd6xcO9mD3h18ni8Kt8SPUG1E+cg6
	4y4vRiDlQCWOt8ieW2oVZZ/IFBPs5xH/u63dyTrsk4DJhzzAuMvzZYQnfjYDEcdOR0hBj3jQf6H+Y
	15TJYu3ZpxU0qkl1yWLuu6za7P7KUy3cdTq27eYpo8Jn1WilEHvFTYollduCSDyNwm1OJoP5sPyok
	9YqJxza5qGG4QUU9DKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7MM-00000008KMd-0IdP;
	Tue, 21 Apr 2026 09:25:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF7MI-00000008KLD-0JnK
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 09:25:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a9296b3926so23162955ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Apr 2026 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1776763529; x=1777368329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAU2czezOYKOKIblUParrQgVvl9OeyW0IiuDcmMed3s=;
        b=GGWs3aih1jkFwYrx/jJ9sFnS90sYBDWM+1+XMe76Deb5rkxLmKQLwFNC8kw3dF5J41
         kBsJEwAttw52i4ERfaWe4Cvhhsct1T8WHk2gTw1vnVZR0l6TZHX54qb3cvSkqC1ToF2x
         LAe2AKPHQvYpIS0XfiIZ/QJJkeCtLivNyWpkLpFe5hnBzcLvskIU5PAZxCaTC3RiMspf
         N/iaEGkwXVO3GuL9VP94pHkwSD6eUWdf3uIcpRJKCDE13fqTpyPoIj/pV3ZwRZ3B1vWM
         PjYqBnN/4FkmwFeeh8JiCtNPZ1p/bIYKq/HvwIA3cveHEchqgy70yiNUImQOJ0h/tmx1
         Xm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776763529; x=1777368329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hAU2czezOYKOKIblUParrQgVvl9OeyW0IiuDcmMed3s=;
        b=mhcAAUDYp/MxKzJwp4FT8NBjhsGJRjNR03DiQlecG2QGqv+orz3LL2fXceXNYJkbIE
         qfFU47OBBEJq2y4uzlYQe96yBe3A4Z9d/oo589d61v7gtntP+YVbhBMie847TCvPLIQk
         09fMMfyfYqqSs8nHSjArQcILpZdtSLQh1By/9mG2vubuyVf8l7xdGOQKkUosOfcU+RZe
         Akg70mPMj8f8yR28OeiJIfpEU06ldVHv90DKkEwBJ1MFrF4ocHFfjAsIAIuui4DaiDXJ
         L4XJm7WbBomjMXoUCFsDpuOZdSF3uGjzn1ctkc3MNM2fNYxFrGrpoxEDQqTyDaNejwIY
         Naug==
X-Forwarded-Encrypted: i=1; AFNElJ8w+DNziJQl2+HX40FmsKHZf8TYFvAgqrFIDmVaRuy4Znf1UL+Ew3Bn8wecXLkWjEvy3JUVXjBb3jg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvsUbN3UEj2mmaOawrleGBCwt7uVtVvA+mL8xISQJKEKX9kPR1
	KsJ4Yl32RyV9xE0NUdYlrHJf8iHpIQ9m5z2uOBmNhnflcauQMCEm2+7/Z1YOMXb4CdE=
X-Gm-Gg: AeBDies2NsAfL82EP1o6E/+wUybT2nsSsbDlIcgeSc8cYRzS9VAgmUJqYDHNzc3Pelv
	sb659BPIl1mwYosWz9kxzCmY55vt5KhO+qOfAjLGIOKgjtG3tAI/XbkSf5fVajW2hExUpMyDiYZ
	Hjn9fWuACvj7ej/MsJc5XidVOoVY6JO5AiGbBjZEf0Boameu0bcMDeyevHfny7Im3SjkpGq4c1P
	kVHtGZu98myF7xOE8ROpamQK25AslkysHHHzgYjSDXG+rlartFvgUTZ7oYyJG6ba/KKmrSBKGm5
	LzHe4FaWNV/byUVtoFTyADsfrtcaB3AMkwMb4ZHvmpiogQVnRLrK/+9NN8KZ4WoQjA/9oTjpTJ2
	PrAkxGuR/2K96WNnCgdyDaYmDixWCP2BT3R5jhPs37KM8ba0ojeVs6LqE0dl90WS+oLMrR1qGc3
	h8tCPZxIrP8ANtlmIXcnrKw2gd7+lMbYaVzHwprkDqBD11t/TwsGjZuVdeh+5uSoptX34P
X-Received: by 2002:a17:902:bd44:b0:2b2:5da8:14be with SMTP id d9443c01a7336-2b5f9fcd9eemr128057035ad.41.1776763529026;
        Tue, 21 Apr 2026 02:25:29 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff39csm131965105ad.4.2026.04.21.02.25.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Apr 2026 02:25:28 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	andrew+kernel@donnellan.id.au,
	andreyknvl@gmail.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	apopple@nvidia.com,
	ardb@kernel.org,
	atish.patra@linux.dev,
	baolin.wang@linux.alibaba.com,
	cuiyunhui@bytedance.com,
	david@kernel.org,
	debug@rivosinc.com,
	djordje.todorovic@htecgroup.com,
	dvyukov@google.com,
	elver@google.com,
	glider@google.com,
	ilias.apalodimas@linaro.org,
	junhui.liu@pigmoral.tech,
	kasan-dev@googlegroups.com,
	kees@kernel.org,
	kevin.brodsky@arm.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liu.xuemei1@zte.com.cn,
	ljs@kernel.org,
	namcao@linutronix.de,
	osalvador@suse.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	rmclure@linux.ibm.com,
	rostedt@goodmis.org,
	rppt@kernel.org,
	ryabinin.a.a@gmail.com,
	surenb@google.com,
	vincenzo.frascino@arm.com,
	vishal.moola@gmail.com,
	wangruikang@iscas.ac.cn,
	zhangchunyan@iscas.ac.cn
Subject: [PATCH 2/7] riscv/kvm: use raw PTE helpers for G-stage leaf PTEs
Date: Tue, 21 Apr 2026 17:24:52 +0800
Message-Id: <20260421092457.37649-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20260421092457.37649-1-cuiyunhui@bytedance.com>
References: <20260421092457.37649-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_022530_187709_D05B440C 
X-CRM114-Status: GOOD (  13.35  )
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

Use the raw RISC-V PTE helpers when KVM G-stage code needs to inspect
or update the exact leaf entry encoding. This keeps G-stage page tables
independent from the public PTE wrappers that will gain Svnapot-aware
behavior.

No functional change intended.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kvm/gstage.c | 48 ++++++++++++++++++++++-------------------
 arch/riscv/kvm/mmu.c    |  4 ++--
 2 files changed, 28 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index d9fe8be2a1516..fda235092533a 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -88,7 +88,7 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
 	*ptep_level = current_level;
 	ptep = (pte_t *)gstage->pgd;
 	ptep = &ptep[gstage_pte_index(gstage, addr, current_level)];
-	while (ptep && pte_val(ptep_get(ptep))) {
+	while (ptep && pte_val(__ptep_get(ptep))) {
 		if (gstage_pte_leaf(ptep)) {
 			*ptep_level = current_level;
 			*ptepp = ptep;
@@ -98,7 +98,7 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
 		if (current_level) {
 			current_level--;
 			*ptep_level = current_level;
-			ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+			ptep = (pte_t *)gstage_pte_page_vaddr(__ptep_get(ptep));
 			ptep = &ptep[gstage_pte_index(gstage, addr, current_level)];
 		} else {
 			ptep = NULL;
@@ -138,18 +138,19 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 		if (gstage_pte_leaf(ptep))
 			return -EEXIST;
 
-		if (!pte_val(ptep_get(ptep))) {
+		if (!pte_val(__ptep_get(ptep))) {
 			if (!pcache)
 				return -ENOMEM;
 			next_ptep = kvm_mmu_memory_cache_alloc(pcache);
 			if (!next_ptep)
 				return -ENOMEM;
-			set_pte(ptep, pfn_pte(PFN_DOWN(__pa(next_ptep)),
-					      __pgprot(_PAGE_TABLE)));
+			__set_pte(ptep,
+				  pfn_pte(PFN_DOWN(__pa(next_ptep)),
+					  __pgprot(_PAGE_TABLE)));
 		} else {
 			if (gstage_pte_leaf(ptep))
 				return -EEXIST;
-			next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+			next_ptep = (pte_t *)gstage_pte_page_vaddr(__ptep_get(ptep));
 		}
 
 		current_level--;
@@ -157,7 +158,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 	}
 
 	if (pte_val(*ptep) != pte_val(map->pte)) {
-		set_pte(ptep, map->pte);
+		__set_pte(ptep, map->pte);
 		if (gstage_pte_leaf(ptep))
 			gstage_tlb_flush(gstage, current_level, map->addr);
 	}
@@ -170,13 +171,13 @@ static void kvm_riscv_gstage_update_pte_prot(struct kvm_gstage *gstage, u32 leve
 {
 	pte_t new_pte;
 
-	if (pgprot_val(pte_pgprot(ptep_get(ptep))) == pgprot_val(prot))
+	if (pgprot_val(pte_pgprot(__ptep_get(ptep))) == pgprot_val(prot))
 		return;
 
-	new_pte = pfn_pte(pte_pfn(ptep_get(ptep)), prot);
+	new_pte = pfn_pte(pte_pfn(__ptep_get(ptep)), prot);
 	new_pte = pte_mkdirty(new_pte);
 
-	set_pte(ptep, new_pte);
+	__set_pte(ptep, new_pte);
 
 	gstage_tlb_flush(gstage, level, addr);
 }
@@ -255,7 +256,8 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
 		if (ptep_level > out_map->level) {
 			kvm_riscv_gstage_split_huge(gstage, pcache, gpa,
 						    out_map->level, true);
-		} else if (ALIGN_DOWN(PFN_PHYS(pte_pfn(ptep_get(ptep))), page_size) == hpa) {
+		} else if (ALIGN_DOWN(PFN_PHYS(pte_pfn(__ptep_get(ptep))),
+					 page_size) == hpa) {
 			kvm_riscv_gstage_update_pte_prot(gstage, ptep_level, gpa, ptep, prot);
 			return 0;
 		}
@@ -301,16 +303,16 @@ int kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 	while(current_level > target_level) {
 		ptep = (pte_t *)&next_ptep[gstage_pte_index(gstage, addr, current_level)];
 
-		if (!pte_val(ptep_get(ptep)))
+		if (!pte_val(__ptep_get(ptep)))
 			break;
 
 		if (!gstage_pte_leaf(ptep)) {
-			next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+			next_ptep = (pte_t *)gstage_pte_page_vaddr(__ptep_get(ptep));
 			current_level--;
 			continue;
 		}
 
-		huge_pte = pte_val(ptep_get(ptep));
+		huge_pte = pte_val(__ptep_get(ptep));
 
 		ret = gstage_level_to_page_size(gstage, current_level - 1, &child_page_size);
 		if (ret)
@@ -322,11 +324,12 @@ int kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 
 		for (i = 0; i < PTRS_PER_PTE; i++) {
 			child_pte = make_child_pte(huge_pte, i, child_page_size);
-			set_pte((pte_t *)&next_ptep[i], __pte(child_pte));
+			__set_pte((pte_t *)&next_ptep[i], __pte(child_pte));
 		}
 
-		set_pte(ptep, pfn_pte(PFN_DOWN(__pa(next_ptep)),
-				__pgprot(_PAGE_TABLE)));
+		__set_pte(ptep,
+			  pfn_pte(PFN_DOWN(__pa(next_ptep)),
+				  __pgprot(_PAGE_TABLE)));
 
 		if (flush)
 			gstage_tlb_flush(gstage, current_level, addr);
@@ -351,18 +354,18 @@ void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 
 	WARN_ON(addr & (page_size - 1));
 
-	if (!pte_val(ptep_get(ptep)))
+	if (!pte_val(__ptep_get(ptep)))
 		return;
 
 	if (ptep_level && !gstage_pte_leaf(ptep)) {
-		next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+		next_ptep = (pte_t *)gstage_pte_page_vaddr(__ptep_get(ptep));
 		next_ptep_level = ptep_level - 1;
 		ret = gstage_level_to_page_size(gstage, next_ptep_level, &next_page_size);
 		if (ret)
 			return;
 
 		if (op == GSTAGE_OP_CLEAR)
-			set_pte(ptep, __pte(0));
+			__set_pte(ptep, __pte(0));
 		for (i = 0; i < PTRS_PER_PTE; i++)
 			kvm_riscv_gstage_op_pte(gstage, addr + i * next_page_size,
 						&next_ptep[i], next_ptep_level, op);
@@ -371,9 +374,10 @@ void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 	} else {
 		old_pte = *ptep;
 		if (op == GSTAGE_OP_CLEAR)
-			set_pte(ptep, __pte(0));
+			__set_pte(ptep, __pte(0));
 		else if (op == GSTAGE_OP_WP)
-			set_pte(ptep, __pte(pte_val(ptep_get(ptep)) & ~_PAGE_WRITE));
+			__set_pte(ptep,
+				  __pte(pte_val(__ptep_get(ptep)) & ~_PAGE_WRITE));
 		if (pte_val(*ptep) != pte_val(old_pte))
 			gstage_tlb_flush(gstage, ptep_level, addr);
 	}
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270c..f338ef08a6d13 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -262,7 +262,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 				       &ptep, &ptep_level))
 		return false;
 
-	return ptep_test_and_clear_young(NULL, 0, ptep);
+	return __ptep_test_and_clear_young(NULL, 0, ptep);
 }
 
 bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
@@ -282,7 +282,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 				       &ptep, &ptep_level))
 		return false;
 
-	return pte_young(ptep_get(ptep));
+	return pte_young(__ptep_get(ptep));
 }
 
 static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *memslot,
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
