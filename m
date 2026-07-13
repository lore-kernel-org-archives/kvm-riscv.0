Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B82C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+RS+Je6nwyJEzsarKODnyapFX2ifE9agKmhRp21460=; b=s3Upoer57E599I
	rOVn8oEGlnrXLy8W0DCJUItPi/Zud7fGdrBh6XmaNchEqQSQgSUTzSA+r2/w+wmTbd7wBMXLPEBp4
	QG+DB8TUnFNzLvBbkXfo3/lgOmaHzkUx/pp/T0HL8H4Cxv8w+nm+RP2yZpnSJPVZ4raMb6zyzoyEw
	E9kaO9iocFYbG7VDQIIoipfBRjyMvWyi3TO3th97pHz6lbWMyOCrgmUiHSS7Vm+FCx1mFR3Gk1J/Y
	uDfJgVhqEaIkgISiOTPAOXIPCjiPsqEMtaRzrQ6yEZ5XlzeTKeFbUg8o4Qlsnb6h6wvyKoPIWrDu/
	138W+JqPzF/a0LXFvqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHCN-00000009Uly-3Wrx;
	Mon, 13 Jul 2026 13:59:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHCN-00000009UkS-00U7;
	Mon, 13 Jul 2026 13:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kYKqDC64EtdDPB+h/buce3AiHZeNWwTAXVj0booe4O0=; b=aL1x9ksveYUDKv4QLw07kcE6qn
	nJTtISvXNCRhlm+eDG4XUd83OGrILCSZZmNI8TQhIb/jegTWjfC4k3lCPRtok+v/sO0Se9IjQ1EZ2
	vJk/ZoLt/N6uc1dHlXILcOwbNtDshrbrONn9mb/c7zFXL3/+DnxIbgzHBLf+tikyiUuEMPE86N4ha
	EI0jjfQHfZkUvlyYdRLNZHJxYAmjSiJ+gj/6ehWt9WBmRCoF3GwHolGTcpgAAHWt0Cn4vPwDaP3R4
	iKah6+RO8a8kvbFF8iyAb70sWr/S+ixAqsPHUpnuoO8g0YA2CEWSs0yv/IeoMdec1xBrA6u7b5bRw
	rQcBCaNA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHCJ-0000000Bg8M-21Sx;
	Mon, 13 Jul 2026 13:59:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB7A01DB5;
	Mon, 13 Jul 2026 06:59:45 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B08443F7B4;
	Mon, 13 Jul 2026 06:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951189; bh=YqnJQyc9CrzYpyp6gWjknvIiJBuEo4b4nmLN5r/zhR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZPr6uIZSUfuQyR/dBUHjcIk7LcANOKrIDpUnnXvitbMXbT2PO3nSzM8sPM+AmgFSh
	 oEYY6m6leU6Z90DVlRyAPnZWbTAQdvt43qG1RNc/JG10d4j0cTl4zhpHBmeYz/DeiC
	 gY5pxSreFEjqd85ky2RlKPv4w2j6RM2bSTCQi2Ho=
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
Subject: [RFC PATCH 16/34] nios2: mm: use proper set_pXd() for generic compile-time folded patable in vmalloc_fault path
Date: Mon, 13 Jul 2026 14:55:55 +0100
Message-ID: <20260713135614.1618183-17-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_145952_140759_4CDE19DA 
X-CRM114-Status: UNSURE (   7.89  )
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

We want to rework how set_pXd() behaves for generic compile-time folded
page tables by disallowing its use and triggering a compile-time error
when it is used improperly, ensuring that the actual first-level set_pXd()
function is used instead.

Since nios2's PGTABLE_LEVELS is 2 always, usage set_pmd() instead of
set_pgd() to handle vmalloc_fault case.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/nios2/mm/fault.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/nios2/mm/fault.c b/arch/nios2/mm/fault.c
index e3fa9c15181df..f67d599115e9e 100644
--- a/arch/nios2/mm/fault.c
+++ b/arch/nios2/mm/fault.c
@@ -227,35 +227,23 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long cause,
 		 * an interrupt in the middle of a task switch..
 		 */
 		int offset = pgd_index(address);
-		pgd_t *pgd, *pgd_k;
-		p4d_t *p4d, *p4d_k;
-		pud_t *pud, *pud_k;
-		pmd_t *pmd, *pmd_k;
-		pte_t *pte_k;
 
-		pgd = pgd_current + offset;
-		pgd_k = init_mm.pgd + offset;
+		BUILD_BUG_ON(CONFIG_PGTABLE_LEVELS != 2);
 
-		if (!pgd_present(*pgd_k))
-			goto no_context;
-		set_pgd(pgd, *pgd_k);
+		pmd_t *pmdp, *pmdp_k, pmd_k;
+		pte_t *ptep_k;
 
-		p4d = p4d_offset(pgd, address);
-		p4d_k = p4d_offset(pgd_k, address);
-		if (!p4d_present(*p4d_k))
-			goto no_context;
-		pud = pud_offset(p4d, address);
-		pud_k = pud_offset(p4d_k, address);
-		if (!pud_present(*pud_k))
-			goto no_context;
-		pmd = pmd_offset(pud, address);
-		pmd_k = pmd_offset(pud_k, address);
-		if (!pmd_present(*pmd_k))
+		pmdp = (pmd_t *)(pgd_current + offset);
+		pmdp_k = (pmd_t *)(init_mm.pgd + offset);
+		pmd_k = *pmdp_k;
+
+		if (!pmd_present(pmd_k))
 			goto no_context;
-		set_pmd(pmd, *pmd_k);
 
-		pte_k = pte_offset_kernel(pmd_k, address);
-		if (!pte_present(*pte_k))
+		set_pmd(pmdp, pmd_k);
+
+		ptep_k = pte_offset_kernel(pmdp_k, address);
+		if (!pte_present(*ptep_k))
 			goto no_context;
 
 		flush_tlb_kernel_page(address);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
