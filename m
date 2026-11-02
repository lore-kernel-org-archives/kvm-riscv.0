Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44B060A383C
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TvbkfAkx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Ln7RvOvc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=S6G8eANt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QvKA/9xcC86MS776wp/YzcOkq3k+QokiSkM9xXhg1Ls=; b=TvbkfAkxqYe0/dcHjgrDT6Q3j4
	VIrIQmW+ClvgaywTw0iwAWx0IYj4H7gHMeKgla0QGjsSUczMwbAMj8nOQQiADA9rW4RvdJ1q/ePla
	ALheTNlWo1tRfqpexcwsIVa5NpPD38e+mjvDzOR5cFdBtHC1uOncCa7tQQvXjuvPwGDM7ujl4dbyy
	GaHJqntyPbfTxorr6VWVorH0xqvwESdw2HbzHTo0DAaM0Or72I7rWem7niwp0rw3kfmjPpQC+tamg
	JfJGtlr6j96lAYVCmDXcQ81Z1uXWa5gfuU1Wdp5QNesyJDzZj0I7cABhuO3vwN4ZfugFVPPtSQwjF
	xvSwqZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq89-0000000GJjP-1nPT;
	Mon, 02 Nov 2026 11:23:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq88-0000000GJhB-243Y;
	Mon, 02 Nov 2026 11:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eb9H+uxRvArRVVJKhsUr+93SDYJ1x6sKU3xCIma4RUU=; b=Ln7RvOvcz3pzVJZkdmbIIllpbs
	ujotoImP/3Q3ZCwzjT9oWJDzunOxwRfXpcvogPBvECX/fd6Ys8zwhxUnwYKMh/ILj9g4Dz0A8rx7p
	Lf5TLjDYTzMCY7PSSY52CZPSgAARmDJ6k9BHq8lVjxkvon7TSv+ixr/YC+9DgC98o5qdayAkernRL
	+grCwhfQCDopsnltvUsWCT6qTkFOLSnaseMg7ODUv9HNPN6fjzGww9NaEEm50R6OYJ+wGrNaHIB+c
	MGQ6Muz/qQTFYms719gz0h9EJiF5EWjZ6EtGAdHt2WL9xy19UHBIMk6KONfFKfOkcvN0PgHm6fL+D
	WYOeuHKQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq83-00000002Qd8-3GAt;
	Mon, 02 Nov 2026 11:23:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EBDA1691;
	Mon,  2 Nov 2026 03:23:02 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 254863F632;
	Mon,  2 Nov 2026 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618585; bh=zghhBXP63HUkMVsnVTW1BBI8m5GQHzJyarBmwmrVkLw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S6G8eANtslFyveBpwPLZwAJIlHGPtPzLOZkPNUbQZrbf/e83nfgLtEhyRdEl+CKWq
	 qbwPr2yNqC5ubwdh6TO7JSUkTYZQmq68VurvEE5YHy1zupilBrGF0jDnFDGjxNIWLR
	 ZIyYkP1apZziEAVLn/pciEqxsStbIpEa7Hh9LprE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:27 +0000
Subject: [PATCH RESEND v2 14/21] x86: mm: use pgtable_level enum in
 effective_prot_pXd()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-14-78840b2ec73c@arm.com>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
In-Reply-To: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2497; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=zghhBXP63HUkMVsnVTW1BBI8m5GQHzJyarBmwmrVkLw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HI1tf/eYu583XiESkJqcFh0Ln97GwifsA4yJ
 5hjudYl5LCJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyNQAKCRBt1cPRWsUx
 M7CXC/9fvtgv/f2rLKFCQe85Z/Wsksb1TC8gpZAQmESeMsNOLwhQJwTmCgEHPluLgWZmholGaYO
 PnqbceUGyr1pcmOkepbh9WeQhL4X2VSfrEtz0/h20WYKiCUi6DjQ3COgz2a7ktLMFI97hvziCdm
 bvP/6V7nAGdhgaX5vVjhY3R9ZwFtaoK1vBgC48ycNo9pXyZAfuFvBcRGqEYuq6LOBAI/hFZIZcH
 xqCDdDYjQPSZH2av9CiYtQwZF5ykGASC3RunuGlgf5r27ykbJeWBfHvdzeoW2F3QkYqyH2l0vU0
 Z0S7et8IybfbSLMVGkurx+pcnIm7053a78ucdXh1zT6HrolfrzEBXSYNJluRMeCZjjAIH2AV5sC
 t8UzGaK5BaQLzP07023I0MrQcTZipUNmqyxr6TiuRmJaiSFAezEea6wC8bi5Jlni2CUujgPL+pY
 1hdZrIDSt+PFoWQZaFdmoxibu5GmrsqgFCoMZphc2Vn0XSC70lJ+vtovtimon2aZhoE9g=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_112309_552757_E26D64CC 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -2.5 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Instead of using hard-coded integers in effective_prot_pXd(), use the
page-table level enum so that architecture code does not need to know
the numeric value of each page-table level, while also providing type
safety.

This also prepares for using generic MM helpers, mm_first_pgtable_level()
which use symbolic names for page-table levels rather than integers.

There should be no functional change.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/dump_pagetables.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 2afa7a23340e9..a18a61e732c3d 100644
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
