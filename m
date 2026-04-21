Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC28F8FA8E
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIXBpMVlBug+GeiMlQGRBhcKipeEyXsBqbyXQTybdsg=; b=lR+H90oczSR2Va
	HFtjKC4/htziuKiZcD4jCOLA6SBdus0pUCZwCPk+WSkKoQA0KXU8XTHOWdD99JMXMbdjjlbmlHWuQ
	zvCGwBcCJdaboDIFlUwqHqcFlyTJFiNV6EKk5pEU0ttip/VOqT10pVHI6f7n0BdCZjgNne/n3sTBP
	z6q4hG0n6cuTSQHHZZ6nB4txA53461O57BJWr4ggiEd2aldYt5RRsiKCXkxwqIKfdOG9so+0ux0F8
	neb9tTVcdRcWaztlGen/nKc/Y2aVVTnOj8N5gMziYdRGZ+SjVmXTRnmDP0Kz0+B9vRSkXRbe6vaic
	tp6gh+WNZBgvgArHshSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCVo-00000008n2w-1Zhv;
	Tue, 21 Apr 2026 14:55:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCVn-00000008n2l-07gs;
	Tue, 21 Apr 2026 14:55:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7905F6001A;
	Tue, 21 Apr 2026 14:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00CDC2BCB7;
	Tue, 21 Apr 2026 14:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783338;
	bh=yNgRE8sbFsnNOSNkaFVjWslqS4WljCPIev13eHJ7d2Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RTKaUxrB6CCnvZO9DbKdwed0dvhzWBIhh60yKBBdZYUyGLOrHzPTFZA7VguG797+W
	 kVkG6kerplCHTSg9AX1bJ2r91cZYFZzb2YEoem/3RRDl8AhkXZK3jb2w88mhKz+JZ+
	 gcxQWAC2bM15un1YqKrH6ktP5Or/M4bAZc8FhwcLWqzcWWn/iJCC+1f45RNGNoxRdI
	 N3eJR/humoI3w9Besak31t3dcQXLb+Fj7b/Kh7Q9VMZ3eR9G03rLKRM6NbsSoBkI8n
	 Tgckp5xr4/ct4QeAcsTQsjsXF+jAkXG5sKawrPriiiEyd7etliMmg2LWM+5eEsEUuS
	 olYFcyAOSDeQg==
From: guoren@kernel.org
To: fangyu.yu@linux.alibaba.com,
	cp0613@linux.alibaba.com,
	inochiama@gmail.com,
	me@ziyao.cc,
	gaohan@iscas.ac.cn,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	tglx@kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] RISC-V: KVM: AIA: Make HGEI number and management fully per-CPU
Date: Tue, 21 Apr 2026 10:54:48 -0400
Message-Id: <20260421145451.1597930-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20260421145451.1597930-1-guoren@kernel.org>
References: <20260421145451.1597930-1-guoren@kernel.org>
MIME-Version: 1.0
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

Previously the number of Hypervisor Guest External Interrupt (HGEI)
lines was stored in a single global variable `kvm_riscv_aia_nr_hgei`
and assumed to be the same for all HARTs. This assumption does not
hold on heterogeneous RISC-V SoCs where different cores may expose
different HGEIE CSR widths.

Introduce `nr_hgei` field into the per-CPU `struct aia_hgei_control`
and probe the actual supported HGEI count for the current HART in
`kvm_riscv_aia_enable()` using the standard RISC-V CSR probe
technique:

    csr_write(CSR_HGEIE, -1UL);
    nr = fls_long(csr_read(CSR_HGEIE));
    if (nr)
        nr--;

All HGEI allocation, free and disable paths (`kvm_riscv_aia_free_hgei()`,
`kvm_riscv_aia_disable()`, etc.) now use the per-CPU value instead of
the global one.

The early global `kvm_riscv_aia_nr_hgei` is kept only for deciding
whether SGEI interrupt registration is needed; the real per-HART
initialization of lock and free_bitmap is moved to enable time.

This makes KVM AIA robust on big.LITTLE-style and multi-vendor
asymmetric platforms.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kvm/aia.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 5ec503288555..a23729052cfb 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -23,6 +23,7 @@ struct aia_hgei_control {
 	raw_spinlock_t lock;
 	unsigned long free_bitmap;
 	struct kvm_vcpu *owners[BITS_PER_LONG];
+	unsigned int nr_hgei;
 };
 static DEFINE_PER_CPU(struct aia_hgei_control, aia_hgei);
 static int hgei_parent_irq;
@@ -452,7 +453,7 @@ void kvm_riscv_aia_free_hgei(int cpu, int hgei)
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-	if (hgei > 0 && hgei <= kvm_riscv_aia_nr_hgei) {
+	if (hgei > 0 && hgei <= hgctrl->nr_hgei) {
 		if (!(hgctrl->free_bitmap & BIT(hgei))) {
 			hgctrl->free_bitmap |= BIT(hgei);
 			hgctrl->owners[hgei] = NULL;
@@ -486,21 +487,8 @@ static irqreturn_t hgei_interrupt(int irq, void *dev_id)
 
 static int aia_hgei_init(void)
 {
-	int cpu, rc;
+	int rc;
 	struct irq_domain *domain;
-	struct aia_hgei_control *hgctrl;
-
-	/* Initialize per-CPU guest external interrupt line management */
-	for_each_possible_cpu(cpu) {
-		hgctrl = per_cpu_ptr(&aia_hgei, cpu);
-		raw_spin_lock_init(&hgctrl->lock);
-		if (kvm_riscv_aia_nr_hgei) {
-			hgctrl->free_bitmap =
-				BIT(kvm_riscv_aia_nr_hgei + 1) - 1;
-			hgctrl->free_bitmap &= ~BIT(0);
-		} else
-			hgctrl->free_bitmap = 0;
-	}
 
 	/* Skip SGEI interrupt setup for zero guest external interrupts */
 	if (!kvm_riscv_aia_nr_hgei)
@@ -545,9 +533,29 @@ static void aia_hgei_exit(void)
 
 void kvm_riscv_aia_enable(void)
 {
+	struct aia_hgei_control *hgctrl;
+
 	if (!kvm_riscv_aia_available())
 		return;
 
+	hgctrl = this_cpu_ptr(&aia_hgei);
+
+	/* Figure-out number of bits in HGEIE */
+	csr_write(CSR_HGEIE, -1UL);
+	hgctrl->nr_hgei = fls_long(csr_read(CSR_HGEIE));
+	csr_write(CSR_HGEIE, 0);
+	if (hgctrl->nr_hgei)
+		hgctrl->nr_hgei--;
+
+	if (hgctrl->nr_hgei) {
+		hgctrl->free_bitmap = BIT(hgctrl->nr_hgei + 1) - 1;
+		hgctrl->free_bitmap &= ~BIT(0);
+	} else {
+		hgctrl->free_bitmap = 0;
+	}
+
+	raw_spin_lock_init(&hgctrl->lock);
+
 	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);
@@ -588,7 +596,7 @@ void kvm_riscv_aia_disable(void)
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-	for (i = 0; i <= kvm_riscv_aia_nr_hgei; i++) {
+	for (i = 0; i <= hgctrl->nr_hgei; i++) {
 		vcpu = hgctrl->owners[i];
 		if (!vcpu)
 			continue;
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
