Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CDDC83F09
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/x70KWdnDi7bHic6elU8jm+U8cyNTxiieGASzZbuIzU=; b=cbPlQa/s49e4Re
	ODPQZMiNsLHy/O0IunoMzb25Wmpne+zRGqpoDOZAVlam4rOMkHeHcTm4izWPjmzIvhPGeBWXea7y8
	H3c7KhRax9r8Zdhe2bw2v64fzE2UTa5aM8xFeIoqLMNa/lCxCd7YYRbFr/Gkzkhg1j9F3UupbFu98
	O5mHyCgEx7KcQNjUHH9iApRadUE1acVbUSYXn6qfxdDQTH2TdlwvYJtt9QOc5i6VYD9eTiL+64Ptm
	FAWKa47IVG/uEQM9Rf2qrF6VvokgBPxhDc0gkIWe1r+6WyF23uwKRzw6xyKbFWVYd2MziCH2DDfjQ
	OhOC4NULbsKVimEymwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiW6-0000000EqtM-3lUn;
	Fri, 04 Jul 2025 15:39:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiVB-0000000Eqe1-0x9d
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:39:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-748d982e97cso1081263b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 04 Jul 2025 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751643540; x=1752248340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGu8D5CO2g4ATuM30TaqWjSMbmUsVDtUpJDi7E1Auq4=;
        b=GTZ78TvyKulMnId8ITYtXig3tDO981J/ZZVC2GdBj5XwpBZBddXGylvVIiA9+IojGh
         Qr7BFrflUqkE2P4OUyD80vGoKBr4nwWa1+5YN+6BuIIBkPV2rLmje9ZWR2XkJq3KQy/0
         v/+UzfpNf3LP0l5oO3Ofds72/kIkLTlsYlaufzuEVRFGQXiXE0p+s/O7pfgYYHPQExP0
         QYODyqyQThrHDfH+6AmCgfGwfVNcfNiLuo1fvkUymMQEcS5NwuBHL5KKOZ2b3pheyYam
         ec30xZZTF6j4kQ/+d9pN/FD6FtobgyWbdJkYhPaPbxCb41f+NFjTY9672Y33V0qd+Je/
         C98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643540; x=1752248340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGu8D5CO2g4ATuM30TaqWjSMbmUsVDtUpJDi7E1Auq4=;
        b=XWs9cf1K/374XjWIdwN35zOotjY8buCb5V06a9Sf7zmvkdYsPagxNqX284OjlqYS9P
         JeU8SL6GVl1yHUR6L+3G18FIfEXuHewgbA8SNqj8KB/i6EWshOBL9XJ4MJKtFhCK1GtV
         J0C/tgNvNWWLoKQC3r+Agj1u1RQ+NivRl2V9H1g77yzi1tOg1DuDqN7alkAORBTzbxou
         eHRxvLHqcvveOBfskaLz9LdpsehEhfSn8MPmaLP57YgeGDCKZgzCVCmExLkNOHsb21yo
         O3IQuJOBFUk1mKcZUDgRcr7tiCyryjJwIQhIyPV1E9EVhRYMoUTBFSRuxevsiTd162z4
         Mk+g==
X-Forwarded-Encrypted: i=1; AJvYcCUs1NAhvyoOVKuxY/GoAIn8xngqplcLkZ2aDMkXG445j+raxbT5ts+5mRcgYJqnVNlPV617hC7cpvY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyocWmAci//8Fbh+Fcsc/O4LZXYZ74PER1jjpF8L22+qIviNMzy
	Yy7QvyZLUnf1PAHTD6yg2vHgMYxTilT5Xel46y1p0o4stbs60tyF/W6YfOJ7hAg5HW0=
