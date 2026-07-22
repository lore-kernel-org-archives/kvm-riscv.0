Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AC5C44536
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFFX/XbPMShLjebJKEUCuO2QMVVTOxNCY5t2+vNA9uA=; b=mrVca3hVBk6dpj
	LaoqlBYUUuNKGmRJgdrNb8KzO3mt6+WZ7UNUg7JSlIosfcUlrCsUdxyXTHUBYaBPypBWvcPNukBsg
	eGjysSpeZYljTkhsGkv/uGbmu/66560bSwDTzWM/kGNRuoFZzFhqpnPUe3HfTmZmV9WF8bFdm+BYT
	+6Ib/cHt5wp7Md/baWD2v9f+ZYK8e++Qaa3Sl8jbTPua5qVd59+5fbIP3T9EefQ0bH4lUbLG1WF0r
	tva7KT23WhvR3ebTAQORoZbFw+V5vCZDHMYjxSxqF5h2moCMdBysG5zQMLrFjq1t9sBDFMreBWXdL
	Gu0cLvifU/NN161qi0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYwC-0000000CBbu-1v3H;
	Wed, 22 Jul 2026 15:32:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYwB-0000000CBad-0qVw;
	Wed, 22 Jul 2026 15:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=x2DEG0/lsSMe18330BYMAw9oq7fwFgPePemeHXeJCXM=; b=JRSFrK8HMtbPVTghyRSkrP++MP
	Vw6fNtaZ5pj1xFmG1iv1j+XQ8E/9G24Z9v3XdFY4PXGBChty4NjO3MOzItC4UNZgp88rfqZ62H104
	PE4GS4iXP33/Si41eEZCeFyI9nrjnlgGtS59hBfHdu2vO14K87F3EQi5l+G/peVLmz/igByuwW0fH
	hmXl7psloNyt9dXzhrcW0GQchEsUkV5bzQXvXGY2A6FYc9XA3Jgom1V+2jD1bWlDHaByKWHcKFEFX
	yyoYGH3iHz8CRaxPMVblZx+5lLeB94Xz++3EkRpEOBnkNbg0d4deEswGmPtdlstLhATey+YXdLvVA
	9GpUmJig==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmYw8-00000000xCI-0uUK;
	Wed, 22 Jul 2026 15:32:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBCC7168F;
	Wed, 22 Jul 2026 08:32:37 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 546693F66F;
	Wed, 22 Jul 2026 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734362; bh=7Ae9Beb4KeYHYFDO2fuqF6aoTpqIj0FluLW/seeBxD4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B0aehDdFvBfvBVIIp2zMH67Lgu5JuiYLh/bHJAAXod1jJVYAFkp5Bu1vG2YdKZCzM
	 M0aFKyio40bPpN9seoAqUpmyTQoj/5ClQV8N33uLEYbIpsyIyeUsQ7VEjiJsJYIlX2
	 a0pvoqex/lEfvtzADdbbAoF90e4wmb3qWVHWRIYw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 22 Jul 2026 16:30:25 +0100
Subject: [PATCH RFC v2 17/20] mm/pgtable: disallow calling
 (pgd|p4d|pud)_page, pgd_page_vaddr() and (p4d|pud)_pgtable with dummy
MIME-Version: 1.0
Message-Id: <20260722-dummy_ptxp3-v2-17-d9e4bad31e0a@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=ZfOIqDcnxaLeCJmpu2GHcBUFS7H+BCZkr1Bq1FmACcE=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqYOIXWFr4tS39OcpehK5ArSSuOGxsT8KERLcOY
 bFidb6RmOuJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCamDiFwAKCRBt1cPRWsUx
 Mxl5C/4/Z1An+pql6k/RmbweehPJhZeYR2tquIfEoDvMBJSdPiyFbCFjDDF/KEPtFyRTltpsXmj
 nzAORhubLrsQB4dtTfHleQt6PMQdVMtlXRJulqNEPQ0lMVYC+Ja5vR6TgOM8Xt0xVRH9op3YXV6
 XVFwxUasE+yRlaMndg/VFQoVgZ0KZVsEOU5OVbb884+BEebDjXZrWL6y9ayYhKEb1s/ASnpJ40c
 jpBwvMakWgRS20jzRBXxCWzNF7S9I33l9S8IpU7Vdc4xGcut0KxmytlqFLElSSrXBpBq3hZbef0
 R3UlALA31tYedWIXhixSSbGujT4BeJDB6W/iKmmZCGoUR71JyBQyljLM+dNRMWR81Cc8kdEGno/
 RRj1wyhyGYC1/hC07KPBcGES4CJ9xA0DCuprgpOcy2/x7Fh6vYNpcPWpse086hcBs731SXQJzI1
 RubKkCaWr4hOc32pd3WmnGvIsyxbARqJAr5JzesTLBpGF4nd4m0X533vaNfqsfo8IK0d4=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_163244_560650_0066D150 
