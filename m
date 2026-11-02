Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0715A60A6F4C
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=abkwKKcW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KZZ2pULE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zCO/hEzaDcwo5EO0ftX6/+PRcfFLu38hQYEHEhyokLo=; b=abkwKKcWR1UblwsGeYpZ7DTXaE
	c5xn84Jvhx4s+NKyEV9r9VmP/b2RU+6Ql4iDzuqpLZBVnDrwi5uKvWasGHHtNCVrNRaMgn5J59Js1
	9CAo6BLDqq6V+v9hTxQ9E5P/Op7/DNQFH4bcn0tAgnQFAGLjZw+zp6tgT7QYmVSek3uWJ5cHxSHZv
	YSqR1n/+uvMrGtOPy8Ca3vH4CJMeykQ1l1OC5NqyQjNUpLub4+C9Qz+YFpx8qVHDoNZJdfsPQLIUk
	Q4SNJP6Xqmc0UIsHvhk02rnAuObhaqmndFtMrtBJMfGQz2GEYPLzaaePMlk6RvVIFDbRQvuGi4t+k
	PzCN3PLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq7u-0000000GJPt-36r7;
	Mon, 02 Nov 2026 11:22:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq7p-0000000GJLZ-0NTQ;
	Mon, 02 Nov 2026 11:22:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42E7A2A31;
	Mon,  2 Nov 2026 03:22:49 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B4F3F632;
	Mon,  2 Nov 2026 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618572; bh=60Xa9B2iUtyR3r8ioE+XTXe+blj+2dKI9yzxVIZr1t0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KZZ2pULEBctEsGAXVrvXT+Vel6lV2ylQM7v0lus5odxyD77t9mWOEHrZc49tBaniz
	 nQ+V1k58GA0+D6TwKZwG0X5N6Rgew97i5ygFK83+IXfvCKtCKCzyF/kY02GLCg4Hkk
	 VwkyuVCUKrSmbbb+nsizpCRap0p4iBkAG7tU2GwE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:25 +0000
Subject: [PATCH RESEND v2 12/21] mm/pgtable: redefine PGTABLE_LEVEL enum
 with ascend order from PGD
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-12-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=60Xa9B2iUtyR3r8ioE+XTXe+blj+2dKI9yzxVIZr1t0=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HI0QV4ojpgcFbw7NYJO5M3UEa0V4ttsQ5fcX
 PLtIuFXA9+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyNAAKCRBt1cPRWsUx
 M5ZvDADXVkFHHBDnee5VQHc1URqbVSLnRmZQGtwzLqlg+CacOzVx4f7Diht4dzRAiiK+1m9UF01
 wRfNSyqT67w0dI1bwZt6KHNKRN+XFKnks05m3unYkdsH3JMDguBAe8SXxh/WUsURKuHCFf/9FHS
 JE5HMbsaUR8G6yz3LC36b96W0UCpRr/7EQOLZ6PHOYoCayzJauK/OB58CtSVxuWSzi2sNEjL164
 3edL/DfNEjgvKH6m2eaH35w6admU/hQvZmWxMa6KbJN8bT5DZyzVo3tNRhmJGQkqGAaAW4egus2
 Ew8qNAr2sofw58ojK3Wec9idGsNAMVs5eaDhV/V+4XtuXB9aUY4wNVPUTouQtD+hOIM7bgv5msO
 M7P5Xb6PZcHXVtsDFOZFKgoj69nU3EGPXYrfSQ7shRw9Mc+7k0eqPaSEEIlD1mUn0Cs9peZCsro
 zWNQBVLh7Nn3TSK8C1Y/FKdh3N26DPsAkAb/jVrnq8PoxftkHncsqMLPSsZNp68ShBSVE=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032253_218040_943D5896 
X-CRM114-Status: GOOD (  11.95  )
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

The PGTABLE_LEVEL enum values appear to be ordered in the opposite direction
from their intended usage.

Intuitively, higher page table levels should have smaller enum values,
but PTE is currently assigned 0.

For consistency and cleanup, reverse the enum value ordering.

Since there is no current user relies on these numbers to be ascending from
PTE->PGD, so it can be changed to be ascending from PGD->PTE, in the
direction of the page table walk.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/linux/pgtable.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b7..a032f95943357 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2288,11 +2288,11 @@ static inline bool arch_has_pfn_modify_check(void)
 typedef unsigned int pgtbl_mod_mask;
 
 enum pgtable_level {
-	PGTABLE_LEVEL_PTE = 0,
-	PGTABLE_LEVEL_PMD,
-	PGTABLE_LEVEL_PUD,
+	PGTABLE_LEVEL_PGD = 0,
 	PGTABLE_LEVEL_P4D,
-	PGTABLE_LEVEL_PGD,
+	PGTABLE_LEVEL_PUD,
+	PGTABLE_LEVEL_PMD,
+	PGTABLE_LEVEL_PTE,
 };
 
 static inline const char *pgtable_level_to_str(enum pgtable_level level)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