X-Gm-Gg: ASbGncvzz6Djcv9i9HEqdqYSLrj7tDEpee5OmJ4BCOFV/GdklJrVx0Nc/CIQY1I+nm7
	XXdQ9dyfjciRN9Ddef5mFwvCP9vuJRuOtlNcPEdIuH2i3/ejsJLwmTyBbA5Uxq7x/3jQH9vnNNH
	2c8hDm4bzELcsoAcWLwv/vM7TABZwZwAG9Fd+W6QbcQ1bSf8JC5oXM83Bh9+bh/vGtN3S+hBfku
	WzXB32SGOthatJGSgP2KZXy5zk7jhBNLhkWEZPPrjB68YOc+PAaKjvbljLsbZoTnSVdnQ7Wafmm
	mFW24PLpuft7HbchZPhgBMj2IQ9JGHCo5OF/FkIF9UiUqiym5r994ez1pizkH5tkUQhyyO+MQ3z
	NwqYAZKqTS17P7WQI5go=
X-Google-Smtp-Source: AGHT+IEy5K6TN3PEoTMk39/X767PpUlO+bEGeE+f/+6Ff0hJG+gUrinbRE67z7eLIyDgw9OeZ6XYHA==
X-Received: by 2002:a05:6a21:a8e:b0:220:a3de:a083 with SMTP id adf61e73a8af0-225b85f3eafmr5148507637.10.1751643540342;
        Fri, 04 Jul 2025 08:39:00 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee63003bsm2084818a12.62.2025.07.04.08.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:38:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/2] RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization
Date: Fri,  4 Jul 2025 21:08:38 +0530
Message-ID: <20250704153838.6575-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704153838.6575-1-apatel@ventanamicro.com>
References: <20250704153838.6575-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_083901_275523_248868FA 
X-CRM114-Status: GOOD (  18.19  )
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

There is one HGEI line associated with each IMSIC VS-file on a host CPU.
The IMSIC virtualization already keeps track of the HGEI line and the
associated IMSIC VS-file used by each VCPU.

Currently, the common AIA functions kvm_riscv_vcpu_aia_has_interrupts()
and kvm_riscv_aia_wakeon_hgei() lookup HGEI line using an array of VCPU
pointers before accessing HGEI[E|P] CSR which is slow. Move the HGEI[E|P]
CSR access to IMSIC virtualization so that costly HGEI line lookup and
potential race-conditions when updating HGEI[E|P] CSR can be avoided.

Fixes: 3385339296d1 ("RISC-V: KVM: Use IMSIC guest files when available")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h |  4 ++-
 arch/riscv/kvm/aia.c             | 51 +++++---------------------------
 arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c            |  2 --
 4 files changed, 55 insertions(+), 47 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 0a0f12496f00..b04ecdd1a860 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -87,6 +87,9 @@ DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
 extern struct kvm_device_ops kvm_riscv_aia_device_ops;
 
+bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_imsic_load(struct kvm_vcpu *vcpu, int cpu);
+void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu);
 
@@ -161,7 +164,6 @@ void kvm_riscv_aia_destroy_vm(struct kvm *kvm);
 int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 			     void __iomem **hgei_va, phys_addr_t *hgei_pa);
 void kvm_riscv_aia_free_hgei(int cpu, int hgei);
-void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable);
 
 void kvm_riscv_aia_enable(void);
 void kvm_riscv_aia_disable(void);
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 19afd1f23537..dad318185660 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -30,28 +30,6 @@ unsigned int kvm_riscv_aia_nr_hgei;
 unsigned int kvm_riscv_aia_max_ids;
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
-static int aia_find_hgei(struct kvm_vcpu *owner)
-{
-	int i, hgei;
-	unsigned long flags;
-	struct aia_hgei_control *hgctrl = get_cpu_ptr(&aia_hgei);
-
-	raw_spin_lock_irqsave(&hgctrl->lock, flags);
-
-	hgei = -1;
-	for (i = 1; i <= kvm_riscv_aia_nr_hgei; i++) {
-		if (hgctrl->owners[i] == owner) {
-			hgei = i;
-			break;
-		}
-	}
-
-	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
-
-	put_cpu_ptr(&aia_hgei);
-	return hgei;
-}
-
 static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
 {
 	unsigned long hvictl;
@@ -95,7 +73,6 @@ void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
 
 bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
-	int hgei;
 	unsigned long seip;
 
 	if (!kvm_riscv_aia_available())
@@ -114,11 +91,7 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 	if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
 		return false;
 
-	hgei = aia_find_hgei(vcpu);
-	if (hgei > 0)
-		return !!(ncsr_read(CSR_HGEIP) & BIT(hgei));
-
-	return false;
+	return kvm_riscv_vcpu_aia_imsic_has_interrupt(vcpu);
 }
 
 void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
