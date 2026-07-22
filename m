Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA771C4453C
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WztD2fHfIwsxD/zP9mI5o6Yzu0WfoA6ZGoDdNSNLtc=; b=vvlt9ar/vXIDoY
	XpBQG66IsPnlGTQNLkO1vxZCz7ULTG/8nrZx8uI0x0xbBiL3CkrnZpGsIXF7w55k7QV/6VDTx0iuv
	DZ6SAVPuccKqNlHi64JT3irrT3nKRUtQuQwdQYnB7/5w5j6qj3zavvBuD4/IpYP0lA6dNndwrMgmh
	lpB1Dox4gIoMtKXEY8Japvi5lGu1f40l6QySaSE3zAwlBJuZsVfjs76GlX+rQL73btakIfEWqghyX
	EleN5R9VB6E9Sfziv3MwSrnnVz9pSTJcLiwY633/zIkZo5H/6Af6nwRfrXlvYAN9zNAzCvqcHOh4p
	OTbs/f4zlgAQEeS8sT6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvy-0000000CBOK-1uRo;
	Wed, 22 Jul 2026 15:32:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYvw-0000000CBMA-3qFE;
	Wed, 22 Jul 2026 15:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0cQUbVT+O+EUHn7P9FVcA0+b4cKu7nSUoPbro21uj4E=; b=DcHQ29Q9Q6QRvWA8v2CnqeurVI
	ShQhN63nfgm8h0fgC5k2s2yxrY+tUPnXpOb3T88VpwM1/Fi9az1/GWCEPq9Ju+Ws14bw/7dQ/LrLc
	RkQsTA0wJZGAgfRatUZEocvUJGDYYPane05NFzy4qA7px6aip3lvhDz2ovgwnqhNKVCW/LK1461MF
	W8pcXDMpn3hBJct8BWqV1n8T2Mm1SabO3d12XHQGTXdJvKAcldiD62JYPnfapvYAOiqRLOqbDWkGs
	ptkSiz5QbNVS7xbaNv3lEGJPBjaA+UT3j/lzb50OC80bbosbiJfvAXVG061WSjZx5IM1t6bwA6G80
	O/WZwZHg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmYvt-00000000x79-1qLW;
	Wed, 22 Jul 2026 15:32:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC0C81595;
	Wed, 22 Jul 2026 08:32:23 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 239BA3F66F;
	Wed, 22 Jul 2026 08:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734347; bh=vWdfZfN+TiiZA9mxg4SsfZFErqbDJUiR9ggvZZQt5JA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TluBfn6YvynnLDcgkk/QGS/YqHzTC1qQOYuWvEjPBaQRfpNlFivei9Evm3MWLvruP
	 TPbqCkwMeV/455tcZTKmsYaC7xvULM9EWroPcZjh24N/EDwhLaY+XZhbJrM151ixS0
	 tRinqhTWhBgUWaY0/Q9D4pc2+OS/ow878qXHsExY=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:23 +0100
Subject: [PATCH RFC v2 15/20] mm/pgtable: optimize pmdp_get() and friends
 for folded pagetable levels
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-15-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5184; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=cnUlm8DDOUq30iZM7WGkUZANPR8bNBvx+fV94KySXE8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIWDgQIN2ellQ1u+0chCvrQkqScLp7v2R/RU
 36cXzhY1xOJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiFgAKCRBt1cPRWsUx
 MyDDDACQWZei5YO99pneN8Lyoq4PWeM8DMKhrvzlE+hATCDxZYZYqyuMtbdAqTyetpmWXGW5siE
 gts8DGY7bYaUgcRAMVhigeJd7bcz7LMDtHhi/u/GW3DDpWGMfA7psXQ6DFVqYMnVUy+wCSNENOc
 SanzIHDCdilyEwAYEfSV92vfl0r239d6VSMLGN2WKD8fSNNn9WtMRLitSyiFRlcVM7uTDQ1D+9m
 swQnX0kJjxZd7fbD1Y0sB3pbgfhBXOnu1b93CBRLKHNK97V0z1hHNLSpcqwI5zeE6vgRLHvCAZ+
 atJFh938hNaw2px8jQNgsNCNI5gFUuCju1bSSlHelm07/m4HUaE3TMUe7Qo9/+h6h5xuytxKnAG
 EFEv9pl5Dr/xsuErnxJQDYY/m3S3fQDIuHvAduxYEAuJC4tT25Q/fdA4f0IMJCBKYgFKHO4WE/C
 BxD1l8i7ha71s9NuT5l/0LKh+2twxhEwhIB1IE99Tv/Df7TZ0p/Yl9HWK5rgCAYq/Y6GI=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163229_994795_4DD54399 
X-CRM114-Status: GOOD (  17.27  )
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

Using pmdp_get() and friends in common code on a kernel config with
folded page tables is suboptimal: they default to a READ_ONCE(), forcing
the compiler to actually read that value even though it will not actually
be used afterwards.

This was recently reported by Christophe Leroy [1] and block conversion
of more common code to pmdp_get() and friends.

(using pgdp_get() as one example)

Most of the code ignores the result from pgdp_get() on configs with
folded page tables entirely, as we hardcode:

        pgd_present()==1 && pgd_leaf()==false

Common code will just treat it as a "this is a page table" and call
p4d_offset() or p4d_offset_lockless() for the next lower level, where
we just ignore the obtained pgdp_get() result entirely.

So we can just return a dummy value and avoid any memory reads.

There is a catch, though:

1) If code calls pgd_val() and somehow relies on the data, it would now
   see dummy values. The code really must be aware of folded page table
   levels. Fortunately, code usually ignores pgd_val() completely for
   page tables (with ptdump being one exception when calculating
   effective permissions). We checked + fixed the x86 ptdump mechanism.

2) If code passes the pgd_t to a function that would work on the result,
   it would now see dummy values. The only concern is really passing
   the pgd_t on the stack as a pointer to p4d_offset(). Most code that
   would do that, should actually use p4d_offset_lockless(), which
   handles this properly. We checked + fixed problematic instances.

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
index 019c3f074b77..ab4a826b3404 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -34,6 +34,14 @@ static inline bool pgd_leaf(pgd_t pgd)		{ return false; }
  */
 #define set_pgd(pgdptr, pgdval)	set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval })
 
+static inline pgd_t pgdp_get(pgd_t *p4dp)
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
index ae2eff44889a..711e12e5d180 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -44,6 +44,14 @@ static inline void pud_clear(pud_t *pud)	{ }
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
index 5a2b0a81ae19..8f01abbb0050 100644
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
