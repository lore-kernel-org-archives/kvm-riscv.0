Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C778FF8850
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 00:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlJwreJGQrUrT46nnosuYN83h3WqO8EMAiX53HgjDKI=; b=vsaePQ1L/zlx+3
	j/5uNkzaqjgQRQUP9bb0upU3sVQ9da26lbcreizwuZvYpUx86oRcNZ7sC6M3xgh2gWSWQ58hKt9Es
	j03pStThq5wSqfHT8hSBNxEkZl0mUwqwY5lvU+aIlSX3rwYlo6IaLp6V/c5qf1/IFXzycdjAJgVrb
	BE7qmZCKx/NnrvfLjcRMyzzZq/XxQl1vHX9JfbTXRq4MNSqsE1MKQCjtFPYKFsJmlYGKRXKT4ydjR
	ycs85YgqBIBDdLvFOm0MUqaA0gQ70F0THAaZsWlgUSySYBjWMoSdEmjpxgF5QHQbK0SMXBUVk1MO0
	CSscFI8lXefvD46del/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRNC-0000000DwYv-0nTV;
	Sat, 25 Apr 2026 00:59:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRN9-0000000DwXx-3KCN;
	Sat, 25 Apr 2026 00:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7994940A39;
	Sat, 25 Apr 2026 00:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFADC19425;
	Sat, 25 Apr 2026 00:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777078791;
	bh=qJflKuAh/n/m965x+f/wDzFNfhoMXFcBLlCylFjbZyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LoLW64A9/zxlX08Uz3CvBNE5wF8jGEs5SzbJx+E5ncuk4yXsIWon+rnaHXGSL6y89
	 6NR+JfhQdDCu/UwJzrQWTpDCvrn30WBh834gWgKFumnvz90WofOUY+lLs4VXctPCBZ
	 ivbmOV5th+04bc/B43ITBsvcx7m4JMgNspAoy9CKVahNbR+AGAAU72i+d7L6J8f9AZ
	 UARNwI0khfCs86K/wiMAB+L6qItRb7t0pmNChJ8LRuku8mMKiOKe7i09dRJ7UHEK0h
	 LsdLS4OYNlYFJznB+Y8+mbYGoLs3IH7OcefJ8EQpbSv7BNRkqdEnMNGnp34nU1oGn2
	 N+VLDth9ceL1Q==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	cp0613@linux.alibaba.com,
	fangyu.yu@linux.alibaba.com,
	gaohan@iscas.ac.cn,
	inochiama@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	me@ziyao.cc,
	palmer@dabbelt.com,
	pjw@kernel.org,
	tglx@kernel.org
Subject: [PATCH V2 2/4] RISC-V: KVM: AIA: Replace global HGEI count with simple enabled bool
Date: Sat, 25 Apr 2026 00:59:14 +0000
Message-ID: <20260425005916.3321811-3-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425005916.3321811-1-guoren@kernel.org>
References: <20260425005916.3321811-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_175951_872877_FF8CDD45 
X-CRM114-Status: GOOD (  14.88  )
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

