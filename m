Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC2BC44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNRnqEACrLyA0XbXEQnurF/yjk1iRAwltDevwPhOE5c=; b=JNVagTcLZ3t7wy
	fGsVKJxeeNGaqWMGaF+P+fatAocB6uCT0bCslSZezQWnGFKGXqYX9Y6KCCluCKtpjb2Ms5THsVxG5
	/slYcKe9qnd6apVRd1x055waOL6gQcay5NLRixf4lCh1lr8Fi7OoDAWz5+6hCaRb4XYXxxX6haB5r
	4rMtVRON0NE0jCAiRmc4P52MtqFViRYqydvnMcxBuKYfOYXhFy2H9SU4JkGaRd7Tyz3NvVWHYlPcv
	rqtk9T/rJJiAbi5PyslC2l857tR8TFzleStCTkI9z50HjOmpydY1zzFqhkijdPCAoNriWXZU8vUp6
	DGbxHwOKnkUfj7nRThOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHEc-00000009WO6-2kvh;
	Mon, 13 Jul 2026 14:02:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHEb-00000009WMQ-0Kbe;
	Mon, 13 Jul 2026 14:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+RCDGrorkyNOOuJOjX5fZBtuLdr9gFJ37Diu3XLCTDo=; b=RmW4uCp41EvKy0CZWCt64WJw53
	j1EnOgYuLnaIr3bbnZbfXn1Ld1LqTKzweM+mZ0GdZg2dfDFU9X7NxMgJRNxSdGHanNegPfkKRxWMY
	rSV6V+j1OjHmCsP/kWIUpl+NGkEnn8wXvUmcLUMeZ54OkYykkc4JYOQISCATIObJJOIQxCcWj5VTY
	IXJMVu+PKeyW6U0kDkt2Z1iTPfLxmZ3N+1s6ucOy9ZtPMs3ysRL9LQVt49tbtFZTK8edJTWydjgVw
	nA7wo2zXAI+dRfeG31jNQCyzPbh7/+WjJbuaQq0Ut5Uh2bEctlD9PnkuKkoMhW83LtIUA6lZwvsE/
	afJfCLiw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHEX-0000000BgSs-1b0L;
	Mon, 13 Jul 2026 14:02:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B917F2050;
	Mon, 13 Jul 2026 07:02:03 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA4093F7B4;
	Mon, 13 Jul 2026 07:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951328; bh=ROB8+gk0/dcoXkR4gcvO5thlCnhrFywn7RQWaf7FRNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ASMMRSEElZbqH3kcSv3cgBHwRCD0y7h1wgH3UWFgn/baB5FeIwo7Xk+LbUkFullBo
	 ek3GdG2jwdbkGcS6tjY0I29itz5ZOSbh5hHu9lh1E6V9LwiKw1W6kVKW+GJRoc6YC2
	 dPS2W1hLic9wNvgpjDdvMv047vveZPnluRUq3ZWI=
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
Subject: [RFC PATCH 27/34] m68k: mm: remove usage of pgd_page_vaddr() for CONFIG_PGTABLE_LEVELS=3
Date: Mon, 13 Jul 2026 14:56:06 +0100
Message-ID: <20260713135614.1618183-28-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_150209_783047_00694686 
X-CRM114-Status: GOOD (  10.34  )
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
the functions used when PGTABLE_LEVELS=3.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/m68k/mm/init.c     | 2 +-
 arch/m68k/mm/motorola.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 3b88c0dd1616d..d8351c210f58d 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -95,7 +95,7 @@ static inline void init_pointer_tables(void)
 		if (!pud_present(*pud))
 			continue;
 
-		pmd_dir = (pmd_t *)pgd_page_vaddr(kernel_pg_dir[i]);
+		pmd_dir = pud_pgtable(*pud);
 		init_pointer_table(pmd_dir, TABLE_PMD);
 
 		for (j = 0; j < PTRS_PER_PMD; j++) {
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index b30aa69a73a6a..03235d0618ef0 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -273,7 +273,7 @@ static pmd_t * __init kernel_ptr_table(void)
 
 			if (!pud_present(*pud))
 				continue;
-			pmd = pgd_page_vaddr(kernel_pg_dir[i]);
+			pmd = (unsigned long)pud_pgtable(*pud);
 			if (pmd > last)
 				last = pmd;
 		}
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
