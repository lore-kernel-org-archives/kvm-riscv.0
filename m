Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03449C44501
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtvJNMyK+C8F82F5bY/HoL2bVeR2yg0RSGJLWcgoaAI=; b=Zyw+GZRapGxHsB
	qJbjyvTtX2OBWJ2aYJo3KY9jcup1Bs0O9YPkhpMIKhKiOPauUeHwtmAPUDAw2ouTtXiazVqLaJNVL
	Lv4caKqH7H6bFGc6AuUBJBkofD0w5yi3gwyg7k1rQTYkzC/9Z8MVin9vyTMO2WYX6eVcNI4HBqaR5
	Kn7ybpMSgXbB/YzUb1NNlpmINjTHaaqHKkhJauoyLidaOE6zjKQI8d23+tRMJ2nwaC58cmYBtcdBU
	pT1EnIIPUQesrXhQAJgQYysRFXdHNc0nF+/LVct+i2Z9UaOYDSh/PG0Bhq54BPFmoSxjE6HEmIVGG
	Cx9xf2s6nVK81Fhlv5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLQU-0000000HHrz-2xRL;
	Thu, 16 Jul 2026 12:42:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLQR-0000000HHpl-3AR6
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:42:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c7c61b5292so44333515ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205771; x=1784810571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ldlfwiuLgMW2soE43Rq8OVhlEemN/KhXMrXMzIbx114=;
        b=KpQDlPwu4XHge7/h1velBafWtMGK7DHCSO+xKsf2b100JnaHp9rnMslyxTR3O8BcT/
         k6Unj82fLDPqTaRCGfcJnk7ZOrN7peni+T5drfp3h+peg6YedjCDaXvWOEjgWZ0wYPQL
         7oHX7uEB8wUxndT+ROlM+MbommMZWHgNpmQk1U/j6vsIZkHXe0TcUB4HrpkKfIrAuThN
         ZpwvAdUcCPOj+2LJFsFqZWgZzl9yq5dKmeO0b9P1mK7bdd4jYrT9idblWKwNY2Kftbpt
         g7+ZcwjgvglK/0zq/YloETazKS2tkaVVWgmq0fGjITjribfYK1nu1PqYXajDDjlZ1Zyt
         0R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205771; x=1784810571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ldlfwiuLgMW2soE43Rq8OVhlEemN/KhXMrXMzIbx114=;
        b=ajb33EmrZ1nHWwz7oxxWYDFjwMLR6Mmj8G4TF3kF2cdoM+jF7C9aX4nndoRYl9Zk+Z
         q59c2+KPRi+dlmzXzPn2wtfiDdp00FkUdatlodPo0/bYbiPA5rRdY+F3IB4R1zxJr7Fj
         AFU0PPSXW08o/a0KqKSeOprhLB4LAGzESe8ploLGXToK6taY+BfazBytmS+5DkR54efc
         swv2B5EuQdb7HwskPZQJ7R4fN0Gys4TvKKoKGndIPIpuLijiFhHeF56LSi8AEW3Fkx6e
         xARTldnsSJxMNZAiU60JPACtjM3j4IqX3xJc4fbp6BOCbhkk0vxTahdOvvvyD7WWjVQa
         F/rA==
X-Forwarded-Encrypted: i=1; AHgh+RojbP8XyHMfZdMvDp0ykNISCZgMhHtuSefhyf14WcgYXLazoBSpVeURWfk4w/qXj5tpoarKdnp9AeA=@lists.infradead.org
X-Gm-Message-State: AOJu0YytIZ1KR+tqM5ZBP671WOqq+cb1mnGrIlWNDBT8ZO7DoB/Gm887
	8NK06Kdg7L1S9ig7NWQNSQRro/xY5Vx6Q7VQ3kflxOKr7ii7TxGiyttZrDm5A5nrx9M=
