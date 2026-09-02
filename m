Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEC4C624D5
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbqTeQuesxjHv516R3n5rp9c0VAj8vZtk3zFKB7tEa4=; b=yKBzWgJUTCKZOO
	Sq8Z4yUNP7SwB6hwdLgjRweMRNIsPhQMqILXBlOalI1ICCz19RDodwG8dUg39pr8z6QM3fWMgRTJp
	C/lNR2cyPcwY/JWZ5ThLtZdhNfapJq807OOsBid1NwQoJCEh263qgtrnp6W/L/Q49Ad2DEqaVXZPs
	V3hnHmxlj/gxL2PVYQRPa3RvCuSH9I5ttX493InJ5QOKhXKufCe+BxNkMduTgZEBlTPC+pWP2dcIH
	hyielPkpKRFSJEim90mZiD7Dlm8DgNo9ExOqE/6m4HjiwXRj+zxKS0lCYWMX8SHBFI1zfkZm6+jGx
	DxBqYPdbFvyW1ZCIeVrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jcJ-0000000EbCN-2ZIb;
	Wed, 02 Sep 2026 11:58:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jcI-0000000EbAu-1KO8;
	Wed, 02 Sep 2026 11:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/GEX+b/EG654g5ZBX1T3eHjkA6GsCqfSs0yD896S7Ys=; b=qJrJvMawxHyqGppZ+rwqMgSYbi
	/gMLQ4DrtcHivEk58CA7GPC5NmidpCjzlkvfDYIv5Gs2cPVC/vNzEmDaTRqG8X91gyaXdZ4KslZ71
	rMh9Bwd1mWkvPBcjOTVTMKXrjbpc2NvQRj8+h+CtW1Dhl53WdG/j3DG5Fn6ulT5JrVPxBZpdOtukM
	SV/7RfWn/UW8N/EQ6xoLRLoQKD1sh+lNEQlfJ6jIwFlyd2hTO//5Sn2YzKcoWhoLv980SIlsaV8pN
	i26QPZ9rxV7d0UFgFYLUO9d1/Bw+yhuo8UmnyZ4ZbpDKQX2Djn/9PgYsWbZHkw+8AgbG0cDQ3pa94
	BgvOBJ9Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1jcC-0000000BvxJ-2oqt;
	Wed, 02 Sep 2026 11:58:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A27EB1E4D;
	Wed,  2 Sep 2026 04:58:47 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C8F23F85F;
	Wed,  2 Sep 2026 04:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788350331; bh=umnYd1J6xWmWFbnXzi3vz83x/xuEZGuwLZioU2+M5Ww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LlZFY9Zu2ujRoZsjVc5Ynf2s++UIneYX6haXrd56wziFajt7R1Vz7bs5m5ByxWxwX
	 gAf8HR+B/ZejTvZgWMMsSDjiH+aScSDD0TNx49sKtqrpKW9d2X4/EzCi6sP1blOQHa
	 aavxMs32nXDjC5vLPAu44ffpYuzHK4DMVZu1JVKw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 02 Sep 2026 12:56:20 +0100
Subject: [PATCH RFC v3 18/21] mm/pgtable: catch abuse of folded dummy
 pgd_t/p4d_t/pud_t
MIME-Version: 1.0
Message-Id: <20260902-dummy_ptxp3-v3-18-5d8f5b17c25c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5530; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=7qpVYfxo11somdb5c6gV0/kDLH5Q0BihBtrikdiezoA=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqmA7qXyQcD9iPBpTAnFU7GV5yNh6YjDdTUtbl6
 Oaf4xiT/C6JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCapgO6gAKCRBt1cPRWsUx
 M7U/C/9ttzpnHb2yuUInkeTRmPl+W6MUdZoaQgEgVwirYFKv8HTBBKYt1YtRNLgvU7BnrSZ1IUl
 PH8YpM1am665hB4A6ZAcgleVTJi+AXCJhojS3SLVU8PhXIm4Eg377aRV19FLkxBoUO0PuabsaSg
 DAED7y2NRXHu5bzGlPIwBjnQg4tGgvlunv6WWcfKf9YsOZ8fk30CJrCnF7BJWiUNaKxXZVZynqf
 s5YET0ss2IoKdc98daxynC3ihV/f3kTtZIVI/Y03MSMY0GeoKmuoEJ9orEzecNOaidHj6eRoAn6
 u+4PCHan2eyLMWAZ1vzaMKQOIBPweR9bEghuKkZiJTqvllEbSJzSlltvfB1gMwKJ4Q1jl01305/
 39eZR59gF0NdnouqIHDnJNx7CVKpv4IT99mguwOGthGa/m1AdiehZZCyE1K7uc/srgCE6su6XHN
 RejUTesdu1qQ2qP6zrtBmjKc+NFH1Y6KRdTeESR8unmk3Km9Ahc/tfCxTGiZF8GNb0ny8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_125853_179629_D70A5C4E 
X-CRM114-Status: GOOD (  12.37  )
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

Catch and prevent all abuse with dummy values on the stack
similar to:

	pud_t pud = pudp_get(pudp);
	pmd_t *pmdp = pud_offset(*pud, addr);

While this approach relies on the compiler propagating constants, it
should catch most of the issues in practice. It would have caught all
the issues were found through manual inspection.

