Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24DF60A6F53
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=33xY2NJC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=IJN7rPqW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bDcPyALH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nHG2D0I3TxkvisU3/aowwDSwia75wxVyaDqoO4VZaus=; b=33xY2NJCbpuxg85BjopjaId0ia
	duoTJNLAUjw92cwzT+nDb/vpktqEbYei1TD2H4fw6JEhvui5q2bhvoX6Fxm4Qm7CKHZ72+HH4bJwF
	KcyPF9WXAXbQ6bPlcDaI17hu/1eky3zVMJ5rXPCQWMeTg3cTs3uZ4EPyUg1q2t4KL6P0aCb5h3oJ7
	3wN/yCkDKzopwcTXuG1caOZYT46ULcmkPbir9k5yWKG8IcfzY6QvcOy5D2UIw31g/dMNNrD4WX+t0
	SeCqJ2kUaZonMAJl9yijddzxZtfSoOXQQBL/WpqXgRNXP8T84VPFywZb0TOAmTshPRYz3yDIgt92G
	jKxX1WDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8k-0000000GKOK-1nPk;
	Mon, 02 Nov 2026 11:23:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8h-0000000GKJx-29QH;
	Mon, 02 Nov 2026 11:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5o7BRqvZemOy4I3F9webe1p/ouSg2QH1C9yt6t24z0o=; b=IJN7rPqWgXsbMSmNOYDlV6gg6S
	8xTZ4MojM2mdpQSdFm5Ex+aWtX/jP5hQMai/IgfF8+5unzwZWLi+9GUJAfdtDDuuI+cklA7eehHAG
	cNsDwe7mXGHYCbRfL7A2xATB4lx/dBclpuBOhWu7R5RBrFpaoIfwOK3hXSpCi05+1ZAFXFO8mJyz+
	u2z2h38AGrG5fS8TbT929VAM+Q0E8jX/xxutp6ksP4vTvlZhOH781O2TGzRWMlOXiMXZONE+Hvsd4
	rrX4hjhxbEmTlmTwyswU+esuxghhmClOwZt0IesjP04y/eeprAbdSH+DKbAbuxa1Mnz89Ii0IihtE
	3eWl7kkQ==;
Received: from foss.arm.com ([217.140.110.172])
	by casper.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8e-00000002FMn-1z2V;
	Mon, 02 Nov 2026 11:23:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D0C8293B;
	Mon,  2 Nov 2026 03:23:40 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 416693F632;
	Mon,  2 Nov 2026 03:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618623; bh=Q9JupG6Ga9Yd5poWoXsf1ojyKybY/JhVHRMS9+yuENk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bDcPyALHdw5Zl0D9VGE+COP0dcVYHFDY2m/TeiDjc0+A/crtNk6K62TNrxMawJglR
	 HuCzRFMzqJY4ZnK2C33oRnpK5HA2DV8dNNYXhI0MkQR1+TfDVeXdgdR+7I8KKSura8
	 tZryB4Pg0pjWfsU/XJyJ2Yyb7THMgfg7MzKeUjL4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:33 +0000
Subject: [PATCH RESEND v2 20/21] mm/pgtable: disallow calling folded
 set_pgd/set_p4d/set_pud with dummy
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-20-78840b2ec73c@arm.com>
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
 linux-openrisc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3423; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=wn+xbNqkdezctD1uOfR77s9+bFTC1HhX6zz+en43LNA=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HI41HYqR/DY60asrivvc260RG+DlN2TcOsBc
 2SoszCYpCyJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyOAAKCRBt1cPRWsUx
 M9KeDADPFy2VaPWEZBujNb0vh7LKkIz7kEE4LevE/m07H9r7Pw9DXwNx3SYKLS8IC154sHLt7rf
 YgyNrbwDUdEpJob+IGYoqz/5K3DHBrZLHS/3qsWBl1KXeR/Dv8K3FWIQ5Ys+rf0g5d/FvdXApJs
 Pii/zng3OoTnqcPyWZZX72ce3RGzjrAoyq5+wljz3V7Ci0FAfKTvreFJtDbCbOWYIZWDV+zOHRs
 v5dDyQFCkAaYDieYiHCztilTWH3UVEa42+JNdhGNV355CTuH0tI408DW6YRmFoV5WNpB63Sydsz
 wYGjMGPqbMriOGW/oWyYBWkDKuO6zxjmC2XJDP8XYYy0BJ+JLQfrf7w5VWYbujb062ucuwx0S+6
 gvVUxMm0oWu7GbkWcJd8uZDyi5+OLF+PWF0CrSfaWEmNttOz782RwBi8oGpmDpCr4jJoGyBxUcC
 zVyZOVxtFTUtOUH6Huj5xtItNrX8U1FTI7uYkQ73fxPepT+046JpjWvUSeJNm1nPmqego=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_112344_777009_99401C8A 
