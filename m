Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF51E9A777
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCxjPiykpPeaFTr2XuDkIEZ7T8RD64x5bGoL0jXxz9g=; b=p8jvYL2GAIXhet
	aYnw7GNS+14MHIGLE8Lrh6iUyRXxaeTM2rRvmjWPIM4KOS+oEUotBtz338N6uCqjsIsqdeEe3/iQC
	i4GLP7NzKzuC/fPjoK6TQymatqV5cLxwvZ4b165IwPqkBBZWVT3Fm5sbiIM3i8lhv5WrHNMNRvgjF
	7J28+21trnQnlFKYm2/S9nJEkHa9ED42CwimvECY30jC1FwLWKFZ9v2vAUzh9MJqWQ+QQkWK3fVCy
	br0oWqrTVOhJG+zwDoQY7rBFdmR6oWrSxZIJH5moA8yBWhNGEsZZsgDOv+Hc2UUg2DI8buqOnLWNn
	jjepeYFCEkOuVr+VWYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Cp-00000001IN4-3gO0;
	Tue, 24 Mar 2026 11:45:55 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Ck-00000001IJQ-3cGM;
	Tue, 24 Mar 2026 11:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774352739; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=jPF1Ju7Ns0lO+Yge9p5ER6y+YNSyxbvGG2vjrwoYHYQ=;
	b=OUO48v5bX+pKN0f/iUijOHCb5jGBRf5toPk9n5U/0jI42hmH4WFVUsSzSKu6VXKAMMMol2eFujGVatBLgHsjeJvyfskYCoc2DQNAsAyMIvZwmjqu7Q9hi0IAewLGLMi5vR3Kkoyu+FXd5Z3yXpH3yg1p5Br0fshzxNS7xpe+yiw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.eWVGD_1774352737;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X.eWVGD_1774352737 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Mar 2026 19:45:38 +0800
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
Subject: [PATCH 4/4] riscv: kexec: Switch to trampoline page table before norelocate
Date: Tue, 24 Mar 2026 19:45:27 +0800
Message-Id: <20260324114527.91494-5-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
References: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044551_479218_82B50131 
X-CRM114-Status: GOOD (  13.58  )
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

Make riscv_kexec_norelocate a two-pass trampoline so it can
drop the kernel page tables while still executing from a
mapped address.

On the first entry, t3 is initialized to 0 by machine_kexec().
Loads the physical address of riscv_kexec_norelocate and the
trampoline SATP value, switches to the trampoline page table,
and jumps to the trampoline VA(=PA).

On the second entry, t3 contains the physical address of
riscv_kexec_norelocate, so the PC comparison matches and
execution continues under trampoline VA(=PA).

Since the trampoline page table is already active, replace the
previous stvec-based handoff with a direct jump to the target
entry (jr a2).

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kernel/kexec_relocate.S | 32 +++++++++++++++++++++++++-----
 arch/riscv/kernel/machine_kexec.c  | 13 ++++++++++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
index af6b99f5b0fd..2b9892bf04f2 100644
--- a/arch/riscv/kernel/kexec_relocate.S
+++ b/arch/riscv/kernel/kexec_relocate.S
@@ -147,13 +147,35 @@ riscv_kexec_relocate_end:
 
 
 /* Used for jumping to crashkernel */
+.extern kexec_tramp_satp
+.extern riscv_kexec_norelocate_pa
 .section ".kexec.tramp.text", "ax"
 SYM_CODE_START(riscv_kexec_norelocate)
+	/*
+	 * Two-pass entry:
+	 *   - 1st entry: t3 == 0 (initialized by machine_kexec()).
+	 *
+	 *   - 2nd entry: t3 holds the physical address of
+	 *     riscv_kexec_norelocate, so auipc matches t3 and we fall through
+	 *     to label 1 to continue execution under trampoline VA(=PA).
+	 */
+	auipc   t0, 0
+	beq     t0, t3, 1f
+
+	la      t0, riscv_kexec_norelocate_pa
+	REG_L   t3, 0(t0)
+	la      t0, kexec_tramp_satp
+	REG_L   t1, 0(t0)
+	csrw	CSR_SATP, t1
+	sfence.vma x0, x0
+
+	jr      t3
 	/*
 	 * s0: (const) Phys address to jump to
 	 * s1: (const) Phys address of the FDT image
 	 * s2: (const) The hartid of the current hart
 	 */
+1:
 	mv	s0, a1
 	mv	s1, a2
 	mv	s2, a3
@@ -199,13 +221,13 @@ SYM_CODE_START(riscv_kexec_norelocate)
 	csrw	CSR_SSCRATCH, zero
 
 	/*
-	 * Switch to physical addressing
-	 * This will also trigger a jump to CSR_STVEC
-	 * which in this case is the address of the new
-	 * kernel.
+	 * We are already executing from the trampoline VA with the trampoline
+	 * page table installed, so there is no need to rely on the old flow
+	 * of programming stvec and taking the implicit trap on SATP switch.
+	 * Jump directly to the target entry instead.
 	 */
-	csrw	CSR_STVEC, a2
 	csrw	CSR_SATP, zero
+	jr	a2
 
 SYM_CODE_END(riscv_kexec_norelocate)
 
diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 4e522a64a614..d78e7928c6cf 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -18,6 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+unsigned long kexec_tramp_satp;
+unsigned long riscv_kexec_norelocate_pa;
 static pgd_t kexec_tramp_pgd[PTRS_PER_PGD] __aligned(PAGE_SIZE);
 static p4d_t kexec_tramp_p4d[PTRS_PER_P4D] __aligned(PAGE_SIZE);
 static pud_t kexec_tramp_pud[PTRS_PER_PUD] __aligned(PAGE_SIZE);
@@ -266,6 +268,8 @@ machine_kexec(struct kimage *image)
 		 */
 		riscv_kexec_build_tramp((unsigned long)__kexec_tramp_text_start,
 					__pa_symbol(__kexec_tramp_text_start));
+		riscv_kexec_norelocate_pa = __pa_symbol(&riscv_kexec_norelocate);
+		kexec_tramp_satp = PFN_DOWN(__pa_symbol(kexec_tramp_pgd)) | satp_mode;
 	}
 
 	pr_notice("Will call new kernel at %08lx from hart id %lx\n",
@@ -277,6 +281,15 @@ machine_kexec(struct kimage *image)
 
 	/* Jump to the relocation code */
 	pr_notice("Bye...\n");
+	/*
+	 * Initialize t3 to 0 for riscv_kexec_norelocate().
+	 *
+	 * The norelocate trampoline uses t3 as a scratch register to record/
+	 * compare against the current PC when switching to the trampoline
+	 * page table. Keep t3 untouched from here until we branch into
+	 * riscv_kexec_norelocate.
+	 */
+	asm volatile ("li t3, 0x0" ::: "t3");
 	kexec_method(first_ind_entry, jump_addr, fdt_addr,
 		     this_hart_id, kernel_map.va_pa_offset);
 	unreachable();
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
