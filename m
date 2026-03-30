Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1708510D14AD
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 12:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdEgEUIb3i+frEPVbk1jz4Hqfqvk22mxlbxqig1dUe0=; b=B2OlIEgcLLaJqF
	1UESD9JJepvxNpSNRM2R4hoFcsGIvo242JGK8O7KOj6e6BBfbTF3Jyh73ImTGH5uayzSEVD5jB05B
	kYkIqotySSCylq+Sh0fplaa4XI0UaUFALjC6HeKibkA/FsjxfaxDH5t5pwL3K/B7ZxCz4OPFehAyN
	69t+s068sf4Rrza3xh1tv8rXCv85b3o9O0xMaaCL8LDzPgNiP0mtqgNxStNijkigkXKSbLxIhiKAy
	WLbT3XYZLxXcrdsz6aeyEj012qljubYPMnecqWbn/VS7P3Jbe5R+xLu6HwiEA3/9VO4Yji6vfmDtV
	CyFZzavqcNYS0gSvdyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Bhe-0000000BFno-36wU;
	Mon, 30 Mar 2026 12:26:46 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BhZ-0000000BFjk-2qtz;
	Mon, 30 Mar 2026 12:26:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774873594; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=PT+yx01BbG86omMromavfHwf6ELYE5YcV+gpW/gZMbk=;
	b=bi2nMf/1BxcM313nB4MzRBmi2Sfl9uCZX8SyppCIWHvT+qS0R7P2BLKi6OcnH3WIda3ZFX3LeyqxVtk8Y5aP5A6MLbQt2VDy6+4ch79h9oiSFXGWqNIdSY9qDz/860/Ac67FChyurIGmGFVqLQV37lOJ6swx2UHysZ0XhE0m9ok=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X.zfcJ9_1774873591;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X.zfcJ9_1774873591 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Mar 2026 20:26:32 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	skhan@linuxfoundation.org
Cc: guoren@kernel.org,
	radim.krcmar@oss.qualcomm.com,
	andrew.jones@oss.qualcomm.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v6 3/4] RISC-V: KVM: Detect and expose supported HGATP G-stage modes
Date: Mon, 30 Mar 2026 20:26:00 +0800
Message-Id: <20260330122601.22140-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260330122601.22140-1-fangyu.yu@linux.alibaba.com>
References: <20260330122601.22140-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_052641_909954_30460013 
X-CRM114-Status: GOOD (  10.38  )
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
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/include/asm/kvm_gstage.h | 11 ++++++++
 arch/riscv/kvm/gstage.c             | 43 +++++++++++++++--------------
 2 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
index 70d9d483365e..bbf8f45c6563 100644
--- a/arch/riscv/include/asm/kvm_gstage.h
+++ b/arch/riscv/include/asm/kvm_gstage.h
@@ -31,6 +31,7 @@ struct kvm_gstage_mapping {
 #endif
 
 extern unsigned long kvm_riscv_gstage_max_pgd_levels;
+extern u32 kvm_riscv_gstage_supported_mode_mask;
 
 #define kvm_riscv_gstage_pgd_xbits	2
 #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
@@ -102,4 +103,14 @@ static inline void kvm_riscv_gstage_init(struct kvm_gstage *gstage, struct kvm *
 	gstage->pgd_levels = kvm->arch.pgd_levels;
 }
 
+static inline u32 kvm_riscv_get_hgatp_mode_mask(void)
+{
+	return kvm_riscv_gstage_supported_mode_mask;
+}
+
+static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
+{
+	return kvm_riscv_gstage_supported_mode_mask & BIT(mode);
+}
+
 #endif
diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 7c4c34bc191b..459041255c14 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -16,6 +16,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
 #else
 unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
 #endif
+/* Bitmask of supported HGATP.MODE encodings (BIT(HGATP_MODE_*)). */
+u32 kvm_riscv_gstage_supported_mode_mask __ro_after_init;
 
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
+	kvm_riscv_gstage_supported_mode_mask = 0;
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
+		kvm_riscv_gstage_supported_mode_mask |= BIT(HGATP_MODE_SV39X4);
+		kvm_riscv_gstage_max_pgd_levels = 3;
 	}
 
 	/* Try Sv48x4 G-stage mode */
-	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
+	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV48X4)) {
+		kvm_riscv_gstage_supported_mode_mask |= BIT(HGATP_MODE_SV48X4);
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
+		kvm_riscv_gstage_supported_mode_mask |= BIT(HGATP_MODE_SV57X4);
+		kvm_riscv_gstage_max_pgd_levels = 5;
 	}
 #else /* CONFIG_32BIT */
 	/* Try Sv32x4 G-stage mode */
-	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
-	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {
+	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV32X4)) {
+		kvm_riscv_gstage_supported_mode_mask |= BIT(HGATP_MODE_SV32X4);
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
