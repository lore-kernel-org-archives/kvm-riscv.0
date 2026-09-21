Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C0C982F1
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFlueTMuA4ag3T5iQB8UDpkraxJD2AP+ilau/cbPDWI=; b=wxXgvsoUADRsl4
	n0nNwf1ZmkvcN2c5tv9mVVg+IZ6ojL3i2cjstCWr9B6mybHeYzCoWh6HS/TUcV4uZoczoqqdvwW0i
	zh6MPuNL87kCbie384XVfh2L+EajaUGD1saxJzjubO5Ttd63CbRS9oer507+k9jRM/s+UE3B5Prbx
	5GdJPkxz/0C/r3m+0ww+DpcsZMi2MxpfLG5SMX6FynTTuoLoGHI7ZUoSgPwceYYhy89tWCxqLsEpe
	+njqhaEdr3WqNw6gRqfMI+t52KSsOI3nP5L99vSs25i9Pxv4am/YnWr0t41viQEupBNjJC2UWgTe9
	xN3kzc0uwrRoLx0EAnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byj-00000001qCP-2Kxg;
	Mon, 21 Sep 2026 11:14:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byi-00000001qBB-0pim
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TdOHOI1E8fGa5CU5V13c9pAIdSK9plZJHC6KFQ2NxiI=; b=E96hJ27T3Anr9UXbC+/w+3wgZY
	aUehnkzMmyHqvQkWessChFwfChbWRSbWhsrGMCakEG5RoqOuPiZSEJpPPcI9DEnlJ+ISvfKn0Tbu3
	F8x0IYMczeCa5r4A2ciD1kKDbISKBE9s4ru1GJ9a0VAaEgqcxLex/Scl85RUvTIONV9naaeUKIyYy
	viOXY5bJQyYqjgJiYfB+2kBeGXDm4k/+ifyHzmYX/Zl0FBsYHhiBaZuLkZakyywAuQwhFNWC9RJpr
	9UOIwtDZ6pF3RrySIXk4YITsKk86ptZ05sbTSddH23VqdlMdIuYaL2lLyFAzjoDBjwWz+CogPwp06
	m6J1fHOQ==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8byc-0000000CB34-2zoE
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:14:30 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso2147381a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989264; x=1790594064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdOHOI1E8fGa5CU5V13c9pAIdSK9plZJHC6KFQ2NxiI=;
        b=bXZlmLCPf0KYA5lhT/Nz0IvfM7/k7y9JTWdpzd0JVEJoU98a4OyZocxhzwhTs6aRJg
         uoYBmK2VexLHOJRHGldXFh643/LsF9HWVNn6W/JYAMeRLtHBpwSvkDxXTS4Ke6yQOPF2
         2uoKpUAZaBMAmgfgWtEuDxizkmTVwlymzBs91QC8IUH0xQYEfyB8ygUi6LXB8WJiJgEa
         j9peuyC2dF8EKkROSDtvMaToibJxamgAxktiHEG4CkvMQ+lOmq0d3jY69Mpc/fCxeKRy
         yYZxHkOYaVq5QYg/ckPDusWMx9cKNyNFnvsOk+ix4GsrHZPsDbSrkykU3XDkxlwO2o7e
         n1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989264; x=1790594064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdOHOI1E8fGa5CU5V13c9pAIdSK9plZJHC6KFQ2NxiI=;
        b=B+LjBce+wvzAKAkKswNzjT3DOhyqdwJn0rAn4c4wCVJJP6LbwsL1QzDKmz69Cf3w0+
         5VrNTzRObiftBFb4rgGdmPxA51TbNCDlKl9XoWWd3PZbAOYiwvXH0NdG0HgG7V1/LqLz
         /DQ1AU0J68QafmuyQFjQ4Xk3bnZANzMueaKBF6oMrk5sL5wyrQ16xdhoB+7NDO/M4+yG
         unkNaGu/4mmUciwn3IWs/zoOmRCWl2SJcTnuC/xBnXxqHcefwcyfspyArLBxDwHgznAf
         Wvi8zx0BHYMTZwBwQp2wvY1JMUQxxP51VSdq+jtZWEw7KNntAURV8UJ1HKJuMqymgd9w
         0cZQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+RrzKbY+7hVV9GtHVNXsELB3Jdz1gWm4DsdWnS2H4osCqFfmCMwfVDe3G5W5FRli8Vi7adNnPA5s=@lists.infradead.org
