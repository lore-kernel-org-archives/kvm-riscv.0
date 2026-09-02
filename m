Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC16C624D0
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwLxuzrwPd0PR53vxEfLM8b5B0FyWYZHaqzf8W16xAo=; b=MtqJEfPdftD5MH
	zEmaANOgzXrnG4BV0v6mETWPx6kj1FBI7NPQtlIId2d7m3imcc0H3AODt+ffWfbpAe2fMDPVpkNj8
	JVdIuaxcrwSV6zdgvK/fsQ58+qq2T6no7uczQFMMyqM3mm+JXhb1v0fkzq+zIJ3iClfJT6C3zokQs
	g5LlNhrpLZxA9kVMaFqe00wFubHCUVA+aUzjW5TIhbg5mESFhP9Z6fyTyM+/FVXFGXH51RbCCCjZ+
	COc7+z6jr+9FFKXQyYlH/3xrHZsAk/0U/Bsi5Zh0aoQrUKY1AhspRCftV5dzvR3k+S419lBpcbXEi
	iG9E31Nb+S/UGTePDmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbg-0000000EaYs-0bLW;
	Wed, 02 Sep 2026 11:58:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbe-0000000EaXY-3smH;
	Wed, 02 Sep 2026 11:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WTVkw3ab/CFKRCPfMcchLiqENpkcFUwtICs+m7pnNZQ=; b=Ipg9+vOxU88LEugAaOo7msVJOD
	I9Gdrb/7DuFj/+TVVbXpwebYXVZ4cfw5qKoQglTRbZUvRb+hMPMYPGaJFtVJKB1t/XOGjHj6+fD/Q
	HtQ9qSdBD5PdyC21fdNKw4X9uJbC+siY16oKQZ0xHLwOtSjk0Cx+bmi5xNHRodpjDg5aeEVFAtl6C
	F1QTd8HOFhxK53xh1GcPeXMdrHmGHiOOxuJKAjnVB2Sfd9xHtstbkregCHPmARhhCqDYvJJy2s9xW
	y3dkQ/Zg2knnKTZ6A6KFWA1WJZ+LRxXKo0MfRYkcbVdPpuqFj+tLZesv7QMtC2AI2M/8TlQ+EQCap
	ndc8psmA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1jbb-0000000Bvlu-1Hca;
	Wed, 02 Sep 2026 11:58:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EBA71D70;
	Wed,  2 Sep 2026 04:58:10 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9AEF93F85F;
	Wed,  2 Sep 2026 04:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350293; bh=lMx8oDxLrRJvH9eMXBjYWF4f+9ZOpE9Y518eoKaPMJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=krO2cV0wUbHoNz4HiaCO7WUC3BC407rFyRRBRidPDVLMxsiarl33hEi5TdBmSfdAe
	 bp001uGnvUM1OPwKydsZG2MF9KK8CeaZyIGT4eRDw5V4mnQ/BGbKmieKcomRbkNsOO
	 CBFUA5OOE9OOa3d84FuizOQSQ6+w2BL4az9e0MS4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:15 +0100
Subject: [PATCH RFC v3 13/21] x86: mm: use pgtable_level enum in
 effective_prot_pXd()
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-13-5d8f5b17c25c@arm.com>
References: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
In-Reply-To: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
To: Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-openrisc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2103; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=lMx8oDxLrRJvH9eMXBjYWF4f+9ZOpE9Y518eoKaPMJE=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7orgNlXXrDglsxwFE6HkLoSMOcv+hn/RGo5
 OZ6Np01hJGJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO6AAKCRBt1cPRWsUx
 M6wOC/4jh3pwjU1HOyorFYcxwSr12oxSEh2yyO74vVtlI7NHpYX5RUUsEZYTnG7+qkDv6ow2iGZ
 AmD3S0ZBxZOzZv9316P62wrPLZu+N3mv3CRuoY27dQMaReBMceQ+4a2CinVFRCeQ7E8m6YIVk5O
 fro0sHSel4RIL4bWa5rTIGwerRJl1goYmC75WreM/MYuWJL9fYxHraDTdlqR0RNnFE4gqF80Jgs
 4TXQWJxntju4OCT7na2A1iAhwi+TjtYBPuj+OQUT0ds/9dAZMHzM6isjqvaOSBhSxnnYfCreX22
 bIQgyPKV3lI59hX7t0N7MG8fUyfmZiMKbPaY7VeioNA7Uswd+OSBeEXQYLmX4ZXfMx/qi5w198K
 t83/WRBdsBEQeChKPf05sHb1SVA5a260F4YS5f6T18Mq2g6xHN41XtDkUgU9rLheidhBTkRZ93w
 LncxMkb9iEoBk6h2+9ACSJ73MImH+il0LpD5x3Akn/XsjQWHN76L6I8KnDsqy5cVwct7g=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_125815_735313_6C74A5C8 
X-CRM114-Status: GOOD (  10.68  )
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

Instead of using hard-coded integer in effective_prot_pXd(), use
pgtable level enum.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/dump_pagetables.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 2afa7a23340e..a18a61e732c3 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -248,13 +248,13 @@ static void note_wx(struct pg_state *st, unsigned long addr)
 		  (void *)st->start_address);
 }
 
-static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
+static void effective_prot(struct ptdump_state *pt_st, enum pgtable_level level, u64 val)
 {
 	struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
 	pgprotval_t prot = val & PTE_FLAGS_MASK;
 	pgprotval_t effective;
 
-	if (level > 0) {
+	if (level > PGTABLE_LEVEL_PGD) {
 		pgprotval_t higher_prot = st->prot_levels[level - 1];
 
 		effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
@@ -268,27 +268,27 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
 
 static void effective_prot_pte(struct ptdump_state *st, pte_t pte)
 {
-	effective_prot(st, 4, pte_val(pte));
+	effective_prot(st, PGTABLE_LEVEL_PTE, pte_val(pte));
 }
 
 static void effective_prot_pmd(struct ptdump_state *st, pmd_t pmd)
 {
-	effective_prot(st, 3, pmd_val(pmd));
+	effective_prot(st, PGTABLE_LEVEL_PMD, pmd_val(pmd));
 }
 
 static void effective_prot_pud(struct ptdump_state *st, pud_t pud)
 {
-	effective_prot(st, 2, pud_val(pud));
+	effective_prot(st, PGTABLE_LEVEL_PUD, pud_val(pud));
 }
 
 static void effective_prot_p4d(struct ptdump_state *st, p4d_t p4d)
 {
-	effective_prot(st, 1, p4d_val(p4d));
+	effective_prot(st, PGTABLE_LEVEL_P4D, p4d_val(p4d));
 }
 
 static void effective_prot_pgd(struct ptdump_state *st, pgd_t pgd)
 {
-	effective_prot(st, 0, pgd_val(pgd));
+	effective_prot(st, PGTABLE_LEVEL_PGD, pgd_val(pgd));
 }
 
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
