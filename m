Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D25DCAC5A5
	for <kvm-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 05:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Cc:To:Mime-Version:Subject:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rZaTekl0y87LB0zvXFPpNElv4rq7x+bUpSK5SxVISqo=; b=jAyiQgN52UuBWk
	qkV4Mt9oPslSyW3+g7qg4vzpZN8eBeeG2cR0J7NuDAJcAcWApg5tHBT2lvbK0MD+3cnmRUw1kavEc
	kS3Mb9HWCBJdYpHj5VLpeAhFmCCSCD+ogyMQzP7XSljQp2ps0t5yCHcUbldGRwhvfA7ZDsvQhZIWn
	CRUENhevgTFDHEa4dXVO1/MiB8sZWYbZ3CJYdqNQlRJuErKFpcSGrA3RlquBHsd/g8rXJM9WkyZlf
	unJR/F9EevPNjhAtbEeVStYr55wsh9UFf++EmW+rNa8wiDNFK/cm/gjhGtvFKyiZPMRKK90fpOV1D
	42zLRJKOFZMtWJIQD3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vkO-0000000CTaR-1vnR;
	Tue, 23 Sep 2025 05:39:28 +0000
Received: from sg-1-22.ptr.blmpb.com ([118.26.132.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vkK-0000000CTZj-39vs
	for kvm-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 05:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1758605953;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=3gmQ2zoxSsM9TQ/jV7QWiBGtZ/AlH7UzJQwrMEBoGjY=;
 b=GC/kLNBITSmfkcfO9WZhuD+p1gcAboL26Ola/dB47QIZJyGrQetTiT2396L4tz38J27lYj
 u8tATudUDLq2iDESeNEpLYOADAhfuJVwiAXWrwi0BVq/RKJ08DIji/1WhX3zlxrmrlp2GD
 edNQVwJxqfot4tV8TirBcD6+oF504v/unfXZc8RBPdqEV+B48ABwmPosWWir1pF0xmQuCh
 fR480yW0AwYqJWDEzEYQt1acCcsPf7F+b394IVhA3sj2D+KO9NxDbJl6Y2zkkwc4IVjtbt
 sfYwfi7hqjOM8K+u8+UW9bSAtc/pV1yrr6JGG6WBDCtY0QqyVqMkCMHPUn91fQ==
Date: Tue, 23 Sep 2025 13:38:51 +0800
X-Lms-Return-Path: <lba+268d2327f+946d54+lists.infradead.org+xiangwencheng@lanxincomputing.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Subject: [PATCH v2] RISC-V: KVM: Introduce KVM_EXIT_FAIL_ENTRY_NO_VSFILE
Mime-Version: 1.0
Received: from Bill.localdomain ([222.128.9.250]) by smtp.feishu.cn with ESMTP; Tue, 23 Sep 2025 13:39:10 +0800
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: <anup@brainfault.org>
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <atish.patra@linux.dev>, 
	<ajones@ventanamicro.com>, 
	"BillXiang" <xiangwencheng@lanxincomputing.com>
Message-Id: <20250923053851.32863-1-xiangwencheng@lanxincomputing.com>
X-Mailer: git-send-email 2.43.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_223924_961781_8D64638F 
X-CRM114-Status: UNSURE (   8.22  )
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

Currently, we return CSR_HSTATUS as hardware_entry_failure_reason when
kvm_riscv_aia_alloc_hgei failed in KVM_DEV_RISCV_AIA_MODE_HWACCEL
mode, which is vague so it is better to return a well defined value
KVM_EXIT_FAIL_ENTRY_NO_VSFILE provided via uapi/asm/kvm.h.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/aia_imsic.c        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da1..068d4d9cff7b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -23,6 +23,8 @@
 #define KVM_INTERRUPT_SET	-1U
 #define KVM_INTERRUPT_UNSET	-2U
 
+#define KVM_EXIT_FAIL_ENTRY_NO_VSFILE	(1ULL << 0)
+
 /* for KVM_GET_REGS and KVM_SET_REGS */
 struct kvm_regs {
 };
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index fda0346f0ea1..937963fb46c5 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -802,7 +802,7 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 		/* For HW acceleration mode, we can't continue */
 		if (kvm->arch.aia.mode == KVM_DEV_RISCV_AIA_MODE_HWACCEL) {
 			run->fail_entry.hardware_entry_failure_reason =
-								CSR_HSTATUS;
+								KVM_EXIT_FAIL_ENTRY_NO_VSFILE;
 			run->fail_entry.cpu = vcpu->cpu;
 			run->exit_reason = KVM_EXIT_FAIL_ENTRY;
 			return 0;
-- 
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
