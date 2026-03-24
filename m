Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1986E9A774
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDK68ngpafdZ8rzNjKlkxcD2peTR+7zEiCG9QUl14tw=; b=gmscAURnmBVKEw
	uKzPFytGhALhgJryIxegu5SwJlIcrR8UNORA/k4rkVpOniek4Jm1+MnWL3FPde11W/+PkF4Qfk+pE
	qI+JA9/iqg1rZq2nQDDaYr3mxWJWkgOmNP7Z5NtNnXRqCZ5bfK2R4sdnAQjY5q3j9/bJx1w3TXdxU
	W1OnxA5mtSJ5EHEAxiWscPtFGePRmsXYzn6kGotpTVWK24kKYa/F/sjX8ek0zhXLJJapEQuNoQvUC
	EiRurp5ufj30kVpmnhTvhWLELFvSlG5P7wdkMtQT3usOX2x5rhZPCUbg0JMWtItUekCKfhjskLI+f
	LGtYFzFEIbTb0aCTjyqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Cp-00000001IMq-2exG;
	Tue, 24 Mar 2026 11:45:55 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Ck-00000001IJX-3j1v;
	Tue, 24 Mar 2026 11:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774352739; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=E9l5eM2dvXocKxkWzJcB7vhB/kHEeAYIIZKXRijN8cA=;
	b=iDVdEQrcMWqJ6c3eDcY72a8GKjjTeb669YHeC7KZIteX+frdyPBM2N5qJru2HDPpfL2Mq196aF0X5F/xvfMOL5M+Uv4QO+N8jCr8ORyWj1ItdgRe3Gkiy2b4eDAI3IRYYzVAIdTE2OtJ7DTQB32We9YEXtEJgKV5xH4UR+T9iG8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.eWVFP_1774352733;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X.eWVFP_1774352733 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Mar 2026 19:45:34 +0800
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
Subject: [PATCH 1/4] riscv: Add kexec trampoline text section to vmlinux.lds.S
Date: Tue, 24 Mar 2026 19:45:24 +0800
Message-Id: <20260324114527.91494-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
References: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044551_477403_D760D813 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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

When CONFIG_KEXEC_CORE is enabled, add a dedicated .kexec.tramp.text
area to the RISC-V kernel linker script.

This introduces a KEXEC_TRAMP_TEXT linker snippet in image-vars.h and
uses it from vmlinux.lds.S to:
  - align to PAGE_SIZE
  - define __kexec_tramp_text_start/__kexec_tramp_text_end
  - KEEP all .kexec.tramp.text* input sections
  - ASSERT the trampoline text fits within one page

When kexec is disabled, KEXEC_TRAMP_TEXT expands to nothing.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kernel/image-vars.h  | 13 +++++++++++++
 arch/riscv/kernel/vmlinux.lds.S |  1 +
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 3bd9d06a8b8f..5419609ff89c 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -34,4 +34,17 @@ __efistub_sysfb_primary_display	= sysfb_primary_display;
 
 #endif
 
+#ifdef CONFIG_KEXEC_CORE
+#define KEXEC_TRAMP_TEXT						\
+		. = ALIGN(PAGE_SIZE);					\
+		__kexec_tramp_text_start = .;				\
+		KEEP(*(.kexec.tramp.text))				\
+		KEEP(*(.kexec.tramp.text.*))				\
+		__kexec_tramp_text_end = .;				\
+		ASSERT((__kexec_tramp_text_end - __kexec_tramp_text_start) <= PAGE_SIZE,  \
+			".kexec.tramp.text exceeds 4K");
+#else
+#define KEXEC_TRAMP_TEXT /* nothing */
+#endif
+
 #endif /* __RISCV_KERNEL_IMAGE_VARS_H */
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 997f9eb3b22b..c55316912c1d 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -45,6 +45,7 @@ SECTIONS
 		ENTRY_TEXT
 		IRQENTRY_TEXT
 		SOFTIRQENTRY_TEXT
+		KEXEC_TRAMP_TEXT
 		_etext = .;
 	}
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
