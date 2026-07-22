Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7D9C4453C
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HNi3rXDl1Q7CZH2jyBVaUl+h7w+Qa957gMDraFLSwg=; b=jp423TxUAuQu1q
	ADPUxsEPrnjeotXuzTh5lN30mqsY2V/JKPYdBbtZGKCEyQXSzIU7AC7luiMSst2Xf7XXkk6IBnU54
	Dz/hnGmy390r2JbvrJz6ujS4Sxcq2WMby1SkbqtNvNrnbFDMWTMUPxjAr/2Hu+NAl27QOcBTY7NZn
	l54jR64dyyoZHkFtSHhHu0spS6+F4mH/8UBIOje0qnIjIOoQi89lfFGP/nTOmFLGn+OuPWaFYgJw+
	SMwV5BsIq++r9Ssx9jQ48VRzrofamkCF+7APu8j0yHDCJ73zsoV/LbTQ3KX+OjJpe6LmkLtmAcUbQ
	rJc7XscMMgfGfrAvPcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuf-0000000CA9P-28vx;
	Wed, 22 Jul 2026 15:31:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYub-0000000CA6F-3wzq;
	Wed, 22 Jul 2026 15:31:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C53141595;
	Wed, 22 Jul 2026 08:31:04 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C0253F66F;
	Wed, 22 Jul 2026 08:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734268; bh=j0suFj/k8Gjr4NVwWjc1PSJ1cuCmTYQ6kxO/jY4zAXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bYolj3D92O1Bkcb60RbrELEOeLxC7qGiqrMWoWtuCVK9o1rROA8BeSTEehzqczBjF
	 eYwaWgknouSSn8Jr4x8hjddfjdjfPza4khbR2hWMic7OBD53WOHQBqO1G9dCqsrvXW
	 gFBujbdyV1Mk5pLV6+vLyHnOJZ3ZEHNvXsqCp0Ew=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:12 +0100
Subject: [PATCH RFC v2 04/20] LoongArch: mm: define pud_leaf() only when
 PUD exists
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-4-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=XSgg9DU4z+fpwZlmcppVFAW3W7NViUDDiwwjek4Nc8g=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIRg3ZFYgpHwFK1On9j8uxrxy90og7ahILe6
 1yqnuhRWRWJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiEQAKCRBt1cPRWsUx
 M1QWDACgUOyq20o0bRU6YzrYy+b7sre2Ng1kMqamUWE3FtJ3UDmIzrC5o6Iq/xiJuQ3V8mER2+u
 sevnTIQQr89vZ9/I5k+KZosUXZ7NfZlvXH+uxw6usioIMN8Efb/0o7XAhncpDgnrhz0jqJReJ0c
 1FeAfWsc6PjjC+VCtxvXVgha6Xl8aEoKHnRFFsFgjeWCpMSQSvWE5cvMWaPhrkMA8dipKjE9B3n
 uJJ9l4UBtZuIa+OiF0higvwhEHRNZWiJvfJBssIZRq4J+qNjYnJmWaAfiiEEJtExocw3XkhHcZR
 bMflTxQkLe50zAegke/F3vuVZzXG0oSAyz5bDqzjnCYTY0YLf4L4C+PVKcIeOg8L1CMkgY7ZuAs
 jzmsrFaiIVlZeT+2qxJHempmPcEYOFmjrXOS+OlUA39p1kZ8vQzlvLM63vb4Ync4R1M4lQ7dOhq
 guDP4rJuLCL73MzRDrsWdrcsvjAB/6UlAUTfuSNeyvc4TBQH32QYx3FAtAbKB/T/1YZiE=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083110_075028_422C07F2 
X-CRM114-Status: GOOD (  10.46  )
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
 arch/loongarch/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 1952e34bc8ee..434e5b483466 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -636,7 +636,9 @@ static inline long pmd_protnone(pmd_t pmd)
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
