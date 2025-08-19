Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DF6CA0EF5
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 02:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1Xx7BWpgTrSy1PZ7wqTuNiT14617jy389wMVBnKKBw=; b=GdeyRAXaqArxVA
	/YA228sYWjLwP0jRsAE/Zmkz474VWpWJS0rCnpKFnnotNlBHz+Vtz8+9w1MPjOeOfBbjV8SIrjqM+
	VBp70DhXlf859Zr6/Ppz9JC+pINxyr+Z8/3GyoCXKCufanolRkPGWnpYO9YP7Srxut/vOzTlJ6Zt5
	AN4XA1eza6ylVjq081r062k02/2Ow1mMWTcVdw3IBiFpHyGVr+jReIfudkP3kdeIRUNSqEKCY3950
	d6CKXJHsiRx5QpRIxyAFRiujVRCobR1m5q7fVtwJ+tOfCh5Puki2VpXHr2vUZGj85aU3KM993EQQE
	ZdXaqL1t1kOpAfXk7/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBqW-00000009B8X-3Ece;
	Tue, 19 Aug 2025 02:13:08 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBfS-000000099rf-1a6K;
	Tue, 19 Aug 2025 02:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1755568898; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5IULTEMO8UY5UYSTMLLyWq2kUCXNHZOA+68prgWQp1U=;
	b=s4+hsDq/Nix4e9ik7FIFVpMiiCml371lV/b+10b5OgVzPRqYJeJEwQNwsFYHok1uvcJ6FF1JZeCjo5UBTnYatL+3MO0N+JB0RZJYi949y27MuC9/qvx0DJw9H2477NJw/MFOdljDo97otBDzFeC91icU699UZ4SJfiotPyWLuiE=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wm4x1Pe_1755568895 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 19 Aug 2025 10:01:37 +0800
From: fangyu.yu@linux.alibaba.com
To: guoren@kernel.org
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com
Subject: [PATCH] RISC-V: KVM: Prevent HGATP_MODE_BARE passed
Date: Tue, 19 Aug 2025 10:01:33 +0800
Message-Id: <20250819020133.93545-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250819004643.1884149-1-guoren@kernel.org>
References: <20250819004643.1884149-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_190142_813090_09D23F19 
X-CRM114-Status: UNSURE (   7.14  )
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

>From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>
>urrent kvm_riscv_gstage_mode_detect() assumes H-extension must
>have HGATP_MODE_SV39X4/SV32X4 at least, but the spec allows
>H-extension with HGATP_MODE_BARE alone. The KVM depends on
>!HGATP_MODE_BARE at least, so enhance the gstage-mode-detect
>to block HGATP_MODE_BARE.
>
>Move gstage-mode-check closer to gstage-mode-detect to prevent
>unnecessary init.

This patch helps to detect hardware function missing in advance,
prevent software from entering incorrect logic.

Reviewed-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

>Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
>---
> arch/riscv/kvm/gstage.c | 27 ++++++++++++++++++++++++---
> arch/riscv/kvm/main.c   | 35 +++++++++++++++++------------------
> 2 files changed, 41 insertions(+), 21 deletions(-)
>
>diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
>index 24c270d6d0e2..b67d60d722c2 100644
>--- a/arch/riscv/kvm/gstage.c
>+++ b/arch/riscv/kvm/gstage.c
>@@ -321,7 +321,7 @@ void __init kvm_riscv_gstage_mode_detect(void)
> 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
> 		kvm_riscv_gstage_mode = HGATP_MODE_SV57X4;
> 		kvm_riscv_gstage_pgd_levels = 5;
>-		goto skip_sv48x4_test;
>+		goto done;
> 	}
>
> 	/* Try Sv48x4 G-stage mode */
>@@ -329,10 +329,31 @@ void __init kvm_riscv_gstage_mode_detect(void)
> 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
> 		kvm_riscv_gstage_mode = HGATP_MODE_SV48X4;
> 		kvm_riscv_gstage_pgd_levels = 4;
>+		goto done;
> 	}
>-skip_sv48x4_test:
>
>+	/* Try Sv39x4 G-stage mode */
>+	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
>+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
>+		kvm_riscv_gstage_mode = HGATP_MODE_SV39X4;
>+		kvm_riscv_gstage_pgd_levels = 3;
>+		goto done;
>+	}
>+#else /* CONFIG_32BIT */
>+	/* Try Sv32x4 G-stage mode */
>+	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
>+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {
>+		kvm_riscv_gstage_mode = HGATP_MODE_SV32X4;
>+		kvm_riscv_gstage_pgd_levels = 2;
>+		goto done;
>+	}
>+#endif
>+
>+	/* KVM depends on !HGATP_MODE_OFF */
>+	kvm_riscv_gstage_mode = HGATP_MODE_OFF;
>+	kvm_riscv_gstage_pgd_levels = 0;
>+
>+done:
> 	csr_write(CSR_HGATP, 0);
> 	kvm_riscv_local_hfence_gvma_all();
>-#endif
> }
>diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
>index 67c876de74ef..8ee7aaa74ddc 100644
>--- a/arch/riscv/kvm/main.c
>+++ b/arch/riscv/kvm/main.c
>@@ -93,6 +93,23 @@ static int __init riscv_kvm_init(void)
> 		return rc;
>
> 	kvm_riscv_gstage_mode_detect();
>+	switch (kvm_riscv_gstage_mode) {
>+	case HGATP_MODE_SV32X4:
>+		str = "Sv32x4";
>+		break;
>+	case HGATP_MODE_SV39X4:
>+		str = "Sv39x4";
>+		break;
>+	case HGATP_MODE_SV48X4:
>+		str = "Sv48x4";
>+		break;
>+	case HGATP_MODE_SV57X4:
>+		str = "Sv57x4";
>+		break;
>+	default:
>+		return -ENODEV;
>+	}
>+	kvm_info("using %s G-stage page table format\n", str);
>
> 	kvm_riscv_gstage_vmid_detect();
>
>@@ -135,24 +152,6 @@ static int __init riscv_kvm_init(void)
> 			 (rc) ? slist : "no features");
> 	}
>
>-	switch (kvm_riscv_gstage_mode) {
>-	case HGATP_MODE_SV32X4:
>-		str = "Sv32x4";
>-		break;
>-	case HGATP_MODE_SV39X4:
>-		str = "Sv39x4";
>-		break;
>-	case HGATP_MODE_SV48X4:
>-		str = "Sv48x4";
>-		break;
>-	case HGATP_MODE_SV57X4:
>-		str = "Sv57x4";
>-		break;
>-	default:
>-		return -ENODEV;
>-	}
>-	kvm_info("using %s G-stage page table format\n", str);
>-
> 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
>
> 	if (kvm_riscv_aia_available())
>--
>2.40.1

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
