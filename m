Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30B6CD6E6D
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NC/pP/ENKEye2+GLHJGuH+EVObNlJQVBHSibn+/HNXE=; b=en+wUwhy4zsfXD
	KlHTkl6UvLBeGKGOW1dbzuccV3NuuXAM0U8r1mMFYeHW+XTvrXu07Dt2Tb0g7JhdNnEjJH9WRthH2
	aJSM0aP5C0zNbhF2CI28Ta3PU46oiw2gjBsF7ZzZ8D+xD2QqdIH+XcX/A4er26r16uhEJ6FTXj0Mb
	mB+ZQu9c3Xh6xbfULv8glLLB76M6YVv0Vooeiov3iOLgVP2dG+Mt/qW/bSv2OuOFPe/CZR0/E26lU
	D27ZAzWyDzozqLFFwPWgU2arX8avI0zWNPvCUq7hSzLk1+QpPYCyM8Zywe6o1eS6cj6lUR81KeLQI
	UhCiGByeqApDr7/kHFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV840-0000000GmUM-2g5l;
	Thu, 04 Jun 2026 13:24:48 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV83t-0000000GmCT-3GD0;
	Thu, 04 Jun 2026 13:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780579478; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3+qPiQ2Gl/TMinxrqx2qmds9VgNiXB+sPEFSqxECM+0=;
	b=AocazI/mJuBopEpVeKeQG5wkwm1KKwywm2ewQNdJLudCqad4K/edRcANsThxBufZ5CMEA8aeezpbkYZbEtdJ12HewTGDU9Io17abZHCQFEXgIEB3nG31xaUtHvTbbapuY0v39WVpmKZkDFrJJxu9NpkHxokfKhwpvSYUxvoK6tI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R961e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X4AKnaT_1780579474;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X4AKnaT_1780579474 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 04 Jun 2026 21:24:35 +0800
From: fangyu.yu@linux.alibaba.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Nick Kossifidis <mick@ics.forth.gr>
Cc: Song Shuai <songshuaishuai@tinylab.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Richard Lyu <richard.lyu@suse.com>,
	Nam Cao <namcao@linutronix.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v3 8/9] riscv: kexec: Add the relocate-trampoline wrapper
Date: Thu,  4 Jun 2026 21:24:17 +0800
Message-Id: <20260604132418.15725-9-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260604132418.15725-1-fangyu.yu@linux.alibaba.com>
References: <20260604132418.15725-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_062442_378955_96091D8D 
X-CRM114-Status: GOOD (  10.94  )
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

Add riscv_kexec_relocate_entry to .kexec.tramp.text and the two
asm-visible globals (riscv_kexec_relocate_entry_pa and
riscv_kexec_cc_buffer_pa) that the wrapper consumes.

The wrapper performs the same two-step transition used by the crash
path: switch to the trampoline pgd, jump to the PA of self, then drop
the MMU with PC already on a PA. It finally jumps to the PA of
control_code_buffer.

machine_kexec_prepare() publishes the wrapper PA via WRITE_ONCE for
non-crash images. The per-image control_code_buffer PA is published
later, at dispatch time, so a load failure between prepare() and the
kexec_image swap cannot leave the global pointing at a freed page.
Nothing routes to the wrapper yet; the switchover happens in the
follow-up patch.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/include/asm/kexec.h     |  1 +
 arch/riscv/kernel/kexec_relocate.S | 36 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/machine_kexec.c  |  5 +++++
 3 files changed, 42 insertions(+)

diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index 6466c1f00d41..b75cab959e53 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -53,6 +53,7 @@ typedef void (*riscv_kexec_method)(unsigned long first_ind_entry,
 				   unsigned long va_pa_off);
 
 extern riscv_kexec_method riscv_kexec_norelocate;
+extern riscv_kexec_method riscv_kexec_relocate_entry;
 
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops elf_kexec_ops;
diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
index 8cfdf6f4032a..6c624560c9ac 100644
--- a/arch/riscv/kernel/kexec_relocate.S
+++ b/arch/riscv/kernel/kexec_relocate.S
@@ -225,6 +225,42 @@ SYM_CODE_START(riscv_kexec_norelocate)
 
 SYM_CODE_END(riscv_kexec_norelocate)
 
+.extern riscv_kexec_relocate_entry_pa
+.extern riscv_kexec_cc_buffer_pa
+.section ".kexec.tramp.text", "ax"
+SYM_CODE_START(riscv_kexec_relocate_entry)
+	/*
+	 * Two-pass entry, identical in shape to riscv_kexec_norelocate:
+	 *   - 1st entry: t3 == 0 (initialized by machine_kexec()).
+	 *   - 2nd entry: t3 == PA of riscv_kexec_relocate_entry, so auipc
+	 *                matches t3 and we fall through to label 1.
+	 * Args a0..a4 are passed through unchanged to riscv_kexec_relocate.
+	 */
+	auipc	t0, 0
+	beq	t0, t3, 1f
+
+	la	t0, riscv_kexec_relocate_entry_pa
+	REG_L	t3, 0(t0)
+	la	t0, kexec_tramp_satp
+	REG_L	t1, 0(t0)
+	csrw	CSR_SATP, t1
+	sfence.vma x0, x0
+
+	jr	t3
+1:
+	/*
+	 * Now executing at the PA of this wrapper with the trampoline pgd
+	 * installed (identity-mapped). Drop the MMU; PC stays valid because
+	 * it is already a PA.
+	 */
+	csrw	CSR_SATP, zero
+
+	/* Jump to the PA of control_code_buffer to run the relocate body. */
+	la	t0, riscv_kexec_cc_buffer_pa
+	REG_L	t0, 0(t0)
+	jr	t0
+SYM_CODE_END(riscv_kexec_relocate_entry)
+
 .section ".rodata"
 SYM_DATA(riscv_kexec_relocate_size,
 	.long riscv_kexec_relocate_end - riscv_kexec_relocate)
diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index d82f45fb44b6..71688c63af65 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -20,6 +20,8 @@
 
 unsigned long kexec_tramp_satp;
 unsigned long riscv_kexec_norelocate_pa;
+unsigned long riscv_kexec_relocate_entry_pa;
+unsigned long riscv_kexec_cc_buffer_pa;
 /*
  * Trampoline page tables. Both the VA(trampoline)->PA and the
  * PA(trampoline)->PA identity mapping are installed in this single
@@ -164,6 +166,9 @@ machine_kexec_prepare(struct kimage *image)
 
 		/* Mark the control page executable */
 		set_memory_x((unsigned long) control_code_buffer, 1);
+
+		WRITE_ONCE(riscv_kexec_relocate_entry_pa,
+			   __pa_symbol(&riscv_kexec_relocate_entry));
 	} else {
 		WRITE_ONCE(riscv_kexec_norelocate_pa,
 			   __pa_symbol(&riscv_kexec_norelocate));
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
