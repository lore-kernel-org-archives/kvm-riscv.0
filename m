Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC0BC44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeS6ua9Lcu9KWEF//+l74k4cZ5RgX59Imzlo3+UfYwc=; b=cTzMMXYmRKkVXT
	U8URFkani0BncwKWBa5WbDOR7T5vFInd0B2gmpx+bM8enhkDL20zSzp9ieQYJodwOd1vlO2VbKfgd
	QmZYtlAcanyrG+qfntwNX+nHAK5QEVq+yNnmg9azkgxegUBAvXsee4zBHYJPVxskZjrm1o8hCT2yg
	qJ/RBrwEByz5B/3mQmcqChPO3JwGgj9Hvz2997iiswiq9vYc+l0jYrB87IXeeM2e56/b6M21NZg9E
	7mVoH/LNRMWX0WyLkKiPfSz8GF0Yg7gCtvYi6/7p8jdB3cRuz5yMbE69olbpCBJiMDZ3PBCn2Cja/
	foxGBR7bPGKSZ1/zedaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHDg-00000009Vgc-23wZ;
	Mon, 13 Jul 2026 14:01:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHDf-00000009Vf8-14qw;
	Mon, 13 Jul 2026 14:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XODR0DLFMAasX2k3OQcGxT82RYcB26wTIaaFE1uMq2Q=; b=Qrc88aLK99zYOdTovOe2eryyRr
	uO967xeEzT6zTuC2RDZT0jcT6Qs5VYUaQJFHi2w+mpr4t/sNs/XnDqDRR92q61OiZhiPAkK4gpKfr
	1P5+UcDzRSADwMotmXS+/scWNqO3njyh0aoKWMHLG9NYR14K4tGW9bnnug0YvMcwqFqMFYoVOGGdi
	aqvg+tA6pYf+ch8DbnjjW9u0rwrdc4r61cz4A9aR3CnsxvuMENQdBUuwTq6YEz8seGCZhlHsOX+Wv
	gajv9Hd8RbV8EeH/pJepO9yvfh+uE06KtB0ooB/HfvVhMlhEedltdAlDp53l9iKVc/Io0y0o8ftqe
	M+RInBPg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHDW-0000000BgK6-30QZ;
	Mon, 13 Jul 2026 14:01:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01BDE1FC7;
	Mon, 13 Jul 2026 07:01:01 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0FC353FAF5;
	Mon, 13 Jul 2026 07:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951265; bh=3LP3kSBkF9WZ5FN+GThlw2ZrRbb/NM3CavuBMu2UCX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jQFofxhrlY9xhPCZ1KjOb60Oo8vAAMeW3u9/kR3kEqBO6OD+WGUbi6FH+GoBuTLyI
	 oSdIVLUVAjxaEDlOi7+HOeEkX3qQLhK46xPY7D5gKofzHDHQHSoEVb/gRv4q0kvsfj
	 z/WGz+7bjb/oyahedBcZbasHVxrEPI9iv40gFe5k=
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
Subject: [RFC PATCH 22/34] x86: mm: use proper set_pXd() for generic compile-time folded patable in one_md_table_init()
Date: Mon, 13 Jul 2026 14:56:01 +0100
Message-ID: <20260713135614.1618183-23-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_150107_090962_B1ADD3FF 
X-CRM114-Status: UNSURE (   8.87  )
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
when it is used improperly, ensuring that the actual first-level
set_pXd() function is used instead.

Therefore, replace set_pgd() with set_pud() to setup first-level pgtable
in case of X86_PAE.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/init_32.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 0908c44d51e6f..690afa27a631b 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -70,19 +70,17 @@ static pmd_t * __init one_md_table_init(pgd_t *pgd)
 	pud_t *pud;
 	pmd_t *pmd_table;
 
+	p4d = p4d_offset(pgd, 0);
+	pud = pud_offset(p4d, 0);
 #ifdef CONFIG_X86_PAE
-	if (!(pgd_val(*pgd) & _PAGE_PRESENT)) {
+	if (!(pud_val(*pud) & _PAGE_PRESENT)) {
 		pmd_table = (pmd_t *)alloc_low_page();
-		set_pgd(pgd, __pgd(__pa(pmd_table) | _PAGE_PRESENT));
-		p4d = p4d_offset(pgd, 0);
-		pud = pud_offset(p4d, 0);
+		set_pud(pud, __pud(__pa(pmd_table) | _PAGE_PRESENT));
 		BUG_ON(pmd_table != pmd_offset(pud, 0));
 
 		return pmd_table;
 	}
 #endif
-	p4d = p4d_offset(pgd, 0);
-	pud = pud_offset(p4d, 0);
 	pmd_table = pmd_offset(pud, 0);
 
 	return pmd_table;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