To avoid build issues particularly on x86, where pgd_val() might not be
around in some inclusion paths, perform the new checks from wrapper
macros.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/asm-generic/pgtable-nop4d.h | 23 ++++++++++++++++++-----
 include/asm-generic/pgtable-nopmd.h | 24 ++++++++++++++++++------
 include/asm-generic/pgtable-nopud.h | 24 ++++++++++++++++++------
 3 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index acd62ee23353..2d86325235da 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -34,7 +34,7 @@ static inline bool pgd_leaf(pgd_t pgd)		{ return false; }
  */
 #define set_pgd(pgdptr, pgdval)	set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval })
 
-static inline pgd_t pgdp_get(pgd_t *pgdp)
+static __always_inline pgd_t pgdp_get(pgd_t *pgdp)
 {
 	pgd_t dummy = { 0 };
 
@@ -42,17 +42,30 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
 }
 #define pgdp_get pgdp_get
 
-static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
+#define pgd_check_dummy(pgd) BUILD_BUG_ON(__builtin_constant_p(pgd_val(pgd)))
+
+static __always_inline p4d_t *__p4d_offset(pgd_t *pgdp, unsigned long address)
 {
-	return (p4d_t *)pgd;
+	return (p4d_t *)pgdp;
 }
 
-static inline p4d_t *p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd,
+#define p4d_offset(pgdp, address)					\
+({									\
+	pgd_check_dummy(*(pgdp));					\
+	__p4d_offset(pgdp, address);					\
+})
+
+static __always_inline p4d_t *__p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd,
 		unsigned long address)
 {
 	return (p4d_t *)pgdp;
 }
-#define p4d_offset_lockless p4d_offset_lockless
+
+#define p4d_offset_lockless(pgdp, pgd, address)				\
+({									\
+	pgd_check_dummy(*(pgdp));					\
+	__p4d_offset_lockless(pgdp, pgd, address);			\
+})
 
 #define p4d_val(x)				(pgd_val((x).pgd))
 #define __p4d(x)				((p4d_t) { __pgd(x) })
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 9322f07ddf1e..bd40d3a5743f 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -43,7 +43,7 @@ static inline void pud_clear(pud_t *pud)	{ }
  */
 #define set_pud(pudptr, pudval)			set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
 
-static inline pud_t pudp_get(pud_t *pudp)
+static __always_inline pud_t pudp_get(pud_t *pudp)
 {
 	pud_t dummy = { 0 };
 
@@ -51,18 +51,30 @@ static inline pud_t pudp_get(pud_t *pudp)
 }
 #define pudp_get pudp_get
 
-static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
+#define pud_check_dummy(pud) BUILD_BUG_ON(__builtin_constant_p(pud_val(pud)))
+
+static __always_inline pmd_t *__pmd_offset(pud_t *pudp, unsigned long address)
 {
-	return (pmd_t *)pud;
+	return (pmd_t *)pudp;
 }
-#define pmd_offset pmd_offset
 
-static inline pmd_t *pmd_offset_lockless(pud_t *pudp, pud_t pud,
+#define pmd_offset(pudp, address)					\
+({									\
+	pud_check_dummy(*(pudp));					\
+	__pmd_offset(pudp, address);					\
+})
+
+static __always_inline pmd_t *__pmd_offset_lockless(pud_t *pudp, pud_t pud,
 		unsigned long address)
 {
 	return (pmd_t *)pudp;
 }
-#define pmd_offset_lockless pmd_offset_lockless
+
+#define pmd_offset_lockless(pudp, pud, address)				\
+({									\
+	pud_check_dummy(*(pudp));					\
+	__pmd_offset_lockless(pudp, pud, address);			\
+})
 
 #define pmd_val(x)				(pud_val((x).pud))
 #define __pmd(x)				((pmd_t) { __pud(x) } )
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 8f01abbb0050..7475d0bd0f2e 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -41,7 +41,7 @@ static inline bool p4d_leaf(p4d_t p4d)		{ return false; }
  */
 #define set_p4d(p4dptr, p4dval)	set_pud((pud_t *)(p4dptr), (pud_t) { p4dval })
 
-static inline p4d_t p4dp_get(p4d_t *p4dp)
+static __always_inline p4d_t p4dp_get(p4d_t *p4dp)
 {
 	p4d_t dummy = { 0 };
 
@@ -49,18 +49,30 @@ static inline p4d_t p4dp_get(p4d_t *p4dp)
 }
 #define p4dp_get p4dp_get
 
-static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
+#define p4d_check_dummy(p4d) BUILD_BUG_ON(__builtin_constant_p(p4d_val(p4d)))
+
+static __always_inline pud_t *__pud_offset(p4d_t *p4dp, unsigned long address)
 {
-	return (pud_t *)p4d;
+	return (pud_t *)p4dp;
 }
-#define pud_offset pud_offset
 
-static inline pud_t *pud_offset_lockless(p4d_t *p4dp, p4d_t p4d,
+#define pud_offset(p4dp, address)					\
+({									\
+	p4d_check_dummy(*(p4dp));					\
+	__pud_offset(p4dp, address);					\
+})
+
+static __always_inline pud_t *__pud_offset_lockless(p4d_t *p4dp, p4d_t p4d,
 		unsigned long address)
 {
 	return (pud_t *)p4dp;
 }
-#define pud_offset_lockless pud_offset_lockless
+
+#define pud_offset_lockless(p4dp, p4d, address)				\
+({									\
+	p4d_check_dummy(*(p4dp));					\
+	__pud_offset_lockless(p4dp, p4d, address);			\
+})
 
 #define pud_val(x)				(p4d_val((x).p4d))
 #define __pud(x)				((pud_t) { __p4d(x) })

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
