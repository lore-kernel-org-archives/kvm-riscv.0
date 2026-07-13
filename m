Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1750C44501
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I40TpJLm3g41A0titH+hDdHS8twCbWlcfxIBWi3/bEo=; b=J/lP3GD/B3wzqK
	2XV7+QojxaELQRT83uWxmuYpHyeL3eyWrWPP86YUU2jtQs848xp1EFqms8teffC8MErHU3BWi2pkC
	4KJQwxJpwddRCXlf8XZKgbBqb3yRxm/lR9iuE00X6ma91oFsV4FasHQTOFtcHSEe0mPJjs84m94ov
	4P5Kejuh4M2v9RI3n1mPerAXQVxrjfuqujRm/i5N4YZHmLrOxhEWg0HKr8wqPaptXTUU7CJ2EJVKT
	W/3chClKY89sSjCxNyAXxAIiMVieQkgjnoUCx1YGoQdqGCRfVCwgLBRxfRlezGbkZj7nlG2MdA4DU
	lxg+H7bdIIApFas9gT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHDB-00000009VEz-23mr;
	Mon, 13 Jul 2026 14:00:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHD7-00000009VCZ-3kMB;
	Mon, 13 Jul 2026 14:00:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E365722C7;
	Mon, 13 Jul 2026 07:00:35 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F00E63F7B4;
	Mon, 13 Jul 2026 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951240; bh=va0q48sXcle/0V8qWAZnWr4Xakv6qUZD5loRZgnhZRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MOz3M/no7GPM/RnhkzFTAVpZxS2ERKQvlXCwbsNiVRL2yYzWglw+94qjOt1vYID/N
	 vyPd1NMFFKbOMm+vDptBUDLnohT7IckowlWYW8T/UQ7ot7g+j7Fi6uF15Cuk4eUFdO
	 qI5ngs3cD0CTMXkzBMuGvFfPsf6DqKwnnjUpXmno=
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
Subject: [RFC PATCH 20/34] x86: kexec: use proper set_pXd() for generic compile-time folded patable in machine_kexec_page_table_set_one()
Date: Mon, 13 Jul 2026 14:55:59 +0100
Message-ID: <20260713135614.1618183-21-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_070042_020974_511A864C 
X-CRM114-Status: UNSURE (   8.56  )
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

Therefore, replace set_pgd() with set_pud() to setup first-level pgtable
in case of X86_PAE.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/kernel/machine_kexec_32.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/machine_kexec_32.c b/arch/x86/kernel/machine_kexec_32.c
index 1f325304c4a84..a36321ee9f24f 100644
--- a/arch/x86/kernel/machine_kexec_32.c
+++ b/arch/x86/kernel/machine_kexec_32.c
@@ -84,12 +84,12 @@ static void machine_kexec_page_table_set_one(
 	pud_t *pud;
 
 	pgd += pgd_index(vaddr);
-#ifdef CONFIG_X86_PAE
-	if (!(pgd_val(*pgd) & _PAGE_PRESENT))
-		set_pgd(pgd, __pgd(__pa(pmd) | _PAGE_PRESENT));
-#endif
 	p4d = p4d_offset(pgd, vaddr);
 	pud = pud_offset(p4d, vaddr);
+#ifdef CONFIG_X86_PAE
+	if (!(pud_val(*pud) & _PAGE_PRESENT))
+		set_pud(pud, __pud(__pa(pmd) | _PAGE_PRESENT));
+#endif
 	pmd = pmd_offset(pud, vaddr);
 	if (!(pmd_val(*pmd) & _PAGE_PRESENT))
 		set_pmd(pmd, __pmd(__pa(pte) | _PAGE_TABLE));
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
