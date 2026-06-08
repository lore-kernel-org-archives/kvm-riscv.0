Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFBBCD8C92
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0ERyUFm+9g6A8DOIucHMI2RuDGouObjlENC2K8PF94=; b=uHxX+/gPcXYD6T
	7jQjNmwpiqmhFHk6rNfYnPy9R+lv3l4t4VBk79ZkiYU4K6uU446nyZZ0nydFmKYs4+AGuqZXQpy2b
	dB7N584Jvu6nYIkdppA5Ht9RYbu+9cDs10UnahLjvRFweZBW0acJtHLHmHALt/KKdWfc3rgIDDnO5
	9r3v4/oXkUQXIMjLqK+6Wh7PAM+soupUT5tfEh2EuUPdZGEYOKokofJ8jM6xIV9UbL8l3f2K54OW3
	ItLNFhUVxGNQGk5Mtbt2PTdvjYitCiV189u2xwNRowysqjbatxPZ+sBXLx7yqrF+PSrrJaw5ZPF1w
	3wfqnVlex7Mhaf+7snTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC9-00000003pe3-40mu;
	Mon, 08 Jun 2026 14:43:17 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC5-00000003pTt-0bgz
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:15 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 16F122028B1;
	Mon,  8 Jun 2026 16:43:08 +0200 (CEST)
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
Subject: [PATCH 14/60] kvm: Make kvm_running_vcpus point to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:06 +0200
Message-ID: <20260608144252.351443-15-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074313_402819_56719E32 
X-CRM114-Status: GOOD (  13.63  )
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

This will remove the need to update kvm_running_vcpu on plane
switches.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/arch_timer.c     |  3 ++-
 arch/arm64/kvm/vgic/vgic-init.c |  3 ++-
 include/linux/kvm_host.h        |  2 +-
 virt/kvm/kvm_main.c             | 18 +++++++++++-------
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index cbea4d9ee955..b2c4f422414e 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -204,7 +204,8 @@ static void soft_timer_cancel(struct hrtimer *hrt)
 
 static irqreturn_t kvm_arch_timer_handler(int irq, void *dev_id)
 {
-	struct kvm_vcpu *vcpu = *(struct kvm_vcpu **)dev_id;
+	struct kvm_vcpu_common *common = *(struct kvm_vcpu_common **)dev_id;
+	struct kvm_vcpu *vcpu = common->current_vcpu;
 	struct arch_timer_context *ctx;
 	struct timer_map map;
 
diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 933983bb2005..a12b89b423d5 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -730,7 +730,8 @@ void kvm_vgic_cpu_down(void)
 
 static irqreturn_t vgic_maintenance_handler(int irq, void *data)
 {
-	struct kvm_vcpu *vcpu = *(struct kvm_vcpu **)data;
+	struct kvm_vcpu_common *common = *(struct kvm_vcpu_common **)data;
+	struct kvm_vcpu *vcpu = common->current_vcpu;
 
 	/*
 	 * We cannot rely on the vgic maintenance interrupt to be
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b334c15d834e..d54f299218a4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2462,7 +2462,7 @@ static inline bool kvm_is_visible_memslot(struct kvm_memory_slot *memslot)
 }
 
 struct kvm_vcpu *kvm_get_running_vcpu(void);
-struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void);
+struct kvm_vcpu_common * __percpu *kvm_get_running_vcpus(void);
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
 struct kvm_kernel_irqfd;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2c16e124a507..9c07321e30f4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -113,7 +113,7 @@ LIST_HEAD(vm_list);
 static struct kmem_cache *kvm_vcpu_cache;
 
 static __read_mostly struct preempt_ops kvm_preempt_ops;
-static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_running_vcpu);
+static DEFINE_PER_CPU(struct kvm_vcpu_common *, kvm_running_vcpu);
 
 static struct dentry *kvm_debugfs_dir;
 
@@ -165,7 +165,7 @@ void vcpu_load(struct kvm_vcpu *vcpu)
 {
 	int cpu = get_cpu();
 
-	__this_cpu_write(kvm_running_vcpu, vcpu);
+	__this_cpu_write(kvm_running_vcpu, vcpu->common);
 	preempt_notifier_register(&vcpu->preempt_notifier);
 	kvm_arch_vcpu_load(vcpu, cpu);
 	put_cpu();
@@ -3954,7 +3954,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait)
 	 * kick" check does not need atomic operations if kvm_vcpu_kick is used
 	 * within the vCPU thread itself.
 	 */
-	if (vcpu == __this_cpu_read(kvm_running_vcpu)) {
+	if (vcpu == kvm_get_running_vcpu()) {
 		if (vcpu->mode == IN_GUEST_MODE)
 			WRITE_ONCE(vcpu->mode, EXITING_GUEST_MODE);
 		goto out;
@@ -6500,7 +6500,7 @@ static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 	WRITE_ONCE(vcpu->preempted, false);
 	WRITE_ONCE(vcpu->ready, false);
 
-	__this_cpu_write(kvm_running_vcpu, vcpu);
+	__this_cpu_write(kvm_running_vcpu, vcpu->common);
 	kvm_arch_vcpu_load(vcpu, cpu);
 
 	WRITE_ONCE(vcpu->scheduled_out, false);
@@ -6532,12 +6532,16 @@ static void kvm_sched_out(struct preempt_notifier *pn,
  */
 struct kvm_vcpu *kvm_get_running_vcpu(void)
 {
-	struct kvm_vcpu *vcpu;
+	struct kvm_vcpu_common *common;
+	struct kvm_vcpu *vcpu = NULL;
 
 	preempt_disable();
-	vcpu = __this_cpu_read(kvm_running_vcpu);
+	common = __this_cpu_read(kvm_running_vcpu);
 	preempt_enable();
 
+	if (common)
+		vcpu = common->current_vcpu;
+
 	return vcpu;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_running_vcpu);
@@ -6545,7 +6549,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_running_vcpu);
 /**
  * kvm_get_running_vcpus - get the per-CPU array of currently running vcpus.
  */
-struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void)
+struct kvm_vcpu_common * __percpu *kvm_get_running_vcpus(void)
 {
         return &kvm_running_vcpu;
 }
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
