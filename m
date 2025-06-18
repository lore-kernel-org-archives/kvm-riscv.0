Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA70BC7115B
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhbdzmS/HolTCKVoQuriIACnMX4ubP3YqoRnWjn0rg0=; b=L0PIkEonAJz042
	3l8PxWz9rg4dryyf26JtpOtHrBhl254gQpI8BOe2k347FdwhkeHgk0yHtQtwpuTUeuoRC3tSEapsS
	HeXtlpEAnnDT9fF5YPQybGCB+yvhCRKXFaGSWSPZAlaoumxi7Jn5hL9rWVbkNZabZ/TAU9F1UL0rb
	+TLy6wLHfRqTHdLP2dmpz7xfc9KoDtQq8h2l4CNwENmQ7bBRA0wfjbKMyk0zwu9/Qaj58o146hI+h
	bRXdi7LwqLmkIb53qStmDLnDk9hokYiypbJ5/RaBTm9CpYXxLjp9Wb5noceZnDT38D3eftFGjCHDY
	rIo5rnsgWJ+zN5Un2F/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWv-0000000AEpP-2BiE;
	Wed, 18 Jun 2025 13:08:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5i-00000009xnf-3gtB
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:32 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23526264386so67422055ad.2
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246590; x=1750851390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p5mv+mJk3QRDyfTxwUw01alJmtpxQQyJ0sOt3jdEOc=;
        b=So/Sq3vDmruu2v9oGXRjpaAyA7OBeuBPXuLRpWiEVkZqL+64rYXIsKscc3C0b2VvjT
         NJNUfLCEDVNQmLxo/HMSbUNmgNCZsU15Bwb8i1NiMR4QVw5pu2WUcmiWqKZQsoiGGYyf
         wFRtvXhSMT+5uB+pWSWC5343fOcmIXsjFtONhzNahDevee3w2ATw5HD3yFnzqq4Vhyy2
         tsLIR8/jqxRWBlnjf5habxbxKxPut2qJMdTC/3ut1Wzxm5dSgfg0vsHULdDS9Td0CNJV
         MdsfGkcH46Y4LSA/89jLplNAXM+2lbPZFzbkPdwdrOL/lJneWjghwFBDGoZ6k+19u2qB
         Xqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246590; x=1750851390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2p5mv+mJk3QRDyfTxwUw01alJmtpxQQyJ0sOt3jdEOc=;
        b=EG6INDwasgbbe6yRlYC9bO4YuWO/KualYhPharM6nRE7o5G4cDJjnrOvU1CLkWO8+e
         vEuYEUIRsz6qEKkEcMxT5tR8zUQp3PCsso1vbLOWSVGGjTZuNj9YO/kvv3LPqPqX2+B1
         lBeCoUaSl7Ra49TTPsKelAdAKsWXmnzu9btAp6XaTpt6dGM1SvrvJ8Wkui3KGl61vOua
         YsciEupoY1i2ZGARLrBMenQIYGStAgYX9lSXlmgEck7GOaFzJ2VZ3xGjAUcu+o963gh5
         jT49TA8Z59zQrY3TsklnlNINaFoYvXPgQSNuqBwY3Xv3cS7B3EPc8FIiHnRWfbthYTWY
         HMLg==
X-Forwarded-Encrypted: i=1; AJvYcCX+BbYvGxqoi/tt3doxnKGs/RHsscMeBVegWUNXVtMJNy3axxjttdW6VDqF3PEE/DNO+SRb0L5+Uu8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk1a1Ok9s8e018ZQVzMgTONBPcWiUwxgzYcB+XxDg4FL1C53sH
	i2EUZQ2unIE4OwQjaGPlCg7sVhy6nV/13ZuqmkJ3m8xkuLt0y9myLX3A5ygf+tZCpnU=
