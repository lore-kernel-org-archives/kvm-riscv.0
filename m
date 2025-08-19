Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8E1CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 00:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XyyJ0zEwDZsILxftAlabIvQw1tgLkkVArPUql6txgf0=; b=F4f8vBu5WJ/P4m
	x7770gqSgvzDNbnzinq4mDzArnAJPrU5p3yF5scWwqw8r8M6rbMRp/mXZO1esLVoy40jmisTYW35U
	gNPm1/r2RU3tBpiEIgFC0Fr10DftzRSWyBZajzVchDIT5HoMASjMeEVu4Sa/h8ECMVr2EnHOSXQgL
	3RPNKtZFpTVRJ7XvtGd9CJYJrhiIj0ej8XjUr2LFyZojg+t+YtmRgGsREi6Ho4a129Mvncv9cJwHR
	WRfr+RhpvbPGPTqZVvbwbCrNRNSxKhf3CB7KhC48odlpr2d5p1hGQiDLISBaIH/OyvA/zjMGy0SoI
	wFppXlblSAzPj3mC2ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAVB-000000091rk-0fuF;
	Tue, 19 Aug 2025 00:47:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoAV8-000000091rF-1eeM;
	Tue, 19 Aug 2025 00:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B10E5C64A0;
	Tue, 19 Aug 2025 00:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49635C4CEEB;
	Tue, 19 Aug 2025 00:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755564417;
	bh=DsWrRR/JVk9NGxDPruscs5vh74AouGxQra9oUbC6csk=;
	h=From:To:Cc:Subject:Date:From;
	b=jrngg2QVHRvbWwsNWWKdi2b4rtirPpuFcxNJHZtkGhRWaGMuCRMGttAin2yqP98FL
	 hIM8dVJa2Mn/sHI1p3ADOnVK+smt6TMQrJNUodhQXrnI2j1NnXRcB724Mi78/dWQWj
	 Z5vlJPpbXAgBDfn/xKx5PnKFqdJKPRLPxE8M3zIgaQmB1+1aoLqcvNDYHapDpoQKZS
	 IVdloivkEZkyZtClFh88C0QwCS3F4rG0klz/AB3CnIob55qqdYI9d970hqWfHdT6ot
	 kDCYGT+RRQY7WYPG8wQz1qfKdE6jEG9/gI4TZn6h3FOpnmP7JkYPQJpRHavzgXtyOT
	 3aOnScz/HTgLw==
From: guoren@kernel.org
To: guoren@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: KVM: Prevent HGATP_MODE_BARE passed
Date: Mon, 18 Aug 2025 20:46:43 -0400
Message-Id: <20250819004643.1884149-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_174658_518728_88D290C7 
X-CRM114-Status: GOOD (  10.37  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

urrent kvm_riscv_gstage_mode_detect() assumes H-extension must
have HGATP_MODE_SV39X4/SV32X4 at least, but the spec allows
H-extension with HGATP_MODE_BARE alone. The KVM depends on
!HGATP_MODE_BARE at least, so enhance the gstage-mode-detect
to block HGATP_MODE_BARE.

Move gstage-mode-check closer to gstage-mode-detect to prevent
unnecessary init.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kvm/gstage.c | 27 ++++++++++++++++++++++++---
 arch/riscv/kvm/main.c   | 35 +++++++++++++++++------------------
 2 files changed, 41 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 24c270d6d0e2..b67d60d722c2 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -321,7 +321,7 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
 		kvm_riscv_gstage_mode = HGATP_MODE_SV57X4;
 		kvm_riscv_gstage_pgd_levels = 5;
-		goto skip_sv48x4_test;
+		goto done;
 	}
 
 	/* Try Sv48x4 G-stage mode */
@@ -329,10 +329,31 @@ void __init kvm_riscv_gstage_mode_detect(void)
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
 		kvm_riscv_gstage_mode = HGATP_MODE_SV48X4;
 		kvm_riscv_gstage_pgd_levels = 4;
+		goto done;
 	}
-skip_sv48x4_test:
 
+	/* Try Sv39x4 G-stage mode */
+	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
+		kvm_riscv_gstage_mode = HGATP_MODE_SV39X4;
+		kvm_riscv_gstage_pgd_levels = 3;
+		goto done;
+	}
+#else /* CONFIG_32BIT */
+	/* Try Sv32x4 G-stage mode */
+	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {
+		kvm_riscv_gstage_mode = HGATP_MODE_SV32X4;
+		kvm_riscv_gstage_pgd_levels = 2;
+		goto done;
+	}
+#endif
+
+	/* KVM depends on !HGATP_MODE_OFF */
+	kvm_riscv_gstage_mode = HGATP_MODE_OFF;
+	kvm_riscv_gstage_pgd_levels = 0;
+
+done:
 	csr_write(CSR_HGATP, 0);
 	kvm_riscv_local_hfence_gvma_all();
-#endif
 }
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 67c876de74ef..8ee7aaa74ddc 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -93,6 +93,23 @@ static int __init riscv_kvm_init(void)
 		return rc;
 
 	kvm_riscv_gstage_mode_detect();
+	switch (kvm_riscv_gstage_mode) {
+	case HGATP_MODE_SV32X4:
+		str = "Sv32x4";
+		break;
+	case HGATP_MODE_SV39X4:
+		str = "Sv39x4";
+		break;
+	case HGATP_MODE_SV48X4:
+		str = "Sv48x4";
+		break;
+	case HGATP_MODE_SV57X4:
+		str = "Sv57x4";
+		break;
+	default:
+		return -ENODEV;
+	}
+	kvm_info("using %s G-stage page table format\n", str);
 
 	kvm_riscv_gstage_vmid_detect();
 
@@ -135,24 +152,6 @@ static int __init riscv_kvm_init(void)
 			 (rc) ? slist : "no features");
 	}
 
-	switch (kvm_riscv_gstage_mode) {
-	case HGATP_MODE_SV32X4:
-		str = "Sv32x4";
-		break;
-	case HGATP_MODE_SV39X4:
-		str = "Sv39x4";
-		break;
-	case HGATP_MODE_SV48X4:
-		str = "Sv48x4";
-		break;
-	case HGATP_MODE_SV57X4:
-		str = "Sv57x4";
-		break;
-	default:
-		return -ENODEV;
-	}
-	kvm_info("using %s G-stage page table format\n", str);
-
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
 	if (kvm_riscv_aia_available())
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
