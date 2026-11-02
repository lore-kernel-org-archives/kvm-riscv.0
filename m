Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52589606A326
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ukURiPxv;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=P7pPmEP1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=djnhqnOlPsBtEAfPz7bTRyqnvyWgtp4SbhIEyu4mnCs=; b=ukURiPxvyujY/RcYQyT6xlZ/NA
	GfUAfBdhAnRs+Q/Z1rNqdTLpZH1T+/02tGIE5FqLCsTSwZd18I1Fa00yPquBImbGyREY7Ohb+mOpw
	ADqmIJA68Kv7AJuBl7GEP37e6Br33VvHUgtW/m+2bk5nELvCUQdGP9LjV9Z6VsdAILgM9gcfGGbbp
	BpqORUsrDvIsiZ964wCNvrvsjRZbsAT0OeBbl/ndRNSP7jyng8FgXOtTBYPCmEcnzrOAupgv39G/s
	ltzp5UWFeDs9q79P1rn4uU33O3NfaqH7vcBGvlmOFq0o5t9kFm+Ya0rBq/Z66s9/oJw2G00Gqeacn
	M1wRlmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq73-0000000GIUy-0IEK;
	Mon, 02 Nov 2026 11:22:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq70-0000000GIT6-2KxY;
	Mon, 02 Nov 2026 11:22:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 368B01691;
	Mon,  2 Nov 2026 03:21:58 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4818B3F632;
	Mon,  2 Nov 2026 03:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618521; bh=kV7fmntEBngzWjlRtt0fXgbabk4vgoYlOIhmmgX++kY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P7pPmEP1+y7xcVY0D4K6XD0jQizTpCe9MveMakhuwNTgU2/rc02un0pmGMjXbJF0R
	 aYrAH5ZcOrnP+iq/bNtZh3I9kNmBsSIpcL/OxZxQcPA/T9dh0psHgdWo77wSDR8Jtr
	 w16o3AMZnYr0X/mED3RmiUDXSnMXprAQfKtqzhZg=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:17 +0000
Subject: [PATCH RESEND v2 04/21] LoongArch: mm: define pud_leaf() only when
 PUD exists
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-4-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=u7CkBygp3t9kTReuMDaCmZH0s2byLy+RqHAVuQrH24I=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HIwlxi0fq0NvoRR6wAM7dkyWS9oxQBI40Cgc
 DKUESF9vgqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyMAAKCRBt1cPRWsUx
 M0akC/9EGZkuiEkdTxl3CwYCFtvx1xhNG+FjrVxbus6mPWauJ8F5+J5sg5Np9DCF7VcqrJ7ge/+
 bth6MHuatRPh7bNm2qmt1JrSUpNXrDlMed/ARE35YCapddiVFrA/hyghxyvDrMd5RXiBZ1M4RTK
 PBpos5isVI6lqHRQNvFpm93ZH2dO+LOClaTapIUlIZCo5Lg/rNxgcJrdFYAMGgANqyeKI3gKPd6
 lQtVhU1ZcDtV2xOKlhJegzKtK8N2O6FCC0F/mzVAlow4BD/Owt2Y9Pla/PUoribW/NWNTCSJ5mV
 yQmIkHn4eDIrvIg4JJi4YgB0AVvnHsv9ctgHp71nNecFNaljvmmvh40iYvrgkfBuuxpwT2Hsyzi
 PDwD5+lh1C/9TTrOCsmc4rjeHahxJv3TCJ1ggX4w1/T9VRTBKxgZEgoQWtprkyPP6vK+BHLuFtd
 Y+v4psuuQM6VJV21P5UYO8NVMmjA0VothRLarZ8QJmarCmc3Eu856bpeW5BNJO+iTCRXs=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032202_695373_A88627B8 
X-CRM114-Status: GOOD (  10.32  )
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

In include/asm-generic/pgtable-nopmd.h, pud_leaf() is hardcoded
to return false as inline function, but it misses the "define pud_leaf
pud_leaf" part.

To prepare for fixing that, define pud_leaf() only when
__PAGETABLE_PMD_FOLDED isn't defined.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/loongarch/include/asm/pgtable.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index f876031351319..9a62b87c246de 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -631,7 +631,9 @@ static inline long pmd_protnone(pmd_t pmd)
 #endif /* CONFIG_ARCH_HAS_PTE_PROTNONE */
 
 #define pmd_leaf(pmd)		((pmd_val(pmd) & _PAGE_HUGE) != 0)
+#ifndef __PAGETABLE_PMD_FOLDED
 #define pud_leaf(pud)		((pud_val(pud) & _PAGE_HUGE) != 0)
+#endif
 
 /*
  * We provide our own get_unmapped area to cope with the virtual aliasing

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
