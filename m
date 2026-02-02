Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495F7E7DEEF
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqj53d3GFghdySpAMShWmlgDHqatd2e5F2J6FLmFDMc=; b=LnHfqqsuFymB8Z
	T/sSulgXmuLlKTd+eF0YjFTStoF5mWLc3FzsZd5fxGgRfgrDFQoJQ4azRx/Fa7zLZ4RsHBbVrZnJK
	0TcwxEQFkMwhfDCRcUGslxsXZXyIasp17zjvf3YX+4uw6Rh9xRtut57P26p2vl9QhxR4a//CQcth1
	mn0FjIFkTbFOsMrDsVuhSTXN2wetZv/O5lKxeO/cd31U0ZMdYKFBaaKekinXuSj2400Bp2rI/suZa
	qLHBL848JUp8kIZED/ezdKi+Am0XUG3Iz9imb7EmwtzYdLjjiLHA3qdk3vjMLHXUgq0eLBOKt09PP
	M5XJhDOvmwQnLsbrvIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmurU-000000055pb-2s5m;
	Mon, 02 Feb 2026 14:25:08 +0000
Received: from out199-4.us.a.mail.aliyun.com ([47.90.199.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmurR-000000055oh-21wU;
	Mon, 02 Feb 2026 14:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770041256; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=PAERw8ES7Sz4+PGBE81cd9YgH/6t6yHMKmA8nztW3dg=;
	b=uUpwPozCR1jOQd+gGwJSeOw7f4dqKNOvZZMh8z4lZ9a5+mjz1K6Psq93YeTQUxaYwf2/3KpBkARj+OdNcZsPfeFflLsSNzWV9/xGXGh/SfNN27t3vCEa+vE0VHf5LQggjXpxHQyE9qnyldqJjQb+tvCQ+nR2J39rHydRFGFTFIc=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WyO62Vn_1770041252 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 02 Feb 2026 22:07:34 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	rkrcmar@ventanamicro.com,
	radim.krcmar@oss.qualcomm.com,
	andrew.jones@oss.qualcomm.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP G-stage modes
Date: Mon,  2 Feb 2026 22:07:14 +0800
Message-Id: <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_062505_852705_976BCA88 
X-CRM114-Status: GOOD (  10.35  )
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

Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
supported by the host and record them in a bitmask. Keep tracking the
maximum supported G-stage page table level for existing internal users.

Also provide lightweight helpers to retrieve the supported-mode bitmask
and validate a requested HGATP.MODE against it.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/include/asm/kvm_gstage.h | 37 +++++++++++++++++++++++++++
 arch/riscv/kvm/gstage.c             | 39 ++++++++++++++++-------------
 2 files changed, 58 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index b12605fbca44..c0c5a8b99056 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -30,6 +30,7 @@ struct kvm_gstage_mapping {
 #endif
 
 extern unsigned long kvm_riscv_gstage_max_pgd_levels;
+extern u32 kvm_riscv_gstage_mode_mask;
 
 #define kvm_riscv_gstage_pgd_xbits	2
 #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
@@ -75,4 +76,40 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 
 void kvm_riscv_gstage_mode_detect(void);
 
+enum kvm_riscv_hgatp_mode_bit {
+	HGATP_MODE_SV39X4_BIT = 0,
+	HGATP_MODE_SV48X4_BIT = 1,
+	HGATP_MODE_SV57X4_BIT = 2,
+};
+
+static inline u32 kvm_riscv_get_hgatp_mode_mask(void)
+{
+	return kvm_riscv_gstage_mode_mask;
+}
+
+static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
+{
+#ifdef CONFIG_64BIT
+	u32 bit;
+
+	switch (mode) {
+	case HGATP_MODE_SV39X4:
+		bit = HGATP_MODE_SV39X4_BIT;
+		break;
+	case HGATP_MODE_SV48X4:
+		bit = HGATP_MODE_SV48X4_BIT;
+		break;
+	case HGATP_MODE_SV57X4:
+		bit = HGATP_MODE_SV57X4_BIT;
+		break;
+	default:
+		return false;
+	}
+
+	return kvm_riscv_gstage_mode_mask & BIT(bit);
+#else
+	return false;
+#endif
+}
+
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 2d0045f502d1..edbabdac57d8 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -16,6 +16,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
 #else
 unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
 #endif
+/* Bitmask of supported HGATP.MODE (see HGATP_MODE_*_BIT). */
+u32 kvm_riscv_gstage_mode_mask __ro_after_init;
 
 #define gstage_pte_leaf(__ptep)	\
 	(pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
@@ -315,42 +317,43 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 	}
 }
 
+static bool __init kvm_riscv_hgatp_mode_supported(unsigned long mode)
+{
+	csr_write(CSR_HGATP, mode << HGATP_MODE_SHIFT);
+	return ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == mode);
+}
+
 void __init kvm_riscv_gstage_mode_detect(void)
 {
+	kvm_riscv_gstage_mode_mask = 0;
+	kvm_riscv_gstage_max_pgd_levels = 0;
+
 #ifdef CONFIG_64BIT
-	/* Try Sv57x4 G-stage mode */
-	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
-		kvm_riscv_gstage_max_pgd_levels = 5;
-		goto done;
+	/* Try Sv39x4 G-stage mode */
+	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV39X4)) {
+		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV39X4_BIT);
+		kvm_riscv_gstage_max_pgd_levels = 3;
 	}
 
 	/* Try Sv48x4 G-stage mode */
-	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
+	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV48X4)) {
+		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV48X4_BIT);
 		kvm_riscv_gstage_max_pgd_levels = 4;
-		goto done;
 	}
 
-	/* Try Sv39x4 G-stage mode */
-	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
-		kvm_riscv_gstage_max_pgd_levels = 3;
-		goto done;
+	/* Try Sv57x4 G-stage mode */
+	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV57X4)) {
+		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV57X4_BIT);
+		kvm_riscv_gstage_max_pgd_levels = 5;
 	}
 #else /* CONFIG_32BIT */
 	/* Try Sv32x4 G-stage mode */
 	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {
 		kvm_riscv_gstage_max_pgd_levels = 2;
-		goto done;
 	}
 #endif
 
-	/* KVM depends on !HGATP_MODE_OFF */
-	kvm_riscv_gstage_max_pgd_levels = 0;
-
-done:
 	csr_write(CSR_HGATP, 0);
 	kvm_riscv_local_hfence_gvma_all();
 }
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
