Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8499CDE00E
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buJovFioSv8IBQwdPT1HCqRB8BkFcduu15gJ5Z+lL4g=; b=HUVRvit+6fqeeT
	57OaiLJXqINQ0ji3wbtCZOvGWcxyBxWpYTDMJiZftXrhLeZtxAjWDunDISEkxMQ3z5ol/4XHyOlvk
	IXpDGqisgI3UlZDwPQnlkoTaqcOgRklKYJ4YuZp7RotE8A2r55wuTMfKtnvA4jeRh3ElfZbeZ87bG
	Fu/z4DesQMDq70AugPcGsvc0PJEqA3bsdhZ3ISlMd97kJfyvP3wWuQfiLrRTE2kaQ7+vZONCGjeCU
	HcRuSktKyY6dumc0PN301r5lBsmIoIow1HpHZDGRlMCO8ldGlzOLCxGBdL236huRgJujnpnBgfm9u
	wHQSKHWpUHICtetPxM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1r4-0000000Aqlm-27bo;
	Fri, 26 Jun 2026 08:24:06 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1r0-0000000AqiF-3PlU
	for kvm-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:24:04 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1363fe80fe8so1568157c88.0
        for <kvm-riscv@lists.infradead.org>; Fri, 26 Jun 2026 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782462242; x=1783067042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=krYcPQa3k13i7reuaRQvQCEYDOEzT3cGJGxL2UEq0GU=;
        b=TObg9N16aLuz293cn4GYn8Rc0s5ULAJbZR54AqqqopIiK8mzfaSfW8pyVuTMexBaBR
         cey40xZiTFDFmj2W6/iwhc7ytPY6+a1ZSTJMEFO/U0lE+6uguROWoNvFTf0ZE6KWg8Bx
         qn7QnzysD+jvM6fhkUE0BOzlkuBIqiQPMjkAEqiIToNWEUW49DolkPnieHWkSz/+cpn+
         2PDxYATmnsWSDLVHoxMPi144tNbMCzDtuE9/4KytrIEYBAgVZSFJw40nLo8XRoOhUiXc
         yz0BI8d8rBaZ/mTxbA+W8M+nBX8+aDplMA8VEJrcx6JN6IFAp+yYZHKjWv95vzy0wEca
         FZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462242; x=1783067042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krYcPQa3k13i7reuaRQvQCEYDOEzT3cGJGxL2UEq0GU=;
        b=CyfYGlKSaHnLq8A7E1LZQpbJKy/qJ7CmCJEj/str95gxC6znsg4yhCZG06D4a+b6b7
         9OPXIpg6MXMzrlRyoqV2EZLtrfAFNjrJtT0mJ3g0dI10KgdQ48+zKmBj8CRlmZGA3j6r
         0X1rGqYDKEsfZTrZYtdl02XfkpwCGpNDPmC+6WlmFMsUZ/MQ/M3ULZQdLCxjaIqvnN26
         KJtGE++ZAWo38BG11eHop8tx2jG/Ct1yU4FI3oHU3T7c7cN3UnJDQ/IlVg0hkP75UzPJ
         1mXcHvpsyNKczrugTKr94NLzhQU85BBYMNf8LTh4xtNWUGa+6BkZQXXAXjNQX0Xxvn0A
         m2LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wedd1vEUmyvXTRsyruF/oJSuB3ffpOgDrqmynKxu+wCp+AYEehmmMphrfGYw4rRSaMS2Pz4hZ2V8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzP+AxMiDZPb21kQas5oe7FFKaOvIniuP028kNaAk1X5JVjyxEL
	WJfYleGadOUuR9kst+IB8h2Iqa43u06a6hg9qR2Z7vysZ23ZheyfMTGVQr6zrpSAkM8=
X-Gm-Gg: AfdE7cnfhzVJ6UIqeDy5VjXcivj9JOgyW7PpwcUqBV2brjfOO2jffIC9I4MphINwSvq
	LBQIMa1abVVSOLjnX71qCc/mp8/8q5wpeWx/v9tR3c4bH7yzJBN2FxnfrqL2FfxpO7pPJwDpFZW
	Z7s8uUJzv8YZ2dN0bhGpejvoN5kJHmjd2qzcanwMnTds8eYfy70ypleSs8/asrGmjH7hyQ1fZaH
	vKP4Q1KUcyp+EdMeS53LRxedE9PMoTOB0UECQUZHKyo3EGnX0dXj0vUkp1l9NMDZLoU2vC56/P2
	8VyfU2RGTNy5zMDEDAfE8W4Ux9H4av5+ttgCP9wHtEgUVn1JEjY2D2vsAnymL5ZyZoyK4dm6RgC
	6/Lj07Fna61n2oca6qPf7KhtqA1WQAm/8M/zyYIDj8DBzP8QBG3/OcKfTOgYwFdlQ8LTM8YaItl
	x2BLUSjL/8fDCeKBUl0TD+fBHZLJkugZdh
X-Received: by 2002:a05:7022:6981:b0:138:43a4:840a with SMTP id a92af1059eb24-139dbab8c50mr5144073c88.28.1782462241883;
        Fri, 26 Jun 2026 01:24:01 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm15557199c88.3.2026.06.26.01.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:24:01 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 26 Jun 2026 01:23:22 -0700