@@ -164,6 +137,9 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
 		csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
 #endif
 	}
+
+	if (kvm_riscv_aia_initialized(vcpu->kvm))
+		kvm_riscv_vcpu_aia_imsic_load(vcpu, cpu);
 }
 
 void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
@@ -174,6 +150,9 @@ void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
 	if (!kvm_riscv_aia_available())
 		return;
 
+	if (kvm_riscv_aia_initialized(vcpu->kvm))
+		kvm_riscv_vcpu_aia_imsic_put(vcpu);
+
 	if (kvm_riscv_nacl_available()) {
 		nsh = nacl_shmem();
 		csr->vsiselect = nacl_csr_read(nsh, CSR_VSISELECT);
@@ -472,22 +451,6 @@ void kvm_riscv_aia_free_hgei(int cpu, int hgei)
 	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 }
 
-void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable)
-{
-	int hgei;
-
-	if (!kvm_riscv_aia_available())
-		return;
-
-	hgei = aia_find_hgei(owner);
-	if (hgei > 0) {
-		if (enable)
-			csr_set(CSR_HGEIE, BIT(hgei));
-		else
-			csr_clear(CSR_HGEIE, BIT(hgei));
-	}
-}
-
 static irqreturn_t hgei_interrupt(int irq, void *dev_id)
 {
 	int i;
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index ea1a36836d9c..fda0346f0ea1 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -677,6 +677,48 @@ static void imsic_swfile_update(struct kvm_vcpu *vcpu,
 	imsic_swfile_extirq_update(vcpu);
 }
 
+bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu)
+{
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	unsigned long flags;
+	bool ret = false;
+
+	/*
+	 * The IMSIC SW-file directly injects interrupt via hvip so
+	 * only check for interrupt when IMSIC VS-file is being used.
+	 */
+
+	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	if (imsic->vsfile_cpu > -1)
+		ret = !!(csr_read(CSR_HGEIP) & BIT(imsic->vsfile_hgei));
+	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+
+	return ret;
+}
+
+void kvm_riscv_vcpu_aia_imsic_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	/*
+	 * No need to explicitly clear HGEIE CSR bits because the
+	 * hgei interrupt handler (aka hgei_interrupt()) will always
+	 * clear it for us.
+	 */
+}
+
+void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
+{
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	unsigned long flags;
+
+	if (!kvm_vcpu_is_blocking(vcpu))
+		return;
+
+	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	if (imsic->vsfile_cpu > -1)
+		csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
+	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+}
+
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
@@ -781,6 +823,9 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 	 * producers to the new IMSIC VS-file.
 	 */
 
+	/* Ensure HGEIE CSR bit is zero before using the new IMSIC VS-file */
+	csr_clear(CSR_HGEIE, BIT(new_vsfile_hgei));
+
 	/* Zero-out new IMSIC VS-file */
 	imsic_vsfile_local_clear(new_vsfile_hgei, imsic->nr_hw_eix);
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index fe028b4274df..b26bf35a0a19 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -211,12 +211,10 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
 {
-	kvm_riscv_aia_wakeon_hgei(vcpu, true);
 }
 
 void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 {
-	kvm_riscv_aia_wakeon_hgei(vcpu, false);
 }
 
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
