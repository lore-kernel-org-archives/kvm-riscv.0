Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D9AC44536
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d60MB7Nsvk6UgkJFYVNBf7ZdeqMwPOn1wU/vpCPzblE=; b=UySicl8+D4lyP+
	M8DpOTY2Cis4bDeV+EbgfMdgjQQcOS0iDE6WfS6UYLnvwfJ0X6hcmikHmBTDPsRRT2qQYVKPF7THA
	2dBV0kEPjbyDgsclOweXcgZHpYr7B5fCyu8I7Tcd115u/JJTRT8DqWcJzdNDNpPlyXBUZBChynU/o
	z9tnYXoiI+CI9sMJ0hSMW6OPgJtECjZYpssTQHMgOza84MXl1FYzeYwiSRtgpt1wqSnb5rUsYfiTs
	cwUGeBIEgAU4pSnc0RFvjrLFFJrFVLZq+/NAtj2PxhcQGISA2iIc/r/GlBC/C0EWFLgnbVVb23eYq
	XPywKprsSSl6JnXcilKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuJ-0000000C9rq-1NM1;
	Wed, 22 Jul 2026 15:30:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuG-0000000C9pw-2LVs;
	Wed, 22 Jul 2026 15:30:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C92B1692;
	Wed, 22 Jul 2026 08:30:43 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D54C73F66F;
	Wed, 22 Jul 2026 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734247; bh=1TxWbr6Rxpr/d5K1ZjUMXUxW7m3hsO+YJqbH2QzQwcI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LnOf3bdGHBtoZ9/i1k15T6gHd7dFP7WuoAJk570GxSvUgd5BdOxok9HLl2YCyOHBL
	 GJxB7U5uIFfxd4a2DVlw6fjpxicCHGnU/35kh4VYvLmym+Ij0aC+RhyHruWS9eiadq
	 gW3ecxtyYk43muPXW0R4LEdqJ1kDHBQE3XVjR/zs=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:09 +0100
Subject: [PATCH RFC v2 01/20] ARM: mm: make nommu pgd_t a scalar
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-1-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=os/Mhoh7pmCouvRwHLkdVyqjdGpvrfvwObzVbRePc/o=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIPcYgvYMqhwm4vdMbW1urTvtv95E4cikIjK
 9DPVoDpWPSJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiDwAKCRBt1cPRWsUx
 MxtADACQ5kPn20eoyFghflTLYxkjfk9WmMH1osH5jieI1yjfetiAaE48NyNlaslyLflmRD3m8V2
 IzZhaFDaREkU/XBda6pU7oJRJCCkiOotAMqZxAvZX/Nd0MF6rAx7hg4kBftgowX7T24YeTiwjsk
 oR97ApgGOy9jhvsswneZVWYwMRBqKQIc0YifuSw4QsQ6YxH/uVJ9RXEVXDh8eAkUNDGq/5/FHz+
 fgYUvvW/mudG8ph8NK/bi46YJTSkKJewn0uSLAvgOo8iM+Yyoh4w4jfTzWr0RB6cL+V8dwNwZfT
 8EBqdswQ7UYO8u9xGlI1ZJ+hdCIt+TpzHAZHTy/nkDt0Ierri61xOfIEpb5muzV+Ng4V3sinnMy
 LUrit2NI1caaxtzJwcEXYkYnmcSOd6eLO8crfcjPSq+mhUn3i59hVIvFOwQhgUZT4T+1nEKvBmh
 z53Y2TNgYmiKgtoqRRExR9LCqzH8L8CJiQ3bkkb9K4QZ56iY9jVjj8TiMg4dlnITDoX4w=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083048_721098_1907D104 
X-CRM114-Status: GOOD (  12.49  )
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

We don't want pgd_t to be an array, as it prohibits returning it from a
function, like ptep_get().

There is no need to match the actual arm page tables, because with nommu
there are no page tables. It's all just in place to make the compiler
happy. Making it a scalar will make the compiler happy.

So let's just use an u32.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/page-nommu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/page-nommu.h b/arch/arm/include/asm/page-nommu.h
index e74415c959be..88659b38e236 100644
--- a/arch/arm/include/asm/page-nommu.h
+++ b/arch/arm/include/asm/page-nommu.h
@@ -18,12 +18,12 @@
  */
 typedef unsigned long pte_t;
 typedef unsigned long pmd_t;
-typedef unsigned long pgd_t[2];
+typedef unsigned long pgd_t;
 typedef unsigned long pgprot_t;
 
 #define pte_val(x)      (x)
 #define pmd_val(x)      (x)
-#define pgd_val(x)	((x)[0])
+#define pgd_val(x)      (x)
 #define pgprot_val(x)   (x)
 
 #define __pte(x)        (x)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