X-CRM114-Status: GOOD (  14.90  )
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

pXdp_get() could return a dummy value for a page-table level folded at
compile time. Passing this value to set_pXd() could cause unexpected
behavior.

Prevent this at compile time by ensuring that all calls to
set_pgd()/set_p4d()/set_pud() are compiled out for folded page-table
levels. Make the compiler complain if these helpers are called with
dummy values.

Since there are places where set_pXd() is called even when
the corresponding page-table level is folded at compile time,
drop the incorrect comments for set_pXd().

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
Co-developed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/asm-generic/pgtable-nop4d.h | 11 ++++++-----
 include/asm-generic/pgtable-nopmd.h | 10 +++++-----
 include/asm-generic/pgtable-nopud.h | 12 +++++++-----
 3 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index d2dccf7542da5..12b01768134b5 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -28,11 +28,12 @@ static inline bool pgd_leaf(pgd_t pgd)		{ return false; }
 
 #define pgd_populate(mm, pgd, p4d)		do { } while (0)
 #define pgd_populate_safe(mm, pgd, p4d)		do { } while (0)
-/*
- * (p4ds are folded into pgds so this doesn't get actually called,
- * but the define is needed for a generic inline function.)
- */
-#define set_pgd(pgdptr, pgdval)	set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval })
+
+#define set_pgd(pgdptr, pgdval)						\
+({									\
+	pgd_check_dummy(pgdval);					\
+	set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval });			\
+})
 
 static __always_inline pgd_t pgdp_get(pgd_t *pgdp)
 {
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 2afbf2d8659dc..11b04c1071295 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -37,11 +37,11 @@ static inline void pud_clear(pud_t *pud)	{ }
 
 #define pud_populate(mm, pmd, pte)		do { } while (0)
 
-/*
- * (pmds are folded into puds so this doesn't get actually called,
- * but the define is needed for a generic inline function.)
- */
-#define set_pud(pudptr, pudval)			set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval })
+#define set_pud(pudptr, pudval)						\
+({									\
+	pud_check_dummy(pudval);					\
+	set_pmd((pmd_t *)(pudptr), (pmd_t) { pudval });			\
+})
 
 static __always_inline pud_t pudp_get(pud_t *pudp)
 {
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 3264673c0c386..5ee8f1852cd8c 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -35,11 +35,13 @@ static inline bool p4d_leaf(p4d_t p4d)		{ return false; }
 
 #define p4d_populate(mm, p4d, pud)		do { } while (0)
 #define p4d_populate_safe(mm, p4d, pud)		do { } while (0)
-/*
- * (puds are folded into p4ds so this doesn't get actually called,
- * but the define is needed for a generic inline function.)
- */
-#define set_p4d(p4dptr, p4dval)	set_pud((pud_t *)(p4dptr), (pud_t) { p4dval })
+
+#define set_p4d(p4dptr, p4dval)						\
+({									\
+	p4d_check_dummy(p4dval);					\
+	set_pud((pud_t *)(p4dptr), (pud_t) { p4dval });			\
+})
+
 
 static __always_inline p4d_t p4dp_get(p4d_t *p4dp)
 {

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
