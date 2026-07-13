Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D5BC43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=roEJx40Wc012HFCPfQ0RCKzQ9wj/BHe0mocD8CvEeMg=; b=t4KkadMaQlwIfA
	DnYtqec7d/Rb4iy8Yut9lBY+vZE1Vc7d/FvY3ELLNyAu2bS4WJHowU+je7ChTeEp9i3wFR/xcLDNV
	NnO3fTbZYxdB1Tb1/ybWZgRF3oiQbEjIy3GOGWqM+sHDBiOCrOm8VRziavoxDQa9nG/i89nR8ku9u
	axYxF4ABaytz2CmsMoOfjqLHYgLE7Byx6up8NyLhLFrCU+tlIh6XJvL7BI4H8OgxCR9AH900XMms8
	iZ4br0VXgeEoGMNMgfTT79S8ISp2DjN6VKH/hE2qAEoXM9djDjcLJGYsdJshgMcPAS3g6Q6HvlCNc
	0jywaEnPkGcVWzgHNo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHBw-00000009UTV-0KoZ;
	Mon, 13 Jul 2026 13:59:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHBt-00000009URg-2TcX;
	Mon, 13 Jul 2026 13:59:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9058F1CE0;
	Mon, 13 Jul 2026 06:59:20 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9EAB63F7B4;
	Mon, 13 Jul 2026 06:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951164; bh=fdM8eSOX1vnuRDMyBnXZwm7qppeDWgURrDmpSOBVWR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jDXnfQY+Em6qUw19QR+A2ZpcQLw1YaP4AJnqCk8v0z4XvE4pF7ZqjOYmqZLgAzlmW
	 J9+MQcHN/tAismdmH0XnV6rUl+JUh5fFUDrudzYvzY6voWv4q0XV1xax1IvfrdY41C
	 KqRnsffjQ/7q71iySWPSNMiArk3b5UNcIT3kGQag=
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
Subject: [RFC PATCH 14/34] csky: mm: use proper set_pXd() for generic compile-time folded patable in vmalloc_fault()
Date: Mon, 13 Jul 2026 14:55:53 +0100
Message-ID: <20260713135614.1618183-15-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_065925_716885_B7649278 
X-CRM114-Status: UNSURE (   9.59  )
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

We want to rework how set_pXd() behaves for generic compile-time
folded page tables by disallowing its use and triggering a
compile-time error when it is used improperly, ensuring that the actual
first-level set_pXd() function is used instead.

Since csky's PGTABLE_LEVELS always is 2, use set_pmd() instead of
set_pgd() to handle vmalloc_fault().

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/csky/mm/fault.c | 35 +++++++++++------------------------
 1 file changed, 11 insertions(+), 24 deletions(-)

diff --git a/arch/csky/mm/fault.c b/arch/csky/mm/fault.c
index 7ff4011089850..1467ea963806c 100644
--- a/arch/csky/mm/fault.c
+++ b/arch/csky/mm/fault.c
@@ -114,12 +114,12 @@ static inline void bad_area_nosemaphore(struct pt_regs *regs, struct mm_struct *
 
 static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long addr)
 {
-	pgd_t *pgd, *pgd_k;
-	pud_t *pud, *pud_k;
-	pmd_t *pmd, *pmd_k;
-	pte_t *pte_k;
+	pmd_t *pmdp, *pmdp_k, pmd_k;
+	pte_t *ptep_k;
 	int offset;
 
+	BUILD_BUG_ON(CONFIG_PGTABLE_LEVELS != 2);
+
 	/* User mode accesses just cause a SIGSEGV */
 	if (user_mode(regs)) {
 		do_trap(regs, SIGSEGV, code, addr);
@@ -135,32 +135,19 @@ static inline void vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	 */
 	offset = pgd_index(addr);
 
-	pgd = get_pgd() + offset;
-	pgd_k = init_mm.pgd + offset;
-
-	if (!pgd_present(*pgd_k)) {
-		no_context(regs, addr);
-		return;
-	}
-	set_pgd(pgd, *pgd_k);
+	pmdp = (pmd_t *)(get_pgd() + offset);
+	pmdp_k = (pmd_t *)(init_mm.pgd + offset);
 
-	pud = (pud_t *)pgd;
-	pud_k = (pud_t *)pgd_k;
-	if (!pud_present(*pud_k)) {
+	pmd_k = *pmdp_k;
+	if (!pmd_present(pmd_k)) {
 		no_context(regs, addr);
 		return;
 	}
 
-	pmd = pmd_offset(pud, addr);
-	pmd_k = pmd_offset(pud_k, addr);
-	if (!pmd_present(*pmd_k)) {
-		no_context(regs, addr);
-		return;
-	}
-	set_pmd(pmd, *pmd_k);
+	set_pmd(pmdp, pmd_k);
 
-	pte_k = pte_offset_kernel(pmd_k, addr);
-	if (!pte_present(*pte_k)) {
+	ptep_k = pte_offset_kernel(pmdp_k, addr);
+	if (!pte_present(*ptep_k)) {
 		no_context(regs, addr);
 		return;
 	}
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
