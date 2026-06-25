Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DF6CDB479
	for <kvm-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 01:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6N/OyXcxmInabhzfX8Dok/O9Ihvfws8mAulecxi22NE=; b=NitpXQrournFgu
	llwlUS+MmlhAUGRuSxD8PnZyGAWLr0c36TwJawlY6uWC07tGZvhb70o/m14+iTgzb6zG8nF8rkUc9
	LI87SefgZQFP0Ps7RkbBOTYH9yiQhx1pVMeje9d4hQyByNbemwSk8jsPDKUwkrnjnKV8U4vElVNE+
	mCj+vxMM5CZGSVKAOmHQhr8bxQSQH7GjJb2fa5X1VcHQ+7+8z5cZJ2+ASRs6coyygTGS6K7vaoBKZ
	9k4+dNUdR2ng8eJI6pxXY7ZFlWOkHg18WJR9hFM6lqHihTf2+xZ6aQ116VHkuCIB8lmvCKjMsrUQ2
	CCKRS+OR4XDyA7lTW2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYzY-00000008W1h-1a3x;
	Thu, 25 Jun 2026 01:34:56 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcYzV-00000008W0X-1mym
	for kvm-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 01:34:54 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-139b914bab6so1932275c88.1
        for <kvm-riscv@lists.infradead.org>; Wed, 24 Jun 2026 18:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782351292; x=1782956092; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLog5PA+sMo6OBYX3OJt/yig+2PJIee2dTcdKGd6cRs=;
        b=ejE7ojfkipBH42p2N+8g7qlYrQpAMsjpYlndB5WTB7wC+q9f/NY//iky+hPMgojrDw
         wntS0Kn66UrI88Ra7igUaEDJbmhRtnNc6ICq552zXeF/UsBxhB+ksb6+B5q0HL3EKsXj
         bjmoBoZW6JtsnENaXWYp7fkvE7ljo1xTDn8omYlw7AdrSSwZASeRnJdr9kaXCV/GbWGL
         P01qB+rVv8arQ2zSZlFDMj2PUeg17b2u3BsSHEgG4U5GIPN/gRckc6eQsuqkKTW4ynGU
         2yAuFFBTp8Zi6lDNCaHezHfuLHV2Vm6n2jsroQbzWviacxNYbnQI/uxEtejLRGOTj99J
         Byug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782351292; x=1782956092;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLog5PA+sMo6OBYX3OJt/yig+2PJIee2dTcdKGd6cRs=;
        b=HGn4Jo2qhh1NHBGNgvFh1OAOxrPMfP0cSZtl9XVV91c0sB8Q0UGjAVu3gbsU7eGDBX
         ChYRQw7vFHfjLNSZIB//xOon/afUAA89j6qHzd5QgEyoyalSQMeToxvWucCZByUZA9m+
         7Hg5PSDX2U1fHUwGtH861UNoZh4n1iyKXxyNhz3+C4WUXMC6qLk8KWUGF/mvsFFmNdg2
         Qisq1PurnDCJc1oTMG+yN0W5RhVzdBPbY3I7JJFCPuuvVOIZ5YrtPo/NSNg7OrSVVnYa
         4UpOixAPAE2lNSfpgaQnhvy9VzkDlUlkIdz4rHAGHOV4idpe1pqG8Xlc0Bb6z8Qe+3zM
         qsew==
X-Forwarded-Encrypted: i=1; AFNElJ9K8ElENWxmqh/4diV1tmMhfJakNIQOXjRrcdOhPCEHbwW70+A91YBooKkb8gwUsWby87uGHAvqxkc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPU6XDZ99LNg1j5lNllHtDBJb+zEgGxNJOFZKdFltj1+Xp1PZ/
	HOVItoO5nMciMtX9+S8OKUnY4IgmzfnKdJRiwKrMJmlBPHHljsf5664hdaurBjnNQ9yDGdBUjY9
	mwNQY
