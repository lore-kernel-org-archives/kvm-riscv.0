Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031D0C61DD6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OEIcFKS+2XNEgRg6U4xepxwUmAt3okTvq+jpJf/H+E=; b=0+YTZW9dGW5yOL
	eIhoWPuEA1ix6Zzeqv0i9+a42qzcWMOts43QXv3qDiByjANPlRB7+j+C04zvNpunYOe1Zbp9QONfX
	JhaiZ0kH8ncwZSNHGGvb73roE9i7ooWEw+V6gkC2SlZWWOKlWtEldm81pdwMQYYOqMSIgC19zERF+
	+wNbQZ0ZNWTpmWBlD273fAlnJltN0SkNKhoO+BUTf7LkoYJ+rlwHs8E3e15cCW+uh5/7LAiF92O/L
	h5T9m4bxwatcRb/DsLCaiGte/Zh4pHS/oEnUwBcwU+912YT56JP8KE7MUDy3Nejxue+tpzPYVe20m
	GnsJ3rM8P8lGFanTW16g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jat-0000000EZnU-1Yqo;
	Wed, 02 Sep 2026 11:57:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jaq-0000000EZkI-3DDN;
	Wed, 02 Sep 2026 11:57:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE5A1D70;
	Wed,  2 Sep 2026 04:57:24 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15A5D3F85F;
	Wed,  2 Sep 2026 04:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350248; bh=/uVVaZbANKTyQZBvzqokqiJ5S0l7q5Ev2Sa3zWB4nwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jWEeau8tzvvOEJXMajlw0s2Og1QbQrAamo2x7HYqtmKGW5bh/GYdN4OCHuQHZowYN
	 TmKaih9bsJcgin/v5UhXkmHL/FyORMqpa6csnzF80NXkHtZQUA9VuB56RP2EVvumeQ
	 M4gDZeFItRFdcWxnkaj++wrQeFU39j68RwDt1bvg=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:09 +0100
Subject: [PATCH RFC v3 07/21] mm/pgtable: define
 (pgd|p4d|pud)_offset_lockless() for folded page tables
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-7-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4358; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=0K77KUA2sW2O3loVo0xQJvE1O+c56uuIFMZeynwrGG8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7lnvBstmPeoa+tQW6jXHQCdviCtwcFUASWP
 PwH1pn6cH6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO5QAKCRBt1cPRWsUx
 M2EoC/4spxeicYhe0dGTJBcXGHGvIvetXBxvYCenurnv2K7/veM+Hixfu6V0L9cF33kWA78aSzf
 +ldUT24g+izjNf9DXOWjwMtW0cvqMzLAMSI+t6g8b42alZPRJhOk8LR0GdTww3EAbQXrglpcvqs
 Sv0yfLpVt9bEglmkJrbozEiK+WPhQ5tyqEELuq/yAH8TjnE2uZ7fvf13Kj5amZMbeZKG7k/IxQP
 CtxvwBUmgwlVmv3wYaGogz4sRZPEUjaYdrmeC1gNdaYx6j4IW6mjBY2LHpqeV9LwejE2GRX63OX
 TDhnYfZiH7LLWACLvTjUnxbvziGFz9gQ1tBpjGyuBmxRWG8kQpxz1lRq8qJ9+9d/FxwVz5BU7Wf
 0jhfHnh95KL9JJ86YJ/+cq2H+uZJsZoSm3El/g83fGpqw5bqzDHu6TJODSjEvCbrTAPYynWqR1V
 QwdXl1hJ9cfSbbMxQJGhEQpCGDgEji8BP+ZQy7i+uIHtXdd2fJUd10EyagGmlCXLGttjs=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_045729_041044_3C6E0C4C 
X-CRM114-Status: GOOD (  15.27  )
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

The default helpers fallback to pud_offset(), passing a pointer to the
stack value.

Let's provide variants that do exactly what (pgd|p4d|pud)_offset() do,
but ignore the passed pgd_t/p4d_t/pud_t, consequently not working on a
pointer to the stack value like the default handlers would.

With this patch, Drop the arm64 custom variant that did that. As it documents:

	Note: reusing the original pointer means that it may be
	dereferenced the same (live) page-table entry multiple times.
	This is safe because it is still only loaded once in the
	context of each level and the CPU guarantees same-address
	read-after-read ordering.

Do not document this, as the double read will be removed in the next patch.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm64/include/asm/pgtable.h    | 23 -----------------------
 include/asm-generic/pgtable-nop4d.h |  7 +++++++
 include/asm-generic/pgtable-nopmd.h |  7 +++++++
 include/asm-generic/pgtable-nopud.h |  7 +++++++
 4 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index e89ec5f4787b..a3c882e46777 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1180,29 +1180,6 @@ static inline bool pgtable_l5_enabled(void) { return false; }
 #define p4d_clear_fixmap()
 
 #define p4d_offset_kimg(dir,addr)	((p4d_t *)dir)
-
-static inline
-p4d_t *p4d_offset_lockless_folded(pgd_t *pgdp, pgd_t pgd, unsigned long addr)
-{
-	/*
-	 * With runtime folding of the pud, pud_offset_lockless() passes
-	 * the 'pgd_t *' we return here to p4d_to_folded_pud(), which
-	 * will offset the pointer assuming that it points into
-	 * a page-table page. However, the fast GUP path passes us a
-	 * pgd_t allocated on the stack and so we must use the original
-	 * pointer in 'pgdp' to construct the p4d pointer instead of
-	 * using the generic p4d_offset_lockless() implementation.
-	 *
-	 * Note: reusing the original pointer means that we may
-	 * dereference the same (live) page-table entry multiple times.
-	 * This is safe because it is still only loaded once in the
-	 * context of each level and the CPU guarantees same-address
-	 * read-after-read ordering.
-	 */
-	return p4d_offset(pgdp, addr);
-}
-#define p4d_offset_lockless p4d_offset_lockless_folded
-
 #endif  /* CONFIG_PGTABLE_LEVELS > 4 */
 
 #define pgd_set_fixmap(addr)	((pgd_t *)set_fixmap_offset(FIX_PGD, addr))
diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index c6a5a43899b5..019c3f074b77 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -39,6 +39,13 @@ static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
 	return (p4d_t *)pgd;
 }
 
+static inline p4d_t *p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd,
+		unsigned long address)
+{
+	return (p4d_t *)pgdp;
+}
+#define p4d_offset_lockless p4d_offset_lockless
+
 #define p4d_val(x)				(pgd_val((x).pgd))
 #define __p4d(x)				((p4d_t) { __pgd(x) })
 
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 4e5aaf253b6a..1dd5b165234b 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -49,6 +49,13 @@ static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
 }
 #define pmd_offset pmd_offset
 
+static inline pmd_t *pmd_offset_lockless(pud_t *pudp, pud_t pud,
+		unsigned long address)
+{
+	return (pmd_t *)pudp;
+}
+#define pmd_offset_lockless pmd_offset_lockless
+
 #define pmd_val(x)				(pud_val((x).pud))
 #define __pmd(x)				((pmd_t) { __pud(x) } )
 
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 6c9bca78047c..5a2b0a81ae19 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -47,6 +47,13 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 }
 #define pud_offset pud_offset
 
+static inline pud_t *pud_offset_lockless(p4d_t *p4dp, p4d_t p4d,
+		unsigned long address)
+{
+	return (pud_t *)p4dp;
+}
+#define pud_offset_lockless pud_offset_lockless
+
 #define pud_val(x)				(p4d_val((x).p4d))
 #define __pud(x)				((pud_t) { __p4d(x) })
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
