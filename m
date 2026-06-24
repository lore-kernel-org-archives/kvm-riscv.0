Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86343CDB470
	for <kvm-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TclatPW2Q6wQLZuV1u2wzm1xTwm9nw4BF1/TifPPBcc=; b=4S6FKwoMIhlBCu
	JAKq4tAZmBXVkSNlsC1NVmYmYMzr4jt0dM1h1Ad/jK4gq1nVi29/VFdvAqPgtngEU02btQzpOSZcr
	j18IFT9s/0hQAlO8vfRDePFf4c68kw4EXADly3bamK5jOhzrBAVadyY3zN8s5z2PrrGlXDHeIXabc
	Gr9z3kzaFNK0ENXK6YpRXdQ6M+s+Zao95OglKU+gDioo7+RFPFPZGpGWXhwBL9bd2Yrl9CLZFj89x
	WBBj+3AqiT0pWX49g4dsXOEYru4GeriBVLSIR4Vvcp2aNAxY5QU+Pe6EpjfECWOtNwFgfNx1z184e
	JDp0Eb5HUEvSctnpiUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIjx-00000007NgB-12T0;
	Wed, 24 Jun 2026 08:13:45 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIju-00000007NfB-349k;
	Wed, 24 Jun 2026 08:13:44 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4glZT00cM9z5B11P;
	Wed, 24 Jun 2026 16:13:40 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl1.zte.com.cn with SMTP id 65O8DTk7096349;
	Wed, 24 Jun 2026 16:13:29 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 24 Jun 2026 16:13:31 +0800 (CST)
X-Zmail-TransId: 2b056a3b91ab127-e3b57
X-Mailer: Zmail v1.0
Message-ID: <202606241613317585xwq5rcUKFZQtDleCa7ES@zte.com.cn>
In-Reply-To: <20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn>
References: 20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn
Date: Wed, 24 Jun 2026 16:13:31 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <atish.patra@linux.dev>, <alex@ghiti.fr>, <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYzIFJFU0VORCA1LzVdIFJJU0MtVjogS1ZNOiBBZGQgdGhlIGVhZ2VyX3BhZ2Vfc3BsaXQgbW9kdWxlIHBhcmFtZXRlcg==?=
X-MAIL: mse-fl1.zte.com.cn 65O8DTk7096349
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 24 Jun 2026 16:13:40 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A3B91B4.000/4glZT00cM9z5B11P
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_011342_927654_6B14F3CC 
X-CRM114-Status: GOOD (  10.86  )
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

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
index cbda927dd24e3..278dd3bba680e 100644
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
@@ -165,8 +168,10 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,

 	kvm_riscv_gstage_wp_range(&gstage, start, end);

-	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-		mmu_split_huge_pages(&gstage, start, end);
+	if (kvm_dirty_log_manual_protect_and_init_set(kvm)) {
+		if (READ_ONCE(eager_page_split))
+			mmu_split_huge_pages(&gstage, start, end);
+	}
 }

 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
@@ -236,7 +241,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
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
