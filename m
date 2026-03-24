Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD75AE9A778
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wj/uKDR2GQ7glTHLVSiVdZHkEDe9fuD051Nb6lT9CY=; b=jWcNjloW0+xXTC
	WuJdpQVT8Ieq8cepSSk4jC2n0MAArv4ItadlwaP6G3GoKKMuNWuSyI5pThYmjK1ITdrkiq68VVOaw
	yhwbIOFjyovbijn1nZJCExxUrF2Rh6GmJ3voYp7bUoCVnAv0flu5207wDxkn4VmqpxjTUtdJnj05f
	masiilh1sjPzy9wLA8k/RgbjLUsmsPY+941PI9Dryuwq2+g1hU0AsUGl3uxqjZ2dhjUib3sp5XjrP
	q69h5ZchAYIUWRLOda4axezqO6TWjwNCq9UE2AQbaxVKNowRgDa6hWBesf56gv6R6HwKNYQaKVBDJ
	3ieOgrP9X1367sYmAYAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Cq-00000001INT-1qWf;
	Tue, 24 Mar 2026 11:45:56 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Cl-00000001IJm-1HM3;
	Tue, 24 Mar 2026 11:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774352742; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5u8vaxNzmtFsbfL7LvvEbSUs+WLXyb+uBK2uxrcg2Kc=;
	b=GCuMuiSIkFRGgbh4RnW3v8XwtHq62sn294fgMIyCvCdtg6ap77X1rOb+pxhBXoWjsYsQYBikGDGQ43vm7lZg/Yx8ppPnwkImd3+W0Oyb6CANa4EjcS0jsF+7Cy4WgKd8z9Cmh4mzTAV4W1tFw0ni8oWnEFZB33dMAIirsR8zwvU=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.eWVFq_1774352736;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X.eWVFq_1774352736 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Mar 2026 19:45:37 +0800
From: fangyu.yu@linux.alibaba.com
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	songshuaishuai@tinylab.org,
	bjorn@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	bhelgaas@google.com,
	richard.lyu@suse.com,
	tzimmermann@suse.de,
	nathan@kernel.org
