Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F4EF8A165
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7t1Rtg60ivIi7QfbrKAS4ey5GrNfVzck8YxwNsFXSz8=; b=ppmWCJYNvkLe79
	gVZ1Zz2b9FJlK0/+ZFdaeZvnzFljtnzFo5cf5030OegNKLNJ+akbpBhRFUqUnoiJUXTq2TzxI2mM5
	8pGESCvHFT4hhmAJnMZC6mWYDyvRjt1VghJH+sDZ9Hr+A51xGOqHqy0VKlsSiO87ZeLocBuyj1YbL
	2uI1Q/qyNlS7OQU2YOIz7O8yvdljg8AXcq5F1vUqnK+OoGa7Tjg80UADago5HWLlHe7wTNVJ5ZlcI
	g5fQkYPzbrhOabBeevZTnbNUTET4LB6crlb+JHYlx+2BDZl7D45P9JhXm5pDiHfT2ycwq26CX1e5c
	PlTg6Lv82VoOgg24C7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLJS-00000002PcX-3xVN;
	Thu, 16 Apr 2026 11:55:14 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDLJP-00000002Pc9-2BfL
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 11:55:13 +0000
X-UUID: 198fefbe398b11f1aa26b74ffac11d73-20260416
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:98a00aad-e37c-45f3-b942-030825a6e46f,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:98a00aad-e37c-45f3-b942-030825a6e46f,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:16a0a90abc718f0981839f4f3e1b20ae,BulkI
	D:260416195506DHI8S6TB,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102|127|
	898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 198fefbe398b11f1aa26b74ffac11d73-20260416
X-User: cuitao@kylinos.cn
Received: from ctao-book.. [(183.242.174.20)] by mailgw.kylinos.cn
	(envelope-from <cuitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1208771587; Thu, 16 Apr 2026 19:55:01 +0800
From: cuitao <cuitao@kylinos.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kvm-riscv@lists.infradead.org
Cc: alex@ghiti.fr,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	kevin.brodsky@arm.com,
	cuitao <cuitao@kylinos.cn>
Subject: [PATCH 2/2] riscv: mm: use pXX_none() instead of raw pXX_val() == 0 checks
Date: Thu, 16 Apr 2026 19:54:39 +0800
Message-ID: <20260416115439.58042-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_045511_895526_89AE263A 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
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

The page table entry empty checks in create_pud_mapping,
create_p4d_mapping, and create_pgd_mapping use open-coded
pud_val()/p4d_val()/pgd_val() comparisons against zero, while
create_pmd_mapping and create_pte_mapping use the proper pmd_none()
and pte_none() helpers.

Using pXX_none() is the canonical and portable way to check for empty
entries.

Signed-off-by: cuitao <cuitao@kylinos.cn>
---
 arch/riscv/mm/init.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..33af0958a65d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -638,12 +638,12 @@ static void __meminit create_pud_mapping(pud_t *pudp, uintptr_t va, phys_addr_t
 	uintptr_t pud_index = pud_index(va);
 
 	if (sz == PUD_SIZE) {
-		if (pud_val(pudp[pud_index]) == 0)
+		if (pud_none(pudp[pud_index]))
 			pudp[pud_index] = pfn_pud(PFN_DOWN(pa), prot);
 		return;
 	}
 
-	if (pud_val(pudp[pud_index]) == 0) {
+	if (pud_none(pudp[pud_index])) {
 		next_phys = pt_ops.alloc_pmd(va);
 		pudp[pud_index] = pfn_pud(PFN_DOWN(next_phys), PAGE_TABLE);
 		nextp = pt_ops.get_pmd_virt(next_phys);
@@ -664,12 +664,12 @@ static void __meminit create_p4d_mapping(p4d_t *p4dp, uintptr_t va, phys_addr_t
 	uintptr_t p4d_index = p4d_index(va);
 
 	if (sz == P4D_SIZE) {
-		if (p4d_val(p4dp[p4d_index]) == 0)
+		if (p4d_none(p4dp[p4d_index]))
 			p4dp[p4d_index] = pfn_p4d(PFN_DOWN(pa), prot);
 		return;
 	}
 
-	if (p4d_val(p4dp[p4d_index]) == 0) {
+	if (p4d_none(p4dp[p4d_index])) {
 		next_phys = pt_ops.alloc_pud(va);
 		p4dp[p4d_index] = pfn_p4d(PFN_DOWN(next_phys), PAGE_TABLE);
 		nextp = pt_ops.get_pud_virt(next_phys);
@@ -721,12 +721,12 @@ void __meminit create_pgd_mapping(pgd_t *pgdp, uintptr_t va, phys_addr_t pa, phy
 	uintptr_t pgd_idx = pgd_index(va);
 
 	if (sz == PGDIR_SIZE) {
-		if (pgd_val(pgdp[pgd_idx]) == 0)
+		if (pgd_none(pgdp[pgd_idx]))
 			pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(pa), prot);
 		return;
 	}
 
-	if (pgd_val(pgdp[pgd_idx]) == 0) {
+	if (pgd_none(pgdp[pgd_idx])) {
 		next_phys = alloc_pgd_next(va);
 		pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE);
 		nextp = get_pgd_next_virt(next_phys);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
