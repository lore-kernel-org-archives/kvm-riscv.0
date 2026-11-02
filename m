Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965DA60A2610
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yWuamLM3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ItsLpBHD;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=O6Y5aTQJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sJcSNL1gfe/4sHcLqljczN2fciUns8zVF6eQfbEwqEQ=; b=yWuamLM34P1Vx3WrYKgks50h4O
	xRA97dXZz99iZ9tBvOcWsH7IAIKF2RKe5nVrGV4AVWGxe2cf6JX1AxAAD5DT0GHKqTs39Y3VnQ5XE
	BZfVLpdsxNdh4Q+jdn5ZQUmHWE8v5KjwEc9MUKOddaudN5hpjU5W4TmbpJ0xoN5fBdfib+awDLjdv
	8rIJmjvirZ7REJoSOHAEeURXdznP4jcjjUoi7kEo3fnLWjxz9bwXHYC+CDPDKIcFmQNh/7o4MmFdg
	VmdtQxFSeSu5gTDm2nR62FGTz3Hjvk0+YgE6n08x81SICqkH1HbCrfPS9l9wiy8IMsFjqJOYNHdHc
	0/c4+Yew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8T-0000000GK3K-0kUG;
	Mon, 02 Nov 2026 11:23:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8R-0000000GK1V-03ac;
	Mon, 02 Nov 2026 11:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bzbkHlCXIOztNCUIQ2oe4PXisYyJ6l3zF3m0g0wGdqo=; b=ItsLpBHDp209VTm91VqyDRC2ua
	ZWzMnlbXcHbwe+7BEWE065D2uq9jhl6I807G4AQng6vB7eL0aVjl7JvpsUr6AiLAyJihBjSabCoui
	v6Rb5IltqpSw6Mvovulrv0441P/GetWvpCrHF9js0MtISn3Wd8iXAxs3U+dBLOZ+M1JbOP/9iQ606
	8YdlEa0ysmCO9PKAWY865+bXCYOSpuDH/XrneVm7QT8GcvxC+rZH28gLpt7EvmFAQJibRgsg0v1v6
	jAGaGJluT5licSfFyibR+Es9haRo7+0LMRVsrb34aS9zG4YGHD8lopVwxDV/zR31vom3HlOvKulIJ
	6Sw13NHw==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8L-00000002FCS-20sl;
	Mon, 02 Nov 2026 11:23:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E0282A31;
	Mon,  2 Nov 2026 03:23:21 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 425403F632;
	Mon,  2 Nov 2026 03:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618604; bh=3qwcredkJP47Q0knCs8r2zQMj6PgEaC6pvNuESy4rVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O6Y5aTQJGvriCytR9bYPhPc8teP7S38goXBCyi0FrXHhPcgUI/VK5QVSOYRjvKkWX
	 RN0/pAen7AAHAps9w7HSRdvtyoM9DYJ+IN2BHRbHL1MPPhiy2Rrxfh3JKryeMbngMC
	 35sXBD2JouQDrqVQDe9c4jQWSg46NUeELFmBDt2M=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:30 +0000
Subject: [PATCH RESEND v2 17/21] mm/pgtable: optimize pmdp_get() and
 friends for folded pagetable levels
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-17-78840b2ec73c@arm.com>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
In-Reply-To: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5359; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=7UYhDG8FvnoAk5ImIUgRe9XhRYP6zIOaKvnUSG6ABJs=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HI3ORBjhDgVhiG8NLXgz+05V/q3PbFarKyI1
 M1+TFxo5X6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyNwAKCRBt1cPRWsUx
 M4K8C/9RIui2TsgD3POI6zjdB3SZC/Jq7bkgNK0EXZ7pxRiCpRWJ3s+y6XKZKi08pLUrW/0doeo
 f79FzUimsG5sWq8i7o3Qvs8iLUlOerz7iIeU8CLwgackXEZI8Yp1OtC3Pa3eIgti8dVW4HCVAc2
 45fyjV6RiSA/h0N2l5M2E5xAHzKdpGSyG4V1e1z2f/E+xvh4yJaK6PeTyVo7ITroN161YMVMyyH
 IqXfICPAav4K4QcS7SJFjxr11Dv9S5lhwprM4oAiu7UGSz0RWlaI9dA9WIlYHppYNQ9Ep7wcFKd
 PZUAI+/RIF5Jx2eFscXFI2ZijjsPo9Z79NpjqsD/oyBAZVh61V9A/nwySidlAV2yzU2RCgjuTIp
 A6YGZmNpCwkrO+3fkndiCg0vgX5Xw7Tt2Y1osCKh8GORdrTenvXH+Km7wCwjhvE1RI8DwmyU/rj
 fRQb3IcrX1TH+HW+cpEGyHwUcXlzYYKevuYTiKGU+ESHSEFQ6OAJMtmtmxsbgFsZ6yyW4=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_112325_823554_5018FCB8 
X-CRM114-Status: GOOD (  18.32  )
X-Spam-Score: -4.4 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "David Hildenbrand (Arm)" <david@kernel.org>

