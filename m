Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A47D39422
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMagpSgmuBVaxSbaK9Qy6tZ7aDbzGr34eemf/rzyaMI=; b=pdrhMRI6ojuIl0
	gw9RJbJyEKH+EdZ5+Yo5Z5yYBs80zoohjYcIfooun0qGFKKdHdtQ3yI0/L/vH9BDTRz0Jwa02mzqL
	B3xG1ACbnbpBRDshbJnan6U3PVoJIHNQWgPdzKPKgegcmWkbIneD/gRsxd268Rj1zX0cxt/1W+JyQ
	MXnehWfINr8Urwc7LMPVX+NuxTqYNXOC6kXJeZipML0cLS63WITFcmY89hH6XEgPaE/9h7WBdd+e+
	t0sO3EjPRNHBwoomegswK4AEd6prwgEl2HdiqsQ6f1M1H0UfaJRYPHvxhZ+TlheOUg1suaAVv+6k4
	DZWiivmLPIvXKIvrjd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I1R-00000000AUU-3RGY;
	Thu, 02 Apr 2026 13:23:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I1Q-00000000ATk-1Iz6;
	Thu, 02 Apr 2026 13:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7ELOJE3JZXFjIllqNR+stpZ1VHthBWOJOaGpIGYae10=; b=OEg7XBN+4MUVSb1YviLmTiYSjB
	fxvG9YjMzQRJJnfFosu+qBUwJmptAmBRPyR4/2CFGlHG4rP5FYK8SVxmpBs/6cWFhS8BnHu881DTg
	UKv0H3/VISP9OOq9Wa+2LS/Hm9uoR8kxijeiE8z1JpXRcNx1CMZ7HKO6NbMoLqV8BWjn0RUFKXOih
	bhdcl/8hlFzJu2nWaQoP4ikT1H3tREHXH+HxA+D7imbqwf+KyrKRa1uJWYO/Q9rNJQPdxSi5LYgMR
	Sqj2fEe3QOP7WQgMYmMnK2x5NRRQti55w/btILt1iPJxMwqFWNZ/o1Admqu+CnR+rgKauqLGvaLJs
	NknnULyA==;
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8I1M-00000002X78-13Oq;
	Thu, 02 Apr 2026 13:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1775136207; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7ELOJE3JZXFjIllqNR+stpZ1VHthBWOJOaGpIGYae10=;
	b=rNTwyPKEO2dCY5Ks6gPWCREB+37aEP7xc58pV3n0wuUff4V0sZ3TuDK2qGwjT2gj/j7Ja86oxelKPYLUopBnOFDi04Us1+a/IZ+FGCzFncOxsGLGpAzJzL/JfzfutG9yypUsefGyuKsXZRHoJBqbiIVu7O26qqw49fk3/kBAKjc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0X0HNDEh_1775136205;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X0HNDEh_1775136205 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 02 Apr 2026 21:23:25 +0800
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
Subject: [PATCH v7 3/4] RISC-V: KVM: Detect and expose supported HGATP G-stage modes
Date: Thu,  2 Apr 2026 21:23:02 +0800
Message-Id: <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_142340_677816_E3F720EF 
X-CRM114-Status: UNSURE (   8.49  )
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

Extend kvm_riscv_gstage_mode_detect() to record HGATP.MODE values in a
bitmask. Keep tracking the maximum supported G-stage page table level
for existing internal users.

Also provide lightweight helpers to retrieve the supported-mode bitmask
and validate a requested HGATP.MODE against it.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/kvm_gstage.h | 11 +++++++++++
 arch/riscv/kvm/gstage.c             | 15 ++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

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
index 7c4c34bc191b..9204e6427d2d 100644
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
@@ -317,11 +319,17 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 
 void __init kvm_riscv_gstage_mode_detect(void)
 {
+	kvm_riscv_gstage_supported_mode_mask = 0;
+	kvm_riscv_gstage_max_pgd_levels = 0;
+
 #ifdef CONFIG_64BIT
 	/* Try Sv57x4 G-stage mode */
 	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
 		kvm_riscv_gstage_max_pgd_levels = 5;
+		kvm_riscv_gstage_supported_mode_mask |= BIT(HGATP_MODE_SV57X4) |
+							BIT(HGATP_MODE_SV48X4) |
+							BIT(HGATP_MODE_SV39X4);
 		goto done;
 	}
 
@@ -329,6 +337,8 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
 		kvm_riscv_gstage_max_pgd_levels = 4;
+		kvm_riscv_gstage_supported_mode_mask |= BIT(HGATP_MODE_SV48X4) |
+							BIT(HGATP_MODE_SV39X4);
 		goto done;
 	}
 
@@ -336,6 +346,7 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
 		kvm_riscv_gstage_max_pgd_levels = 3;
+		kvm_riscv_gstage_supported_mode_mask |= BIT(HGATP_MODE_SV39X4);
 		goto done;
 	}
 #else /* CONFIG_32BIT */
@@ -343,13 +354,11 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {
 		kvm_riscv_gstage_max_pgd_levels = 2;
+		kvm_riscv_gstage_supported_mode_mask |= BIT(HGATP_MODE_SV32X4);
 		goto done;
 	}
 #endif
 
-	/* KVM depends on !HGATP_MODE_OFF */
-	kvm_riscv_gstage_max_pgd_levels = 0;
-
 done:
 	csr_write(CSR_HGATP, 0);
 	kvm_riscv_local_hfence_gvma_all();
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