X-Gm-Gg: AfdE7ckbcX+Yn59ho/tcCTnXJH4BVxVc5qQ9LziFQWa4Md+Vi0GX/AmOqjtrVqeoJBw
	H9GR4EVosVlispYE5IgZcG5RomqBsfT6vfkjrpKqKL3UPGkSwBmXXad07FvuHwehU1K13WxGzeY
	zT85Pj/N63AFq9d8kdUocf0oJB4PvAVSNSAwoUJf7TB/hGfepul9s2FpjisnST+jSHz/bRkWGza
	zo5QTfrVE/JKSGun0YXIx/Jm1TQxzM8CLNpYR4RGdBB3ydKTdlayQySjDCh9W/H4Xh+AvI/slzx
	4zju00wu9eq2DwM5bgVH/1tsZcgs/rNzny8o1QYT6jhNPAol2IRJNBXUdsiOxZD4szBNryaHIBp
	sbyhiTy1PbIHS88uWnTyy0YwKjxIwQhIIj4yxpmpK6GhuQDUhh8SDO9sUzjgUlNAkqr3+mma3Qu
	T1/Ag/aiUfub7haSoCgQtioofhuzyVFXE8pQ==
X-Received: by 2002:a05:6a21:10b:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3c110009b76mr25226010637.2.1784205770620;
        Thu, 16 Jul 2026 05:42:50 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.42.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:42:50 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: linux-riscv@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 01/15] riscv: introduce raw PTE helpers
Date: Thu, 16 Jul 2026 20:41:36 +0800
Message-Id: <2bde82cde4c262d35663d386e8a16455c76ec3e6.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054251_824251_BFA5568D 
X-CRM114-Status: GOOD (  13.37  )
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

Svnapot needs RISC-V to distinguish between two PTE views: the raw encoded
entries used by architecture code, and the logical per-page PTE view that
will later be exposed to generic MM paths.

Split the low-level RISC-V PTE operations from the public helpers so the
raw helpers can keep operating on the hardware encoding, while follow-up
changes build the Svnapot-aware public view on top.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 129 +++++++++++++++++++++++++++----
 1 file changed, 114 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index a810655ce8f9b..8ca5da9534967 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -9,6 +9,7 @@
 #include <linux/mmzone.h>
 #include <linux/sizes.h>
 
+#include <asm/cmpxchg.h>
 #include <asm/pgtable-bits.h>
 
 #ifndef CONFIG_MMU
@@ -628,11 +629,13 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
  * a page table are directly modified.  Thus, the following hook is
  * made available.
  */
-static inline void set_pte(pte_t *ptep, pte_t pteval)
+static inline void __set_pte(pte_t *ptep, pte_t pteval)
 {
 	WRITE_ONCE(*ptep, pteval);
 }
 
+#define __set_pte __set_pte
+
 void flush_icache_pte(struct mm_struct *mm, pte_t pte);
 
 static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
@@ -640,13 +643,13 @@ static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
 	if (pte_present(pteval) && pte_exec(pteval))
 		flush_icache_pte(mm, pteval);
 
-	set_pte(ptep, pteval);
+	__set_pte(ptep, pteval);
 }
 
 #define PFN_PTE_SHIFT		_PAGE_PFN_SHIFT
 
-static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
-		pte_t *ptep, pte_t pteval, unsigned int nr)
+static inline void __set_ptes(struct mm_struct *mm, unsigned long addr,
+			      pte_t *ptep, pte_t pteval, unsigned int nr)
 {
 	page_table_check_ptes_set(mm, addr, ptep, pteval, nr);
 
@@ -658,24 +661,85 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
 		pte_val(pteval) += 1 << _PAGE_PFN_SHIFT;
 	}
 }
-#define set_ptes set_ptes
 
-static inline void pte_clear(struct mm_struct *mm,
-	unsigned long addr, pte_t *ptep)
+#define __set_ptes __set_ptes
+
+static inline void __pte_clear(struct mm_struct *mm,
+			       unsigned long addr, pte_t *ptep)
 {
 	__set_pte_at(mm, ptep, __pte(0));
 }
 