Now that HGEI line management is fully per-CPU (via struct
aia_hgei_control::nr_hgei), the global `kvm_riscv_aia_nr_hgei`
is no longer needed. Replace it with a simple `bool
kvm_riscv_aia_hgei_enabled` that only indicates whether HGEI
support is available at all.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/kvm_aia.h |  2 +-
 arch/riscv/kvm/aia.c             | 18 ++++++++----------
 arch/riscv/kvm/aia_device.c      |  4 ++--
 arch/riscv/kvm/main.c            |  3 +--
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index b04ecdd1a860..e8749ac6bed7 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -79,7 +79,7 @@ struct kvm_vcpu_aia {
 
 #define irqchip_in_kernel(k)		((k)->arch.aia.in_kernel)
 
-extern unsigned int kvm_riscv_aia_nr_hgei;
+extern bool kvm_riscv_aia_hgei_enabled;
 extern unsigned int kvm_riscv_aia_max_ids;
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 #define kvm_riscv_aia_available() \
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index a23729052cfb..70ff1d25dd99 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -28,7 +28,7 @@ struct aia_hgei_control {
 static DEFINE_PER_CPU(struct aia_hgei_control, aia_hgei);
 static int hgei_parent_irq;
 
-unsigned int kvm_riscv_aia_nr_hgei;
+bool kvm_riscv_aia_hgei_enabled;
 unsigned int kvm_riscv_aia_max_ids;
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
@@ -491,7 +491,7 @@ static int aia_hgei_init(void)
 	struct irq_domain *domain;
 
 	/* Skip SGEI interrupt setup for zero guest external interrupts */
-	if (!kvm_riscv_aia_nr_hgei)
+	if (!kvm_riscv_aia_hgei_enabled)
 		goto skip_sgei_interrupt;
 
 	/* Find INTC irq domain */
@@ -524,7 +524,7 @@ static int aia_hgei_init(void)
 static void aia_hgei_exit(void)
 {
 	/* Do nothing for zero guest external interrupts */
-	if (!kvm_riscv_aia_nr_hgei)
+	if (!kvm_riscv_aia_hgei_enabled)
 		return;
 
 	/* Free per-CPU SGEI interrupt */
@@ -631,6 +631,7 @@ int kvm_riscv_aia_init(void)
 {
 	int rc;
 	const struct imsic_global_config *gc;
+	unsigned int kvm_riscv_aia_nr_hgei;
 
 	if (!riscv_isa_extension_available(NULL, SxAIA))
 		return -ENODEV;
@@ -641,21 +642,18 @@ int kvm_riscv_aia_init(void)
 	kvm_riscv_aia_nr_hgei = fls_long(csr_read(CSR_HGEIE));
 	csr_write(CSR_HGEIE, 0);
 	if (kvm_riscv_aia_nr_hgei)
-		kvm_riscv_aia_nr_hgei--;
+		kvm_riscv_aia_hgei_enabled = true;
 
 	/*
 	 * Number of usable HGEI lines should be minimum of per-HART
 	 * IMSIC guest files and number of bits in HGEIE
 	 */
-	if (gc)
-		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
-					    gc->nr_guest_files);
-	else
-		kvm_riscv_aia_nr_hgei = 0;
+	if (!gc)
+		kvm_riscv_aia_hgei_enabled = 0;
 
 	/* Find number of guest MSI IDs */
 	kvm_riscv_aia_max_ids = IMSIC_MAX_ID;
-	if (gc && kvm_riscv_aia_nr_hgei)
+	if (gc && kvm_riscv_aia_hgei_enabled)
 		kvm_riscv_aia_max_ids = gc->nr_guest_ids + 1;
 
 	/* Initialize guest external interrupt line management */
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 3d1e81e2a36b..5b45b1114425 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -71,7 +71,7 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 				 * external interrupts (i.e. non-zero
 				 * VS-level IMSIC pages).
 				 */
-				if (!kvm_riscv_aia_nr_hgei)
+				if (!kvm_riscv_aia_hgei_enabled)
 					return -EINVAL;
 				break;
 			default:
@@ -628,7 +628,7 @@ void kvm_riscv_aia_init_vm(struct kvm *kvm)
 	 */
 
 	/* Initialize default values in AIA global context */
-	aia->mode = (kvm_riscv_aia_nr_hgei) ?
+	aia->mode = (kvm_riscv_aia_hgei_enabled) ?
 		KVM_DEV_RISCV_AIA_MODE_AUTO : KVM_DEV_RISCV_AIA_MODE_EMUL;
 	aia->nr_ids = kvm_riscv_aia_max_ids - 1;
 	aia->nr_sources = 0;
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index cb8a65273c1f..bcfa139f4871 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -169,8 +169,7 @@ static int __init riscv_kvm_init(void)
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
 	if (kvm_riscv_aia_available())
-		kvm_info("AIA available with %d guest external interrupts\n",
-			 kvm_riscv_aia_nr_hgei);
+		kvm_info("AIA available with guest external interrupts\n");
 
 	kvm_riscv_setup_vendor_features();
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
