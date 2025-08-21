Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DD1CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 03:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vL5Dq+9xgItvY/7x373BLKrcQOcGJ6OchzmG4I6STzo=; b=gA4NMNIz754Njc
	707ntVv0LVm0oLfNxKOpzXBHDOIDW4qY3V619eaJUPMdoMlQMQTgbXjXP9jiA0HYyc3UeZnYs8LhT
	jVfDboq+tk051YtYtp+9ASiv43mr+p3HAmpSZrhfxlvUPopxrSR2bKdqBnwdaQhlHYSuxRupC9fd4
	au3Vz8GPBu6ZLNLYwtlvo84vD4Ryy5o190AyfoWXxVTik/tQQFvY3NApEnzLWNSopmakqAxDiofCi
	VMpCZGBEw9iEUnTUuoJuMIVz7Y0Q+187ZhLAi/dTnz1+GzQjRWRmJDrMzyIh7I9SEO4ndzC38LWUZ
	EGDA4v4bnaJ38d9wGejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow96-0000000Fg6W-2JoS;
	Thu, 21 Aug 2025 03:39:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovoI-0000000FbxB-2PlY;
	Thu, 21 Aug 2025 03:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FB9141A53;
	Thu, 21 Aug 2025 03:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05C2C113CF;
	Thu, 21 Aug 2025 03:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755746274;
	bh=DMRWjGxN262TTh3G5XEfX36BOwhJZxZpsyMaejs1xjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jjIATB4zD7fodr7HIVXX5acF/oLmA+F+rCzD6d36kDPuMtRAx3DH/T3oGRXgda4ON
	 4ADF4lBAPeSYUsiu7/1iv10poNdPIM2sc9SDTdpRV/lBsbTycsWJ9RBqZWks8e3mHk
	 39gcyPtpbiEd3fyMKBz46Fd4xy/osqSbGn3D8DiPF8myJ0ve3UkJ4fb75aXEkSgHAd
	 IcsH0hU/RxeAsdIa4ZLNw6CsoKy/EdOxykwvGSJq9hLzjtztpQFn2mjS/cC9TVBVVO
	 scyjqOL4BrYmZRGZtmfB8H/4HhPm2pkUCwEJuq/B+H/axgGd/ImyrYtMiPzE4bDfzX
	 jYxrOalEVsyIQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	troy.mitchell@linux.dev
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@linux.alibaba.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH V4 3/3] RISC-V: KVM: Prevent HGATP_MODE_BARE passed
Date: Wed, 20 Aug 2025 23:17:18 -0400
Message-Id: <20250821031719.2366017-4-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250821031719.2366017-1-guoren@kernel.org>
References: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
 <20250821031719.2366017-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_201754_652012_3E964C35 
X-CRM114-Status: GOOD (  11.36  )
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

Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
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
