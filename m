Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DF1CD8CA4
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=472IHxs4J/bgOZ0wZh1kUmI67XxQUzXqAhKW+ICOCHI=; b=IPSYWH8x8K6sAV
	ngR4AHaTunngKK2hx7LIxoJg4nXmnbIDqYXklpMhkurfdyZo2hWGvq7qRTN2h2jAsCwAipuXPJObu
	yLePt2tyFEg0otUepWiWSezNtv2QLHQioLewCLwN+7F3TRZ7NVH0XvNP4zlacEAQQFTS7fkWOm4dY
	LLBEeyyBK55g585czqMs+WYzf+7Ok0ldTKOdjrOv2ko+ER/WeaTL+BKubtNv7QyTqCbC1gIg1EkCd
	BIlzAWoE+5pTHRXvsmfaPpBfK0cWdrQgOB/6FiUzsJv72xmmYDldJ5+tNCXQE5e80ez7PWLrMhDR7
	mcIPQaoRjOXZy3wIDb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCH-00000003pti-2atH;
	Mon, 08 Jun 2026 14:43:25 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC9-00000003pSK-2oBH
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9229F2028C6;
	Mon,  8 Jun 2026 16:43:12 +0200 (CEST)
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
Subject: [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
Date: Mon,  8 Jun 2026 16:42:27 +0200
Message-ID: <20260608144252.351443-36-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074317_901544_8210AA53 
X-CRM114-Status: GOOD (  14.41  )
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

The algorithm is to always run the lowest runnable plane. Plane
switches are done by stopping the current plane and setting another
runnable.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 16 ++++++++++++++
 virt/kvm/kvm_main.c      | 45 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5c3f9dfa15ea..e3611e6cc3e4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -168,6 +168,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQ_VM_DEAD			(1 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_UNBLOCK			2
 #define KVM_REQ_DIRTY_RING_SOFT_FULL	3
+#define KVM_REQ_PLANE_RESCHED		4
 #define KVM_REQUEST_ARCH_BASE		8
 
 /*
@@ -324,6 +325,8 @@ struct kvm_mmio_fragment {
 	unsigned int len;
 };
 
+
+
 struct kvm_vcpu_common {
 	struct kvm *kvm;
 
@@ -381,6 +384,8 @@ struct kvm_vcpu_common {
 
 	struct kvm_dirty_ring dirty_ring;
 
+	bool plane_switch;
+
 	struct kvm_vcpu_arch_common arch;
 };
 
@@ -388,6 +393,12 @@ struct kvm_vcpu_common {
 	for ((i) = 0; (i) < KVM_MAX_PLANES; ++(i))		\
 		if (((v) = common->vcpus[(i)]) != NULL)
 
+/* Tracked per plane-VCPU - used for deciding which plane-vcpu to run */
+enum kvm_vcpu_state {
+	STOPPED,
+	RUNNABLE,
+};
+
 struct kvm_vcpu {
 	struct kvm *kvm;
 	struct kvm_plane *plane;
@@ -401,6 +412,7 @@ struct kvm_vcpu {
 	struct kvm_run *run;
 
 	u64 plane_requests;
+	enum kvm_vcpu_state plane_state;
 
 	/* S390 only */
 	bool valid_wakeup;
@@ -440,6 +452,10 @@ struct kvm_vcpu {
 	unsigned plane_level;
 };
 
+void kvm_vcpu_set_plane_runnable(struct kvm_vcpu *vcpu);
+void kvm_vcpu_set_plane_stopped(struct kvm_vcpu *vcpu);
+struct kvm_vcpu *kvm_vcpu_select_plane(struct kvm_vcpu *vcpu);
+
 static inline bool kvm_vcpu_wants_to_run(struct kvm_vcpu *vcpu)
 {
 	return vcpu->common->wants_to_run;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9d30fd85ce5f..a30123b77112 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4397,6 +4397,7 @@ static int kvm_plane_ioctl_create_vcpu(struct kvm_plane *plane, unsigned long id
 	vcpu->vcpu_idx = vcpu->common->vcpu_idx;
 	vcpu->plane = plane;
 	vcpu->plane_level = plane->level;
+	vcpu->plane_state = STOPPED;
 	vcpu->run = vcpu->common->run;
 
 	kvm_vcpu_init(vcpu, kvm, id);
@@ -4938,6 +4939,50 @@ static struct file_operations kvm_plane_fops = {
 	KVM_COMPAT(kvm_plane_ioctl),
 };
 
+void kvm_vcpu_set_plane_runnable(struct kvm_vcpu *vcpu)
+{
+	vcpu->plane_state = RUNNABLE;
+	vcpu->common->plane_switch = true;
+	kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_set_plane_runnable);
+
+void kvm_vcpu_set_plane_stopped(struct kvm_vcpu *vcpu)
+{
+	vcpu->plane_state = STOPPED;
+	kvm_make_request(KVM_REQ_PLANE_RESCHED, vcpu);
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_set_plane_stopped);
+
+struct kvm_vcpu *kvm_vcpu_select_plane(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_common *common = vcpu->common;
+	struct kvm_vcpu *ret = NULL;
+	unsigned i;
+
+	for (i = 0; i < KVM_MAX_PLANES; i++) {
+		if (common->vcpus[i] == NULL)
+			continue;
+
+		if (common->vcpus[i]->plane_state == RUNNABLE) {
+			ret = common->vcpus[i];
+			break;
+		}
+	}
+
+	if (ret == NULL) {
+		ret = common->vcpus[0];
+		ret->plane_state = RUNNABLE;
+	}
+
+	common->current_vcpu = ret;
+
+	common->plane_switch = false;
+
+	return ret;
+}
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_select_plane);
+
 static int kvm_device_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct kvm_device *dev = filp->private_data;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
