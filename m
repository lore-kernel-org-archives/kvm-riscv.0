Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272FBC61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4KnWB0r9Eee2cUYem/NSyvvz+BKR3hMPYUDISAtQwA=; b=yyBfzPo64TZp3X
	u8Aw6W67A+qzEk2d5i30fZE6W8qh2aEc9wUvLzb+m31HXKBAtdi9WL8rT2hqivESnT3aRVexgBmhq
	L2OHMODrHOYM6ku6ZNWRJrsWDqKBTzKCsIctpHv1L6zoHO8Ce834blOcci96MCJ9POrnycJCRi552
	S95bli8soyKfw/oVcZ2adHX2lVaoYr4U3n/em/itxSOSzRJ9gwAsx2/7KhjYVi1KDev996pZf3OW3
	LCS8rbbWA6xhJARt6XwQv3wbBB6C9FSzN0k0XM2rL08RsyGzb9xlowldo3MGLxqIHO0f/Xf7vDfnq
	SjRJBWpy0lzjdk9rIG5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbY-0000000EaS5-3aGy;
	Wed, 02 Sep 2026 11:58:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jbX-0000000EaPh-0Axt;
	Wed, 02 Sep 2026 11:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=J+TGgn602Em+uiCZ2yEPxwneC1yhH0OhJjma1frwYe4=; b=RMe5rmvhi1+7KHt+2lmWpgvvvi
	XY5J26MhtZU6mctIJpaNYOEro4XbFjGPaJc4V87SVc6HtKD/W43wfBHf6l8JnGe25HvlRZGLX57mk
	xUrwnwYUYOgfq3Mhup9tQPX/80E0MiRuPNgZ5+oWzoZXvuXA/BW2PUxugbA/6C5RRiDpn3OLoYUbb
	l9V5joAq2th8NWmllBtsBR+sAPJdbxRxXUgOMJ1PtmVVqnSTo8yDNLm0PX3FRc02XL7K0yEd578Xc
	ZqmQ8OUtElnCMTBhNTXRphIF7dtzo4u5IPU4O7jRAEtzDW3SczP9x4ov5ShgboYu6t7ocmF8Ki38c
	UJ5sMNUg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1jbT-0000000Bvjh-3DuY;
	Wed, 02 Sep 2026 11:58:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 831ED1684;
	Wed,  2 Sep 2026 04:58:02 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09BE23F85F;
	Wed,  2 Sep 2026 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350286; bh=JAI8HuvMrB06U9pngwcLmVHYlvLOsBAW7o0q3zLItzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Br0kvwiZKirBYwtP8GSbqaahPr9eXVJSF3G6/g+zhRfz9rudpPonCKSJx1zZiDP5I
	 seMnZ0FIMrBMphvLYpfrg+MO5sigrisjQEeqGAmO+6ELBvPgtEKno0usZoDWmbAedz
	 z1OTeZdg4q9ETpJggfEcDWTY/b5vPm9214of8Xyc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:14 +0100
Subject: [PATCH RFC v3 12/21] mm/pgtable: redefine PGTABLE_LEVEL enum with
 ascend order from PGD
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-12-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=JAI8HuvMrB06U9pngwcLmVHYlvLOsBAW7o0q3zLItzs=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7nq1z+UGkBh+k3plBTwHn84nfJGlTH4HLv6
 PSsOOGZ/OqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO5wAKCRBt1cPRWsUx
 M4WQC/4j5E65SCGx3a5/ZzEhrT7FR7As2mIMS9VAlDcEK/fUO+neWKP+3tAec53rUxb4zzYZKQr
 g3mrmjGqQfOQWFk0eMRy2UiUFM9sGnzM+aPCUjoMiPSlvR4ZloQz6B11DzS/1vcE9hCDnTfjvtK
 qVQP7mnCLKp6tqIu24k7YyT7/1M5TwLF9MckxKXher2kNgQyHoOU0A++ZAo8AnP5mdlzo5T2a0H
 yqfNYTL2jA0+vAPusTvh552PMoTvcNMpL10IwhehGblQh3b2mr3AWKiPaiII+C/tvF8CX1S0hYO
 Lsv/z7b/+GbqLVyVEZPDMeZ76r21qIJjSuSzlY3XmUdMaIXYuG5Zh2EeZh0142nK7VIzSEQXJdl
 1WqI52sg40psqB++3zm3uJk2vkt3ViK3XEvLCey+cs9cs3THb4NBf8ha4nuPMmOFiw6Bt6yHWOk
 PpTMxtIHG90CMyP8nQCuRgq1kKwGXaA+MSt7L4chgHdCIlEnjwejGwdNLXoe7Bqj4d0Sc=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_125808_165465_1765F192 
X-CRM114-Status: GOOD (  12.61  )
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

The PGTABLE_LEVEL enum values appear to be ordered in the opposite direction
from their intended usage.

Intuitively, higher page table levels should have smaller enum values,
but PTE is currently assigned 0.

For consistency and cleanup, reverse the enum value ordering.

Since there is no current user relies on these numbers to be ascending from
PTE->PGD, so it can be changed to be ascending from PGD->PTE, in the
direction of the page table walk.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/linux/pgtable.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e3c8ab96941c..3186096a6e13 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2288,11 +2288,11 @@ static inline bool arch_has_pfn_modify_check(void)
 typedef unsigned int pgtbl_mod_mask;
 
 enum pgtable_level {
-	PGTABLE_LEVEL_PTE = 0,
-	PGTABLE_LEVEL_PMD,
-	PGTABLE_LEVEL_PUD,
+	PGTABLE_LEVEL_PGD = 0,
 	PGTABLE_LEVEL_P4D,
-	PGTABLE_LEVEL_PGD,
+	PGTABLE_LEVEL_PUD,
+	PGTABLE_LEVEL_PMD,
+	PGTABLE_LEVEL_PTE,
 };
 
 static inline const char *pgtable_level_to_str(enum pgtable_level level)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
