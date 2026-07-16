Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CBBC4450A
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9jEHGMWNIrkrU+y63w68fD8NrKIVH+oWizbJrrCx0g=; b=v+CCCbw3uhO9Wq
	nApg8NsvDvsaSp4N1EdT8wcs1piRJ3L9lxtx5P/f9c6LpVk2/A43qcqf0RVv9uP6gmRCuPiYv4s3l
	uwqqL/kSQvyYTzNRJ4PCVSIKUcgtWTMVNcrg06v3pr/dhBxJ2OZatY0QgunJYbTRTeWzKL2M81LW6
	ZW3yCAR7/fEnHOqwf9WbVeuuzb45vHyKnkrArxbAIi5Wj3LcHuQLBiB7pSZFsUS+K+NV+2W3ziw5c
	1kamG4p+g+IfIh6oIMKIK2AZsd+/S5PG1e7IgCaX6g49y5KLJEt3OdWWj9PqCgfEqYSgP9n5tk/ua
	7fnTIYgvWQ0S4d9NNlEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRE-0000000HIdb-2Chc;
	Thu, 16 Jul 2026 12:43:40 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLRC-0000000HIal-2SLk
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:43:40 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c998fd549a8so4401303a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205818; x=1784810618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z21FwdUtYh7DDT6q0cWRgWwFAJ8AfleqYSoyR88c720=;
        b=QBtI25eaiM1h0bMr1kuwbzPR33qhw51Iv3p6XkoZlDCQjutMzvRSVWNVh6bUqiBhaR
         7E2EJ3Bkdeiwq1DkxDxryMATouz7eMMspHO91Fa8qEESLcO7zsqVefQHiXEdIZznp6L/
         k2Yaa3MRfmrTQV0UzpKThe+bVUZwAQMeaar8vvLD1ogv9zOb7WIxlCOJblqw3le4JrFJ
         vnmL4BrD9SjOLw/6i3srDrnk/rRiBX7RfhgdvZxWADpEk8EtM4Rg/k+fbx8ybtP6YnZq
         6vv3QanbWoBMiEdw/rJuPBMAtuIUR5xef0TPp0Sqau3J/popHhzLQW+ycmyAl8MgFLAf
         iILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205818; x=1784810618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z21FwdUtYh7DDT6q0cWRgWwFAJ8AfleqYSoyR88c720=;
        b=TEvgHP7DV8ktlf8cuT/0swfbsM83FY0iErLjBFeqCrbmh3ChjjAZ3od5PIfAclCWGB
         k0EdkjNLOhDFi8OXIsyvlRYM0A722WdO8xz3XQESevYrqcQ/kfL/Xuqk/KUOJfCWy8J6
         qp1geGOvX4SjmQAnQWnAU2KsFjIGJWEq87Pw4CJ9iRmSlGcqEzNBXVIJ3wHY471VPVR/
         h6UzwE3Vt00zB2ATprVbqlgs2EXhr/EhuxgBiFxdOWRHe5ywIe0NNFPCejnoLcfPbBMJ
         ZXp9/bXsok3D41BxYPdHB45/0bBR7kD89S84MRbABtlxGPZbAEK7H3k3Nc9gsCD66A98
         OdDg==
X-Forwarded-Encrypted: i=1; AHgh+RrCLtrMWU9r1xOPxBnfNTRcXqd0eVuBy5+O6uxh6uttrQ78ecfpCriGFLZk3RsZo2vdubLZySOH/T4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzALCmP2ejl5e12fbR/E6Zhs02lbSue6Ny4EAyBfPslnqSIj9d7
	UNS9mUoZrnSSovYmH0Cy6NnghMELmSxIa/CMBUQzQde0JiJ30ysdkeJZxWGl4KIMOKg=
