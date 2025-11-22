Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF0ACF64B1
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lBZ5Na5xKtqnxd3WCxGhGeiApGYDdbLGu7A6X1L8C0o=; b=IGIbtfMnS5eWj+
	nrdaX6LbWOsUhK/f3nChR1R5s43AQpq55zQhZ0/iiAYI8x4J1soGZZdS/rWgadZYCYlX3MZD7G/qe
	+Gc7oHrafG7BfbMNDWsB4LTboRwhIvpfvhh/UHmok1zwUynppNIHtRoaGCih3g+mwgsCWK2rkBFyC
	uhY8rNPbqcRao4+gKNFoxYGgEAHQgCeDOkk5cyU6FpNyRb/lOHCw5LpeSgev75gpfw17PV+C8pbUd
	XJart2sfZxRGLqxJEsthdwD4FK1vguWGsC8QMihZKKuz5rVisqJngLteh6QXNDMJBXvbO1xpmCFMK
	gxCWSCAgRAE0b3ZVOzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMiOE-00000009MEv-07hm;
	Sat, 22 Nov 2025 07:50:38 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMiOA-00000009MER-1TOD;
	Sat, 22 Nov 2025 07:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763797831; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=2EzqfeFOaSlEXbtIbD6DtqooVMJceZ4coYRaIINcRzU=;
	b=fjq9lGlt/MbZeX5grxkvKSMwIREZ9ha3vaam1Ku/4+PEa9n2qpd/CY729Rz6kQxUR+yeviBTHQIWYjEpPE8n9XgVnqi7fGsrZFFR6vDw2FDv/ZHqjH2nyTTvLX7ymd6pW3XUUDIo/BlGjxjYI3e+wkQtmC/dgDI6bRgrKPj5ufk=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wt3WcpV_1763797825 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 22 Nov 2025 15:50:26 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] RISC-V: KVM: Allow to downgrade HGATP mode via SATP mode
Date: Sat, 22 Nov 2025 15:50:23 +0800
Message-Id: <20251122075023.27589-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_235035_098110_4F466546 
X-CRM114-Status: UNSURE (   6.46  )
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

Currently, HGATP mode uses the maximum value detected by the hardware
but often such a wide GPA is unnecessary, just as a host sometimes
doesn't need sv57.
It's likely that no additional parameters (like no5lvl and no4lvl) are
needed, aligning HGATP mode to SATP mode should meet the requirements
of most scenarios.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/gstage.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index b67d60d722c2..bff80c80ead3 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -320,7 +320,6 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
 		kvm_riscv_gstage_mode = HGATP_MODE_SV57X4;
-		kvm_riscv_gstage_pgd_levels = 5;
 		goto done;
 	}
 
@@ -328,7 +327,6 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
 		kvm_riscv_gstage_mode = HGATP_MODE_SV48X4;
-		kvm_riscv_gstage_pgd_levels = 4;
 		goto done;
 	}
 
@@ -336,7 +334,6 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
 		kvm_riscv_gstage_mode = HGATP_MODE_SV39X4;
-		kvm_riscv_gstage_pgd_levels = 3;
 		goto done;
 	}
 #else /* CONFIG_32BIT */
@@ -354,6 +351,10 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	kvm_riscv_gstage_pgd_levels = 0;
 
 done:
+#ifdef CONFIG_64BIT
+	kvm_riscv_gstage_mode = min(satp_mode >> SATP_MODE_SHIFT, kvm_riscv_gstage_mode);
+	kvm_riscv_gstage_pgd_levels = kvm_riscv_gstage_mode - HGATP_MODE_SV39X4 + 3;
+#endif
 	csr_write(CSR_HGATP, 0);
 	kvm_riscv_local_hfence_gvma_all();
 }
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
