Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DDBD44C4E
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KhvHg3ls1SNwcpcoQwiCFhqXXMVJ+D6FuIfl1zuPP9g=; b=oLo+W607X+q/ca
	FdWPDGfzv6Qm7MAUReN8jv/7kPYu4MOmRiYu21MEhUJeG7fsa3NvDsO6vr7ycj/t0YxH1nQ8jFlc/
	dFA83nR4CXTc8R5QDEv/j6hCc/2d/kmnRw2kxL5T6PssdzyOyb2kmZQrnmLYmpmkHeiqlLnGXa+uT
	0s5oIlXczfWi05tZluah0tMJchljkw3fz3r1+wgfUUQ3sZXxI636DlPR2rTuPoRvfq95oA+moofmh
	IrieVBK7ecJaYwQEuh4mmDS7kqtW+MjqBJSGBr0biuDQjVt49aodvclKXigonYyaK0ns/9d76kRFl
	cYRMYXbq0psdSBte0uCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggaQ-0000000DtQX-3iOx;
	Fri, 16 Jan 2026 09:57:46 +0000
Received: from mailer.gwdg.de ([134.76.10.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggaO-0000000DtQ4-2cD0;
	Fri, 16 Jan 2026 09:57:45 +0000
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vggaI-0004Pd-03;
	Fri, 16 Jan 2026 10:57:38 +0100
Received: from Mac (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Fri, 16 Jan
 2026 10:57:37 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
To: <anup@brainfault.org>, <atish.patra@linux.dev>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <daniel.weber@cispa.de>,
	<marton.bognar@kuleuven.be>, <jo.vanbulck@kuleuven.be>,
	<michael.schwarz@cispa.de>, Lukas Gerlach <lukas.gerlach@cispa.de>
Subject: [PATCH] KVM: riscv: Fix Spectre-v1 in APLIC interrupt handling
Date: Fri, 16 Jan 2026 10:57:31 +0100
Message-ID: <20260116095731.24555-1-lukas.gerlach@cispa.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: MBX19-GWD-08.um.gwdg.de (10.108.142.61) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_015744_667144_FED2DCA2 
X-CRM114-Status: UNSURE (   7.89  )
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

Guests can control IRQ indices via MMIO. Sanitize them with
array_index_nospec() to prevent speculative out-of-bounds access
to the aplic->irqs[] array.

Similar to arm64 commit 41b87599c743 ("KVM: arm/arm64: vgic: fix possible
spectre-v1 in vgic_get_irq()") and x86 commit 8c86405f606c ("KVM: x86:
Protect ioapic_read_indirect() from Spectre-v1/L1TF attacks").

Fixes: 74967aa208e2 ("RISC-V: KVM: Add in-kernel emulation of AIA APLIC")
Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/kvm/aia_aplic.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index f59d1c0c8c43..a2b831e57ecd 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/riscv-aplic.h>
 #include <linux/kvm_host.h>
 #include <linux/math.h>
+#include <linux/nospec.h>
 #include <linux/spinlock.h>
 #include <linux/swab.h>
 #include <kvm/iodev.h>
@@ -45,7 +46,7 @@ static u32 aplic_read_sourcecfg(struct aplic *aplic, u32 irq)

 	if (!irq || aplic->nr_irqs <= irq)
 		return 0;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	raw_spin_lock_irqsave(&irqd->lock, flags);
 	ret = irqd->sourcecfg;
@@ -61,7 +62,7 @@ static void aplic_write_sourcecfg(struct aplic *aplic, u32 irq, u32 val)

 	if (!irq || aplic->nr_irqs <= irq)
 		return;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	if (val & APLIC_SOURCECFG_D)
 		val = 0;
@@ -81,7 +82,7 @@ static u32 aplic_read_target(struct aplic *aplic, u32 irq)

 	if (!irq || aplic->nr_irqs <= irq)
 		return 0;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	raw_spin_lock_irqsave(&irqd->lock, flags);
 	ret = irqd->target;
@@ -97,7 +98,7 @@ static void aplic_write_target(struct aplic *aplic, u32 irq, u32 val)

 	if (!irq || aplic->nr_irqs <= irq)
 		return;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	val &= APLIC_TARGET_EIID_MASK |
 	       (APLIC_TARGET_HART_IDX_MASK << APLIC_TARGET_HART_IDX_SHIFT) |
@@ -116,7 +117,7 @@ static bool aplic_read_pending(struct aplic *aplic, u32 irq)

 	if (!irq || aplic->nr_irqs <= irq)
 		return false;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	raw_spin_lock_irqsave(&irqd->lock, flags);
 	ret = (irqd->state & APLIC_IRQ_STATE_PENDING) ? true : false;
@@ -132,7 +133,7 @@ static void aplic_write_pending(struct aplic *aplic, u32 irq, bool pending)

 	if (!irq || aplic->nr_irqs <= irq)
 		return;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	raw_spin_lock_irqsave(&irqd->lock, flags);

@@ -170,7 +171,7 @@ static bool aplic_read_enabled(struct aplic *aplic, u32 irq)

 	if (!irq || aplic->nr_irqs <= irq)
 		return false;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	raw_spin_lock_irqsave(&irqd->lock, flags);
 	ret = (irqd->state & APLIC_IRQ_STATE_ENABLED) ? true : false;
@@ -186,7 +187,7 @@ static void aplic_write_enabled(struct aplic *aplic, u32 irq, bool enabled)

 	if (!irq || aplic->nr_irqs <= irq)
 		return;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	raw_spin_lock_irqsave(&irqd->lock, flags);
 	if (enabled)
@@ -205,7 +206,7 @@ static bool aplic_read_input(struct aplic *aplic, u32 irq)

 	if (!irq || aplic->nr_irqs <= irq)
 		return false;
-	irqd = &aplic->irqs[irq];
+	irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 	raw_spin_lock_irqsave(&irqd->lock, flags);

@@ -254,7 +255,7 @@ static void aplic_update_irq_range(struct kvm *kvm, u32 first, u32 last)
 	for (irq = first; irq <= last; irq++) {
 		if (!irq || aplic->nr_irqs <= irq)
 			continue;
-		irqd = &aplic->irqs[irq];
+		irqd = &aplic->irqs[array_index_nospec(irq, aplic->nr_irqs)];

 		raw_spin_lock_irqsave(&irqd->lock, flags);

@@ -283,7 +284,7 @@ int kvm_riscv_aia_aplic_inject(struct kvm *kvm, u32 source, bool level)

 	if (!aplic || !source || (aplic->nr_irqs <= source))
 		return -ENODEV;
-	irqd = &aplic->irqs[source];
+	irqd = &aplic->irqs[array_index_nospec(source, aplic->nr_irqs)];
 	ie = (aplic->domaincfg & APLIC_DOMAINCFG_IE) ? true : false;

 	raw_spin_lock_irqsave(&irqd->lock, flags);
--
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