Cc: guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH 3/4] riscv: kexec: Build trampoline page tables for crash kernel entry
Date: Tue, 24 Mar 2026 19:45:26 +0800
Message-Id: <20260324114527.91494-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
References: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044551_562229_0BAB6888 
X-CRM114-Status: GOOD (  11.32  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Crash kexec uses riscv_kexec_norelocate as a trampoline to jump into
the crashkernel. Add a small helper to build dedicated 4KB page tables
that map the trampoline page as executable.

Two mappings are installed:
  - VA(__kexec_tramp_text_start) -> PA(__kexec_tramp_text_start)
  - PA(__kexec_tramp_text_start) -> PA(__kexec_tramp_text_start)

This allows the trampoline to run regardless of whether it is entered
via its linked virtual address or its physical address.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kernel/machine_kexec.c | 103 +++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 2306ce3e5f22..4e522a64a614 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -18,6 +18,98 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+static pgd_t kexec_tramp_pgd[PTRS_PER_PGD] __aligned(PAGE_SIZE);
+static p4d_t kexec_tramp_p4d[PTRS_PER_P4D] __aligned(PAGE_SIZE);
+static pud_t kexec_tramp_pud[PTRS_PER_PUD] __aligned(PAGE_SIZE);
+static pmd_t kexec_tramp_pmd[PTRS_PER_PMD] __aligned(PAGE_SIZE);
+static pte_t kexec_tramp_pte[PTRS_PER_PTE] __aligned(PAGE_SIZE);
+static p4d_t kexec_tramp_p4d2[PTRS_PER_P4D] __aligned(PAGE_SIZE);
+static pud_t kexec_tramp_pud2[PTRS_PER_PUD] __aligned(PAGE_SIZE);
+static pmd_t kexec_tramp_pmd2[PTRS_PER_PMD] __aligned(PAGE_SIZE);
+static pte_t kexec_tramp_pte2[PTRS_PER_PTE] __aligned(PAGE_SIZE);
+
+static void riscv_kexec_build_tramp(unsigned long va, unsigned long pa)
+{
+	pgd_t *pgd;
+	pud_t *pud;
+	p4d_t *p4d;
+	pmd_t *pmd;
+	pte_t *pte;
+	int index;
+
+	index = pgd_index(va);
+	pgd = (pgd_t *)kexec_tramp_pgd + index;
+	if (pgtable_l5_enabled)
+		set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa_symbol(kexec_tramp_p4d)),
+			PAGE_TABLE));
+	else
+		set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa_symbol(kexec_tramp_pud)),
+			PAGE_TABLE));
+
+	if (pgtable_l5_enabled) {
+		index = p4d_index(va);
+		p4d = (p4d_t *)kexec_tramp_p4d + index;
+		if (pgtable_l4_enabled)
+			set_p4d(p4d, pfn_p4d(PFN_DOWN(__pa_symbol(kexec_tramp_pud)),
+				PAGE_TABLE));
+		else
+			set_p4d(p4d, pfn_p4d(PFN_DOWN(__pa_symbol(kexec_tramp_pmd)),
+				PAGE_TABLE));
+	}
+
+	if (pgtable_l4_enabled) {
+		index = pud_index(va);
+		pud = (pud_t *)kexec_tramp_pud + index;
+		set_pud(pud, pfn_pud(PFN_DOWN(__pa_symbol(kexec_tramp_pmd)), PAGE_TABLE));
+	}
+
+	index = pmd_index(va);
+	if (pgtable_l4_enabled)
+		pmd = (pmd_t *)kexec_tramp_pmd + index;
+	else
+		pmd = (pmd_t *)kexec_tramp_pud + index;
+	set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa_symbol(kexec_tramp_pte)), PAGE_TABLE));
+
+	index = pte_index(va);
+	pte = (pte_t *)kexec_tramp_pte + index;
+	set_pte(pte, pfn_pte(PFN_DOWN(pa), PAGE_KERNEL_EXEC));
+
+	index = pgd_index(pa);
+	pgd = (pgd_t *)kexec_tramp_pgd + index;
+	if (pgtable_l5_enabled)
+		set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa_symbol(kexec_tramp_p4d2)), PAGE_TABLE));
+	else
+		set_pgd(pgd, pfn_pgd(PFN_DOWN(__pa_symbol(kexec_tramp_pud2)), PAGE_TABLE));
+
+	if (pgtable_l5_enabled) {
+		index = p4d_index(pa);
+		p4d = (p4d_t *)kexec_tramp_p4d2 + index;
+		if (pgtable_l4_enabled)
+			set_p4d(p4d, pfn_p4d(PFN_DOWN(__pa_symbol(kexec_tramp_pud2)),
+				PAGE_TABLE));
+		else
+			set_p4d(p4d, pfn_p4d(PFN_DOWN(__pa_symbol(kexec_tramp_pmd2)),
+				PAGE_TABLE));
+	}
+
+	if (pgtable_l4_enabled) {
+		index = pud_index(pa);
+		pud = (pud_t *)kexec_tramp_pud2 + index;
+		set_pud(pud, pfn_pud(PFN_DOWN(__pa_symbol(kexec_tramp_pmd2)), PAGE_TABLE));
+	}
+
+	index = pmd_index(pa);
+	if (pgtable_l4_enabled)
+		pmd = (pmd_t *)kexec_tramp_pmd2 + index;
+	else
+		pmd = (pmd_t *)kexec_tramp_pud2 + index;
+	set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa_symbol(kexec_tramp_pte2)), PAGE_TABLE));
+
+	index = pte_index(pa);
+	pte = (pte_t *)kexec_tramp_pte2 + index;
+	set_pte(pte, pfn_pte(PFN_DOWN(pa), PAGE_KERNEL_EXEC));
+}
+
 /*
  * machine_kexec_prepare - Initialize kexec
  *
@@ -164,8 +256,17 @@ machine_kexec(struct kimage *image)
 
 	if (image->type != KEXEC_TYPE_CRASH)
 		kexec_method = control_code_buffer;
-	else
+	else {
 		kexec_method = (riscv_kexec_method) &riscv_kexec_norelocate;
+		/*
+		 * Build two 4KB identity-mapping page tables for the
+		 * trampoline page:
+		 *   - VA(__kexec_tramp_text_start) -> PA(__kexec_tramp_text_start)
+		 *   - PA(__kexec_tramp_text_start) -> PA(__kexec_tramp_text_start)
+		 */
+		riscv_kexec_build_tramp((unsigned long)__kexec_tramp_text_start,
+					__pa_symbol(__kexec_tramp_text_start));
+	}
 
 	pr_notice("Will call new kernel at %08lx from hart id %lx\n",
 		  jump_addr, this_hart_id);
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
