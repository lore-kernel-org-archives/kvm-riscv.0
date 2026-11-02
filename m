Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6802960A261F
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XFZ+XlTP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zj3iOGza;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=VZKidji6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G6QTva+VVrT1bf7GOXVVoDOSfx9D+nBlu2Sj9iDcl3k=; b=XFZ+XlTPZv9f7Cr31bAvq/K9iV
	LzVx6b6+u8pX5NCuI3hzQ227rfufWpINqjvKJQ6Gi0u5JpM3IsN9WnyPUcD0/spOOIo/whnwzF0hb
	/K9gVlKiRZ04PWf1/KeNv9I90P1mrLNh49o0fjwMFdX4aY3Y1ZALBvtykQI5Y8mhFtG79g4z73p9v
	MF/7+Hwt+yzpEFiTRzGlY34SVRrUDT4FGZuQ5S0pBS4IzMEbuCdYk8CGuZkPuf9GHSLQcHw2/tUol
	x2PGhhZD9VcZnrKcwStwaJ20C/5P0iCHZB1lp3tUtXVKpt+q+xt3Cb/gpZQiEvaXeWAM2renlSsQo
	4lNvY8gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8Y-0000000GK9H-0WdT;
	Mon, 02 Nov 2026 11:23:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8X-0000000GK7T-1li7;
	Mon, 02 Nov 2026 11:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=61mOQB/NPnyS6WFT1v6qj3vnbL64UK7nj4+n5n9dFHw=; b=Zj3iOGzan1lGvk4cRDD3nl6D58
	PI296HcLakOeMedkY+TgTu9dpbiVm5VFKAhDmxSLz8XdaVaMLAUpHC/9wjH7qtNYiKfpcS4sru7BF
	Zw2rkxtTIpMKbvUmGpRnW7QE+912rdzUBOMyI989i0IgsGwO4LT/OgRWmcgvuRyoxmadDff3RWUqD
	Jm4RBMQWTsR2rTCz07QuqMl1kcjd7U72aFQMgP5wP78/ctSrpR164by0PVH6Zr52JrzuXwjdR9gas
	LM10hsEgvEtZ3g30Cr2i/nBle02Bu/SPhZZSWUCcSUzGRnz6MaaEXQulQSZ6S36xRh5aOzrHy740x
	od75/ITQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq8F-00000002QiN-1fjg;
	Mon, 02 Nov 2026 11:23:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD92D2972;
	Mon,  2 Nov 2026 03:23:14 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE2F03F632;
	Mon,  2 Nov 2026 03:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618598; bh=fSF1q0uZ2D6D7eSotmHP8T3BZdnaiPG7UdplRIp/5/4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VZKidji6e6O+6chEIb7bnFpe9r7WvFkyVmIiYaEEba1bfdN9JrXHk/VOjxcw7Jcv2
	 qFG379Foq/0vjKt0b37jJIKZ0fR8WbzX6hs+6FN6mIxGadRPx56BeD/OHqHj0M3Q3k
	 P/jCQurQOOjvmQK+t8GXmw74iH/Bo3dhkM8XPPwQ=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:29 +0000
Subject: [PATCH RESEND v2 16/21] openrisc/pgtable: drop __pmd_offset()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-16-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=HHmjFCiPkfuAa6Yg+gCAN1VqpmgkbnXOKSW8+pCvqDs=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HI2QHNhLhdF8ydTZOu6McskHbnVKaSU6Y1AJ
 kMVzOl9su+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyNgAKCRBt1cPRWsUx
 MyWSDADUCB3Wh9MFEpUj8ayzq1Kie8YQYpCId3Wx6BZaE5A1K8xkvpBPTY/cf29xjfbRsl7YRod
 f1/gmxrhGnDXme+YBUt2LT+0R/6EYVFjWRb1HaF4XnJ7SRtR5AfMbVoeJOu3aHUtnyg9aqu7SDS
 YeA8/r9WGRtYatAteea4TTFtSp8P9eiyOX/iBhyYCy2PbEOYhYEeHT1QZuWAjUN1uhOQKpV8hl3
 mSpYhEruccW0rL5562glqtUyYO/ueaxe4V2cBBgrXSrho1pWtskDFplB3FGftnJ5yamOVzqEcuP
 sus6RmCTWMYsPRNee20/kjKQ84LvMCIBlqb+2evLIDmjhjbxT6pMa6fthG6IMlOMTv9j0Rk7vYZ
 PgWFxK6acMO4omG7AGcC1rIhrQD5WRMTW66aI38UR1xYHRCPFTR+MGptOyem0dOSHrXPIzrUiaS
 GsTuYuKe/a4MlFNlzuz4X287hGp2oOWGie0GnD81s6W+FjBJt8WVgJP5E2iMP4i/zfMKg=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_112322_144304_44BB2667 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.5 (--)
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

The macro is unused, and will collide with a folded page table helper.
Let's just remove it.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/openrisc/include/asm/pgtable.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 13afcc0bd8631..7fceed641610c 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -331,9 +331,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return ((unsigned long) __va(pmd_val(pmd) & PAGE_MASK));
 }
 
-#define __pmd_offset(address) \
-	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
-
 #define PFN_PTE_SHIFT		PAGE_SHIFT
 #define pte_pfn(x)		((unsigned long)(((x).pte)) >> PAGE_SHIFT)
 #define pfn_pte(pfn, prot)  __pte((((pfn) << PAGE_SHIFT)) | pgprot_val(prot))

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