X-Gm-Gg: AfdE7cmn/7evBxbTwAKu0CRxKn7UDsTkYG9txNPvXQBLOnEruY2KOGcsO3lntygg09Z
	elnbGMS26f99CLiuFQld6WQoYuKthV9O4DO1PStStdawtH3XILufkvS5un+d1ZIRQcDJ9F5styb
	5ArElS9+nS/frjCkbx75w/OS9Kcu3vE2epD9zHS5rXFNoGYQQO5vGPBMNL/OaCuyWfAKduXPNMW
	rbRD9N7AdUePXO6sIDGzShnKo1l5ZJHxZYPuM1zrOC+8x8xCppn49XjvceDSL9dumMMFXhTRCGy
	+abNAa5ruiG9exBWDSqNFI0lQ7z9BZu1gRkn1f9HiVxN7dB+J9jMVY9wTNxLQxM4E6bYfj6pOAK
	AtwWiVEcMaP3VSQtv70IDPxFIUpNpOAp3afPbmUb/3Gk8F2fes8kW/9Izvkt5p/fMDFx/G+gfru
	ShfJ326Yiu3zsLz/RM423J3nQ=
X-Received: by 2002:a05:6a21:a98:b0:3bf:6c08:fb88 with SMTP id adf61e73a8af0-3c36c3e7638mr7532060637.56.1784205817786;
        Thu, 16 Jul 2026 05:43:37 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.43.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:43:37 -0700 (PDT)
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
Subject: [PATCH v2 06/15] riscv: make pte_batch_hint() honor folio batch flags
Date: Thu, 16 Jul 2026 20:41:41 +0800
Message-Id: <40bc1db57d1fdad482a32ca6aa95031f7d5676e1.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054338_644873_DEC2C097 
X-CRM114-Status: GOOD (  14.04  )
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

Svnapot folded mappings may be exposed through a logical per-page PTE
view instead of the raw encoded block entry. Generic folio batching code
already defines which PTE bits are ignored when comparing entries, and
folded mappings need to use the same comparison rules. Otherwise RISC-V
can reject a batch that generic MM would consider equivalent simply
because the hint path compared a different view of the same mapping.

Install a Svnapot-aware pte_batch_hint() implementation. If the caller
passes a logical sub-PTE instead of a raw NAPOT entry, rebuild the
corresponding block PTE first, apply the same folio batch flags as the
generic batching code, and only return a multi-entry hint if the
remaining raw PTEs in the folded block still match.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 26 +++++++++++++
 arch/riscv/mm/contpte.c          | 66 ++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 771faabb2b00b..da7ffea0dcd98 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -6,6 +6,13 @@
 #ifndef _ASM_RISCV_PGTABLE_H
 #define _ASM_RISCV_PGTABLE_H
 
+#ifndef __ASSEMBLY__
+#ifndef __LINUX_FPB_T
+#define __LINUX_FPB_T
+typedef int __bitwise fpb_t;
+#endif
+#endif
+
 #include <linux/mmzone.h>
 #include <linux/sizes.h>
 
@@ -591,6 +598,8 @@ void napotpte_clear_young_dirty_ptes(struct vm_area_struct *vma,
 				     unsigned int nr, cydp_t flags);
 void napotpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
 			     pte_t *ptep, unsigned int nr);
+unsigned int napotpte_pte_batch_hint_from_pte(pte_t *ptep, pte_t orig_pte,
+					      fpb_t flags);
 int napotpte_ptep_set_access_flags(struct vm_area_struct *vma,
 				   unsigned long address, pte_t *ptep,
 				   pte_t entry, int dirty);
@@ -1033,6 +1042,16 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return napotpte_ptep_clear_flush_young(vma, address, ptep);
 }
 
+#define pte_batch_hint pte_batch_hint
+static inline unsigned int
+pte_batch_hint(pte_t *ptep, pte_t pte, fpb_t flags)
+{
+	if (!pte_present(pte))
+		return 1;
+
+	return napotpte_pte_batch_hint_from_pte(ptep, pte, flags);
+}
+
 #else /* CONFIG_RISCV_ISA_SVNAPOT */
 
 #define napotpte_ptep_set_access_flags(vma, address, ptep, entry, dirty) \