X-Gm-Message-State: AFuF++k06lX9JoMlkO2HhEtS0yT6DWjsqfXc9Fu1wbnATTRgGYfffpHv
	jMTOw4GLcRmZPyntJoCQio5P9OiKSjdsk0QacE6saCOWi9Zkd7JdlLl+
X-Gm-Gg: AYBFou2oFowocQdCqbVMYLACSd2/mi5/Nkto38NxEB1nvh4oZI//8tjtlPHDZ8kyc1/
	p0LydTaPgOqeI3geE/+05mQ2O8+T41Qk+S4ICVmikKFFOgXFaEs3uC+XV+52lHF7MV0wOn7Gvz8
	dV56Zl0pW4HZxeS7FQp6a1d20TjUK6ILpf85ESLvT0+sI9F5VKmWo0I4dO6eMscDYDy2TCfjj+0
	Nm00+fws6F/ux5XqhKKyT7UW+AbRkBAKRGcfq/KV3HnazC3zoAqVPax4DTnjfEMdB6tpCytD5Jb
	7Jc6qJlQfUisAlp9q5V5FHbuajMUfRWvRHOzGY/4dL9bVS0UA8qjmOre+BpQikEqAvTAwaYqvRq
	qCxtTW44NYC8Q3HpQc7YLKs3Z5Egq0Mvi273lr3oHEyYs+WZ8blCEfn8G2NRHjBRJQWOEB73cZq
	DEdaSe5dbBI2HTAx+vGdwLwm/FkzlYitWEaK75C7nzAV26MSPjHK5Nc+0XtgoGyy25+4GXQnflo
	eW2L9bnBBO2MuSF4vY3HnWkCdAwJKfh
X-Received: by 2002:a17:90b:35c9:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-39e6c6a674bmr9093523a91.47.1789989264562;
        Mon, 21 Sep 2026 04:14:24 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:24 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 2/5] KVM: riscv: Read G-stage PTEs once when walking page tables
Date: Mon, 21 Sep 2026 20:13:59 +0900
Message-ID: <20260921111402.120911-3-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260921111402.120911-1-suunj1331@gmail.com>
References: <20260921111402.120911-1-suunj1331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121428_880248_AA76EEAA 
X-CRM114-Status: GOOD (  14.17  )
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

gstage_pte_leaf() dereferences the PTE pointer, causing walkers to read
the same entry multiple times. This is safe under mmu_lock, but a
lockless walker could observe different values when deciding whether an
entry is a leaf and which child table to follow.

Make gstage_pte_leaf() take a PTE value and use a single snapshot for
presence, leaf and child-table checks. Also remove a redundant leaf
check in kvm_riscv_gstage_set_pte(), where mmu_lock prevents the entry
from changing.

Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
 arch/riscv/kvm/gstage.c | 48 +++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index f61ba434093c..944fa4c95aea 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -19,8 +19,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
 unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
 #endif
 