X-CRM114-Status: GOOD (  11.80  )
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

These helpers that silently fallback to the folded level
are dangerous, especially with some upcoming changes.

Make all code compile-out any calls to these helpers with dummy value.
So let's make the compiler complain if these helpers are abused with dummy pXdp value.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 include/asm-generic/pgtable-nop4d.h | 8 ++++++--
 include/asm-generic/pgtable-nopmd.h | 8 ++++++--
 include/asm-generic/pgtable-nopud.h | 8 ++++++--
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index 9e9e4557761d..05c3acc0884b 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -70,8 +70,12 @@ static __always_inline p4d_t *__p4d_offset_lockless(pgd_t *pgdp, pgd_t pgd,
 #define p4d_val(x)				(pgd_val((x).pgd))
 #define __p4d(x)				((p4d_t) { __pgd(x) })
 
-#define pgd_page(pgd)				(p4d_page((p4d_t){ pgd }))
-#define pgd_page_vaddr(pgd)			((unsigned long)(p4d_pgtable((p4d_t){ pgd })))
+#define pgd_page(pgd)				({ BUILD_BUG(); (struct page *)NULL; })
+#define pgd_page_vaddr(pgd)						\
+({ 									\
+	pgd_check_dummy(pgd);						\
+	(unsigned long)p4d_pgtable((p4d_t) { pgd });			\
+})
 
 /*
  * allocating and freeing a p4d is trivial: the 1-entry p4d is
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index f92ddcea444f..aa4902f63c0e 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -80,8 +80,12 @@ static __always_inline pmd_t *__pmd_offset_lockless(pud_t *pudp, pud_t pud,
 #define pmd_val(x)				(pud_val((x).pud))
 #define __pmd(x)				((pmd_t) { __pud(x) } )
 
-#define pud_page(pud)				(pmd_page((pmd_t){ pud }))
-#define pud_pgtable(pud)			((pmd_t *)(pmd_page_vaddr((pmd_t){ pud })))
+#define pud_page(pud)				({ BUILD_BUG(); (struct page *)NULL; })
+#define pud_pgtable(pud)						\
+({									\
+	pud_check_dummy(pud);						\
+	((pmd_t *)(pmd_page_vaddr((pmd_t) { pud })));			\
+})
 
 /*
  * allocating and freeing a pmd is trivial: the 1-entry pmd is
diff --git a/include/asm-generic/pgtable-nopud.h b/include/asm-generic/pgtable-nopud.h
index 7475d0bd0f2e..3264673c0c38 100644
--- a/include/asm-generic/pgtable-nopud.h
+++ b/include/asm-generic/pgtable-nopud.h
@@ -77,8 +77,12 @@ static __always_inline pud_t *__pud_offset_lockless(p4d_t *p4dp, p4d_t p4d,
 #define pud_val(x)				(p4d_val((x).p4d))
 #define __pud(x)				((pud_t) { __p4d(x) })
 
-#define p4d_page(p4d)				(pud_page((pud_t){ p4d }))
-#define p4d_pgtable(p4d)			((pud_t *)(pud_pgtable((pud_t){ p4d })))
+#define p4d_page(p4d)				({ BUILD_BUG(); (struct page *)NULL; })
+#define p4d_pgtable(p4d)						\
+({									\
+	p4d_check_dummy(p4d);						\
+	((pud_t *)(pud_pgtable((pud_t) { p4d })));			\
+})
 
 /*
  * allocating and freeing a pud is trivial: the 1-entry pud is

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
