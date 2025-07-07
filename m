Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558AAC83030
	for <kvm-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 03:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ex4BmuwpL13/l2hB6RwhyubewWryeQczzYfUqL2eC2Y=; b=TlubOqS2eHNwAj
	dPvRMu4NwFmEdaJHw1qHcrkL591CDY56L0RKr46n7OhmAexcJYsTVQ5t3K/Ft8olfPv4AjBcMT4vb
	UHTGL9KHmF4f61xY+/IgwyK8P+FEBmd64Ck14uXi+XUemhFJgO1QOG3WWLg5TZhjYMxbbhC/yr8CQ
	EGcNsjfLwqhO7CL+97UASFZH3aFFlZdBc0oCxe9GSnzpBDA6pZPtrw0zDJO2Kpsf1lWStJTInIhB4
	+v1yOrP5xrEJaUhamPRi7t+R9N/DcCUHRIahEwK8aZ27bHmL2Y7GRQ1Ql8E1xYpENgFn0o5EVxgQ/
	BjxfayChc9g72s+JtaXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcvg-00000001Kqf-0OAB;
	Mon, 07 Jul 2025 03:54:08 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYcvd-00000001Knu-0qtF
	for kvm-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 03:54:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2353a2bc210so23446855ad.2
        for <kvm-riscv@lists.infradead.org>; Sun, 06 Jul 2025 20:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751860444; x=1752465244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fh2AJt0yoZFTrEfJ+nsZtn9P0jIR9N+wVBorJAiW1uA=;
        b=JnTTOhGwJz63ExZXk7+1fV3HkDzMAEcEWKjf8xyly3fhVxHlIGgS7th3GvU9ivIzvw
         BWMwZMIGAaOx5971CEUe+WlhvpYHPuxgIPATRDya7INw1Us1WtuT0iEhgG0+LFYJbHCr
         bWW+3zurqDUHdPezjPRqOQKGiLUDtGmhw2x4VaiyEqERtQiKkIv0s7nlpVg06IIKSlIe
         R5negROiWC3Ax97WC4/cb9rfZ6VtDoY8cRdU++Iss4JcVXxlEqc+mvgcrbZ+AS3ypGw2
         uKlRGfnQ/6UYAwcoX4TJSxZfQSunUE/aIOXGPsYcJHs8SyFCXqLetw3U94kEILhnrG5l
         3a6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751860444; x=1752465244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fh2AJt0yoZFTrEfJ+nsZtn9P0jIR9N+wVBorJAiW1uA=;
        b=FgT+eRVw20N6/TnNGo0qQ0C+j+iDw9fpJbIGyz4+1c5lqFs0K8Pwti4V5m3b0eY4tv
         zce8cmUAiZFFmKWQUp0w+hvc4nt+ieufo1CRo1HNzKwL8pjUdiBkyg583xJSRymnTe+J
         rn8w/tB1lmmKTBXeG6PLayqndhOGudCrBWGSywD+e6JsXVCugYgtO0UmeSJMVcgCaJOf
         i1+xynKwMFtn/fTPic/7wv7Q285939CVlymKLX0cGjmal+1KL0pwHrOIDVCn2xmeDcnA
         x/JqrxDZhzmthryNBNNlNpNZi9tihzi8UJTJoGHO5ymTP9sgJSnc8UCo3BdSmCMwiSvS
         U0KA==
X-Forwarded-Encrypted: i=1; AJvYcCWYp9Qc1CIYy8FFDIaixT4+fFBQ2lmR8fsrUYPSuTwa+w+G0dtzYGXx457KXQIrgES/3safq4100bQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaolDjPKLC5b9XHLWcl0zxQvbuc9S+8OMUim/X7iIfOiIUg4K8
	iH4i6WAfgEIWy8r9AdEBYQjTXeb7dKTuxz66hjTziRTdZcqKVBMqS4wip5klder0t9Y=
X-Gm-Gg: ASbGnctjUcJPbhIh3fm9kT8YnMd2xvkbKJv5i0FPXdqswxrVfbNdl3HxA3txQHxyOmd
	bQGT9oa/ynrFcfXgIhXgFokKA9tDqrAr11ZE4SkPjuXAhDFdnwNzha6xTT7CS0mItK7XYRwY9t7
	eO39wykfV1ByR1Cr1mqpskS7pZlXyPIdJbCecIjUxpNqOXkMSRuYFvSmvjYe8O4wnn4uj0IOb4E
	C9aoJ59jKJvXfh5Hn+03VsHnFdDbyH6PfNaCixpTHXYDc53tCcnjz3jWed4XOoQP9FMQXrg/Lks
	46B4FMe6q0uvgVMyF0DW9CodELtclzq+JIfAqPYCWhwwGyD81ZieqtOEU8CefLKdu10Izg7H8/F
	deoCvuC7MCy+Y1ZnVFOw=
X-Google-Smtp-Source: AGHT+IFe82d6BHmBOo2M+2ls1e4A5K/eZXQL9BtmwHX6jMWuif2aGFAVvqblJlwRZZSbrmPBr5HHVg==
X-Received: by 2002:a17:903:27cc:b0:235:225d:30a2 with SMTP id d9443c01a7336-23c85ec7329mr136803185ad.48.1751860444304;
        Sun, 06 Jul 2025 20:54:04 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae80ae0sm8159137a91.21.2025.07.06.20.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 20:54:03 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH v2 2/2] RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization
Date: Mon,  7 Jul 2025 09:23:44 +0530
Message-ID: <20250707035345.17494-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707035345.17494-1-apatel@ventanamicro.com>
References: <20250707035345.17494-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_205405_248675_193FC121 
X-CRM114-Status: GOOD (  20.20  )
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

Currently, the common AIA functions kvm_riscv_vcpu_aia_has_interrupts()
and kvm_riscv_aia_wakeon_hgei() lookup HGEI line using an array of VCPU
pointers before accessing HGEI[E|P] CSR which is slow and prone to race
conditions because there is a separate per-hart lock for the VCPU pointer
array and a separate per-VCPU rwlock for IMSIC VS-file (including HGEI
line) used by the VCPU. Due to these race conditions, it is observed
on QEMU RISC-V host that Guest VCPUs sleep in WFI and never wakeup even
with interrupt pending in the IMSIC VS-file because VCPUs were waiting
for HGEI wakeup on the wrong host CPU.

The IMSIC virtualization already keeps track of the HGEI line and the
associated IMSIC VS-file used by each VCPU so move the HGEI[E|P] CSR
access to IMSIC virtualization so that costly HGEI line lookup can be
avoided and likelihood of race-conditions when updating HGEI[E|P] CSR
is also reduced.

Reviewed-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Atish Patra <atishp@rivosinc.com>
Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
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
