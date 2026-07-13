Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4ECC43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvEPFBgFSt31g0U1SjzcWqscmyogDuBeYL3W895cG3g=; b=Kky9v9asrq+fHG
	fd+0q48SXTsS22ro0gdWaahbNGI8nwqpIp2cT+ybABzdohA/kSC5tIe4HiQMLGhmcbD/i8eM2RKcH
	T7x24d3qrkj0GbhvsT7hfEc9uISzoJjUCnUThU/JcNCDriPp+fx9c5YkZZDbyLSdgoEKoEqzGprAH
	/fhcqVGcVkpSIx3F4ADeedEOUxzPZyeQqliuWV4qGb11UrFOgcus2G1l73mlfziqOGvTiy1QBVFdZ
	cdwCpUSu0uIIUJKxsKYfz3dTKsj1Ux9EbnEsjy0A485indMCWG/rOF/f0mUZO0XzkN0LXhLWT29ex
	MTfuvWqvCNHxvYRKdbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHBB-00000009Tys-2pZe;
	Mon, 13 Jul 2026 13:58:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHBA-00000009Txn-0w9a;
	Mon, 13 Jul 2026 13:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xpXZhmbiVuKVrLvZ80LTV1Vrpobd07xhsGjtQDwZJbs=; b=bM8gOgknhKTh7wAfT+5V11rTWU
	o6+AUo1cEGxyrRvrk7vsy3rcU4H/0DvSus+46JEz5VAx+3Vyw7wYat3O0hB5AT1VOCBi/4Ljwf/pf
	hG4HBQJwSplnifwwCXN1PosY/c126HurOGmNZEBx7n4mwNkfCxAix0Ua9LTzOkcwDVEdxYyH1hRT5
	V9zR+3e2O22TV6htf1aADYMkJE6Eb2Tk88eC7kyMizih9AFW1kiJXmKuHcM1ygYtIrI9+ETPyY+Kg
	zeANqDXLnGE/l/aq7lluWTRo7OIXnFeB9QBTnRM4gIvuczT0AcuHJs7GtKY5tbLJDuCFcg/9bMEjK
	C9XS2QuQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHB6-0000000Bfx3-3y9H;
	Mon, 13 Jul 2026 13:58:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 626221AC1;
	Mon, 13 Jul 2026 06:58:30 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 722843F7B4;
	Mon, 13 Jul 2026 06:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951114; bh=ijbMFumg8P8gGkdSIJoBYbLSyYeD/Vjhz9UbWDLoy8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CHlkydzVCllPoGxzxcQSUErvYXIAGBQ595+NL7G7e1sqPROHhsxJ8MBiTiSYo8eIB
	 Mu0LCgbjUkOW4pofPbQVpr3Y0M6KWgdVpaR90WouabYCqysQ0cuW4q7ADzrIlktriy
	 gEX7NRAFqIzU5fkSuMPNTtCBJn75XvGeTJjmc76Q=
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
Subject: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time folded pgtable case in effective_prot()
Date: Mon, 13 Jul 2026 14:55:49 +0100
Message-ID: <20260713135614.1618183-11-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_145837_436303_477B23B1 
X-CRM114-Status: GOOD (  12.83  )
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

From: "David Hildenbrand (Arm)" <david@kernel.org>

We want to change how pXdp_get() works with generic compile-time folded
page tables. To prepare for that, rework effective_prot() to ignore any
folded page tables entries, as it will unconditionally get called by
ptdump core with pXd_val(pXdp_get()), and we really should be ignoring
that value for folded entries.

For this, identify the first real page-table level and
update effective_prot only when the current entry is not folded.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/x86/mm/dump_pagetables.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 2afa7a23340e9..e32848c7f26d4 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -27,6 +27,7 @@
  */
 struct pg_state {
 	struct ptdump_state ptdump;
+	struct mm_struct *mm;
 	int level;
 	pgprotval_t current_prot;
 	pgprotval_t effective_prot;
@@ -253,8 +254,22 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
 	struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
 	pgprotval_t prot = val & PTE_FLAGS_MASK;
 	pgprotval_t effective;
+	bool first_level = false;
 
-	if (level > 0) {
+	/* Ignore folded levels ... */
+	if (((level == 0) && mm_p4d_folded(st->mm)) ||
+	    ((level == 1) && mm_pud_folded(st->mm)) ||
+	    ((level == 2) && mm_pmd_folded(st->mm)))
+		return;
+
+	/* ... and make the actual first level remember the protection. */
+	if (((level == 0)) ||
+	    ((level == 1) && mm_p4d_folded(st->mm)) ||
+	    ((level == 2) && mm_pud_folded(st->mm)) ||
+	    ((level == 3) && mm_pmd_folded(st->mm)))
+		first_level = true;
+
+	if (!first_level) {
 		pgprotval_t higher_prot = st->prot_levels[level - 1];
 
 		effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
@@ -449,6 +464,7 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
 			.effective_prot_pgd = effective_prot_pgd,
 			.range		= ptdump_ranges
 		},
+		.mm		= mm,
 		.level = -1,
 		.to_dmesg	= dmesg,
 		.check_wx	= checkwx,
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
