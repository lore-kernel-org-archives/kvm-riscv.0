Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50560CD8CAE
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBc4xrCpgGyFpmER50cJSIMT4W8jDQcWHptNrRJ+7w8=; b=GLbL04jUaOGVf4
	KtOfLJUzOXnPg3XLgUdKNOEg9OEqBU+/vLEBFhjEN3FROzko2MUIlwGM41y080a4YQjfmoXGlwbrP
	E+I7nIW+/NNe7VeekjzqxWM+asyWqA9n9AgG0crV5U7jOObVhoCkrJwP8EWlSq61iLJTwNGKLCBzN
	Skmz8HEIyBX5hjFsZOwfQwCXvMzStsfnTuY9HsuYNgXcfHlyeVyBhYe44ViMiNo4T6zkUcv1p4oE/
	QMkbvKh1EoFJQkSvZCvlnTRmy7t5gxNlQ75GzaRL1+eo1WSkAj09n4y6XNqI3ohNcLToG6CEobrPI
	XJbUd6wNPPVJpUDvQI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCF-00000003ppo-36nn;
	Mon, 08 Jun 2026 14:43:23 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC8-00000003pTb-3G0Q
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:19 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B53292028C2;
	Mon,  8 Jun 2026 16:43:11 +0200 (CEST)
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
Subject: [PATCH 31/60] kvm: Allocate struct kvm_plane in architecture code
Date: Mon,  8 Jun 2026 16:42:23 +0200
Message-ID: <20260608144252.351443-32-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074316_998063_3BB22D22 
X-CRM114-Status: GOOD (  11.71  )
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

Move plane allocation to architecture code so that per-arch
implementations can embed the structure into another one for keeping
additional data.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/arm.c       | 13 +++++++++++++
 arch/loongarch/kvm/vm.c    | 13 +++++++++++++
 arch/mips/kvm/mips.c       | 13 +++++++++++++
 arch/powerpc/kvm/powerpc.c | 13 +++++++++++++
 arch/riscv/kvm/main.c      | 13 +++++++++++++
 arch/s390/kvm/kvm-s390.c   | 13 +++++++++++++
 arch/x86/kvm/x86.c         | 13 +++++++++++++
 include/linux/kvm_host.h   |  2 ++
 virt/kvm/kvm_main.c        |  6 +++---
 9 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 7e6d2773fd39..d7a4b9b239dc 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -205,6 +205,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 /**
  * kvm_arch_init_vm - initializes a VM data structure
  * @kvm:	pointer to the KVM struct
diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
index 14f1232c6e0c..e4d2814b717d 100644
--- a/arch/loongarch/kvm/vm.c
+++ b/arch/loongarch/kvm/vm.c
@@ -114,6 +114,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 60870452119d..e22d2a267e03 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -120,6 +120,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 {
 	return false;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index cfa40be20e00..35658cded0cb 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -504,6 +504,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 {
 	int r;
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 5adba3a455a3..46834b2ddfae 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -22,6 +22,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 static void kvm_riscv_setup_vendor_features(void)
 {
 	/* Andes AX66: split two-stage TLBs */
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 24f24ea95f86..94c40b2aa759 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -3191,6 +3191,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 void kvm_arch_free_vm(struct kvm *kvm)
 {
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 25299c8c28e3..d6bf0425525c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -487,6 +487,19 @@ unsigned kvm_arch_max_planes(struct kvm *kvm)
 	return 1;
 }
 
+struct kvm_plane *kvm_alloc_plane(void)
+{
+	/* For better type checking, do not return kzalloc() value directly */
+	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+
+	return plane;
+}
+
+void kvm_free_plane(struct kvm_plane *plane)
+{
+	kfree(plane);
+}
+
 /*
  * All feature MSRs except uCode revID, which tracks the currently loaded uCode
  * patch, are immutable once the vCPU model is defined.
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 90b97137840e..55e3e9046975 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1157,6 +1157,8 @@ void vcpu_load(struct kvm_vcpu *vcpu);
 void vcpu_put(struct kvm_vcpu *vcpu);
 
 unsigned kvm_arch_max_planes(struct kvm *kvm);
+struct kvm_plane *kvm_alloc_plane(void);
+void kvm_free_plane(struct kvm_plane *plane);
 
 #ifdef CONFIG_KVM_IOAPIC
 void kvm_arch_post_irq_ack_notifier_list_update(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f0f78bb74e51..4f2c8f46a0d3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1209,7 +1209,7 @@ static void kvm_disable_virtualization(void);
 
 static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 {
-	struct kvm_plane *plane = kzalloc(sizeof(*plane), GFP_KERNEL_ACCOUNT);
+	struct kvm_plane *plane = kvm_alloc_plane();
 
 	if (!plane)
 		return NULL;
@@ -1227,7 +1227,7 @@ static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 	return plane;
 
 out_free_plane:
-	kfree(plane);
+	kvm_free_plane(plane);
 
 	return NULL;
 }
@@ -1235,7 +1235,7 @@ static struct kvm_plane *kvm_create_plane(struct kvm *kvm, unsigned plane_level)
 static void kvm_destroy_one_plane(struct kvm_plane *plane)
 {
 	kvm_arch_plane_destroy(plane);
-	kfree(plane);
+	kvm_free_plane(plane);
 }
 
 static void kvm_destroy_planes(struct kvm *kvm)
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
