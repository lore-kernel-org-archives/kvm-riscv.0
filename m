Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972E8C61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pHW/zUX6gbdYaPqyUEQ12h5yWKtirdxNLu6rkoQm/8=; b=TZYJBaD8auMHNU
	xwTcIrRV5VivVp5wGxCcsJGpBsqBTWJncUy617HoKQMTkfMn6I4AoDeRLPKPWwuEiwvJWtfO5NTEM
	eZrCNF7yM+kvzZb903Gj8qNfMVFzcH9QUFL2dtlW0VWNgHemxmhN/tBbD6O8a59kckEkc4PPsao98
	RbFVbTMlLUHQYo9ZfIMuGIZvarovjVM8T0wSuh/dzhEO1LTW+1bYMZ/0BsriFd0YCOoZB4+r0BljP
	Hfna8M7WTS81jXc+6V8UrvCBi+kZROC/pjt0gvQtQqg7iQcDQ2iPs9eyw3pOxyzAdBa8LYvJeyNhh
	Dwrsv6nq3hrupWCfutoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaX-0000000EZTx-1EgP;
	Wed, 02 Sep 2026 11:57:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaU-0000000EZSH-26M1;
	Wed, 02 Sep 2026 11:57:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1327F1D70;
	Wed,  2 Sep 2026 04:57:02 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF15D3F85F;
	Wed,  2 Sep 2026 04:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350225; bh=j5KZYcW3oeEza4wEEPuE0tmGJJW/8LJA7zNPUWzIuhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f884vSlO+uAcSOf6hpsG5kaWDJDu6ROVeqIxakx81gtXhm/KayFYQx3b0SCK781i+
	 ZSk6qtseiictiBC97Kr4v1QHtwtGjl/atFe3flG+GhuG+wfBXuUBazoiBAngDR8fvR
	 tKEl/qlZ1BbKg9E51TqNwea+bodKg9gJ9tMXlYsY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:06 +0100
Subject: [PATCH RFC v3 04/21] LoongArch: mm: define pud_leaf() only when
 PUD exists
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-4-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=991; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=MeOlGX5zz7TlceiZpHJLSajwL3IbIwIyElnPnwNLJYM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7jTpyCvz3weXiiloXvIu0HwGyNZYxNUOeR8
 zzOVDDHkf+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO4wAKCRBt1cPRWsUx
 M3FsDACKI0amFDWitWwqgh1X55KBW3r2psT1svJy9ACAY/TLdpJ2t6SqKg8N3iwOgav6tFmT1XU
 86PQMGlakmgCrVcxwGzFtiDfDMkcWhmxqA/hhBGByyFv3V8gAiqsIoTquASbDXeL6LoJdJ5A/xg
 IebsQSd4VBxzbzb0gOXKeqBB+7iXnGt0wae0LXAeHWxCPmG9kDER4VE2c68yCvvDMmeoYfzr1BH
 +OFsMihMBsPX8/ZK/6nTeTCYg8IPT+9DnZPLlxl0lP+VsQbT0ev47AJ3nVeUHxgAOk8zPIY9K9I
 dCABHAruCzWiJw+oV/AwPm/soI68/eQC5VVhARWFqQbPX19ouqoqsU7X4HJpSm751C8/KxvRCja
 Xy/x/jEo2crwE3wqLwygg1u2ZnbLaY8I5NsAH2gLHc3J9pcUSFUnPbsXlRmoFcDcVLAZVj5ic6J
 mm/ikE8OecbRalNsAOP1gdwZSr3I6i2GxLBhGHvtVWYZUt6+GxdiXpV3MblQM1dbfU9L8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045706_626625_1966F514 
X-CRM114-Status: GOOD (  11.19  )
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

In include/asm-generic/pgtable-nopmd.h, pud_leaf() is hardcoded
to return false as inline function, but it misses the "define pud_leaf
pud_leaf" part.

To prepare for fixing that, define pud_leaf() only when
__PAGETABLE_PMD_FOLDED isn't defined.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/loongarch/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index cf29a4c8ac59..8aee4fc27a26 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -630,7 +630,9 @@ static inline long pmd_protnone(pmd_t pmd)
 #endif /* CONFIG_ARCH_HAS_PTE_PROTNONE */
 
 #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
+#ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
+#endif
 
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