Subject: [PATCH v2 2/2] KVM: RISC-V: Add CPU PM notifier for non-retention
 idle states
MIME-Version: 1.0
Message-Id: <20260626-kvm-cpu-pm-v2-2-478e5ef8dc9b@sifive.com>
References: <20260626-kvm-cpu-pm-v2-0-478e5ef8dc9b@sifive.com>
In-Reply-To: <20260626-kvm-cpu-pm-v2-0-478e5ef8dc9b@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782462237; l=12408;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=/QbFFpsCboBDa9cui72zMmEKaCY9UuIm5HwWxj1et3w=;
 b=tUNh0DUemY9KKf2vF6bVrVh1CR+ViaQU5MeleAy2xEteCcCOLp+q3QELSMykASbi7xnDCNuTy
 vAgjWsjn+IJDpZs5ysK8aHt0YkhgZWZ7bKlX+k64Iwf1DkkBPKh7JKn
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012402_930490_8255EA09 
X-CRM114-Status: GOOD (  23.70  )
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
powers off the CPU domain, hypervisor CSRs and VS CSRs lose their state
and must be saved before entry and restored after exit.

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
 arch/riscv/kvm/aia.c             | 144 ++++++++++++++++++++++-----------------
 arch/riscv/kvm/main.c            |  98 +++++++++++++++++++++-----
 3 files changed, 174 insertions(+), 83 deletions(-)

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
index bafb009c5ce5..4cf351f91c64 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -25,6 +25,7 @@ struct aia_hgei_control {
 	unsigned long free_bitmap;
 	struct kvm_vcpu *owners[BITS_PER_LONG];
 	unsigned int nr_hgei;
+	unsigned long saved_value;
 };
 static DEFINE_PER_CPU(struct aia_hgei_control, aia_hgei);
 static int hgei_parent_irq;
@@ -532,50 +533,59 @@ static void aia_hgei_exit(void)
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
+		csr_write(CSR_HGEIE, hgctrl->saved_value);
 	}
-	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 
 	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 	csr_write(CSR_HVIPRIO1, 0x0);
@@ -587,16 +597,17 @@ void kvm_riscv_aia_enable(void)
 	csr_write(CSR_HVIPRIO2H, 0x0);
 #endif
 
-	/* Enable per-CPU SGEI interrupt */
-	enable_percpu_irq(hgei_parent_irq,
-			  irq_get_trigger_type(hgei_parent_irq));
+	if (full_cleanup)
+		enable_percpu_irq(hgei_parent_irq,
+				  irq_get_trigger_type(hgei_parent_irq));
 	csr_set(CSR_HIE, BIT(IRQ_S_GEXT));
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
@@ -609,42 +620,49 @@ void kvm_riscv_aia_disable(void)
 
 	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSCOFPMF))
 		csr_clear(CSR_HVIEN, BIT(IRQ_PMU_OVF));
-	/* Disable per-CPU SGEI interrupt */
-	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
-	disable_percpu_irq(hgei_parent_irq);
 
-	csr_write(CSR_HVICTL, aia_hvictl_value(false));
-
-	raw_spin_lock_irqsave(&hgctrl->lock, flags);
-
-	for (i = 0; i <= hgctrl->nr_hgei; i++) {
-		vcpu = hgctrl->owners[i];
-		if (!vcpu)
-			continue;
+	if (full_cleanup) {
+		/* Disable per-CPU SGEI interrupt */
+		csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
+		disable_percpu_irq(hgei_parent_irq);
+	}
 
-		/*
-		 * We release hgctrl->lock before notifying IMSIC
-		 * so that we don't have lock ordering issues.
-		 */
-		raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
+	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 
-		/* Notify IMSIC */
-		kvm_riscv_vcpu_aia_imsic_release(vcpu);
+	if (full_cleanup) {
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
+	} else {
+		hgctrl->saved_value = csr_read(CSR_HGEIE);
 	}
 
-	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
-
 	put_cpu_ptr(&aia_hgei);
 }
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 350e4f097d6e..f397a93881dc 100644
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
@@ -74,6 +65,59 @@ void kvm_arch_disable_virtualization_cpu(void)
 	kvm_riscv_nacl_disable();
 }
 
+int kvm_arch_enable_virtualization_cpu(void)
+{
+	int rc;
+
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
+	kvm_riscv_nacl_disable();
+}
+
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
+	case CPU_PM_ENTER_FAILED:
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
@@ -174,17 +218,31 @@ static int __init riscv_kvm_init(void)
 
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
 
+	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (rc)
+		goto err_unregister_cpu_pm;
+
 	if (kvm_riscv_aia_available())
 		kvm_info("AIA available with %d guest external interrupts\n",
 			 atomic_read(&kvm_riscv_aia_nr_hgei));
 
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
 
@@ -192,6 +250,10 @@ static void __exit riscv_kvm_exit(void)
 {
 	kvm_exit();
 
+	/* Unregister CPU PM notifier */
+	if (IS_ENABLED(CONFIG_CPU_PM))
+		cpu_pm_unregister_notifier(&kvm_riscv_cpu_pm_nb);
+
 	kvm_riscv_teardown();
 }
 module_exit(riscv_kvm_exit);

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