Using pmdp_get() and friends in common code on a kernel config with
folded page tables is suboptimal: they default to a READ_ONCE(), forcing
the compiler to actually read that value even though it will not actually
be used afterwards.

This was recently reported by Christophe Leroy [1] and block conversion
of more common code to pmdp_get() and friends.

(using pgdp_get() as one example)

Most of the code ignores the result from pgdp_get() on configs with
folded page tables entirely, as it's hardcoded:

        pgd_present()==1 && pgd_leaf()==false

Common code will just treat it as a "this is a page table" and call
p4d_offset() or p4d_offset_lockless() for the next lower level, where
the obtained pgdp_get() result is ignored entirely.

So, return a dummy value and avoid any memory reads.

There is a catch, though:

1) If code calls pgd_val() and somehow relies on the data, it would now
   see dummy values. The code really must be aware of folded page table
   levels. Fortunately, code usually ignores pgd_val() completely for
   page tables (with ptdump being one exception when calculating
   effective permissions). it's checked + fixed the x86 ptdump mechanism.

2) If code passes the pgd_t to a function that would work on the result,
   it would now see dummy values. The only concern is really passing
   the pgd_t on the stack as a pointer to p4d_offset(). Most code that
   would do that, should actually use p4d_offset_lockless(), which
   handles this properly. it's checked + fixed problematic instances.

3) Calling set_pgd() / pgd_page() / pgd_page_vaddr() with a pgd_t obtained through
   pgdp_get(). There was once such case in riscv code with set_pgd(), which
   is fixed.

As an example, this is the generated code for perf_get_page_size() with
PGTABLE_LEVELS=3 on arm64:

Before:
00000000000052a0 <perf_get_page_size>:
    ...
    52dc: d53b4234      mrs     x20, DAIF
    52e0: d50343df      msr     DAIFSet, #0x3
    ...
    52fc: d35e9a69      ubfx    x9, x19, #30, #9        /* pud_offset_lockless() */
    5300: f9403508      ldr     x8, [x8, #0x68]
    5304: f869790a      ldr     x10, [x8, x9, lsl #3]   /* pudp_get() */
    5308: f90007ea      str     x10, [sp, #0x8]
    530c: f8697908      ldr     x8, [x8, x9, lsl #3]    /* pudp_get() */
    ...
    5360: 90000009      adrp    x9, 0x5000 <perf_prepare_sample+0x548>
    5364: 92746908      and     x8, x8, #0x7ffffff000
    5368: d3557675      ubfx    x21, x19, #21, #9       /* pmd_offset_lockless() */
    ...
    5394: f8757ac8      ldr     x8, [x22, x21, lsl #3]  /* pmdp_get() */

After:
0000000000052a0 <perf_get_page_size>:
    ...
    52dc: d53b4234      mrs     x20, DAIF
    52e0: d50343df      msr     DAIFSet, #0x3
    ...                                                 /* no pud_offset_lockless() and pudp_get() */
    5318: 90000009      adrp    x9, 0x5000 <perf_prepare_sample+0x548>
    531c: 92746908      and     x8, x8, #0x7ffffff000
    5320: d3557675      ubfx    x21, x19, #21, #9       /* pmd_offset_lockless() */
    ...
    5334: f8757ac8      ldr     x8, [x22, x21, lsl #3]  /* pmdp_get() */

[1] https://lore.kernel.org/all/0019d675-ce3d-4a5c-89ed-f126c45145c9@kernel.org/

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/asm-generic/pgtable-nop4d.h | 8 ++++++++
 include/asm-generic/pgtable-nopmd.h | 8 ++++++++
 include/asm-generic/pgtable-nopud.h | 8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index 019c3f074b771..acd62ee233536 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -34,6 +34,14 @@ static inline bool pgd_leaf(pgd_t pgd)		{ return false; }
  */
 #define set_pgd(pgdptr, pgdval)	set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval })
 
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	pgd_t dummy = { 0 };
+
+	return dummy;
+}
+#define pgdp_get pgdp_get
+
 static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
 {
 	return (p4d_t *)pgd;
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 1dd5b165234be..9322f07ddf1ef 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -43,6 +43,14 @@ static inline void pud_clear(pud_t *pud)	{ }
  */
 #define set_pud(pudptr, pudval)			set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
 
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	pud_t dummy = { 0 };
+
+	return dummy;
+}
+#define pudp_get pudp_get
+
 static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
 {
 	return (pmd_t *)pud;
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 5a2b0a81ae197..8f01abbb00503 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -41,6 +41,14 @@ static inline bool p4d_leaf(p4d_t p4d)		{ return false; }
  */
 #define set_p4d(p4dptr, p4dval)	set_pud((pud_t *)(p4dptr), (pud_t) { p4dval })
 
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	p4d_t dummy = { 0 };
+
+	return dummy;
+}
+#define p4dp_get p4dp_get
+
 static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 {
 	return (pud_t *)p4d;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
