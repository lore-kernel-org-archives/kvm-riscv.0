Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E56C44507
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 14:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdkNiO3IcfXbA6baY3ZPNuydoF8Eih+dc0w8owfjrQY=; b=C9W/djI3/HCbUS
	mvInpUlxQkE0y976kW8cySSSSlHZgPdvnhZHbCXcw+peAzRciVtp7yCPhvvpsO5MM6ZF6YsrELHHr
	mSowrALZ9YY8ogE4Nr4ycTVV6NO9lWursUgYxiAKmZArqQL9bThx6/ZI941ZI/eACkGV5kdxAWzGR
	xbhuY5ffd6G0kI/rwGH2zkql/XSkNGLefJ+XgXa4+RgrsQ5h5H9m3AwiQHJHhevWBr+FCFU1SJ+Oc
	3FGaOqUmNdE7qz5b7V+sKXADYDW1vsncaj3SKwfukVcK9VZHOaZKO/ABNy1Mer4AukkmXR3vARs7h
	0LpP7V1gC05V344zY2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHEC-00000009W4W-0jSZ;
	Mon, 13 Jul 2026 14:01:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHE7-00000009W1t-3D96;
	Mon, 13 Jul 2026 14:01:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A69112050;
	Mon, 13 Jul 2026 07:01:38 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC5243F7B4;
	Mon, 13 Jul 2026 07:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951302; bh=LOmsIF99gDivwRx9XPk8OZOaXIoiL2NNZLIFwLFlP7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MBKMtffjH/2TsrVbH+SkmMXbiGJBeEJHhF8LadP3YgGbjdont1gw/VdepmxscZqrJ
	 /zxxH1NjBOLeGlqg7U0kAEtuxNOn3OYUZZYCUv8EE0HqcQu7y53to5uLHDgursFMhJ
	 NOUTvMkS9bdptcq+ZJMUX8Jo+95uFVvJ1WPxsglA=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org
Cc: david@kernel.org,
	linux@armlinux.org.uk,
	akpm@linux-foundation.org,
	ankur.a.arora@oracle.com,
	rppt@kernel.org,
	linmag7@gmail.com,
	chleroy@kernel.org,
	klarasmodin@gmail.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	kas@kernel.org,
	zhangtianyang@loongson.cn,
	wangyuli@aosc.io,
	tsbogend@alpha.franken.de,
	ljs@kernel.org,
	jgg@ziepe.ca,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	ryan.roberts@arm.com,
	pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	kevin.brodsky@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	anshuman.khandual@arm.com,
	yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com,
	ardb@kernel.org,
	guoren@kernel.org,
	yang.li85200@gmail.com,
	viro@zeniv.linux.org.uk,
	dinguyen@kernel.org,
	schuster.simon@siemens-energy.com,
	wangruikang@iscas.ac.cn,
	junhui.liu@pigmoral.tech,
	muchun.song@linux.dev,
	vishal.moola@gmail.com,
	namcao@linutronix.de,
	pavel@kernel.org,
	djbw@kernel.org,
	yu-cheng.yu@intel.com,
	baolu.lu@linux.intel.com,
	Jonathan.Cameron@huawei.com,
	coxu@redhat.com,
	andreas@gaisler.com,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	geert@linux-m68k.org,
	shorne@gmail.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 25/34] x86: mm: remove usage of pgd_page_vaddr() for CONFIG_x86_PAE
Date: Mon, 13 Jul 2026 14:56:04 +0100
Message-ID: <20260713135614.1618183-26-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_070143_908868_14FEE013 
X-CRM114-Status: GOOD (  11.12  )
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

We want to rework how pgd_page_vaddr() behaves for generic compile-time
folded page tables by disallowing its use and triggering a compile-time
error when it is used improperly, ensuring that the actual first-level
pXd_pgtable() function is used instead.

