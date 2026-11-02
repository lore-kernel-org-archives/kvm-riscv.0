Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5C160A263A
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dqh6AC41;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sGQxrLj2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rjgM06fDB/Vuk+XwoigMBBg6QifXUmDFcff0vWvnK7Y=; b=dqh6AC41KWEaAtHT9UoPmjOMzW
	S19DlbGgK4YVyiUXh4/NPolZMv8wrXFZDky6KpnMDl5Iolu6uqLGceC1A0ilOBq0xspd+Hg+q4VIc
	leIp4yigYp5ekeMQ+vw9glUHdshA77p1AdqnsC8OXFXq/fksLzYqoIKS+gu8FBSoAaaTVIe8bwaxs
	oildptZ21DdjgjYaJLgzzXDlmo4nMEwlW+09z2KQQejHNCzjrsPe0JRDvhVwtSWEEw5svz6Legb1Q
	YsfaETOFuUJvUoWXF1XHEN/dYpnIit/3k15O7UYLyeBiWzsGvT+EYOA2vfwy0QLCGmTdOBx6BP6c+
	yhOIYXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq6p-0000000GILT-1Jzj;
	Mon, 02 Nov 2026 11:21:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq6n-0000000GIKO-3HAv;
	Mon, 02 Nov 2026 11:21:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98BB5293B;
	Mon,  2 Nov 2026 03:21:45 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABBBC3F632;
	Mon,  2 Nov 2026 03:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618508; bh=MWIk55sq3Xl5IhFPSCZgQqnLya5ldzX0H6ZlzYM7l/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sGQxrLj2PAVQM5fHkHevqVIfVin1ll/3g3ae4t/g8HEOkurxB70lXF0DZTL/IljQ5
	 rHKZXsGBRrFJanBWMs+pRElUxUB2BOmIRgyPg/tZXyH7V1J+xZrJnVL8vDsgkjLlnk
	 oes83MtSFez0CJt//3pZ8TBKJnbeTFU4waApKUA8=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:15 +0000
Subject: [PATCH RESEND v2 02/21] ARM: mm: make 2-level pgd_t a scalar
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-2-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=4Z0osGAP3S0civxPu6dKKFX1qsd70Ol0fauRungSauY=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HIvrNf0zi5GZGBTyShCkosyjcm/ve62Hffev
 ytAlT3j/TaJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyLwAKCRBt1cPRWsUx
 M12BC/9v/yOQz+XWwbdtR0EhCi2ksiI4sjutQ/bwS5HN1By936VSeN3wcUH0K1fKV0O4ZIiW+s2
 SfJf6SpaQEfPzplAyvkiXQnqW09aHWhOdT1UwkkxMNSsHXdfqi1M4FHRSWPCkb6K0FI12tyXCNB
 h4nuW6sYscec7ovrm5iXzQbZ18FdIgFk4raQqVHNTwmq+NydXKk3z4z1PKr6pQr9LF/IibhywF4
 XjnF1eu4DGG5cokFCAkzEPmLAy7JprIb56giiRaum8uQRFE4AQ+Cp1WSXeJ2dYh0gtBvPfSBIC/
 mxl4TgYzuAab+dAvT/qiL8ektFPYyYhHDUvtnnvaYZd7YDgQ3WVoVaWuqwj0VkGu2Zkeaqp0uR9
 2vHpxiZK4KVn3Mm9K7SZrbcjdZUCchSWx3i9Tlu4I8WUFQY0nxAPvoTQsduekKtvwMxY20rvnhs
 Tv4dNY9GxHesD3XthpSYqMK/OdNippbv5S3PTdRLmqElgGJKdAMoOXuZeIn1q0haCDfG0=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032149_916349_22BD0C53 
X-CRM114-Status: GOOD (  14.04  )
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
index 650e793f41429..805044ea315b7 100644
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
