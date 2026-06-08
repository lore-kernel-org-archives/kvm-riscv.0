Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F53CD8CA4
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwSJlrTR+MEfyoN7J5WbRpG069XfDxE3GWhxZRgI8JU=; b=flJAuRkNtmfWxu
	hiNGLB7Npt7E1lKhp+7HTeDxlPxXhtBIIclNCnwHI78XetxfNkkRIrFKBKQXOb0Tk7b87AlQm8Unf
	79jVDtdSWqWRGfEPGR0nsesK/Yiw3UBDby8tJB9MmXjfNZsngdzf2klEQGkF5OO13jB3gnhQ2ft44
	e5Lro2d2Gvzu40xOOO4yv6CS+PPE0sfzfJYu0eGW1E2UaX8hvvVupDuA4kvnHFIj8MGoX5nenR/h+
	s+7Y+EPWMu8gdLp+ihrcyUHO0NvkJSzfbKWjsraYatZMIrE2ZKY66v5cuSL9LszdF1Qo8/ZsINpKV
	/hZEFD8rzrZhiJyMthgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCB-00000003pgI-0UrN;
	Mon, 08 Jun 2026 14:43:19 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC5-00000003pSS-3ypM
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:16 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B17262028B4;
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
Subject: [PATCH 17/60] kvm: Move VCPU locking to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:09 +0200
Message-ID: <20260608144252.351443-18-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074314_134959_FEF9E024 
X-CRM114-Status: GOOD (  11.62  )
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

Fields in struct kvm_vcpu which are protected by these locks is going
to move to struct kvm_vcpu_common. So move the locks as well.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 include/linux/kvm_host.h | 31 +++++++++++++++++--------------
 virt/kvm/kvm_main.c      |  3 ++-
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 611bba515ac0..c8085c23e18e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -330,6 +330,13 @@ struct kvm_vcpu_common {
 	/* Currently active VCPU */
 	struct kvm_vcpu *current_vcpu;
 
+	/* Locks */
+	int ____srcu_idx; /* Don't use this directly.  You've been warned. */
+#ifdef CONFIG_PROVE_RCU
+	int srcu_depth;
+#endif
+	struct mutex mutex;
+
 	/* Scheduling state */
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
@@ -347,15 +354,11 @@ struct kvm_vcpu {
 	int cpu;
 	int vcpu_id; /* id given by userspace at creation */
 	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
-	int ____srcu_idx; /* Don't use this directly.  You've been warned. */
-#ifdef CONFIG_PROVE_RCU
-	int srcu_depth;
-#endif
+
 	int mode;
 	u64 requests;
 	unsigned long guest_debug;
 
-	struct mutex mutex;
 	struct kvm_run *run;
 
 #ifndef __KVM_HAVE_ARCH_WQP
@@ -1001,35 +1004,35 @@ static inline void kvm_vm_bugged(struct kvm *kvm)
 
 static inline void kvm_vcpu_lock(struct kvm_vcpu *vcpu)
 {
-	mutex_lock(&vcpu->mutex);
+	mutex_lock(&vcpu->common->mutex);
 }
 
 static inline void kvm_vcpu_unlock(struct kvm_vcpu *vcpu)
 {
-	mutex_unlock(&vcpu->mutex);
+	mutex_unlock(&vcpu->common->mutex);
 }
 
 static inline struct mutex *kvm_vcpu_mutex(struct kvm_vcpu *vcpu)
 {
-	return &vcpu->mutex;
+	return &vcpu->common->mutex;
 }
 
 static inline void kvm_vcpu_srcu_read_lock(struct kvm_vcpu *vcpu)
 {
 #ifdef CONFIG_PROVE_RCU
-	WARN_ONCE(vcpu->srcu_depth++,
-		  "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->srcu_depth - 1);
+	WARN_ONCE(vcpu->common->srcu_depth++,
+		  "KVM: Illegal vCPU srcu_idx LOCK, depth=%d", vcpu->common->srcu_depth - 1);
 #endif
-	vcpu->____srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+	vcpu->common->____srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 }
 
 static inline void kvm_vcpu_srcu_read_unlock(struct kvm_vcpu *vcpu)
 {
-	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->____srcu_idx);
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->common->____srcu_idx);
 
 #ifdef CONFIG_PROVE_RCU
-	WARN_ONCE(--vcpu->srcu_depth,
-		  "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->srcu_depth);
+	WARN_ONCE(--vcpu->common->srcu_depth,
+		  "KVM: Illegal vCPU srcu_idx UNLOCK, depth=%d", vcpu->common->srcu_depth);
 #endif
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d6975a5c60b4..9accca10c249 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -466,6 +466,8 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 	common->vcpu_idx = atomic_read(&kvm->online_vcpus);
 
+	mutex_init(&common->mutex);
+
 	common->kvm = kvm;
 	common->current_vcpu = vcpu;
 
@@ -500,7 +502,6 @@ static void kvm_vcpu_finish_common(struct kvm_vcpu *vcpu)
 
 static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 {
-	mutex_init(&vcpu->mutex);
 	vcpu->cpu = -1;
 	vcpu->kvm = kvm;
 	vcpu->plane = kvm->planes[0];
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