@@ -1095,6 +1114,13 @@ static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
 #define ptep_clear_flush_young __ptep_clear_flush_young
 
+#define pte_batch_hint pte_batch_hint
+static inline unsigned int
+pte_batch_hint(pte_t *ptep, pte_t pte, fpb_t flags)
+{
+	return 1;
+}
+
 #endif /* CONFIG_RISCV_ISA_SVNAPOT */
 
 #define set_pte __set_pte
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 3f8a0a2970afb..9ffdffdc2b0c0 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -176,6 +176,32 @@ static inline bool napotpte_is_consistent(pte_t pte, pte_t orig_pte)
 	       pte_val(pte_mask_ad(pte)) == pte_val(pte_mask_ad(orig_pte));
 }
 
+static inline bool
+napotpte_is_batch_consistent(pte_t pte, pte_t batch_pte, fpb_t flags)
+{
+	return pte_present_napot(pte) &&
+	       pte_val(__pte_batch_clear_ignored(pte, flags)) ==
+	       pte_val(batch_pte);
+}
+
+static inline pte_t
+napotpte_normalize_batch_pte(pte_t *ptep, pte_t orig_pte, fpb_t flags)
+{
+	unsigned long pfn;
+	pgprot_t prot;
+	unsigned int off;
+
+	if (pte_present_napot(orig_pte))
+		return __pte_batch_clear_ignored(orig_pte, flags);
+
+	off = ptep - napot_align_ptep(ptep);
+	pfn = pte_pfn(orig_pte) - off;
+	prot = __pgprot(pte_protval_no_pfn_no_napot(orig_pte));
+
+	return __pte_batch_clear_ignored(pte_mknapot(pfn_pte(pfn, prot),
+					     napotpte_order()), flags);
+}
+
 static bool napotpte_all_subptes_same(pte_t *ptep, pte_t expected_pte)
 {
 	pte_t *start;
@@ -328,6 +354,46 @@ pte_t napotpte_ptep_get_lockless(pte_t *orig_ptep)
 }
 EXPORT_SYMBOL(napotpte_ptep_get_lockless);
 
+unsigned int napotpte_pte_batch_hint_from_pte(pte_t *ptep, pte_t orig_pte,
+					      fpb_t flags)
+{
+	pte_t batch_pte, pte;
+	pte_t *start;
+	unsigned int i, nr, off;
+
+	if (!napot_hw_supported())
+		return 1;
+
+	if (!pte_present_napot(orig_pte) && !pte_present_napot(READ_ONCE(*ptep)))
+		return 1;
+
+	/*
+	 * @orig_pte may be either the raw NAPOT entry read from the page
+	 * table or the logical sub-PTE returned by ptep_get(). In the latter
+	 * case, the public view has the NAPOT bit stripped and the PFN adjusted
+	 * by the slot offset within the folded block.
+	 *
+	 * If the caller passes a logical sub-PTE, rebuild the corresponding
+	 * block PTE first. Then apply the same folio batch flags as the generic
+	 * batching code, and only return a multi-entry hint if every remaining
+	 * raw PTE in the folded block still matches.
+	 */
+	batch_pte = napotpte_normalize_batch_pte(ptep, orig_pte, flags);
+
+	start = napot_align_ptep(ptep);
+	nr = napotpte_pte_num();
+	off = ptep - start;
+
+	for (i = off; i < nr; i++) {
+		pte = READ_ONCE(start[i]);
+		if (!napotpte_is_batch_consistent(pte, batch_pte, flags))
+			return 1;
+	}
+
+	return nr - off;
+}
+EXPORT_SYMBOL(napotpte_pte_batch_hint_from_pte);
+
 static void napotpte_try_unfold_range(struct mm_struct *mm,
 				      unsigned long addr, pte_t *ptep,
 				      unsigned int nr)
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
