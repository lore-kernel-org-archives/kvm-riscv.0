Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C35C982ED
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Viv87kHkM/xPwdMra/JH0EjBdRc6iKOqAKXDxhFv2gM=; b=MTRIsV+uCh8wsZ
	snIVO6p2G70SydxddZF6My3zM3uVX52ShcOpRYjul0vF+6Kemh26LOzyLfLXx6GMP7hQRkIWAbh6b
	bf+H0DJTbBilGO9qmNJ76cYDG+Kpj+xqcZU/f1phsgHcDwpolfqq/smggBqgZ8ILxDqSLW+/55PWX
	uxJVJZLwpfM9WQOtc/2q7sk2fGDbeMXyM8jZDoiA8Vydo1tVzdwdjp1dLLA6srFtuZRXdm3WSXETI
	ai3KZX2yf6JHpL78PN2ckXtx1gs984FPbGLui3RpBkP8krJq5waBJQD3tTRWgXEynltZnXQo+QfCh
	yFbvmJADVVny8/jGxe5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bin-00000001mhB-1ZOE;
	Mon, 21 Sep 2026 10:58:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bim-00000001mfO-1DmJ;
	Mon, 21 Sep 2026 10:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PPh7P4/uTe2DdUqFkWDXpxMIk96xx52i1UmgW1/Bvi4=; b=om5981RtHou5+rDT3S2puy51SM
	fixl7A8ihejFaf58kkHdbTAcemDLvcDeuMd2SdcbElW1frdT24Uw2DLMvEqHiMBbVHAfn56K6qMA+
	Ob7LMl76Fp+XuG+oLwddRdkoL8GFAszs/RR6KkSoKMQf+krNTIUGao9nQ4EA4BHmBfSprWzW7VXA9
	JsnEj3bJCtGpREOvOS6EgPtFbxglOWxoxTAjxY+CXZ38CnwVVm6wBRypPe6wx/dw4zXuvYoYXVgpf
	ezi7l7Pb0PqDJN0abAfHUkJazM2Rr0zIYT4ovZHuIKgHUsHdRM3qE5TlWnoPYomjSgZyruKBCirrm
	xZlzpvCA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8bii-0000000C9RX-3G9a;
	Mon, 21 Sep 2026 10:58:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E73E61570;
	Mon, 21 Sep 2026 03:57:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3592C3F86C;
	Mon, 21 Sep 2026 03:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789988279; bh=Y8EwOxLNbw4UfgGXcWJN4XYR7fgRn1Moj06vSGiaGhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Acv2ig2sdtBQm1rWWS02siT0WU0ZatIgo532lzW7QnReSNXQH1ySM+8DelzsQa55e
	 0TVi9G11NlTKdUH74Sp6k0cO+qCtLFbvrelhmtDh0SsbAsGd/j0A7ufpMeXn2Es2yz
	 Xmxo3CKqJ1ia+7cA6vpupVw3peojMkInMbV3ExN4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 21 Sep 2026 11:55:34 +0100
Subject: [PATCH 12/21] mm/pgtable: redefine PGTABLE_LEVEL enum with ascend
 order from PGD
MIME-Version: 1.0
Message-Id: <20260921-dummy_ptxp3-v1-12-cd40cf68242e@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=Y8EwOxLNbw4UfgGXcWJN4XYR7fgRn1Moj06vSGiaGhw=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQ1QUaPfd/TdZdMCVJig81AKqOVJKDuhmr9iK
 mpmDD+NEl+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarENUAAKCRBt1cPRWsUx
 MzrLC/9aTw7wgAVsVSkyAx9JoerSy/E93mC4rUycb4dvDtSfmjpnvXqlvMNOZ0X4B5Tw+BHjFpL
 9jH7TfpouVsi3ilgGlYWmhFqe3BTMspr76UeuII7d1gg8OfdV923kIjDcgioZarrRikees4YSip
 5uqKCkUTlyqCGmKOuU7nhOAK7tW4wYh0FmSWSpiG0PLWIeBMOwyBw/zW8ypmQTnMIIB1wuLzs/u
 7ROCVrCCjQ/dan0IYAxg+t7qTPtpD8XuY7kE8NURgpEKId4bCFhy3U/wB3lIQdsLHM2mgGlnKYV
 zy6aNQBGpN9mKjDtE/bZGY6gmk+CVWrUNVbiSTouNAfpiUTsGa+e6Yl0KqWvXhip7lrYnaQWTzm
 Q2l8/kQPPW5++rC7+eeJkINpxVX3PFWYeBJwLOBF75Lr6+GAyvrtK5usO7NuLcJLTYaKd/1JKHL
 OxP80e+rles/44lu4BlVndGbnxkSWb4UFg7VdtjQ5e0MfYATc+XAacUtqoHmAK6Nsi+34=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_115801_640134_2C6DA3EB 
X-CRM114-Status: GOOD (  11.76  )
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

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/linux/pgtable.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e3c8ab96941c5..3186096a6e130 100644
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