X-Gm-Gg: AfdE7cmFry/aH2C2iLZQN8h/quRGoUZHyrvVx30bhpNeulGMHrCk3MgN9QD38JnBL+3
	jj24vJPcAHMupJIEuSEE37TvKgKsdFnB05ThJZhgAxso70JmpalSGQ1apttUgcOoP+Q4atD2FDD
	nAhmASGFwIGpyOPFR2rTup1+MpnSpzmwsNmuBM81mYapvDKeUR40/uYHmwQceQUlEdIA7FmlcLL
	iQR/jdtfi8xp0c61kdzHInfQWNyrnkFWmeTd5O3eDrmBO2spHorRWbbaT2MwUjixhI1l7l7mFQ5
	j5K7MmSM4Oose7fxoZRSNsh9L95DVI/Z77t104wVZl1puVxTriBFCuKM5RTA1IXQqRQylHvQC7j
	wM9ddBlPqUEzDRnxqUjr8BI683dqlHDq7NLgegNmOVmzSBaYRYv9OYxSQzlFIxvFQGtoujYrxoS
	NG/cGYq4Ojgu6kjDMw4E1UOWbBEPW6j/TJ
X-Received: by 2002:a05:7022:672c:b0:12d:ce60:cb52 with SMTP id a92af1059eb24-139dbb906e5mr483561c88.18.1782351291898;
        Wed, 24 Jun 2026 18:34:51 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm3972338c88.11.2026.06.24.18.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 18:34:51 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 24 Jun 2026 18:34:29 -0700
Subject: [PATCH] KVM: RISC-V: Add CPU PM notifier for non-retention idle
 states
MIME-Version: 1.0
Message-Id: <20260624-kvm-cpu-pm-v1-1-52088e127a55@sifive.com>
X-B4-Tracking: v=1; b=H4sIAKSFPGoC/yXMQQ5AMBBA0avIrE2iTUm4ilhUDYagaVUk4u6K5
 Vv8f4Enx+ShSi5wdLDnbY0QaQJm1OtAyF00yEwWWSEVzseCxga0C5ZKKKHJdHmvIQbWUc/nN6u
 b3z60E5n9PcB9P6frQztuAAAA
X-Change-ID: 20260624-kvm-cpu-pm-94141aecd5fa
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782351290; l=12573;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=kyEJxuiDg8qBlUvUKR8HL5jG+gJK93PvfNhSDfXgzDA=;
 b=DRn2pZI+y9Z/SZ6uxvllUMuVIkvMYSFhKQaZfC6qEESY+tjOxKoR8XOdSzz+I5ebOLhgRWmsi
 z7m1V6y0PFXCwu7jfndspMeP0G59sfZhb5G6dqfWXVm6SYR3VAKi8EU
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_183453_503603_275E49AF 
X-CRM114-Status: GOOD (  23.34  )
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

Register a CPU_PM notifier to restore hypervisor CSR content during CPU
non-retention idle states. When a CPU enters a deep idle state that
powers off the CPU domain, hypervisor CSRs lose their state and must be
saved before entry and restored after exit.

To avoid conflicts with KVM's existing syscore suspend/resume handlers,
the notifier checks system_state and skips processing during system-wide
suspend/resume operations, where the syscore mechanism in
virt/kvm/kvm_main.c already handles the state transitions.

This completes KVM's power management coverage for RISC-V:
- CPU hotplug: handled by kvm_online_cpu/kvm_offline_cpu (cpuhp callbacks)
- System suspend: handled by kvm_suspend/kvm_resume (syscore ops)
- CPU idle (retention): no action needed, CSRs are retained
- CPU idle (non-retention): handled by this CPU_PM notifier

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_aia.h |  15 +++-
 arch/riscv/kvm/aia.c             | 155 ++++++++++++++++++++++-----------------
 arch/riscv/kvm/main.c            |  97 ++++++++++++++++++------
 3 files changed, 176 insertions(+), 91 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index c67ec5ac0a14..7c1c3250598f 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -165,8 +165,19 @@ int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 			     void __iomem **hgei_va, phys_addr_t *hgei_pa);
 void kvm_riscv_aia_free_hgei(int cpu, int hgei);
 
-void kvm_riscv_aia_enable(void);
-void kvm_riscv_aia_disable(void);
+/**
+ * kvm_riscv_aia_enable() - Enable AIA support on current CPU
+ * @full_cleanup: true = full hardware init (CPU hotplug/module load),
+ *                false = lightweight CSR restore (CPU non-retention idle resume)
+ */
+void kvm_riscv_aia_enable(bool full_cleanup);
+
+/**
+ * kvm_riscv_aia_disable() - Disable AIA support on current CPU
+ * @full_cleanup: true = full hardware cleanup (CPU hotplug/module exit),
+ *                false = lightweight CSR save (CPU non-retention idle entry)
+ */
+void kvm_riscv_aia_disable(bool full_cleanup);
 int kvm_riscv_aia_init(void);
 void kvm_riscv_aia_exit(void);
 
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index bafb009c5ce5..82812493ac68 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -532,50 +532,61 @@ static void aia_hgei_exit(void)
 	free_percpu_irq(hgei_parent_irq, &aia_hgei);
 }
 
