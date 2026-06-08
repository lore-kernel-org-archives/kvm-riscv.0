Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8306CD98CB
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBa005qBUoBgUbZKK9RQd0ezaYPhEo47gdW36n0aH94=; b=0pk5R4coDblZBe
	IxPsDxli/jp86RbX+ZOb1l0EYoYbpXaH/l/YVsQ/Xj289tIGXBN/fGJB8NG+Bvq9PTopptfK9OzKu
	GfiYNrIKOZZwEzqS0F/dbYu8I/ydPE4N/zs+WUtWEOd/6aywPx2pLWLVjZ67rl7/+NwvgTGvCOQsI
	OHa8zd2H7Wnk4+VkGfu+AVDhHcaig+/h6E32dFVVEROIotaIArVjT/hiaQmuaEL9pu/JpHzFfBS0i
	5GHIGpwJGBO5phhUGVI3SguJNmPy9HMDFWAgYzhc/9kqUdhV8nOn8916beOBzG09jwlL/VHSoPpF4
	6KUTQ2AGa9hEJ42rZPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCM-00000003q3n-1sQj;
	Mon, 08 Jun 2026 14:43:30 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCA-00000003pTK-02Uz
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:22 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 0BE7C2028C8;
	Mon,  8 Jun 2026 16:43:13 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com
Subject: [PATCH 37/60] kvm: Pass plane_level to kvm_set_routing_entry()
Date: Mon,  8 Jun 2026 16:42:29 +0200
Message-ID: <20260608144252.351443-38-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074318_802534_FD464BC5 
X-CRM114-Status: GOOD (  13.86  )
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

From: Joerg Roedel <joerg.roedel@amd.com>

The plane_level is used to route MSI IRQs to the correct plane.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/vgic/vgic-irqfd.c | 6 ++++--
 arch/loongarch/kvm/irqfd.c       | 6 ++++--
 arch/powerpc/kvm/mpic.c          | 5 +++--
 arch/riscv/kvm/vm.c              | 5 +++--
 arch/s390/kvm/interrupt.c        | 3 ++-
 arch/x86/kvm/irq.c               | 7 ++++---
 include/linux/kvm_host.h         | 3 ++-
 virt/kvm/irqchip.c               | 2 +-
 8 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-irqfd.c b/arch/arm64/kvm/vgic/vgic-irqfd.c
