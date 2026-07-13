Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25650C44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxYveb7WI6gqoLEIO3xFNvFydwlzsE/l31k7JLiUnpQ=; b=Qz8Iu6DMez8s4i
	E9mNtc/Mrsbvk3u9CcnoCun+Qm1wRvzUQgWGOqIt+aHX/BeKzTBNIM7ohJsGNSJFCu8BdlZ3Y+GgU
	qC+TZrP/GkBDeuBlGPa+NOgaVUjqQBLeFgtRDSGhbYRGNBmH6CRP6uZF+IeIjFMCBxtuEkoFFJ9Ka
	U8Ub51fVyx/Fa4Xqva3Mwusok3w1+RWw9gWVvF/Hb/Aup+Vlmhj5qEBt/eOXNOYP9O1eqm1AHC/4Q
	qaR9joZO1IOE70RRiC4x+7fKIcDyxQu7tQ77Cpmh4ZDcthMaR70oqgG1GrvjXJcEzF/QCJgaRbDNW
	lrYsGD9fj3KFkt9h50Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHDy-00000009Vui-3Qmp;
	Mon, 13 Jul 2026 14:01:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHDv-00000009VrL-3aFJ;
	Mon, 13 Jul 2026 14:01:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A01A2050;
	Mon, 13 Jul 2026 07:01:26 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 25E193F7B4;
	Mon, 13 Jul 2026 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951290; bh=rrBwQUNghxkMeytXEUNPpto8wZMFntDlW0SzsHEzoAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IVRIV9T1flpA0gOrme1V1eRRplwrh4TOVZQ26715JQXP4QS1CmEmFLuEQckZtZvv4
	 4p+gq0ht2Chb+NH1sjxzNiEzIZeyEPeVbwJ1KM74ZeocLv5XHo0v7Uh1Lze0qxAo+P
	 JXkmUcVeya83Vz4L/uprN4mXjJ5dFsFizk8SHMNA=
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
Subject: [RFC PATCH 24/34] x86: mm: call try_to_free_pmd_page() when CONFIG_PGTABLE_LEVELS > 2
Date: Mon, 13 Jul 2026 14:56:03 +0100
Message-ID: <20260713135614.1618183-25-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_070131_985646_CBE4E1D8 
X-CRM114-Status: GOOD (  12.30  )
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
error when it is used improperly, ensuring that the actual
first-level pXd_pgtable() function is used instead.

The try_to_free_pmd_page() wouldn't need to call when
CONFIG_PGTABLE_LEVELS=2. therefore call it when CONFIG_PGTABLE_LEVELS > 2.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/pat/set_memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index cffb1cef869cc..2137174b733ae 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -1452,7 +1452,7 @@ static bool unmap_pte_range(pmd_t *pmd, unsigned long start, unsigned long end)
 static void __unmap_pmd_range(pud_t *pud, pmd_t *pmd,
 			      unsigned long start, unsigned long end)
 {
-	if (unmap_pte_range(pmd, start, end))
+	if (unmap_pte_range(pmd, start, end) && CONFIG_PGTABLE_LEVELS > 2)
 		if (try_to_free_pmd_page(pud_pgtable(*pud)))
 			pud_clear(pud);
 }
@@ -1496,7 +1496,7 @@ static void unmap_pmd_range(pud_t *pud, unsigned long start, unsigned long end)
 	/*
 	 * Try again to free the PMD page if haven't succeeded above.
 	 */
-	if (!pud_none(*pud))
+	if (!pud_none(*pud) && CONFIG_PGTABLE_LEVELS > 2)
 		if (try_to_free_pmd_page(pud_pgtable(*pud)))
 			pud_clear(pud);
 }
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