-#define gstage_pte_leaf(__ptep)	\
-	(pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
+#define gstage_pte_leaf(__pte)	\
+	(pte_val(__pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
 
 static inline unsigned long gstage_pte_index(struct kvm_gstage *gstage,
 					     gpa_t addr, u32 level)
@@ -84,14 +84,18 @@ static int gstage_level_to_page_size(struct kvm_gstage *gstage, u32 level,
 bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
 			       pte_t **ptepp, u32 *ptep_level)
 {
-	pte_t *ptep;
+	pte_t *ptep, pte;
 	u32 current_level = gstage->pgd_levels - 1;
 
 	*ptep_level = current_level;
 	ptep = (pte_t *)gstage->pgd;
 	ptep = &ptep[gstage_pte_index(gstage, addr, current_level)];
-	while (ptep && pte_val(ptep_get(ptep))) {
-		if (gstage_pte_leaf(ptep)) {
+	while (ptep) {
+		pte = ptep_get(ptep);
+		if (!pte_val(pte))
+			break;
+
+		if (gstage_pte_leaf(pte)) {
 			*ptep_level = current_level;
 			*ptepp = ptep;
 			return true;
@@ -100,7 +104,7 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
 		if (current_level) {
 			current_level--;
 			*ptep_level = current_level;
-			ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+			ptep = (pte_t *)gstage_pte_page_vaddr(pte);
 			ptep = &ptep[gstage_pte_index(gstage, addr, current_level)];
 		} else {
 			ptep = NULL;
@@ -151,10 +155,12 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 		return -EINVAL;
 
 	while (current_level != map->level) {
-		if (gstage_pte_leaf(ptep))
+		pte_t pte = ptep_get(ptep);
+
+		if (gstage_pte_leaf(pte))
 			return -EEXIST;
 
-		if (!pte_val(ptep_get(ptep))) {
+		if (!pte_val(pte)) {
 			if (!pcache)
 				return -ENOMEM;
 			next_ptep = kvm_mmu_memory_cache_alloc(pcache);
@@ -163,9 +169,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 			set_pte(ptep, pfn_pte(PFN_DOWN(__pa(next_ptep)),
 					      __pgprot(_PAGE_TABLE)));
 		} else {
-			if (gstage_pte_leaf(ptep))
-				return -EEXIST;
-			next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+			next_ptep = (pte_t *)gstage_pte_page_vaddr(pte);
 		}
 
 		current_level--;
@@ -175,7 +179,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 	if (pte_val(*ptep) != pte_val(map->pte)) {
 		bool was_invalid = !pte_val(*ptep);
 		set_pte(ptep, map->pte);
-		if (gstage_pte_leaf(ptep) &&
+		if (gstage_pte_leaf(map->pte) &&
 		    !(was_invalid && riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC)))
 			gstage_tlb_flush(gstage, current_level, map->addr);
 	}
@@ -316,7 +320,7 @@ bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 	unsigned long huge_pte, child_pte;
 	unsigned long child_page_size;
 	bool need_flush = false;
-	pte_t *ptep;
+	pte_t *ptep, pte;
 	int i, ret;
 
 	if (!pcache)
@@ -325,16 +329,17 @@ bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
 	while(current_level > target_level) {
 		ptep = (pte_t *)&next_ptep[gstage_pte_index(gstage, addr, current_level)];
 
-		if (!pte_val(ptep_get(ptep)))
+		pte = ptep_get(ptep);
+		if (!pte_val(pte))
 			break;
 
-		if (!gstage_pte_leaf(ptep)) {
-			next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+		if (!gstage_pte_leaf(pte)) {
+			next_ptep = (pte_t *)gstage_pte_page_vaddr(pte);
 			current_level--;
 			continue;
 		}
 
-		huge_pte = pte_val(ptep_get(ptep));
+		huge_pte = pte_val(pte);
 
 		ret = gstage_level_to_page_size(gstage, current_level - 1, &child_page_size);
 		if (ret)
@@ -373,7 +378,7 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 			     pte_t *ptep, u32 ptep_level, enum kvm_riscv_gstage_op op)
 {
 	int i, ret;
-	pte_t old_pte, *next_ptep;
+	pte_t old_pte, pte, *next_ptep;
 	u32 next_ptep_level;
 	unsigned long next_page_size, page_size;
 	bool flush = false;
@@ -384,11 +389,12 @@ bool kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
 
 	WARN_ON(addr & (page_size - 1));
 
-	if (!pte_val(ptep_get(ptep)))
+	pte = ptep_get(ptep);
+	if (!pte_val(pte))
 		return false;
 
-	if (ptep_level && !gstage_pte_leaf(ptep)) {
-		next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
+	if (ptep_level && !gstage_pte_leaf(pte)) {
+		next_ptep = (pte_t *)gstage_pte_page_vaddr(pte);
 		next_ptep_level = ptep_level - 1;
 		ret = gstage_level_to_page_size(gstage, next_ptep_level, &next_page_size);
 		if (ret)
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
