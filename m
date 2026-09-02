Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C97C61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJeiVF+eiU/PbOmcgn8JbQ9tb0UPwbznMRQqeynmAQE=; b=NTEdmj6wW9DYgt
	ubTfQQ6bgaM61e85N4LYrqmHk5CMNuC5Thd3/mXIYJ+N08+nwuKZLNPKa+xzrxsuGmG2odINtxLgw
	eWdkbEn9Yz8SpvqdbBSwOpfcvhbj3Zu4aZkQaPNnpJ0Y/slPAT+1s/0pWHBcYgLy1QynFodbHc+rH
	Ux4DxboejduFxVs3zJOGB5ZfbN2dlmb9Z43CLPj/pUr2ZV9lWu2WYFJ6W7ddI0qKkknTZev+X8/kG
	ZMG9fVyhUy57UWg3dMlEcJkP17DfRH1YTi4KbhwrQ5sJXKQxMcXBPXGGudV4xeFSH9UbKl8uAjV9L
	ZGwOFPaVEulykWkGo9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaI-0000000EZJm-1jKX;
	Wed, 02 Sep 2026 11:56:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaF-0000000EZIW-3lDt;
	Wed, 02 Sep 2026 11:56:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25B9F1E4D;
	Wed,  2 Sep 2026 04:56:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C29DA3F85F;
	Wed,  2 Sep 2026 04:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350210; bh=gPlnE5UqZRk40YfWFz/1w9GlKcNlqtJOo/oAxLycbvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JngvOrh/7RH2K28ggppoS4NPOaZa16P0lMCoxQdm8Y5sORQtjxmHS2nRWh7A+nD4U
	 lR6pGdNIo04IsFUKW5Iu2DeZy5RCXDzqAoufI7eiLPS9ULkCP3Objs0zsXamRb15xM
	 79g8rzGAvghuXLj6fzSyLmOEqrVRnC+EMjOuSpSI=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:04 +0100
Subject: [PATCH RFC v3 02/21] ARM: mm: make 2-level pgd_t a scalar
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-2-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=uhcO6NTPYBqTkI+U1pSNHYmMsIjTOQrElUAua45fg4s=;
 b=kA0DAAoBbdXD0VrFMTMByyZiAGqYDuKh4pUBsXDB1v/n9ZVHNsXgpbZHusYBh6IUK6klb7xYB
 YkBswQAAQoAHRYhBC2D4JLdBTO4WHWknW3Vw9FaxTEzBQJqmA7iAAoJEG3Vw9FaxTEz0BQL/2nk
 sf3h4xmh3cZtnS+lTvf+itMKAMxUvApGWmC4Wv39xE1jps4ZQyzWb/SJp98V66g00L30MWVLQgD
 tat6tOwX2/q+6qy17JKwUz/7i6TzD/TZzQ32xBFcvYhluUlq4Pz649NjIZ1uEl17UZziViJLQZo
 B644h4n9Wc3Fi0IzgaW+5KhHLWdt3ZRDR4WZpZi7IjFTFL9oWkZy+PhQQbx81hRv7nsS9YwgULP
 fPyvywMC5/BRNiJv4Bv2rw2drYfgLwbtkRYVXdzToW0jskEmlweWHUbj/LEfWkimMjxMWvghuAo
 Oeu5Ftb+6z/NoWkVWxtiZgTWcKlD6bqJRc4X95Ub5E3L9cgOVL/seXRA+oZwAczjdUHNqa91mAl
 pnh0MNHv3f/9NAQhLk8LtdSDcYIXBjJ6AbC+3whUFU8/q87D2oQ4K6sGHgvH6W2nYMjrBVc4by4
 tF8lhm2Doykt9IqmrtjwiMUDhbIJElBOahrbMYMCzbEgkFh+2nRz6QH8GanA==
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045652_024522_F26D74C3 
X-CRM114-Status: GOOD (  14.74  )
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

As pgd_t is returned from a function like pgdp_get(), pgd_t shouldn't
be an array.

So, just use an u64, and extract the right 32bit value in pgd_val().

Leave the STRICT_MM_TYPECHECKS case alone for now.

As an alternative, the STRICT_MM_TYPECHECKS approach could be used here
as well, but using an u64 looks conceptually cleaner, even though
pgd_val() gets a bit more involved.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/pgtable-2level-types.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level-types.h b/arch/arm/include/asm/pgtable-2level-types.h
index 650e793f4142..805044ea315b 100644
--- a/arch/arm/include/asm/pgtable-2level-types.h
+++ b/arch/arm/include/asm/pgtable-2level-types.h
@@ -25,7 +25,7 @@ typedef struct { pteval_t pgprot; } pgprot_t;
 
 #define pte_val(x)      ((x).pte)
 #define pmd_val(x)      ((x).pmd)
-#define pgd_val(x)	((x).pgd[0])
+#define pgd_val(x)      ((x).pgd[0])
 #define pgprot_val(x)   ((x).pgprot)
 
 #define __pte(x)        ((pte_t) { (x) } )
@@ -36,14 +36,28 @@ typedef struct { pteval_t pgprot; } pgprot_t;
 /*
  * .. while these make it easier on the compiler
  */
+typedef u64 pgdval_t;
+
 typedef pteval_t pte_t;
 typedef pmdval_t pmd_t;
-typedef pmdval_t pgd_t[2];
+typedef pgdval_t pgd_t;
 typedef pteval_t pgprot_t;
 
 #define pte_val(x)      (x)
 #define pmd_val(x)      (x)
-#define pgd_val(x)	((x)[0])
+
+static inline pmdval_t pgd_val(pgd_t pgd)
+{
+	/*
+	 * A PGD entry actually corresponds to two PMD entries in the PMD table.
+	 * Both PMD entries point to PTE tables residing in the same physical page,
+	 * but at different offsets. See include/asm/pgtable-2level.h for details.
+	 *
+	 * Historically, pgd_val() has returned the lower of the two PMD entries.
+	 */
+	return (*(pmdval_t (*)[2])&pgd)[0];
+}
+
 #define pgprot_val(x)   (x)
 
 #define __pte(x)        (x)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
