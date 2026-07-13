Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683B6C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Ps60S0ADPxW5qwgdHd/pwrWupRVYNu6mP/Wp5DB+j8=; b=Xu9dxfApRyBbTH
	yAjvAfPwGwVa6C5FRihzq+TOf8/M43XMghi4TXKBIattkOqylSJBmCI0G7k2aJB2TBzypYRU083J2
	yhMCvBQDcHKWf0g/GyLmrTg0cNfH+CPdwY+L85RCb69UuL9SM7IvvgNs6MsWlfH1X/dAPXp9Ml9W+
	OwX+TASlwE7Utw26AThDU85b0wX6Jr5zby4gaaiMtdLxUTRwSuKmmp3o4IJmH6T0odVAIZK4ApMJY
	76ENCTXkkaE39s+lmfUZwE4UJbUa0RiAxQrwxjn5EzlBFVSzjTtI0/3e/6tGkO4+IRPhA65ewAyjU
	VHjdFwBHMGQkNjqHpy7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHBO-00000009U6z-0nr0;
	Mon, 13 Jul 2026 13:58:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHBM-00000009U6A-3gZX;
	Mon, 13 Jul 2026 13:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Knn/IlgpbZTFm0uPlrSK4RQsRgPGqFz5Of3Db38ttBU=; b=Tqk7PjuM2cyO4U514azsIcjCE0
	Sn4NDn4iNmm/9Ocy1LgKM28fFwr60m2cTv65ubpbAB7CDKjRMIoYacLszpZm8VUkHPGpACUdaMPf2
	MbbK9KCgmpTHEDP6Ioq1EoLlxrGeXKY+ydGqgsGZTdSAYwccHcwr4lTf0gbcGVPZixakCUWqRA5In
	HJC2shPJEQaPOoeYTabfDgjdXMnXwYK+HAi8zkYNbG527pA+0x1Ass2Kfmll+a4enSpwi3lKGyp1p
	IhftEBR10pV6MCljNKt0SqopfGJE+9W0tX3JlvsrbBv4HtA24vzUD5BzURv0R1X37E/kuJf7cMEU7
	ngHqJUmg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjHBJ-0000000BfzS-2jQY;
	Mon, 13 Jul 2026 13:58:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBC211AC1;
	Mon, 13 Jul 2026 06:58:42 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F144A3F7B4;
	Mon, 13 Jul 2026 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783951127; bh=uqt0YCzTdiYk9CWaJTOcbu4/zhkZINw0+fy6QeqfMrM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YkNMk2duo++wV39RQ3zQsSkBtiXGMU8KXH8jVFl7fKMdTT/xjjvp60qA2AMoxmk68
	 Eg4fUEaPBaK2tL00GYQTBSmmhplTwjTD2k3y608RG1C/j/Fh8LekoiysZImaxes3aD
	 i+drxBJLKGmYBW0HKqOEYeyxcBZniTS0k9lWnbXQ=
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
Subject: [RFC PATCH 11/34] mm: vmscan: remove stack copy address of pud pass in wallk_pud_range()
Date: Mon, 13 Jul 2026 14:55:50 +0100
Message-ID: <20260713135614.1618183-12-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713135614.1618183-1-yeoreum.yun@arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_145850_082814_7D14A9EC 
X-CRM114-Status: UNSURE (   9.34  )
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

We want to change how pXdp_get() works with generic compile-time folded
page tables. To prepare for that, replace passing the address of a stack
copy of a pXd to walk_pmd_range() with pud pointer directly so that
the ignoring the value of folded entries.

There should be no functional change.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 986dde8e7429f..61470223d8213 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3725,7 +3725,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
 		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
 			continue;
 
-		walk_pmd_range(&val, addr, next, args);
+		walk_pmd_range(pud + i, addr, next, args);
 
 		if (need_resched() || walk->batched >= MAX_LRU_BATCH) {
 			end = (addr | ~PUD_MASK) + 1;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