index 479b896c8954..53e5fcc591d7 100644
--- a/arch/arm64/kvm/vgic/vgic-irqfd.c
+++ b/arch/arm64/kvm/vgic/vgic-irqfd.c
@@ -33,11 +33,13 @@ static int vgic_irqfd_set_irq(struct kvm_kernel_irq_routing_entry *e,
  * @kvm: the VM this entry is applied to
  * @e: kvm kernel routing entry handle
  * @ue: user api routing entry handle
+ * @plane_level: target plane level
  * return 0 on success, -EINVAL on errors.
  */
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	int r = -EINVAL;
 
@@ -57,7 +59,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.data = ue->u.msi.data;
 		e->msi.flags = ue->flags;
 		e->msi.devid = ue->u.msi.devid;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 		break;
 	default:
 		goto out;
diff --git a/arch/loongarch/kvm/irqfd.c b/arch/loongarch/kvm/irqfd.c
index 50f0c32df46c..a36a8a9d8a66 100644
--- a/arch/loongarch/kvm/irqfd.c
+++ b/arch/loongarch/kvm/irqfd.c
@@ -39,11 +39,13 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
  * @kvm: the VM this entry is applied to
  * @e: kvm kernel routing entry handle
  * @ue: user api routing entry handle
+ * @plane_level: target plane level
  * return 0 on success, -EINVAL on errors.
  */
 int kvm_set_routing_entry(struct kvm *kvm,
 			struct kvm_kernel_irq_routing_entry *e,
-			const struct kvm_irq_routing_entry *ue)
+			const struct kvm_irq_routing_entry *ue,
+			unsigned plane_level)
 {
 	switch (ue->type) {
 	case KVM_IRQ_ROUTING_IRQCHIP:
@@ -60,7 +62,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 		return 0;
 	default:
 		return -EINVAL;
diff --git a/arch/powerpc/kvm/mpic.c b/arch/powerpc/kvm/mpic.c
index 0f568f5fff8b..6b6eba7fbf75 100644
--- a/arch/powerpc/kvm/mpic.c
+++ b/arch/powerpc/kvm/mpic.c
@@ -1824,7 +1824,8 @@ int kvm_set_msi(struct kvm_kernel_irq_routing_entry *e,
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	int r = -EINVAL;
 
@@ -1841,7 +1842,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 		break;
 	default:
 		goto out;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index f518247e699b..6b3c8a0e74e2 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -118,7 +118,8 @@ bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	int r = -EINVAL;
 
@@ -138,7 +139,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.data = ue->u.msi.data;
 		e->msi.flags = ue->flags;
 		e->msi.devid = ue->u.msi.devid;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 		break;
 	default:
 		goto out;
diff --git a/arch/s390/kvm/interrupt.c b/arch/s390/kvm/interrupt.c
index 1d66ef9f7527..dbd6029773aa 100644
--- a/arch/s390/kvm/interrupt.c
+++ b/arch/s390/kvm/interrupt.c
@@ -2862,7 +2862,8 @@ void kvm_s390_reinject_machine_check(struct kvm_vcpu *vcpu,
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	const struct kvm_irq_routing_s390_adapter *adapter;
 	u64 uaddr_s, uaddr_i;
diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index b7e08eddb765..d2ecfd54d57a 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -295,7 +295,8 @@ bool kvm_arch_can_set_irq_routing(struct kvm *kvm)
 
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue)
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level)
 {
 	/* We can't check irqchip_in_kernel() here as some callers are
 	 * currently initializing the irqchip. Other callers should therefore
@@ -304,7 +305,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 	switch (ue->type) {
 #ifdef CONFIG_KVM_IOAPIC
 	case KVM_IRQ_ROUTING_IRQCHIP:
-		if (irqchip_split(kvm))
+		if (irqchip_split(kvm) || plane_level != 0)
 			return -EINVAL;
 		e->irqchip.pin = ue->u.irqchip.pin;
 		switch (ue->u.irqchip.irqchip) {
@@ -332,7 +333,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		e->msi.address_lo = ue->u.msi.address_lo;
 		e->msi.address_hi = ue->u.msi.address_hi;
 		e->msi.data = ue->u.msi.data;
-		e->msi.plane_level = 0;
+		e->msi.plane_level = plane_level;
 
 		if (kvm_msi_route_invalid(kvm, e))
 			return -EINVAL;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 16dcca3132d3..cfb6911d6771 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2355,7 +2355,8 @@ int kvm_set_irq_routing(struct kvm *kvm,
 int kvm_init_irq_routing(struct kvm *kvm);
 int kvm_set_routing_entry(struct kvm *kvm,
 			  struct kvm_kernel_irq_routing_entry *e,
-			  const struct kvm_irq_routing_entry *ue);
+			  const struct kvm_irq_routing_entry *ue,
+			  unsigned plane_level);
 void kvm_free_irq_routing(struct kvm *kvm);
 
 #else
diff --git a/virt/kvm/irqchip.c b/virt/kvm/irqchip.c
index ae47e56176f1..14480d1df4f9 100644
--- a/virt/kvm/irqchip.c
+++ b/virt/kvm/irqchip.c
@@ -146,7 +146,7 @@ static int setup_routing_entry(struct kvm *kvm,
 
 	e->gsi = gsi;
 	e->type = ue->type;
-	r = kvm_set_routing_entry(kvm, e, ue);
+	r = kvm_set_routing_entry(kvm, e, ue, 0);
 	if (r)
 		return r;
 	if (e->type == KVM_IRQ_ROUTING_IRQCHIP)
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
