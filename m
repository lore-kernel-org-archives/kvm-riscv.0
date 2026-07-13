Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5211C44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3PNGx0+iyfLGIWOYSsfJW7qSYtN9nltR4g4be2KAIs=; b=d1G9pUb7t+gM3z
	FPRDjpNsuOomF/COydVg/FlU4kjdETwPhrk74M0JfAU+mFz0L39gpBWIqQ8i51zfqE55rX8Syfb9v
	eRYBLaSECO3/s435qfirspo12brFtK+e6CHht1OjQheqL8XAHmASl6c2VdrLjFy8xKOoBRZzFnrpc
	XeCS3p1nG8AI9PoCuu24xhpEf1ux2EpRhnVArKbshwpKRkPWHCeYoVIdpmj/NJ/9BZty/mTTU/pSO
	Rf0FMedHKaraLFSmymfXUjq27BEdiG9iae+dXJ5AmMjHgDrz+JPBvMhgtpygAO32SbimNsTbjyW+2
	lgYplksA8exCclizadiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHBW-00000009UCP-1mnm;
	Mon, 13 Jul 2026 13:59:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHBU-00000009UBJ-30gM;
	Mon, 13 Jul 2026 13:59:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CBB81AC1;
	Mon, 13 Jul 2026 06:58:55 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AFC43F7B4;
	Mon, 13 Jul 2026 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951139; bh=iWSMe0u/TmUpLGP78SOxYHheokckyiOAtAWUlz/N+7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MpXGh2dyKISR6DmyGzWLFiY1IubdGLMwywplIn/5NLWuhRoCFqF14/61QWrYnPFyH
	 8ENXFrrXM9IQ0feMBLfAuZQ3uSqYQ1VDKgmK0iw41OdetVs+/OFNb0scNIwAyRexPn
	 9DlDOmF0ValnVz1+/8RvKCkBlm7zW0w6IsMcimeQ=
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
Subject: [RFC PATCH 12/34] arm64: mm: use proper set_pXd() for generic compile-time folded patable in kasan_early_init()
Date: Mon, 13 Jul 2026 14:55:51 +0100
Message-ID: <20260713135614.1618183-13-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_065900_836914_96A94417 
X-CRM114-Status: UNSURE (   9.35  )
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

Therefore, call the proper set_pXd() in case of folded pgtable
to setup early kasan first-level pgtable with pXd_present()

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/mm/kasan_init.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 3fcad956fdf7c..c77ba4ab643b5 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -216,10 +216,32 @@ asmlinkage void __init kasan_early_init(void)
 		 */
 		static pte_t tbl[PTRS_PER_PTE] __bss_pgtbl;
 		pgd_t *pgdp = pgd_offset_k(KASAN_SHADOW_START);
-
-		set_pgd(pgdp, __pgd(__pa_symbol(tbl) | PGD_TYPE_TABLE));
+		p4d_t *p4dp;
+		pud_t *pudp;
+		pmd_t *pmdp;
+
+		if (CONFIG_PGTABLE_LEVELS == 5 && pgtable_l5_enabled()) {
+			set_pgd(pgdp, __pgd(__pa_symbol(tbl) | PGD_TYPE_TABLE));
+			goto populate;
+		}
+
+		p4dp = p4d_offset(pgdp, KASAN_SHADOW_START);
+		if (CONFIG_PGTABLE_LEVELS >= 4 && pgtable_l4_enabled()) {
+			set_p4d(p4dp, __p4d(__pa_symbol(tbl) | P4D_TYPE_TABLE));
+			goto populate;
+		}
+
+		pudp = pud_offset(p4dp, KASAN_SHADOW_START);
+		if (CONFIG_PGTABLE_LEVELS >= 3) {
+			set_pud(pudp, __pud(__pa_symbol(tbl) | PUD_TYPE_TABLE));
+			goto populate;
+		}
+
+		pmdp = pmd_offset(pudp, KASAN_SHADOW_START);
+		set_pmd(pmdp, __pmd(__pa_symbol(tbl) | PMD_TYPE_TABLE));
 	}
 
+populate:
 	kasan_pgd_populate(KASAN_SHADOW_START, KASAN_SHADOW_END, NUMA_NO_NODE,
 			   true);
 }
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
