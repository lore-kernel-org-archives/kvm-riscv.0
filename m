Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD0860A3812
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 11:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JgDUq3sk;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Tf5YISm/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yo7xXi70INGJCYJh41yWv2DSRTpPfwawO4xPijZaKhk=; b=JgDUq3skO+ozCtuj5keYzjmPKP
	fjAyjLQWmBmklsfDoHyxTQnq2lKUN5BLk0o4Fh/Zw3elIf3o+zp7ZKeRVJKgRiniNs18UsUO9sjU3
	VcbMSmgGfCDrReeTrfPVP6DPmlk0tSsQs+L85H7E7qqSmLWyMqUrSQY01YCAqT1XFAXKe5KJlGZQf
	H0KiOQTx+PYF9+Ho+4PSW2/6C8dyi648ZipQvS4R0HuyQ/qxDzhNBf0amACU84vDYd14eMxqb/BNx
	x7c7hILnQWa1kG5ea9932AuqgvjVNhA+0pQubS+Cix81H1ONNPjZE6g+3DWytPWguLfgoF02u0ngv
	YxguBMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq6w-0000000GIPp-3OMQ;
	Mon, 02 Nov 2026 11:21:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq6u-0000000GINS-0Iez;
	Mon, 02 Nov 2026 11:21:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E13402A68;
	Mon,  2 Nov 2026 03:21:51 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 000EB3F632;
	Mon,  2 Nov 2026 03:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793618515; bh=pfH49/wekZWH0tUlmAGPYfXLPMYhwWIki53rOu3JrVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tf5YISm/NbZvwkPEnUHnWMU4HZk+CDcrkirL9z+8KS5qYFwMCSdPLDcxtwNkqYbla
	 mFdwJmtXdDZOweXSP/PDkgFSpVfkODm5NlcHFi+CoNzkIVmyQp1290rt9pBK2JiC9o
	 kYPxrWkSuMDqiTHtpyDsilHlX/0l2sFdrwt6OtRE=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:21:16 +0000
Subject: [PATCH RESEND v2 03/21] ARM: mm: remove custom pgdp_get()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261102-dummy_ptxp3-v2-3-78840b2ec73c@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=794; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=yi3BzhiHjasTHpKXh1MmDEBzfM1jM8lRPSh1W8s2lTo=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HIwc/GAt+z5/OOvI3XR8a7QDzLX+Kmmbr+jA
 ZF852tvsq2JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauhyMAAKCRBt1cPRWsUx
 Myg5C/wNk/i75t104WkQdgspkcwkRtCjKwHmV8D+fUK6nYb7ji1MHoEsVIe1sHMK0ADIk7OhxRS
 S3rpo2/d6+5qv/LmYF55JqittempBiiZZ+UFylH0lRHBfdXkOQNDbYCPopeHy3uEZbCUONl2ATe
 9mMlptrkZULQOx0oikCg1Pz3pLbent5TKJ9XwhSE7M7utu5izrQrquojB54trKaQfNCZQ8qS3GG
 tv3+PZd7ghv+bTvhDvi9AvjoCnZREX6rWFwVv/mxSR3zoOuloBrW+44ASZJpqJAWzwvREAM4N//
 UAbJCBV2ykb6MBSmZEEKQKIEDhhQRAY489gVgAMjOa/Un448WLURsjNETK4mMK064AuH8uQ5gyT
 krvRSxNzJeqsDewqn8e638zfsd7jtGSAsu6S5FT1p3KZGa6B6217eOXhOvTHJkAkrjOCNk/J/RB
 AXmrtPiCPS1sZsFy11YkhRK35X9QswfJPdmpKES7oBqQdrPfh4pA3GXP9KNqQLUay7cv8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_032156_208579_833651B8 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

Now that pgd_t is no longer an array and rely on the common
code pgdp_get(), which is a static inline function that returns pgd_t.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 arch/arm/include/asm/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 8dd17d20faa33..ff3868acea945 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -134,8 +134,6 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
-#define pgdp_get(pgpd)		READ_ONCE(*pgdp)
-
 #define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
 #define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
