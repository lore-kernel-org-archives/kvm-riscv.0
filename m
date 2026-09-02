Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A4BC624D0
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5SOMKkHnSycJtscb7UsWz0Lvi/LjB1AbyGQ/F0YY68=; b=maCiT6eSWZqJ5M
	wmJiGGYWV/1KElmysl0oV2MRyXEL/LsFazTW88KP7B60trRwuxiCNP3cokSSOJML2Mc+k12NE/hCX
	2ESgI4BGFiFMthGguv3T04Cx18v0B/dpovyZSxgz4K/+FplfmDwitjwoKawblvKa4JRMk1JeY5Chy
	ABHVWt54JbATwh/GrXOjtc/6/9YoaeWttqse08C3SGVOTyEQ3v4nLrC5ZDHLe+VN4dMsc9/nOPD8p
	XcAYkKKIZKhKNoVeW+dU0ZJvSYgImee27ogn1q+eopICs+mt+QjoJfdNSQ+Qulq2RKfT5v5+azKk8
	4lyQEoFS+N2WQmOXWlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jah-0000000EZcN-2PUV;
	Wed, 02 Sep 2026 11:57:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jac-0000000EZZC-1NlK;
	Wed, 02 Sep 2026 11:57:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F91A1684;
	Wed,  2 Sep 2026 04:57:09 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AFCC3F85F;
	Wed,  2 Sep 2026 04:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350233; bh=Wt0Z/oRBkZT86NkETNbvCPFl/jDrFm+0ICRcmx2Gpw4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QlfFMcIgpV3JYZhXIz3ZKax54n1D+5p68jpTNDA5ds52moiQkyj5mRrWZ8+El2QFC
	 ZYc598eW0tD/p3pw7LWjrSJnCEErawQmBKD5wWOQ8mCEinmi6VGrTVN6m+aN/4bVG4
	 iTzY66nzYxKk2Z4nlAfCZ32Tz9TAvUrC2JoDv03o=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:07 +0100
Subject: [PATCH RFC v3 05/21] MIPS: mm: define pud_leaf() only when PUD
 exists
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-5-5d8f5b17c25c@arm.com>
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
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=950; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=r6k/TjEKlLvF6QYrAiLexU7+JoLa9iezYFCnVRD7jlk=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7k1BasbENs7scYH6YCwuMubOtsGe1c3+4m6
 SOomUSWrtuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO5AAKCRBt1cPRWsUx
 M3hGC/4t647eElOpB391p80tv3+7NgML6I6J4DGdbsBSvNkUpOdiEDJxWt6dXvZJprZIM65I9gL
 pzwDOktDu7P0q/H2ealDT27R5xiLJiMSYQJD6LtqjzaTOUCJqcBBsdwvvfz6exPz8jg/3s6owof
 z8kanGk2RTw/R2pBX7mz7baBXd/kXIAh+VtdG/yriBIJvw54oV1NawZ3QLH8cT0V++vjSvtx+6I
 U305Jn8DD42q1uSiiXgWq6uoWhAFuydp1y6fNV0XPcX+OG4n/bLcApPCVxGhNfqD+h1dlYA5xUC
 3o3jHz8nXtffVSV1y2NX3+3BoAGkTj4JNftFb2oWfopLzLA8/jyqMEbV4QfTRMUcaPy94LAC9cb
 Je+vi6FqOCznR7ehsyiVNSUNOjyc2vcdlWDc8a3Efj7eElfAPuFNaiYMc7XIK+Qbpa8CgPR7Wqs
 gDblJRw0/WUPCu6jYlUuWd5gIEIzWHCbXriyTy4PEaG9XfbRg8ExE6mc4ZXlJ2wNcj26A=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045714_486756_87C7E50E 
X-CRM114-Status: UNSURE (   9.82  )
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

From: "David Hildenbrand (Arm)" <david@kernel.org>

In include/asm-generic/pgtable-nopmd.h, pud_leaf() has hardcoded
to return false as inline function, but it misses the "define pud_leaf"
part.

To prepare for fixing that, define pud_leaf() only when
__PAGETABLE_PMD_FOLDED isn't defined.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/mips/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index fa7b935f947c..151f4d15bd12 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -745,8 +745,10 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 
 #ifdef _PAGE_HUGE
 #define pmd_leaf(pmd)	((pmd_val(pmd) & _PAGE_HUGE) != 0)
+#ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)	((pud_val(pud) & _PAGE_HUGE) != 0)
 #endif
+#endif
 
 #define gup_fast_permitted(start, end)	(!cpu_has_dc_aliases)
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
