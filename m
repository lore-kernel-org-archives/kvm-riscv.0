Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EABDC44539
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1dWh6hxRe+D8T0Upyeu5vfivYAO00/nP2uhHLku4s4=; b=KBauvOHjjKnfUR
	P4mOqRG/FsbKRhmB5arwETjtKxPUxUJkjK0xit49hojvBv9ZIHmjN4rfNwkBkUeIwDq6xTzD9dfYe
	Mk72j/5tA0YujPNG3D0MLyr++KM4BpOPh+MofE2YEPXumv3GKjm465Z/CNQX0awHC5XZyzbado9fz
	aoGoK7nelDY+GxeAkHFKdrFveafYDuLPwQbjT+IUz53YPlifj3wZfVbO6R9SFJWSNfmOPTMc1iiIv
	rUArhSCDit80GhcVghl/CihQLI2rffyM/KYOujjW5C1j+ZDgD34tigevaN5bz2rrNm0oIRuuzwrn4
	IAIEJ636suLjOI+yfKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYul-0000000CAF4-48eh;
	Wed, 22 Jul 2026 15:31:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYui-0000000CACa-44Hg;
	Wed, 22 Jul 2026 15:31:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF1B51691;
	Wed, 22 Jul 2026 08:31:11 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43CC43F66F;
	Wed, 22 Jul 2026 08:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734276; bh=hiWrXKZl3HSQimA2aMCTib+KVKF++dHLJJBYh+lph9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MPNrLQ+YsrzFiOpSP9SWG7N/+MHgnknKNZkXq4aPF58fJCxXjdRe8DHJBZU1yH/gb
	 Hz/yrfkTsAkIA/ai9FsVtwg3y7MKal7n0Ve6mdFNF8PditHoNSpER1jfZuPa1LaR0O
	 RKS15ZaEJK8eMHTb91p12+ZneLnHBLh7wAv66T/M=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:13 +0100
Subject: [PATCH RFC v2 05/20] MIPS: mm: define pud_leaf() only when PUD
 exists
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-5-d9e4bad31e0a@arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
In-Reply-To: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=954; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=H+H/wmu4330VwmFZtb9J1sA2hSnEoaKRqGEvxUP6qx4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIRWk1b7HFDPY1VFchgF5Cds4RBwgntIkDQd
 5jEN4eIWxmJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiEQAKCRBt1cPRWsUx
 M6wGDAC2lHq5x8fgh5N3V0oN64yuI0v5l4DrbkPQqL3r9rW2b0FNVBd8zIJiTJmI0CpqtAOemH4
 07Hnd7BkZnZpKDbHohJSPnUdu086S156nZ5ujv4kOhoHf8KmNwkqeHp18R78FvRHCex06Ri81uu
 vfeUTcJSNH5iNsf9kMiwUlTIsfEcXZA4/xSPo54Qe2vfVKC28/Y9VXC4xeiT92Sx0XyUgD5cQdu
 5sGaCdBzlMbyiAdTA4BA0bjCbVvtvdaz0mihbWktNtc5Ep0aa57zWF54tpr7+vdIp3Hl7AFudJz
 bf3BBQPe4rLdeg2tMCLgcXy2dUxCbFZJRH/oGKD8u59MwaVyGN5z4J01wLxQap/KzJi5ux9/KiP
 Mf4bjM2FpSXqbhPa479cy4ItfK3JCYLe+rXwrUEmg9zfiY2DG7BfXN3hY99ee4pjgVHIswn26Gy
 LkGQcigk9fzVC8V+gFi2TGvn5JttPDqyJr8QzSiXoSgwRxNuqZEx+nlFB5lY+w/pxZ7YA=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083117_347796_38A39327 
X-CRM114-Status: UNSURE (   9.39  )
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

In include/asm-generic/pgtable-nopmd.h, we do have a hard-coded
pud_leaf()=false inline function, but we miss the "define pud_leaf
pud_leaf" part.

 To prepare for fixing that, define pud_leaf() only if we don't have
 __PAGETABLE_PMD_FOLDED.

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
