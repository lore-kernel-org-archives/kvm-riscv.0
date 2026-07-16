Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F34EC44501
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 12:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WK0upYE4hkmZRLjtJPmVU2ukzXdfGzUoY7xwA2Bd0Nc=; b=uusd3PNDaOBs36
	D8wlOuS6a8W46gt6z4MgtWSJPq52Ld6F07xBfi67z2c4stx50OyRKD7KZ69s4UmSmJ52Dg6clbmlA
	Rz4c8Kk6QnpnOuv249NDM/GXwITJxGgjj2rbdlfhsB2xnZcN8pYFm4OH3bWM3mSDUYXL+JY4WFCqo
	2LBrOSGtdPxuW0jkzA3Qj3IRWkzqcm3xDnq1dL6+3vwq8Y34+dn98S5Drbp9cX4gcUL62jwxrBhF9
	XWjaY2C/aFGTX6SEcqPGCDYBrj5HpGaolQil6bjEG1jWVQikSijNwrCbP7cOkKUpu3kdYbQECjUKs
	SKn3hWA0QPGdvRSDsXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSR-0000000HKDt-100G;
	Thu, 16 Jul 2026 12:44:55 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLSL-0000000HK7N-448w
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 12:44:53 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so2825957a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1784205889; x=1784810689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P62EVeZeD6Lr+EK73ByExkJlzskm2POoZpW1kwtVtAQ=;
        b=KKPb15WMnCnTyW5QBnp4ufHS6cR8ccx+A+zqF9/Y0NBpZf0vudrOAkyveQGYkQpQpR
         ZMBCTUhgEluIK7+LeQNvl4gUMpilnRO54kkMTYfZVrenbWCbAFZ+PQwPWm0mVL1Zz39M
         BKLrtQwctSp4c12a+ATSW7071vbNEYYROHw29Ra5vSJQW3FJPO+ZhYHoxMVV4tg10QyG
         ilprh/LPCSFApTJdNnIGXazOjhstb5QIG2Bt+8fv/txqy+8kP8ZAPkyrrwaA6gmrbA+T
         tAaGD3oimvEO9NabUtFlgdbRmRobh6CJR4R+eiQ4cY6+xsAW2l9vZT9xO8UUJpa6obxH
         PDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205889; x=1784810689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P62EVeZeD6Lr+EK73ByExkJlzskm2POoZpW1kwtVtAQ=;
        b=Top04GGkQLANMqASmaJIySHb6CQ3o7ZpbfbEuWJ7HwddpnmQwOAXHNkz95K4bq2O0T
         SMl6FZLJl0r7ko/PK+C1az73kth6xMWPzslWU6LSjoEYUwJLbSCOE8ENXEX82N4Bn40q
         urv/8oKeL2Xmq6p9KMh+ZSDLBV1TD75s9WmmODRzfV2C1rqz6opo5emEeUiJ6gbbplUl
         K6PIV8xrE6nYaZQB5rVIiP7xn2/Pr0J6T8E3bmnvWgEIN7sAKYeWpSesYYc7BQXh3L+6
         Oh8Li5NrgplV/j2qoyke4i+U57qiMrCJXbbNcBQt22Y9Is3uPpKxIjXH/p0IAvPKkM3O
         dMvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqq6rW2za70+0fKFyRwxn7xX22Kcos1KJTEqQCDqGVVhffyZieWAoY2i68WdN0Js7tOufRwiyaZBXc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHUAGUVWKZBXik0TO37wVOtancFpyqUTga3O0Ozf2KExhRZNqJ
	CyCC+3oxhcxSdLb8vRARJWJWXYtUtUOPQRlLsmb0NX/ctoe1ZbvXb1ViUbaXkwi4iiY=
X-Gm-Gg: AfdE7clIfJjXWVjNfcSWTdVPCDPcxvm4B6t+/G2Q5w2rGdeGzROfovrUWhQ9qehOxk4
	9r12HMl3jYQS8x5Mdhl/vkNzP4V9pNesxLMW6v1xR5x8mxtswYY50EYLh+iHzdjn8JC/+MRC65B
	jTYoVel+5GtHuIJKL318cegnyrW5Jcs37WaYxNqCJHMOiRS9jiDrciE3E0f5Jprs9/ksHGjFhi8
	BQ0uyWKLQjmWbiXMSAaWQIKcuG23UvSTFCJWreO3mMdhzFq8xCTG1hSSI6VSeL52+FG2qdtc/pw
	5nOE85t1wmW/DJKK0UNJEL07dGgGO2ZFe5uMYkYLtVy9MFXhLqG/CcECKy5+6j2j7HpLdNszVYa
	h6sp79SlLdR7uQwsUpzh1Q0Ju7PHdELFwhs7EviShFPuWlodQYbtPqB/zLnxRWRuSmMhATt9S1w
	KUDymkckePuYs5JDrZVp+Y1O8=
