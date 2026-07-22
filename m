Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDD5C4453E
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IRgolsjbN4vHHk/Tu/GfdMNhYCuubiJ8w3j6D5igBwc=; b=K59/czIQToyVkF
	XqMvaGgIK5OnHBCcikjgYtazU2r+dUqWgVyM9CbFd5UYVtu06/KU/mPXARDb775Rd2Ohf3Sp+HFqh
	1jjuBng5KabsRv7OId2vj8FUtDqGZwUUVyBiB0/LugMP1yvdS2CWgaIuTS9rwYe4cgfiXm/SP//aR
	zD5HVIO0bT0IsCCg+wtu63JYUniBLsJ7043kCJUYdcRZxMgrgjOd4I/eRCr2s5PEdI0czIvf8XYSs
	D7FUQFzgsKEiLt2GINm60dWabww6c6USiQZCpKwWr1ZIPkGgXoGWpU2cctBqdmUNto3LKkchiMW8R
	t57E4RryFUz5mTfnYClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuQ-0000000C9x2-3xkl;
	Wed, 22 Jul 2026 15:30:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuN-0000000C9ul-3DoZ;
	Wed, 22 Jul 2026 15:30:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 914D81595;
	Wed, 22 Jul 2026 08:30:50 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEB983F66F;
	Wed, 22 Jul 2026 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734254; bh=NwLzJE9YUYcwQouyyHhdNDainQ0wboh6oH5R8Qr5IHk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CMfDyJKBKmK50YTcejppNKTrTWiJP57IF6DHVLjdYdB2gqyRXO1180hCz77V7dhiw
	 /Rhc6XGpzTsM9UJ2o8cGBXNsPlK7hInWAm0H7N+W5Ya7RehIy81zPyYAERNZ20t24L
	 nfvmJqhMmxi974lDKs5uoKjcVHSlsRqupqgSxxk0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:10 +0100
Subject: [PATCH RFC v2 02/20] ARM: mm: make 2-level pgd_t a scalar
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-2-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=3A02R9gJAFlGYYgA2zmEeHAxV0ZhWViB/KSchyi5T/4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIQeAF4NvX+ghiLdlZcQA9dzdnJsUpGO89IJ
 Z0P4tNZzvGJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiEAAKCRBt1cPRWsUx
 M9cgDACmrJH7vGtwlt1q+G75J+q2g7DLACRd8qQ65REy5KW9VbVYXXmBfsv7k2aacinnF+IUr1m
 w3DvIXTMScFAlv6aZMEIqzXU9KuPuo24JNo8rMNKxi9T1m+acBCRHvLvSO2xL29IrbZAcioI4Wx
 p65yuAc9KS13mOJr3OIKeTM2uPBpc+Dm5DZte59tUdL88pUcKmgr5jOzWyXYdMRsz3hDwLYMW+2
 xxjo5fmXJlXgap750FaoM8rT0iXoAT6YJTKSXBHneNtHjfELNOmnfR3FouecTJpQYreibBoY4Go
 wTzx/VMNWooLYFE7j0Suwe4IRqREcwTjIE7Sy0K+4hH8myO5maXRxcC6QsnckrWLVBUFmQB4lFH
 /yAaiETHizvEjofTsL+JjwiTrmaQq2gXigwhquNdb6UYzqGvR7neA73xa7ugREzMT8ojGHpTpOr
 l75oD4xe0+GWpdz7MWMp3Wqtq2t9VjFSsaVZperSbQsuUsnnV9f1oO35vpoX6HoDyNfd4=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083055_894202_309EC865 
X-CRM114-Status: GOOD (  14.36  )
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
function, like pgdp_get().

So let's just use an u64, and extract the right 32bit value in
pgd_val().

Leave the STRICT_MM_TYPECHECKS case alone for now.

As an alternative, we could use the STRICT_MM_TYPECHECKS approach here
as well, but using an u64 looks conceptually cleaner, even though
pgd_val() gets a bit more involved.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/pgtable-2level-types.h | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/pgtable-2level-types.h b/arch/arm/include/asm/pgtable-2level-types.h
index 650e793f4142..7f85384ac386 100644
--- a/arch/arm/include/asm/pgtable-2level-types.h
+++ b/arch/arm/include/asm/pgtable-2level-types.h
@@ -25,7 +25,7 @@ typedef struct { pteval_t pgprot; } pgprot_t;
 
 #define pte_val(x)      ((x).pte)
 #define pmd_val(x)      ((x).pmd)
-#define pgd_val(x)	((x).pgd[0])
+#define pgd_val(x)      ((x).pgd[0])
 #define pgprot_val(x)   ((x).pgprot)
 
 #define __pte(x)        ((pte_t) { (x) } )
@@ -36,14 +36,32 @@ typedef struct { pteval_t pgprot; } pgprot_t;
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
+	 * The lower and higher pmdval_t values point to the same page.
+	 * the only difference is their offset within that page.
+	 * Therefore, whichever value is returned, the behavior of pmd_pfn(),
+	 * pmd_page(), and other users of pgd_val() remains unchanged.
+	 *
+	 * However, pgd_val() has historically returned the lower pmdval_t, so
+	 * keep returning the lower one.
+	 *
+	 * See the comments in include/asm/pgtable-2level.
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
