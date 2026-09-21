Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B3AC982ED
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXH4dIofwIYbv7N0CnVncBkJA20PgeHwJFpThwHIs7U=; b=WcvnKUdCb4RQpj
	qtzsmQRf+NeTLFHEwtpSZAhriXux2YAUdIByEs9UjAOMcS5vpOQJIdwf5S5NaGja94c/5VJZIzbzj
	o1sOPT3Sp4vaQrmg82mEILIDS5Ux95T4qeinZ2XEENZWo25xrE3DCq1JNK4krpQwJDKgNqxlxb2cH
	httZ241iXmusp149YuESM0XTgpPKqXS6d/xI/AA81t5f89iseLYs12rrWTl9gO9+adtUrUe/dBtjF
	WiJgA5dNTG17v7i8xNv0WWc2gmz+bWGcjiZnRJtIHm18dK6PZ/R76kgnGwYPG/YmzaWZjC61RRMrV
	lb7B22uPodDqwMz1WNmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8big-00000001mZi-1KYH;
	Mon, 21 Sep 2026 10:57:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bib-00000001mWI-3eqs;
	Mon, 21 Sep 2026 10:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Kqu7jR4LZ6KFKtyM96Yqa71AZjrybXBKCvKDll9J4VY=; b=UdnSltXsCWVp4EQ84el0S1d1v7
	rcv1QHBmesncmFWj9he23AJh2J/tLYsgVpt011sBjf3rVxjjotun1VtNNxIVFV2uXiTzpQPEFjQ82
	KRiaykUluqKUtuTDXhT7Jvg30uuMIUKNAQ8Y+rTJO1GU7N7sUoQnBag+G+stViyNsIizTFNyYiM1D
	AL1jfcsB2szHNzIv6Xjv8AgCT6n/TDMUJqXOSHCGtA9ja0Hy+eX8xHPgg/1JmQi86k2ncJssI3zJ/
	wlw12mntUFw5/+D6JW3KlXyaCcsGS7UODvB5GhUpC31Ui9PG8g9MdSBFz40034NSEMQYEAfIVjAqg
	jxH3qNew==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8biM-0000000C9M9-2ueE;
	Mon, 21 Sep 2026 10:57:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 293551570;
	Mon, 21 Sep 2026 03:57:33 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DC153F86C;
	Mon, 21 Sep 2026 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988256; bh=tenWdx/UAPDDmgqvhn1jTW0rtV2ElcnA6e+1jtwaJs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r3qQ0wEnceoNCSAemMvOXk/eg6xJzFlkI2IyMBaatbiz4/x7s7q8hXTaO0Vl8MDQ4
	 rS0/4H24aYxcUvmqdedXNG5j5+laQn70ovdDLv2Urbd3WHUzthrh0Kec8w0w+ul6hy
	 3zGTSf1mygcnWXtKW69QPNHlW0tU/7g+HwsoV8R8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:55:31 +0100
Subject: [PATCH 09/21] loongarch: kvm: remove stack copy address of pXd in
 pXd_offset()
MIME-Version: 1.0
Message-Id: <20260921-dummy_ptxp3-v1-9-cd40cf68242e@arm.com>
References: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
In-Reply-To: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
To: Russell King <linux@armlinux.org.uk>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, 
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-openrisc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2052; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=tenWdx/UAPDDmgqvhn1jTW0rtV2ElcnA6e+1jtwaJs8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQ1PJaEMk0o9SRiHZSjHIfm+GrA188fN+4hRU
 6wJUgjEtAaJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarENTwAKCRBt1cPRWsUx
 M8LxC/9j9lKenvxhbWb1SDdCXY3s7kZnCDH1casxpL2CIqsMn1jRkSXlvvWc0FK7/ooO4WCtNPY
 isddhbQdba3tQ14ARwFYleVeWNNmiT05JGvjASoPg50ySoGJaDe19OE4hZWOghnmxjkdc86g7jL
 gcCOPOwe9mQY4LNYG8oZF9///bcv3szPoREYgWxSzP1vxiY0prT9Dyfrv3zTgfStuBUY4ntnptW
 G6zFnDbNPzkifb/jVOuDI1ksUJyOcnJzCCWQh8wAul/S21IO6AC6udNQZCpR4UHngkTh0e7kUgq
 arNAcFyIjLTCw2utF3PQlxLJylHPboWGN6Qby0dJF/WPvfwiMZ5ZqM7rzEP8W0iKnUglDk7bkpP
 V87UdgAwIoTi1oSvrjliTDJV5yEBgdqYWHvSXN54WMH8yzs8AO3xWzAryfmg1jwsGVfcCNvBtRA
 5hUpniFYmqdNtZll1Rh6ljx/ikMnaZyFYSHYscH16HGIFR1qU5Wck0IPfXF0jYchNE1jQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_115750_539508_621436A4 
X-CRM114-Status: GOOD (  11.23  )
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

The behaviour of pXdp_get() will change with generic compile-time folded
page tables. To prepare for that,  rework host_pfn_mapping_level() to avoid
use of a stack copy of a pXd and pass it as argument to pXd_offset() so that
the folded entries value is ignored.

Replace direct uses of stack-based pXd values with pXd_offset_lockless().
And there should be no functional change.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/loongarch/kvm/mmu.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index e104897aa5328..837b40bb694f4 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -669,10 +669,10 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	int level = 0;
 	unsigned long hva;
 	unsigned long flags;
-	pgd_t pgd;
-	p4d_t p4d;
-	pud_t pud;
-	pmd_t pmd;
+	pgd_t *pgdp, pgd;
+	p4d_t *p4dp, p4d;
+	pud_t *pudp, pud;
+	pmd_t *pmdp, pmd;
 
 	/*
 	 * Note, using the already-retrieved memslot and __gfn_to_hva_memslot()
@@ -698,19 +698,23 @@ static int host_pfn_mapping_level(struct kvm *kvm, gfn_t gfn,
 	 * value) and then p*d_offset() walks into the target huge page instead
 	 * of the old page table (sees the new value).
 	 */
-	pgd = pgdp_get(pgd_offset(kvm->mm, hva));
+	pgdp = pgd_offset(kvm->mm, hva);
+	pgd = pgdp_get(pgdp);
 	if (pgd_none(pgd))
 		goto out;
 
-	p4d = p4dp_get(p4d_offset(&pgd, hva));
+	p4dp = p4d_offset_lockless(pgdp, pgd, hva);
+	p4d = p4dp_get(p4dp);
 	if (p4d_none(p4d) || !p4d_present(p4d))
 		goto out;
 
-	pud = pudp_get(pud_offset(&p4d, hva));
+	pudp = pud_offset_lockless(p4dp, p4d, hva);
+	pud = pudp_get(pudp);
 	if (pud_none(pud) || !pud_present(pud))
 		goto out;
 
-	pmd = pmdp_get(pmd_offset(&pud, hva));
+	pmdp = pmd_offset_lockless(pudp, pud, hva);
+	pmd = pmdp_get(pmdp);
 	if (pmd_none(pmd) || !pmd_present(pmd))
 		goto out;
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