X-Received: by 2002:a05:6a21:7117:b0:3c3:89ce:b5bc with SMTP id adf61e73a8af0-3c389ced5b6mr3647677637.15.1784205889298;
        Thu, 16 Jul 2026 05:44:49 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([2408:8606:1800:501::2:f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258eeaba2sm1730793a12.12.2026.07.16.05.44.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Jul 2026 05:44:48 -0700 (PDT)
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
Subject: [PATCH v2 14/15] riscv/mm: optimize mprotect for Svnapot mappings
Date: Thu, 16 Jul 2026 20:41:49 +0800
Message-Id: <8b79ddc3311e1dc32b150b7efbaed5a187ee5ccd.1784201104.git.cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <cover.1784201104.git.cuiyunhui@bytedance.com>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_054450_078829_BA1BED6D 
X-CRM114-Status: GOOD (  10.96  )
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

Svnapot represents a naturally aligned range as a block of base PTEs, but
generic mprotect() still processes a full block one base PTE at a time.
For a full-block permission change, that repeatedly clears and reinstalls
the same logical mapping and then has to reconstruct the folded Svnapot
block afterwards, making the operation unnecessarily expensive.

Use the batched protection transaction hooks to handle a full Svnapot
block as one operation. The fast path is restricted to user mappings
where hardware Svnapot is supported, the range is exactly one aligned
Svnapot block, and every sub-PTE is consistent with the block PTE. The
generic per-PTE fallback remains in place for partial, unaligned, special,
non-user, or otherwise inconsistent mappings.

libMicro mprotect median latency improves on the full-block cases:

  mprot_tw4m   (-l 4m   -w -t -f /dev/zero): 40.4 us -> 4.3 us
  mprot_tw128k (-l 128k -w -t -f /dev/zero): about 15-16% faster

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h |  8 ++++
 arch/riscv/mm/contpte.c          | 76 ++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 3727c148fa0fc..b546e6614c558 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -619,6 +619,14 @@ int napotpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
 				       unsigned long address, pte_t *ptep);
 int napotpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 				    unsigned long address, pte_t *ptep);
+#define modify_prot_start_ptes modify_prot_start_ptes
+pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
+			     unsigned long addr, pte_t *ptep,
+			     unsigned int nr);
+#define modify_prot_commit_ptes modify_prot_commit_ptes
+void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, pte_t old_pte, pte_t pte,
+			     unsigned int nr);
 #endif
 
 #ifdef CONFIG_ARCH_HAS_PTE_PROTNONE
diff --git a/arch/riscv/mm/contpte.c b/arch/riscv/mm/contpte.c
index 8289f39d6e188..6a1156629d115 100644
--- a/arch/riscv/mm/contpte.c
+++ b/arch/riscv/mm/contpte.c
@@ -190,6 +190,82 @@ napotpte_is_batch_consistent(pte_t pte, pte_t batch_pte, fpb_t flags)
 	       pte_val(batch_pte);
 }
 
+static bool napotpte_can_modify_prot_block(struct mm_struct *mm,
+					   unsigned long addr, pte_t *ptep,
+					   unsigned int nr, pte_t *raw_pte)
+{
+	pte_t raw, pte;
+	unsigned int i;
+
+	if (!napot_hw_supported() || !mm_is_user(mm))
+		return false;
+
+	if (nr != napotpte_pte_num())
+		return false;
+
+	if (addr != napot_align_addr(addr) || ptep != napot_align_ptep(ptep))
+		return false;
+
+	raw = READ_ONCE(*ptep);
+	if (!pte_present_napot(raw) || pte_special(raw))
+		return false;
+
+	for (i = 0; i < nr; i++) {
+		pte = READ_ONCE(ptep[i]);
+		if (!napotpte_is_consistent(pte, raw))
+			return false;
+	}
+
+	*raw_pte = raw;
+	return true;
+}
+
+pte_t modify_prot_start_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, unsigned int nr)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long ptent_addr;
+	pte_t raw, pte, ptent;
+	unsigned int i;
+
+	if (napotpte_can_modify_prot_block(mm, addr, ptep, nr, &raw)) {
+		pte = pte_mknonnapot(raw, addr);
+
+		for (i = 0; i < nr; i++) {
+			ptent_addr = addr + i * PAGE_SIZE;
+			ptent = __ptep_get_and_clear_noptc(ptep + i);
+			page_table_check_pte_clear(mm, ptent_addr,
+						   pte_mknonnapot(ptent, ptent_addr));
+			if (pte_dirty(ptent))
+				pte = riscv_pte_mkhwdirty(pte);
+			if (pte_young(ptent))
+				pte = pte_mkyoung(pte);
+		}
+
+		return pte;
+	}
+
+	pte = __ptep_modify_prot_start(vma, addr, ptep);
+	while (--nr) {
+		ptep++;
+		addr += PAGE_SIZE;
+		ptent = __ptep_modify_prot_start(vma, addr, ptep);
+		if (pte_dirty(ptent))
+			pte = pte_mkdirty(pte);
+		if (pte_young(ptent))
+			pte = pte_mkyoung(pte);
+	}
+
+	return pte;
+}
+
+void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
+			     pte_t *ptep, pte_t old_pte, pte_t pte,
+			     unsigned int nr)
+{
+	set_ptes(vma->vm_mm, addr, ptep, pte, nr);
+}
+
 static inline pte_t
 napotpte_normalize_batch_pte(pte_t *ptep, pte_t orig_pte, fpb_t flags)
 {
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