X-Gm-Gg: ASbGncv0ugE9H3hjl6aQHyHYzUWzEXFd8l16geg34hJwyTVqpUh72xoSo031iR6XkMa
	1k1tq1PfgxiRF/sGTpjO49jZqA1ioSpynZLctlXA5fYrMBCr24IQty6DHzM8Y7bdqiH3EjM1Y+E
	Fd2qt0Q96FERHQ+0lvWcMj7jy0gQ32TeQRiZYgHKL1MjCNbA5sKNttUzlem9jH0C/XNMlk1I8a4
	PSRECJKmxWkreWYk6BEjUZkHkKlapbiOIuXc3M+P0JBW5N/vIWxJkPqywegKX84q7KZ5kymUDPM
	SWpGPrnR71hftW/AOgzj0oK6oudGw4ZQT0tkocBC5osrO17RgQ67vhome0ITChjWDid/c7Ai/D2
	sJb8srr3J2w3au7q6CNHA6A+mBz5I
X-Google-Smtp-Source: AGHT+IEBquBrf2XB4FByIM0NjX1oGNwUDdFIttWNjoo91vzWLERz/6T2M0LEaAO4ssBEon09H6iLyQ==
X-Received: by 2002:a17:903:74f:b0:234:b422:7120 with SMTP id d9443c01a7336-2366b3137c0mr188903225ad.9.1750246589968;
        Wed, 18 Jun 2025 04:36:29 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:29 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 09/12] RISC-V: KVM: Introduce struct kvm_gstage_mapping
Date: Wed, 18 Jun 2025 17:05:29 +0530
Message-ID: <20250618113532.471448-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043630_918906_F0E294D3 
X-CRM114-Status: GOOD (  16.71  )
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

Introduce struct kvm_gstage_mapping which represents a g-stage
mapping at a particular g-stage page table level. Also, update
the kvm_riscv_gstage_map() to return the g-stage mapping upon
success.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_mmu.h |  9 ++++-
 arch/riscv/kvm/mmu.c             | 58 ++++++++++++++++++--------------
 arch/riscv/kvm/vcpu_exit.c       |  3 +-
 3 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_mmu.h b/arch/riscv/include/asm/kvm_mmu.h
index 4e1654282ee4..91c11e692dc7 100644
--- a/arch/riscv/include/asm/kvm_mmu.h
+++ b/arch/riscv/include/asm/kvm_mmu.h
@@ -8,6 +8,12 @@
 
 #include <linux/kvm_types.h>
 
+struct kvm_gstage_mapping {
+	gpa_t addr;
+	pte_t pte;
+	u32 level;
+};
+
 int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 			     phys_addr_t hpa, unsigned long size,
 			     bool writable, bool in_atomic);
@@ -15,7 +21,8 @@ void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
 			      unsigned long size);
 int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write);
+			 gpa_t gpa, unsigned long hva, bool is_write,
+			 struct kvm_gstage_mapping *out_map);
 int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index c1a3eb076df3..806614b3e46d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -135,18 +135,18 @@ static void gstage_remote_tlb_flush(struct kvm *kvm, u32 level, gpa_t addr)
 	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0, addr, BIT(order), order);
 }
 
