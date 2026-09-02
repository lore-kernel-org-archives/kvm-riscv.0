Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3432C624D0
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBB8qRYGBS/qUhKgnIVUflik8Tvo1Vqe98DcEBf3ep8=; b=cyQZDW00G86weW
	s731RtsRTvlEcWrwGEoz1q+DV1F5bqGFJjn6+1dwwC5tg27ovBEGCuzJ2T3bEmS3GYyRAV09A2yst
	OkE2248bH+shk6gC5KbcmLBIrDHymh2g7Cl6IQCt+1ui6jIkd9XommjVZdDE6aGXV6/yO0rEt7Rx8
	fxBnmGbYOEZb7QBnpDmnf42ckkVWEUg9kH77Ki5yU+FDlbDeDxFkTGdZZjkNirl+JdjZJRYQ/ygQP
	jjW+iYB6E45DXLCjfHGXdeajUSnfolYyx8uEvqFcWVRFQQKmIEQjA4l2TE8G5CDM+zr86c89jZC7k
	9MFw1KX9PhnSg60agBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jb8-0000000Ea36-2lLT;
	Wed, 02 Sep 2026 11:57:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jb6-0000000Ea1G-3mY3;
	Wed, 02 Sep 2026 11:57:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA2151682;
	Wed,  2 Sep 2026 04:57:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4280E3F85F;
	Wed,  2 Sep 2026 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350263; bh=0PR5oXIOKKN44EvqTmmgCdRAk0g+3zRMhCuigLr45iw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Vq+BgO/b9aFK8A71JXNvBNBhfYac165FZEWsOyfDio4LQR5ETa+QDbn0KiaPLujHS
	 uLoEkmt86nlYEJy4d97XbCJa5a/RrJAqeUxW3ZxGdtC9wL7x8/PwJ1wvuq/GRns9N7
	 Th6snsDoMGFDvih9v1FYFDzHDNdr4HPtcJY6+7u4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:11 +0100
Subject: [PATCH RFC v3 09/21] loongarch: kvm: remove stack copy address of
 pXd in pXd_offset()
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-9-5d8f5b17c25c@arm.com>
References: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
In-Reply-To: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2050; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=0PR5oXIOKKN44EvqTmmgCdRAk0g+3zRMhCuigLr45iw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7mEvNM+bOE9I/iEnGFs4yU/Cp4f0fN/0Ksu
 pte4JObv3SJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO5gAKCRBt1cPRWsUx
 MyqUDACMb1+lsAjXkT07U7jCymAJfazCLi+GO5DlCm+D+flCqcZOXldliTBCwRmzRj4Jqg7Lg38
 AJyICWYXb6otlnlJHMXfPDwZu9oriA6Q74Im7EbN1oi2lrxIO9QuzLqZq9nopqL5fdnCkTBhLrY
 LFbHTE9MMndjLMFADqfDsab4Esti4VfIpOU4zi3bRjfsrOW/Jo38w74rDrf6jIb6m06O5nKgY26
 HUTG0A4hPkfkb16/8WvbC8Vx6of/7JJcOrFXcWSLZyFse+khfKtKwgfYvv0+thlQW4xRckUBLOQ
 pCH/6ZzZ187+fClXG1Fd5ju+Cgwx8GJCKMzTd6LZHMDPjzeYPM/QGHiTnBdi1v7i7Go1hTjtNtS
 8xasNcaQ1mXrOPnuCYwf7yA4NDpzHk9ZqcO7oLb0fPGbHL+wRNcJglW9vAmoSFXEhlaV5BIFfOC
 gqUa2a8dnHBQjWCVTTuiYqmSxJ6hfeym+A4VgyETaZD+WU4xI6McKP5byVyCs1DTCNe6Y=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045745_025101_AAEA8B23 
X-CRM114-Status: GOOD (  12.02  )
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
index e104897aa532..837b40bb694f 100644
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
