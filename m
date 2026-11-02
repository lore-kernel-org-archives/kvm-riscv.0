Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AF6606A33C
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=piu/szqA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=A7rQE586
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nO4n436sWxj82zdvfwbhShzUzixa6Ff3aevZmlXBq44=; b=piu/szqAHeda/0s3/bnfXfn6FC
	Hib6xb9ZEH27GdY6EhOPioOAANvUrdEuuTjVejKUdG4EKvZux7fOqqy6OguEbLZ7P2Bb6SWQHGZ6n
	b+Qo80gOdlsZYAoO2LOXr6Z7McvzpGwS5b5FDH3ITZtOi/DeIH81Yg/WJlpkzX/gtIcnKrRpqsD14
	cB0ziFOlQQ+wPRSYJ58myK0d2NDW1civVixo2JRS8cRhy6N1z3zeIaG6YdT3nGwm55OG2BgbOpFyB
	I7+oJnv/An3eBATiQ05Plj4BvGTTv/wV3FdED0K6MrC8tdhzMwswH/j0sHjeny5T5NQ4bG/4CFTPt
	49po7TwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq7H-0000000GIhj-1UPt;
	Mon, 02 Nov 2026 11:22:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq7C-0000000GIdR-3z9k;
	Mon, 02 Nov 2026 11:22:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C90D9293B;
	Mon,  2 Nov 2026 03:22:10 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D99E73F632;
	Mon,  2 Nov 2026 03:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618533; bh=evfeL7lk1yM+NSCKYrKsUpK8FtfFqKH2c2v1uANMiZA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A7rQE586SxmeYhdbuDjgGojrf+yFdXKkVJvIWE3/CkvAh47B/hi7pieq8pgJx6OPd
	 7+IdQ9YxhSeIZpcu39Tq98FmLu1Q3ge8+e61N66fuaQUSiCZLJB7SxbfiAp/g9FEqC
	 pD/C97hYRDBX9CkJO435UP1+7vyxZpzRkF237Vvg=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:19 +0000
Subject: [PATCH RESEND v2 06/21] mm/pgtable: define (pgd|p4d|pud)_leaf()
 for folded page tables
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-6-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2651; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=MsUi6fKiy4C8DH1qxUfB7PhJ8/xMmbWjYscC+NJ7HZ8=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HIxIVd8yfHE+3CA9LTpZi1gUI+XMCzgs5U2Q
 BHJBi3iXj+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyMQAKCRBt1cPRWsUx
 M/V2C/9ItyCxgxlMh10fHR69tVgw9EuphM40QYD/mSrn4nLbxqXwGeoRCXJD/CQZjbzhVqNLqD8
 4pI+P8VaiZD1ROaf98yDqlm38MdDfJo/nXweMu2XCSuy8bvJOZ5akdNLIqOCNL/Kky/4vAvfA7y
 g/DN2CQi8iHcZmgFZENpatEkLXDT+irkdH/T8momUPL2iU/gMe9+PBe83/sjStUInekkPY+48fS
 tQ4YbgN0JI0jsnh5HfL7yHY0zHyLhvoIlmUPykZRIofr+KodLXQYFHAKOkD2khVIs/r2bFJxKJM
 7EZ9zMN52ptWFsHpkIIDhVoEnRhnj2vRlH6U7Y8kV9ZSGk2CzFCTZuWrT3cGyiZ4sRJ2z/gLRS+
 DXMtq/JtOP08ZaADSQRymmkYRKA9PLkrAtBZXZKwEO/gg81uxE4KT+wj8pXddgbXPnOWNxmpGA0
 MxTCMq+1KtHR5HFt8aTkW7OiLozCLtwsA62FVhYXV48+piX5IjzAgVxuzgBp34DGCh8VI=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032215_072674_44692B3D 
X-CRM114-Status: GOOD (  11.87  )
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

Define (pgd|p4d|pud)_leaf(), hard-coding it to "false". Note
that it's missed to define pud_leaf() before, allowing architectures to
unknowingly overwrite it.

Still use static inline functions (type checking), and while at it, just
use "bool" as a return value.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/asm-generic/pgtable-nop4d.h | 3 +++
 include/asm-generic/pgtable-nopmd.h | 3 ++-
 include/asm-generic/pgtable-nopud.h | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index 1cf739ee38aa1..c6a5a43899b50 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -22,6 +22,9 @@ static inline int pgd_none(pgd_t pgd)		{ return 0; }
 static inline int pgd_bad(pgd_t pgd)		{ return 0; }
 static inline int pgd_present(pgd_t pgd)	{ return 1; }
 static inline void pgd_clear(pgd_t *pgd)	{ }
+static inline bool pgd_leaf(pgd_t pgd)		{ return false; }
+#define pgd_leaf pgd_leaf
+#define p4d_ERROR(p4d)				(pgd_ERROR((p4d).pgd))
 
 #define pgd_populate(mm, pgd, p4d)		do { } while (0)
 #define pgd_populate_safe(mm, pgd, p4d)		do { } while (0)
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index ff4235cf84d77..4e5aaf253b6a5 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -31,7 +31,8 @@ static inline int pud_none(pud_t pud)		{ return 0; }
 static inline int pud_bad(pud_t pud)		{ return 0; }
 static inline int pud_present(pud_t pud)	{ return 1; }
 static inline int pud_user(pud_t pud)		{ return 0; }
-static inline int pud_leaf(pud_t pud)		{ return 0; }
+static inline bool pud_leaf(pud_t pud)		{ return false; }
+#define pud_leaf pud_leaf
 static inline void pud_clear(pud_t *pud)	{ }
 
 #define pud_populate(mm, pmd, pte)		do { } while (0)
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index eedee8e3ad68f..6c9bca78047c4 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -29,6 +29,9 @@ static inline int p4d_none(p4d_t p4d)		{ return 0; }
 static inline int p4d_bad(p4d_t p4d)		{ return 0; }
 static inline int p4d_present(p4d_t p4d)	{ return 1; }
 static inline void p4d_clear(p4d_t *p4d)	{ }
+static inline bool p4d_leaf(p4d_t p4d)		{ return false; }
+#define p4d_leaf p4d_leaf
+#define pud_ERROR(pud)				(p4d_ERROR((pud).p4d))
 
 #define p4d_populate(mm, p4d, pud)		do { } while (0)
 #define p4d_populate_safe(mm, p4d, pud)		do { } while (0)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
