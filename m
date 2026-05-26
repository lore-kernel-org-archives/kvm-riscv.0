Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85E5CD5BD0
	for <kvm-riscv@archiver.kernel.org>; Tue, 26 May 2026 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qJ6z3d9oy6wEl3UcwUhumAorfjP/MhusfRJZGFUinGk=; b=DNObT/dpSj9EIH
	wbVhStIF6JlY6G76H61gqzdDVu2WrHX9CCTcWC1zYwP19IxdtFIXUGpsdOofgh5p4T4EU2AMC2KEk
	dWl7dCdAMh9EYQoqxrGPTLnZNnkSHsraJwyARD/T2YLidGAJrN/ORz7BIxV6fbJsN9Ss80WE+sBiA
	7wIk462owDGM1bTSC1b/MrD4/jIIdEshLxFEhSX65eLfAui6Gntp4NQuNMF1U2soWcLO8n+++gmNo
	i22Ri4uSOyRjfwvW98Srt/tuNq5Za6r04dstozhr20WAJ7jnuEZtml5AUL501qJgIds8bLGPzJ9y+
	I/nlMG6DgeKn0SHG1V2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrF4-00000001xqx-1sr0;
	Tue, 26 May 2026 12:50:42 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrEp-00000001xcC-1AMq;
	Tue, 26 May 2026 12:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779799822; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=4YSxzzA490KamtxaOd7dYYkwJkuqZylRfAB7NDmYOFI=;
	b=upBsi0PYr/ECfEIQyQeN5YtAb1hALQIf2lMlpNzSwJLvrK5bah9R3dqDA7wJbLWde3hFTXmCchB/8AU5JBXHCT5kZIvKdlMFBvxY2+sBRCsJzYHisOCz1rSgyznz2iavYx07p4oZsqPjaOnuuRcs/i46YwY05U2WTkpbixDLWvs=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X3gDNK2_1779799815;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X3gDNK2_1779799815 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 26 May 2026 20:50:16 +0800
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
Subject: [PATCH v2 1/7] riscv: Add kexec trampoline text section to vmlinux.lds.S
Date: Tue, 26 May 2026 20:50:03 +0800
Message-Id: <20260526125009.2404-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260526125009.2404-1-fangyu.yu@linux.alibaba.com>
References: <20260526125009.2404-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_055027_900253_6771576E 
X-CRM114-Status: UNSURE (   8.91  )
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
  - align both the start and the end to PAGE_SIZE
  - define __kexec_tramp_text_start/__kexec_tramp_text_end
  - KEEP all .kexec.tramp.text* input sections
  - ASSERT the trampoline text fits within one page

The end-of-section page alignment guarantees that the trampoline page,
which is later identity-mapped as PAGE_KERNEL_EXEC, contains nothing but
the trampoline code and padding (no shared neighbour data).

When kexec is disabled, KEXEC_TRAMP_TEXT expands to nothing.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kernel/image-vars.h  | 14 ++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 3bd9d06a8b8f..35ee3f059afa 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -34,4 +34,18 @@ __efistub_sysfb_primary_display	= sysfb_primary_display;
 
 #endif
 
+#ifdef CONFIG_KEXEC_CORE
+#define KEXEC_TRAMP_TEXT						\
+		. = ALIGN(PAGE_SIZE);					\
+		__kexec_tramp_text_start = .;				\
+		KEEP(*(.kexec.tramp.text))				\
+		KEEP(*(.kexec.tramp.text.*))				\
+		__kexec_tramp_text_end = .;				\
+		ASSERT((__kexec_tramp_text_end - __kexec_tramp_text_start) <= PAGE_SIZE,  \
+			".kexec.tramp.text exceeds 4K");				\
+		. = ALIGN(PAGE_SIZE);
+#else
+#define KEXEC_TRAMP_TEXT /* nothing */
+#endif
+
 #endif /* __RISCV_KERNEL_IMAGE_VARS_H */
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..fc7758e5b819 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -41,6 +41,7 @@ SECTIONS
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