-static int gstage_set_pte(struct kvm *kvm, u32 level,
-			   struct kvm_mmu_memory_cache *pcache,
-			   gpa_t addr, const pte_t *new_pte)
+static int gstage_set_pte(struct kvm *kvm,
+			  struct kvm_mmu_memory_cache *pcache,
+			  const struct kvm_gstage_mapping *map)
 {
 	u32 current_level = gstage_pgd_levels - 1;
 	pte_t *next_ptep = (pte_t *)kvm->arch.pgd;
-	pte_t *ptep = &next_ptep[gstage_pte_index(addr, current_level)];
+	pte_t *ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
 
-	if (current_level < level)
+	if (current_level < map->level)
 		return -EINVAL;
 
-	while (current_level != level) {
+	while (current_level != map->level) {
 		if (gstage_pte_leaf(ptep))
 			return -EEXIST;
 
@@ -165,13 +165,13 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		}
 
 		current_level--;
-		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
+		ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
 	}
 
-	if (pte_val(*ptep) != pte_val(*new_pte)) {
-		set_pte(ptep, *new_pte);
+	if (pte_val(*ptep) != pte_val(map->pte)) {
+		set_pte(ptep, map->pte);
 		if (gstage_pte_leaf(ptep))
-			gstage_remote_tlb_flush(kvm, current_level, addr);
+			gstage_remote_tlb_flush(kvm, current_level, map->addr);
 	}
 
 	return 0;
@@ -181,14 +181,16 @@ static int gstage_map_page(struct kvm *kvm,
 			   struct kvm_mmu_memory_cache *pcache,
 			   gpa_t gpa, phys_addr_t hpa,
 			   unsigned long page_size,
-			   bool page_rdonly, bool page_exec)
+			   bool page_rdonly, bool page_exec,
+			   struct kvm_gstage_mapping *out_map)
 {
-	int ret;
-	u32 level = 0;
-	pte_t new_pte;
 	pgprot_t prot;
+	int ret;
 
-	ret = gstage_page_size_to_level(page_size, &level);
+	out_map->addr = gpa;
+	out_map->level = 0;
+
+	ret = gstage_page_size_to_level(page_size, &out_map->level);
 	if (ret)
 		return ret;
 
@@ -216,10 +218,10 @@ static int gstage_map_page(struct kvm *kvm,
 		else
 			prot = PAGE_WRITE;
 	}
-	new_pte = pfn_pte(PFN_DOWN(hpa), prot);
-	new_pte = pte_mkdirty(new_pte);
+	out_map->pte = pfn_pte(PFN_DOWN(hpa), prot);
+	out_map->pte = pte_mkdirty(out_map->pte);
 
-	return gstage_set_pte(kvm, level, pcache, gpa, &new_pte);
+	return gstage_set_pte(kvm, pcache, out_map);
 }
 
 enum gstage_op {
@@ -352,7 +354,6 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 			     phys_addr_t hpa, unsigned long size,
 			     bool writable, bool in_atomic)
 {
-	pte_t pte;
 	int ret = 0;
 	unsigned long pfn;
 	phys_addr_t addr, end;
@@ -360,22 +361,25 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 		.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0,
 		.gfp_zero = __GFP_ZERO,
 	};
+	struct kvm_gstage_mapping map;
 
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
 
 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
-		pte = pfn_pte(pfn, PAGE_KERNEL_IO);
+		map.addr = addr;
+		map.pte = pfn_pte(pfn, PAGE_KERNEL_IO);
+		map.level = 0;
 
 		if (!writable)
-			pte = pte_wrprotect(pte);
+			map.pte = pte_wrprotect(map.pte);
 
 		ret = kvm_mmu_topup_memory_cache(&pcache, gstage_pgd_levels);
 		if (ret)
 			goto out;
 
 		spin_lock(&kvm->mmu_lock);
-		ret = gstage_set_pte(kvm, 0, &pcache, addr, &pte);
+		ret = gstage_set_pte(kvm, &pcache, &map);
 		spin_unlock(&kvm->mmu_lock);
 		if (ret)
 			goto out;
@@ -593,7 +597,8 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 
 int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write)
+			 gpa_t gpa, unsigned long hva, bool is_write,
+			 struct kvm_gstage_mapping *out_map)
 {
 	int ret;
 	kvm_pfn_t hfn;
@@ -608,6 +613,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	unsigned long vma_pagesize, mmu_seq;
 	struct page *page;
 
+	/* Setup initial state of output mapping */
+	memset(out_map, 0, sizeof(*out_map));
+
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
 	if (ret) {
@@ -677,10 +685,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	if (writable) {
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
-				      vma_pagesize, false, true);
+				      vma_pagesize, false, true, out_map);
 	} else {
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
-				      vma_pagesize, true, true);
+				      vma_pagesize, true, true, out_map);
 	}
 
 	if (ret)
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 965df528de90..6b4694bc07ea 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -15,6 +15,7 @@
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
 {
+	struct kvm_gstage_mapping host_map;
 	struct kvm_memory_slot *memslot;
 	unsigned long hva, fault_addr;
 	bool writable;
@@ -43,7 +44,7 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	}
 
 	ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
-		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
+		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false, &host_map);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