For this, change usage of pgd_page_vaddr() to pud_pgtable() for
the functions used when CONFIG_x86_PAE is enabled where PGTABLE_LEVELS=3
and replace direct check value of pgd_val() with pud_none().

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/pgtable.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index f32facdb30354..e4bf6a1d63618 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -207,14 +207,17 @@ static int preallocate_pmds(struct mm_struct *mm, pmd_t *pmds[], int count)
  */
 static void mop_up_one_pmd(struct mm_struct *mm, pgd_t *pgdp)
 {
-	pgd_t pgd = *pgdp;
+	pud_t *pudp, pud;
 
-	if (pgd_val(pgd) != 0) {
-		pmd_t *pmd = (pmd_t *)pgd_page_vaddr(pgd);
+	pudp = pud_offset(p4d_offset(pgdp, 0), 0);
+	pud = *pudp;
 
-		pgd_clear(pgdp);
+	if (!pud_none(pud)) {
+		pmd_t *pmd = pud_pgtable(pud);
 
-		paravirt_release_pmd(pgd_val(pgd) >> PAGE_SHIFT);
+		pud_clear(pudp);
+
+		paravirt_release_pmd(pud_pfn(pud));
 		pmd_free(mm, pmd);
 		mm_dec_nr_pmds(mm);
 	}
@@ -239,23 +242,24 @@ static void pgd_mop_up_pmds(struct mm_struct *mm, pgd_t *pgdp)
 #endif
 }
 
-static void pgd_prepopulate_pmd(struct mm_struct *mm, pgd_t *pgd, pmd_t *pmds[])
+static void pgd_prepopulate_pmd(struct mm_struct *mm, pgd_t *pgdp, pmd_t *pmds[])
 {
-	p4d_t *p4d;
-	pud_t *pud;
+	pud_t *pudp, *pudp_s;
 	int i;
 
-	p4d = p4d_offset(pgd, 0);
-	pud = pud_offset(p4d, 0);
+	pudp = pud_offset(p4d_offset(pgdp, 0), 0);
 
-	for (i = 0; i < PREALLOCATED_PMDS; i++, pud++) {
+	for (i = 0; i < PREALLOCATED_PMDS; i++, pudp++) {
 		pmd_t *pmd = pmds[i];
 
-		if (i >= KERNEL_PGD_BOUNDARY)
-			memcpy(pmd, (pmd_t *)pgd_page_vaddr(swapper_pg_dir[i]),
+		if (i >= KERNEL_PGD_BOUNDARY) {
+			pudp_s = pud_offset(p4d_offset(&swapper_pg_dir[i], 0), 0);
+
+			memcpy(pmd, (pmd_t *)pud_pgtable(*pudp_s),
 			       sizeof(pmd_t) * PTRS_PER_PMD);
+		}
 
-		pud_populate(mm, pud, pmd);
+		pud_populate(mm, pudp, pmd);
 	}
 }
 
@@ -265,8 +269,8 @@ static void pgd_prepopulate_user_pmd(struct mm_struct *mm,
 {
 	pgd_t *s_pgd = kernel_to_user_pgdp(swapper_pg_dir);
 	pgd_t *u_pgd = kernel_to_user_pgdp(k_pgd);
-	p4d_t *u_p4d;
-	pud_t *u_pud;
+	p4d_t *s_p4d, *u_p4d;
+	pud_t *s_pud, *u_pud;
 	int i;
 
 	u_p4d = p4d_offset(u_pgd, 0);
@@ -278,7 +282,10 @@ static void pgd_prepopulate_user_pmd(struct mm_struct *mm,
 	for (i = 0; i < PREALLOCATED_USER_PMDS; i++, u_pud++, s_pgd++) {
 		pmd_t *pmd = pmds[i];
 
-		memcpy(pmd, (pmd_t *)pgd_page_vaddr(*s_pgd),
+		s_p4d = p4d_offset(s_pgd, 0);
+		s_pud = pud_offset(s_p4d, 0);
+
+		memcpy(pmd, (pmd_t *)pud_pgtable(*s_pud),
 		       sizeof(pmd_t) * PTRS_PER_PMD);
 
 		pud_populate(mm, u_pud, pmd);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
