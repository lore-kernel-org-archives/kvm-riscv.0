Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF62C982EE
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 10:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrOp3bNjDP3wgXoGQlHQgeH/ydi4VUtTckXQvNK7bcE=; b=vhlCTfWVcSU4Hm
	iWsiVXoBX3C2S3D7n1CXgEEWvq44EoLpALYNQiIdlt60LODGn/UAhoA4SERLdbfhOLhd35wpwjD8t
	H6H5ZfcWtcPQC32+pWa4KzAF8j6vE33CdpMwgH9uWyfY/nRUBc7VDAwTdIVgW6bh1pZp4Dq8Ii+jt
	vY5z5zCYo2GyNQqF2/oXfSX+wyEmq5rDO5shQAYiHrrrX2pQcqc52Zou/x/P+ZPSgetqoUyrGQA7O
	op05bYlNJ9SEl6pxFVenPHbFc0bguXLLAgiS9QjkqnE8eseWxkKono25Ytbyd4s4mEw440hbHgufV
	osm/0slgNkGOtPevYx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bhl-00000001lkm-3SVL;
	Mon, 21 Sep 2026 10:57:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bhj-00000001liT-2oGx;
	Mon, 21 Sep 2026 10:57:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B0B41CE0;
	Mon, 21 Sep 2026 03:56:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA2C53F86C;
	Mon, 21 Sep 2026 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988219; bh=rnI7y0Fpi9EpSaKs0zPg/sympiblJU7quGD2p5tv2as=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Erxu0w3k0j6ub5hHfj+RN6pEhjSNKHkKz8ooYKskXllnoLVwJ8Ut4DZ7NeEJ5/rDP
	 SPY3vbUR4axOfHnsqT+sZBjZVHL/E9nsVWbpsXIhcl8s27YOeWUOZEH7qpSiFxdsmr
	 myTCIU+NKUGM4uM3qVejSjvoXD/mXvabuVl3WG3g=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:55:26 +0100
Subject: [PATCH 04/21] LoongArch: mm: define pud_leaf() only when PUD
 exists
MIME-Version: 1.0
Message-Id: <20260921-dummy_ptxp3-v1-4-cd40cf68242e@arm.com>
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
 linux-openrisc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=uHP3fCujvTA7teOGPJseRh4165tfxVj1UjkqwzmtCWQ=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQ1MsnYSzGCrfSvMhPR2nenqzfaOWd2TWY08B
 FS8dv7UCUWJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarENTAAKCRBt1cPRWsUx
 MwVVDADY86GBwYvZ/9NRAVbtoFfHEGdfPzdSbaqYPaX2rteHd+ssXS7FQyNXF7l/1y5jgMN6f8T
 u7ZaYgOKw41FfG1EJ8ZIDiu9bHuqzDTTvuRML+XcjRwJXrhPRAztnbXo/OZ1RTqo729jpcB5Xl9
 9PS3DceEj++x8zDzmyN8uxazCUfLRsT6GzwULKx9ysQ+5jUUhYPliUTuPjjCAry4VEjHRk2u0Ed
 vQh9FTH94HI/jFBfC4SZtHDWf6T1x5Mb0/CSBtnqPk4Pme3fbJMuU2FsPfmyKx2KBuYHJkBfRDZ
 2znp1ATgR9+XFXRZo4l/N1jmwBMxYXnA63Q4aLVjuDFyHKRaqnvXBv39ZW6q6spPgH9F7MIAiZ8
 X6kHCzMocHrCdxMnZwrD4R9ifssomtcBwjrY1xxB7PCNiew50qsZ9SlhqunzUmYP5D4KRNdR9Eu
 yEbDNwJYCgqoM0+XH0D/u8DleX7OGnVzPCTqimSGz40CcsWXg4oKF9+WTv4QSQoYAQubY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_035659_833852_A1B64E77 
X-CRM114-Status: GOOD (  10.43  )
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
index cf29a4c8ac593..8aee4fc27a26e 100644
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