+#define __pte_clear __pte_clear
+
+#define __ptep_get __ptep_get
+static inline pte_t __ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+
+#define __ptep_get_lockless __ptep_get_lockless
+static inline pte_t __ptep_get_lockless(pte_t *ptep)
+{
+	return __ptep_get(ptep);
+}
+
+static inline void __clear_young_dirty_pte(struct vm_area_struct *vma,
+					   unsigned long addr, pte_t *ptep,
+					   pte_t pte, cydp_t flags)
+{
+	pte_t old_pte;
+
+	do {
+		old_pte = pte;
+
+		if (flags & CYDP_CLEAR_YOUNG)
+			pte = pte_mkold(pte);
+		if (flags & CYDP_CLEAR_DIRTY)
+			pte = pte_mkclean(pte);
+
+		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
+					       pte_val(old_pte),
+					       pte_val(pte));
+	} while (pte_val(pte) != pte_val(old_pte));
+}
+
+static inline void __clear_young_dirty_ptes(struct vm_area_struct *vma,
+					    unsigned long addr, pte_t *ptep,
+					    unsigned int nr, cydp_t flags)
+{
+	pte_t pte;
+
+	for (;;) {
+		pte = __ptep_get(ptep);
+
+		if (flags == (CYDP_CLEAR_YOUNG | CYDP_CLEAR_DIRTY))
+			__set_pte(ptep, pte_mkclean(pte_mkold(pte)));
+		else
+			__clear_young_dirty_pte(vma, addr, ptep, pte, flags);
+
+		if (--nr == 0)
+			break;
+		ptep++;
+		addr += PAGE_SIZE;
+	}
+}
+
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS	/* defined in mm/pgtable.c */
 extern int ptep_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 				 pte_t *ptep, pte_t entry, int dirty);
+int __ptep_set_access_flags(struct vm_area_struct *vma,
+			    unsigned long address, pte_t *ptep,
+			    pte_t entry, int dirty);
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG	/* defined in mm/pgtable.c */
 bool ptep_test_and_clear_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep);
+			       unsigned long address, pte_t *ptep);
+bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
+				 unsigned long address, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				       unsigned long address, pte_t *ptep)
+static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
+					 unsigned long address, pte_t *ptep)
 {
 #ifdef CONFIG_SMP
 	pte_t pte = __pte(xchg(&ptep->pte, 0));
@@ -690,9 +754,24 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 	return pte;
 }
 
+#define __ptep_get_and_clear __ptep_get_and_clear
+
+static inline pte_t __ptep_clear_flush(struct vm_area_struct *vma,
+				       unsigned long address, pte_t *ptep)
+{
+	pte_t pte = __ptep_get_and_clear(vma->vm_mm, address, ptep);
+
+	if (pte_accessible(vma->vm_mm, pte))
+		flush_tlb_page(vma, address);
+
+	return pte;
+}
+
+#define __ptep_clear_flush __ptep_clear_flush
+
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
-static inline void ptep_set_wrprotect(struct mm_struct *mm,
-				      unsigned long address, pte_t *ptep)
+static inline void __ptep_set_wrprotect(struct mm_struct *mm,
+					unsigned long address, pte_t *ptep)
 {
 	pte_t read_pte = READ_ONCE(*ptep);
 	/*
@@ -705,9 +784,11 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm,
 			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
+#define __ptep_set_wrprotect __ptep_set_wrprotect
+
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-static inline bool ptep_clear_flush_young(struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep)
+static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
+					    unsigned long address, pte_t *ptep)
 {
 	/*
 	 * This comment is borrowed from x86, but applies equally to RISC-V:
@@ -724,9 +805,27 @@ static inline bool ptep_clear_flush_young(struct vm_area_struct *vma,
 	 * shouldn't really matter because there's no real memory
 	 * pressure for swapout to react to. ]
 	 */
-	return ptep_test_and_clear_young(vma, address, ptep);
+	return __ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#define __ptep_clear_flush_young __ptep_clear_flush_young
+
+#define ptep_get __ptep_get
+#define ptep_get_lockless __ptep_get_lockless
+#define set_pte __set_pte
+#define set_ptes __set_ptes
+
+static inline void pte_clear(struct mm_struct *mm,
+			     unsigned long addr, pte_t *ptep)
+{
+	__pte_clear(mm, addr, ptep);
+}
+
+#define ptep_get_and_clear __ptep_get_and_clear
+#define clear_young_dirty_ptes __clear_young_dirty_ptes
+#define ptep_set_wrprotect __ptep_set_wrprotect
+#define ptep_clear_flush_young __ptep_clear_flush_young
+
 #define pgprot_nx pgprot_nx
 static inline pgprot_t pgprot_nx(pgprot_t _prot)
 {
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
