Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20B4C624D0
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT53gyOUI7JwXHDMpmP+5CZT8YjyMPbqVF8cin3F03o=; b=ybbtXKQ0osDNgZ
	h258lZWyO7X33/cEVE4btZnRNAZdFVhpHhFqBj+tB/M7rHdjEWlx67nJ1/1Xztpk6YwH8Wq5v9iIc
	zs4XSkMqi7XS+NezJOd3A9S/BGkIhFsRIniOEmaIKTEwE3lfEH7tiABh9t25BidCe3mcXwfy+qFUB
	uv2A7kT8tC3kwwv70JJy/w8nobU2NIJ0e0r3FQBE6wfHtCQWypxZGogdeYuQ2oZRZlr3mQHJhNtKG
	U3XEDxkC9ETY4YelSBwujlcVkD7n7zuafTErmkewiLtF6D6j6pIavIQT1jQmqMmuUjmekFm1gGbSt
	cbDnWgnd54XxNW7SPW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jb1-0000000EZwb-1aIU;
	Wed, 02 Sep 2026 11:57:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jay-0000000EZtG-2esB;
	Wed, 02 Sep 2026 11:57:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29AAE1684;
	Wed,  2 Sep 2026 04:57:32 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85EC13F85F;
	Wed,  2 Sep 2026 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350255; bh=hoNRRxOZ7Q1TQ3tPx9cyjNqGROvazqJ7TpP1oXJkYEo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HQPs1WFXY9CW3alroELpjH318TftojKz/4UscrbJ2jzOFyxx3UatrpJLr33W9KNfE
	 Asl/9rxAlMVPA9iigGjXVyLoAqrTCxfagAzzbKGU1vafeZPpNPJsLqD5plO8kJvIF7
	 CaAYby5EXyJ2Sp3R2RxfIvknlwZ8d+mi2y2qcyb8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:10 +0100
Subject: [PATCH RFC v3 08/21] mm: vmscan: remove stack copy address of
 pud/pmd pass in walk_pud/pmd_range()
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-8-5d8f5b17c25c@arm.com>
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
 linux-openrisc@vger.kernel.org, Muhammad Usama Anjum <usama.anjum@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=hoNRRxOZ7Q1TQ3tPx9cyjNqGROvazqJ7TpP1oXJkYEo=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7lNaVBcsfB9ZliAXNxOQ6b9wJghPjcL8fDa
 uK2aRokBiGJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO5QAKCRBt1cPRWsUx
 M7ySC/4oY0cDV4bfPbL9NxITYd9JIehHPFNxIAbq4GdJg2qXG5UDzoBj4Wg+TBEiBJtleT7fIh7
 V/SUCFBsSIOPfl21gAV4DsJqqIR2BI9tpisGacYX4mBzjdSVensar8f+n2/L+1HDi08QM7Jfab+
 vw/jd4OIcl5haxvZT1/9ckj2vzQjqGUNnVIQtu3cKR/zayGHnPRqXFeLj7Feqw64p3A05OQ2d3j
 z+koBd6eCH3o4f+a6JZkpt4dea7g7soIxmhTudXuzjnFdZ3j247H1g1jWvNpqX7WLUnUqXJes2M
 TgWOc1HdziiVK5q2kLYUiANmR9JGvyRR08qduHULn09JGSR4TYQBM97x7YeDQwLPSQ5wtU1BnNi
 MP/XV2imJviNZrvi/+xofZE/1KHQ6IchyObI70sbt1mEw24q8+T/I1AmCjW4cX/b7p7K6z6WT5c
 q898aoJd2V8gO2BB56t63O0drtKXzGoei518zBzrff8qAZoIk9QbxY+W21MH5ju9gxOd8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045736_775678_DED7254D 
X-CRM114-Status: GOOD (  12.91  )
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
page tables. To prepare for that, replace passing the address of a stack
copy of a pud/pmd to walk_pmd/pte_range() with passing the pud/pmd pointer
directly so that  makes allowing folded entries to be ignored and
check the concurrent access proeprly otherwise pXd_same() would return
always true.

There should be no functional change.

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/vmscan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 4d51b0d8e287..4e98088becab 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3777,7 +3777,7 @@ static void walk_pmd_range(pud_t *pud, unsigned long start, unsigned long end,
 
 		walk->mm_stats[MM_NONLEAF_FOUND]++;
 
-		if (!walk_pte_range(&val, addr, next, args))
+		if (!walk_pte_range(pmd + i, addr, next, args))
 			continue;
 
 		walk->mm_stats[MM_NONLEAF_ADDED]++;
@@ -3813,7 +3813,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
 		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
 			continue;
 
-		walk_pmd_range(&val, addr, next, args);
+		walk_pmd_range(pud + i, addr, next, args);
 
 		if (need_resched() || walk->batched >= MAX_LRU_BATCH) {
 			end = (addr | ~PUD_MASK) + 1;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
