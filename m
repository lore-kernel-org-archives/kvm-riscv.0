Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB73CCF2DE
	for <kvm-riscv@archiver.kernel.org>; Mon, 19 Oct 2026 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7tnUj1KKd4vZd8koz9ffIMxvSEQupbeCO7Np+RUwUVY=; b=Il6pFFST6ZkfFu
	mNYF5OuV2AbElL0aPvUgx42hRF3cYrgKX0WV+dCs4zOQ24PktQQQMat0YD6byAiZW2hCGhuOHdu/T
	FWOVwrXLyEB1CmuHKc3n2WzzZ53rpiagG/3/dFPiYaq/YX5fKW0PFu5HbhzOtaH7atk30+2yXn2fh
	BdRxHJVJyP70FMU+oPLFYENOH428uC6q7UktGDQvy7XLxIWAdwyJ6sXpG5+TYUm7ftKrePViADL7b
	FlNz43c1MBKsmWziLPio7nGyYePXJ7I7Tr1c9eRb+x+1pLr3Ls58MalJpEvBJvs0j4gS47n0vQrXG
	vUMMykswU6E20uTpNQxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInhw-00000007Yec-0Z1H;
	Mon, 19 Oct 2026 13:47:20 +0000
Received: from out-51.mta1.migadu.com ([2001:41d0:203:375::33] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xInht-00000007YdN-1DhR
	for kvm-riscv@lists.infradead.org;
	Mon, 19 Oct 2026 13:47:18 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=/qaWoZI/YGAqceCwDucx/imq3smJTVtLSwTEScGWq70=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792417633; v=1; x=1793022433;
 b=lNb6ba9bmT8idF2PNhbo07YN+szjH79RwQTeTMMaqL3Aj2Ll3UKNHunejiX4C4brXaTZBeki
 Gvnv47F6yXX7bZIEueY4UWUlJ8qtnK+lgH2MhKfSJLis6GxYnWi0hRcHttl8l8K8nDSqMNFXpKE
 rKiD1cj8s7F+KK9A1EJtDfP4=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5640194636ea6c18;
	Mon, 19 Oct 2026 13:47:13 +0000
X-Mizu-Trace-ID: 5640194636ea6c18
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] RISC-V: KVM: Convert IMSIC vsfile_lock to a raw spinlock
Date: Mon, 19 Oct 2026 15:47:09 +0200
Message-ID: <20261019134709.2610129-1-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_064717_472002_89849328 
X-CRM114-Status: GOOD (  14.40  )
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

kvm_riscv_vcpu_aia_imsic_put() runs from the scheduler preemption
notifier with the raw runqueue lock held, so it must not take
vsfile_lock, an rwlock_t, which sleeps on PREEMPT_RT. All vsfile_lock
critical sections are short, so a raw spinlock is fine.

Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization")
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
v2:
 - Convert vsfile_lock to raw_spinlock_t instead of adding a separate
   hgei_lock [Anup]
---
 arch/riscv/kvm/aia_imsic.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index f17dc559a709..bad0ce20edc1 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -47,7 +47,7 @@ struct imsic {
 	 */
 
 	/* IMSIC VS-file */
-	rwlock_t vsfile_lock;
+	raw_spinlock_t vsfile_lock;
 	int vsfile_cpu;
 	int vsfile_hgei;
 	void __iomem *vsfile_va;
@@ -593,13 +593,13 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 	 * VCPU is being destroyed.
 	 */
 
-	write_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
 	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
-	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	memset(imsic->swfile, 0, sizeof(*imsic->swfile));
 
@@ -687,7 +687,7 @@ bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu)
 	 * only check for interrupt when IMSIC VS-file is being used.
 	 */
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	if (imsic->vsfile_cpu > -1) {
 		/*
 		 * This function is typically called from kvm_vcpu_block() via
@@ -702,7 +702,7 @@ bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu)
 		else
 			ret = !!(csr_read(CSR_HGEIP) & BIT(imsic->vsfile_hgei));
 	}
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	return ret;
 }
@@ -727,10 +727,10 @@ void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
 	if (!kvm_vcpu_is_blocking(vcpu))
 		return;
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	if (imsic->vsfile_cpu > -1)
 		csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 }
 
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
@@ -744,13 +744,13 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 		return;
 
 	/* Read and clear IMSIC VS-file details */
-	write_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
 	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
-	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	/* Do nothing, if no IMSIC VS-file to release */
 	if (old_vsfile_cpu < 0)
@@ -807,10 +807,10 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 		return 1;
 
 	/* Read old IMSIC VS-file details */
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	/* Do nothing if we are continuing on same CPU */
 	if (old_vsfile_cpu == vcpu->cpu)
@@ -860,12 +860,12 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 	/* TODO: Update the IOMMU mapping ??? */
 
 	/* Update new IMSIC VS-file details in IMSIC context */
-	write_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	imsic->vsfile_hgei = new_vsfile_hgei;
 	imsic->vsfile_cpu = vcpu->cpu;
 	imsic->vsfile_va = new_vsfile_va;
 	imsic->vsfile_pa = new_vsfile_pa;
-	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	/*
 	 * At this point, all interrupt producers have been moved
@@ -975,7 +975,7 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
 	}
 	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 
 	rc = 0;
 	vsfile_hgei = imsic->vsfile_hgei;
@@ -990,7 +990,7 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
 					    isel, val, 0, 0);
 	}
 
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	if (!rc && vsfile_cpu >= 0)
 		rc = imsic_vsfile_rw(vsfile_hgei, vsfile_cpu, imsic->nr_eix,
@@ -1052,7 +1052,7 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 	if (imsic->nr_msis <= iid)
 		return -EINVAL;
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
@@ -1062,7 +1062,7 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 		imsic_swfile_extirq_update(vcpu);
 	}
 
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	return 0;
 }
@@ -1118,7 +1118,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 
 	/* Setup IMSIC context  */
 	imsic->nr_msis = kvm->arch.aia.nr_ids + 1;
-	rwlock_init(&imsic->vsfile_lock);
+	raw_spin_lock_init(&imsic->vsfile_lock);
 	imsic->nr_eix = BITS_TO_U64(imsic->nr_msis);
 	imsic->nr_hw_eix = BITS_TO_U64(kvm_riscv_aia_max_ids);
 	imsic->vsfile_hgei = imsic->vsfile_cpu = -1;
-- 
2.56.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