-void kvm_riscv_aia_enable(void)
+void kvm_riscv_aia_enable(bool full_cleanup)
 {
-	const struct imsic_global_config *gc;
-	const struct imsic_local_config *lc;
 	struct aia_hgei_control *hgctrl;
 	unsigned long flags;
-	int aia_nr_hgei;
 
 	if (!kvm_riscv_aia_available())
 		return;
 
-	gc = imsic_get_global_config();
-	lc = (gc) ? this_cpu_ptr(gc->local) : NULL;
 	hgctrl = this_cpu_ptr(&aia_hgei);
 
-	/* Figure-out number of bits in HGEIE */
-	csr_write(CSR_HGEIE, -1UL);
-	hgctrl->nr_hgei = fls_long(csr_read(CSR_HGEIE));
-	csr_write(CSR_HGEIE, 0);
-	if (hgctrl->nr_hgei)
-		hgctrl->nr_hgei--;
+	if (full_cleanup) {
+		const struct imsic_global_config *gc;
+		const struct imsic_local_config *lc;
+		int aia_nr_hgei;
 
-	/*
-	 * Number of usable per-HART HGEI lines should be minimum of
-	 * per-HART IMSIC guest files and number of bits in HGEIE.
-	 */
-	if (lc)
-		hgctrl->nr_hgei = min((ulong)hgctrl->nr_hgei, lc->nr_guest_files);
-	else
-		hgctrl->nr_hgei = 0;
+		gc = imsic_get_global_config();
+		lc = (gc) ? this_cpu_ptr(gc->local) : NULL;
 
-	/* Update the number of IMSIC guest files across all HARTs */
-	aia_nr_hgei = atomic_read(&kvm_riscv_aia_nr_hgei);
-	do {
-		if (aia_nr_hgei <= hgctrl->nr_hgei)
-			break;
-	} while (!atomic_try_cmpxchg(&kvm_riscv_aia_nr_hgei, &aia_nr_hgei, hgctrl->nr_hgei));
+		/* Figure-out number of bits in HGEIE */
+		csr_write(CSR_HGEIE, -1UL);
+		hgctrl->nr_hgei = fls_long(csr_read(CSR_HGEIE));
+		csr_write(CSR_HGEIE, 0);
+		if (hgctrl->nr_hgei)
+			hgctrl->nr_hgei--;
 
-	raw_spin_lock_irqsave(&hgctrl->lock, flags);
-	if (!hgctrl->free_bitmap_initialized) {
-		hgctrl->free_bitmap = (hgctrl->nr_hgei) ? GENMASK_ULL(hgctrl->nr_hgei, 1) : 0;
-		hgctrl->free_bitmap_initialized = true;
+		/*
+		 * Number of usable per-HART HGEI lines should be minimum of
+		 * per-HART IMSIC guest files and number of bits in HGEIE.
+		 */
+		if (lc)
+			hgctrl->nr_hgei = min((ulong)hgctrl->nr_hgei, lc->nr_guest_files);
+		else
+			hgctrl->nr_hgei = 0;
+
+		/* Update the number of IMSIC guest files across all HARTs */
+		aia_nr_hgei = atomic_read(&kvm_riscv_aia_nr_hgei);
+		do {
+			if (aia_nr_hgei <= hgctrl->nr_hgei)
+				break;
+		} while (!atomic_try_cmpxchg(&kvm_riscv_aia_nr_hgei, &aia_nr_hgei,
+					     hgctrl->nr_hgei));
+
+		raw_spin_lock_irqsave(&hgctrl->lock, flags);
+		if (!hgctrl->free_bitmap_initialized) {
+			hgctrl->free_bitmap = (hgctrl->nr_hgei) ?
+					      GENMASK_ULL(hgctrl->nr_hgei, 1) :
+					      0;
+			hgctrl->free_bitmap_initialized = true;
+		}
+		raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+	} else {
+		raw_spin_lock_irqsave(&hgctrl->lock, flags);
+		csr_write(CSR_HGEIE, ~hgctrl->free_bitmap);
+		raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 	}
-	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 
 	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 	csr_write(CSR_HVIPRIO1, 0x0);
@@ -587,65 +598,73 @@ void kvm_riscv_aia_enable(void)
 	csr_write(CSR_HVIPRIO2H, 0x0);
 #endif
 
-	/* Enable per-CPU SGEI interrupt */
-	enable_percpu_irq(hgei_parent_irq,
-			  irq_get_trigger_type(hgei_parent_irq));
-	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
+	if (full_cleanup) {
+		/* Enable per-CPU SGEI interrupt */
+		enable_percpu_irq(hgei_parent_irq,
+				  irq_get_trigger_type(hgei_parent_irq));
+		csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
+	}
+
 	/* Enable IRQ filtering for overflow interrupt only if sscofpmf is present */
 	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
 		csr_set(CSR_HVIEN, BIT(IRQ_PMU_OVF));
 }
 
-void kvm_riscv_aia_disable(void)
+void kvm_riscv_aia_disable(bool full_cleanup)
 {
 	int i;
 	unsigned long flags;
-	struct kvm_vcpu *vcpu;
-	struct aia_hgei_control *hgctrl;
 
 	if (!kvm_riscv_aia_available())
 		return;
-	hgctrl = get_cpu_ptr(&aia_hgei);
 
 	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
 		csr_clear(CSR_HVIEN, BIT(IRQ_PMU_OVF));
-	/* Disable per-CPU SGEI interrupt */
-	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
-	disable_percpu_irq(hgei_parent_irq);
-
-	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 
-	raw_spin_lock_irqsave(&hgctrl->lock, flags);
+	if (full_cleanup) {
+		/* Disable per-CPU SGEI interrupt */
+		csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
+		disable_percpu_irq(hgei_parent_irq);
+	}
 
-	for (i = 0; i <= hgctrl->nr_hgei; i++) {
-		vcpu = hgctrl->owners[i];
-		if (!vcpu)
-			continue;
+	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 
-		/*
-		 * We release hgctrl->lock before notifying IMSIC
-		 * so that we don't have lock ordering issues.
-		 */
-		raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+	if (full_cleanup) {
+		struct kvm_vcpu *vcpu;
+		struct aia_hgei_control *hgctrl;
 
-		/* Notify IMSIC */
-		kvm_riscv_vcpu_aia_imsic_release(vcpu);
+		hgctrl = get_cpu_ptr(&aia_hgei);
+		raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-		/*
-		 * Wakeup VCPU if it was blocked so that it can
-		 * run on other HARTs
-		 */
-		if (csr_read(CSR_HGEIE) & BIT(i)) {
-			csr_clear(CSR_HGEIE, BIT(i));
-			kvm_vcpu_kick(vcpu);
+		for (i = 0; i <= hgctrl->nr_hgei; i++) {
+			vcpu = hgctrl->owners[i];
+			if (!vcpu)
+				continue;
+
+			/*
+			 * We release hgctrl->lock before notifying IMSIC
+			 * so that we don't have lock ordering issues.
+			 */
+			raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+
+			/* Notify IMSIC */
+			kvm_riscv_vcpu_aia_imsic_release(vcpu);
+
+			/*
+			 * Wakeup VCPU if it was blocked so that it can
+			 * run on other HARTs
+			 */
+			if (csr_read(CSR_HGEIE) & BIT(i)) {
+				csr_clear(CSR_HGEIE, BIT(i));
+				kvm_vcpu_kick(vcpu);
+			}
+
+			raw_spin_lock_irqsave(&hgctrl->lock, flags);
 		}
 
-		raw_spin_lock_irqsave(&hgctrl->lock, flags);
+		raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+		put_cpu_ptr(&aia_hgei);
 	}
-
-	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
-
-	put_cpu_ptr(&aia_hgei);
 }
 
 int kvm_riscv_aia_init(void)
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 0924c75100a2..41ef91ea3921 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -10,6 +10,7 @@
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/kvm_host.h>
+#include <linux/cpu_pm.h>
 #include <asm/cpufeature.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
@@ -33,14 +34,9 @@ long kvm_arch_dev_ioctl(struct file *filp,
 	return -EINVAL;
 }
 
-int kvm_arch_enable_virtualization_cpu(void)
+/* Initialize hypervisor CSRs - called during CPU online and non-retention idle resume */
+static void kvm_riscv_csr_enable(void)
 {
-	int rc;
-
-	rc = kvm_riscv_nacl_enable();
-	if (rc)
-		return rc;
-
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
 
@@ -48,16 +44,11 @@ int kvm_arch_enable_virtualization_cpu(void)
 	csr_write(CSR_HCOUNTEREN, 0x02);
 
 	csr_write(CSR_HVIP, 0);
-
-	kvm_riscv_aia_enable();
-
-	return 0;
 }
 
-void kvm_arch_disable_virtualization_cpu(void)
+/* Clear hypervisor CSRs - called during CPU offline and non-retention idle entry */
+static void kvm_riscv_csr_disable(void)
 {
-	kvm_riscv_aia_disable();
-
 	/*
 	 * After clearing the hideleg CSR, the host kernel will receive
 	 * spurious interrupts if hvip CSR has pending interrupts and the
@@ -68,10 +59,60 @@ void kvm_arch_disable_virtualization_cpu(void)
 	csr_write(CSR_HVIP, 0);
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
+}
+
+int kvm_arch_enable_virtualization_cpu(void)
+{
+	int rc;
 
+	rc = kvm_riscv_nacl_enable();
+	if (rc)
+		return rc;
+
+	kvm_riscv_csr_enable();
+	kvm_riscv_aia_enable(true);
+
+	return 0;
+}
+
+void kvm_arch_disable_virtualization_cpu(void)
+{
+	kvm_riscv_aia_disable(true);
+	kvm_riscv_csr_disable();
 	kvm_riscv_nacl_disable();
 }
 
+static int kvm_riscv_cpu_pm_notifier(struct notifier_block *self, unsigned long cmd, void *v)
+{
+	/*
+	 * To avoid redundant disable/enable operations (since KVM's
+	 * syscore ops will handle the state during system suspend),
+	 * ignore CPU_PM events when a system suspend/resume is in
+	 * progress.
+	 */
+	if (system_state == SYSTEM_SUSPEND)
+		return NOTIFY_DONE;
+
+	switch (cmd) {
+	case CPU_PM_EXIT:
+		kvm_riscv_csr_enable();
+		kvm_riscv_aia_enable(false);
+		return NOTIFY_OK;
+	case CPU_PM_ENTER:
+		kvm_riscv_aia_disable(false);
+		kvm_riscv_csr_disable();
+		return NOTIFY_OK;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block kvm_riscv_cpu_pm_nb = {
+	.notifier_call = kvm_riscv_cpu_pm_notifier,
+};
+
 static void kvm_riscv_teardown(void)
 {
 	kvm_riscv_aia_exit();
@@ -172,22 +213,36 @@ static int __init riscv_kvm_init(void)
 
 	kvm_register_perf_callbacks();
 
-	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-	if (rc) {
-		kvm_riscv_teardown();
-		return rc;
+	/* Register CPU PM notifier for CPU idle non-retention states */
+	if (IS_ENABLED(CONFIG_CPU_PM)) {
+		rc = cpu_pm_register_notifier(&kvm_riscv_cpu_pm_nb);
+		if (rc) {
+			kvm_err("Failed to register CPU PM notifier: %d\n", rc);
+			goto err_teardown;
+		}
 	}
 
-	if (kvm_riscv_aia_available())
-		kvm_info("AIA available with %d guest external interrupts\n",
-			 atomic_read(&kvm_riscv_aia_nr_hgei));
+	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (rc)
+		goto err_unregister_cpu_pm;
 
 	return 0;
+
+err_unregister_cpu_pm:
+	if (IS_ENABLED(CONFIG_CPU_PM))
+		cpu_pm_unregister_notifier(&kvm_riscv_cpu_pm_nb);
+err_teardown:
+	kvm_riscv_teardown();
+	return rc;
 }
 module_init(riscv_kvm_init);
 
 static void __exit riscv_kvm_exit(void)
 {
+	/* Unregister CPU PM notifier */
+	if (IS_ENABLED(CONFIG_CPU_PM))
+		cpu_pm_unregister_notifier(&kvm_riscv_cpu_pm_nb);
+
 	kvm_exit();
 
 	kvm_riscv_teardown();

---
base-commit: 52738352a6f29279e15285fcb7b50241ef867e27
change-id: 20260624-kvm-cpu-pm-94141aecd5fa


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
