Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C00C43327
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=is07V5QUhabKVem0BbtEXl9bCdhmPPZTZXMp1GlpOow=; b=FOfnNYKrQNaa7s
	Mm4H/Vx0Eu8b7uAqiF0vU43AUUM56zb6rEWP+7XbscoBgG//4GzkI4AMR2P4pb5iiFt65BcAAPYfw
	iJub7nsiyOL78EoZYJipTcOWbbG6G1cXnmHk++kK/PgCc/6iOEM3x2zb06zIMAh5CJ1ORu4H9ViOx
	6VbQhWoIpe0BAMkkVwQSQReXn6ALaHTbMtz+zjZ4fyhOaOEtY86ZoDsgxfP/y7kBkWXA1c924eila
	wLabebfG3LOzNnGa9jG+6Pa3I8/54z3Kcq0jwg6neSVllks2+1xzmDJn2bf2KWzZVPUQicknJI3xI
	uNTmkjC8r6PppIAFe+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetmk-00000001nnU-13w9;
	Wed, 01 Jul 2026 12:11:22 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetmi-00000001nkF-0XkK;
	Wed, 01 Jul 2026 12:11:21 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gqzPx5sMnz8XrrJ;
	Wed, 01 Jul 2026 20:11:17 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 661CB6SP047127;
	Wed, 1 Jul 2026 20:11:06 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Wed, 1 Jul 2026 20:11:09 +0800
X-Zmail-TransId: 3e816a4503dd008-1d60a
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: [PATCH v4 5/5] RISC-V: KVM: Add the eager_page_split module parameter
Date: Wed,  1 Jul 2026 20:09:48 +0800
Message-ID: <20260701120954.129873-6-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260701120954.129873-1-wang.yechao255@zte.com.cn>
References: <20260701120954.129873-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl1.zte.com.cn 661CB6SP047127
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 01 Jul 2026 20:11:17 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4503E5.000/4gqzPx5sMnz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051120_323708_E1D809CB 
X-CRM114-Status: GOOD (  12.72  )
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

Add an eager_page_split module parameter for RISC-V KVM, following
the same approach as on x86. This parameter controls whether eager
page splitting is enabled. The default value is on.

When eager page splitting is enabled, KVM proactively splits large
pages (huge pages) into smaller pages when needed for dirty logging
or other operations. Disabling it can be beneficial for VM workloads
that rarely perform writes, or that only write to a small region of
memory, as it allows huge pages to remain intact for read accesses.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++--
 arch/riscv/kvm/mmu.c                            | 13 ++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a68003c3599cc..b4c68a896fa79 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3047,7 +3047,7 @@ Kernel parameters
 			Default is 0 (don't ignore, but inject #GP)
 
 	kvm.eager_page_split=
-			[KVM,X86] Controls whether or not KVM will try to
+			[KVM,X86,RISCV] Controls whether or not KVM will try to
 			proactively split all huge pages during dirty logging.
 			Eager page splitting reduces interruptions to vCPU
 			execution by eliminating the write-protection faults
@@ -3067,7 +3067,10 @@ Kernel parameters
 			the KVM_CLEAR_DIRTY ioctl, and only for the pages being
 			cleared.
 
-			Eager page splitting is only supported when kvm.tdp_mmu=Y.
+			On x86, eager page splitting is only supported when
+			kvm.tdp_mmu=Y.
+
+			On RISCV, eager page splitting is supported by default.
 
 			Default is Y (on).
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 29a7ac023d4db..a534f596c8ca0 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -16,6 +16,9 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 
+static bool __read_mostly eager_page_split = true;
+module_param(eager_page_split, bool, 0644);
+
 static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 {
 	struct kvm_memslots *slots = kvm_memslots(kvm);
@@ -167,8 +170,10 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 
 	kvm_riscv_gstage_wp_range(&gstage, start, end);
 
-	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-		mmu_split_huge_pages(&gstage, start, end);
+	if (kvm_dirty_log_manual_protect_and_init_set(kvm)) {
+		if (READ_ONCE(eager_page_split))
+			mmu_split_huge_pages(&gstage, start, end);
+	}
 }
 
 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
@@ -238,7 +243,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
 			return;
 		mmu_wp_memory_region(kvm, new->id);
-		mmu_split_memory_region(kvm, new->id);
+
+		if (READ_ONCE(eager_page_split))
+			mmu_split_memory_region(kvm, new->id);
 	}
 }
 
-- 
2.43.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
