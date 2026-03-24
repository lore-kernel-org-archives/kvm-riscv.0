Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81635E9A777
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpThCwSZjPRv299FoBRgibbGnFVhlXui1ACHBC04fsg=; b=C6PwzxDPEwG0jy
	tUpM08DhCMuQpucLi0Lnr2j5oPXgq8XyzFSxeKpyA7GI6YjYfba40vKjpWhzyOS8vNCwI9mQJ+v6k
	ieojSEieBHy1h2fl6idsIDVWbxayvbjtBa46GssJipiDB+4bw8D14MmCKCuVOl3mI5Hljt4J7p36O
	+tGW1M6L8zjDVKB1k233rbnWOgzQRuAIKnL/5NeUK0wCpvgf0kl0weyytqwbc4X3ttPMEkey63j8K
	DGr+BGc83J4tZq4sOv4Vlmci5XmMe8OIdyKAZLzsz9WJ4DHaKi/v+1vR7RnQ3qONBN68ulzrboxyW
	HCnNgQz2Fr+xubAM6pbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50El-00000001IrF-0mNG;
	Tue, 24 Mar 2026 11:47:55 +0000
Received: from out199-1.us.a.mail.aliyun.com ([47.90.199.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Ei-00000001Iq8-19My
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 11:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774352741; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=eGoUX5+U64mMyKbsYD4ZIBWAtxP/BeYqHD20VtSl4vc=;
	b=TLeffPEX1hMfUlHGGNXJQ0orUMvWCoGAz5t4rI3U9z9yUAC60TrsCz8aI/bpHxaaPeex1ZtwO5AMvjDSmHg2/xCnwfAWNBiC42gJ5SmfCf0Vz4Torp/dxzmqtSW+ibTlpWxQT199/iZfGdwd5YajxnAMmWhu+uVH7YeWtwQx6xI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R781e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.eWVFc_1774352735;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X.eWVFc_1774352735 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Mar 2026 19:45:35 +0800
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
Subject: [PATCH 2/4] riscv: kexec: Place norelocate trampoline into .kexec.tramp.text
Date: Tue, 24 Mar 2026 19:45:25 +0800
Message-Id: <20260324114527.91494-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
References: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044752_584454_43A5B509 
X-CRM114-Status: UNSURE (   6.13  )
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

Move riscv_kexec_norelocate out of the generic .text section and into
a dedicated executable trampoline section, .kexec.tramp.text.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/include/asm/kexec.h     | 9 +++++++++
 arch/riscv/kernel/kexec_relocate.S | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index b9ee8346cc8c..315dce0d9ca6 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -75,4 +75,13 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 			unsigned long cmdline_len);
 #endif
 
+#ifndef __ASSEMBLY__
+#ifdef CONFIG_MMU
+#define __kexec_tramp_text __section(".kexec.tramp.text")
+#else
+#define __kexec_tramp_text
+#endif
+#endif
+extern char __kexec_tramp_text_start[];
+
 #endif
diff --git a/arch/riscv/kernel/kexec_relocate.S b/arch/riscv/kernel/kexec_relocate.S
index de0a4b35d01e..af6b99f5b0fd 100644
--- a/arch/riscv/kernel/kexec_relocate.S
+++ b/arch/riscv/kernel/kexec_relocate.S
@@ -147,7 +147,7 @@ riscv_kexec_relocate_end:
 
 
 /* Used for jumping to crashkernel */
-.section ".text"
+.section ".kexec.tramp.text", "ax"
 SYM_CODE_START(riscv_kexec_norelocate)
 	/*
 	 * s0: (const) Phys address to jump to
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
