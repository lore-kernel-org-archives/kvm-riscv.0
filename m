Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F22CD8CAD
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAcm2rtEi826QDIK4p4k2hL2UXR+g6olk9sTdQxphDU=; b=pSi1nplC+tbtlm
	TZ0fOyTJCUZptPMDpBtdxWwhmbQdDlufmJmhESTvyo0vbIoz32KHPQfHn0NuFOBUvGBo85sqa4bGo
	Kbe2K985gdZyFI6osKpSk3XJjOxieFFs5wDbrmZNJhWdkJekMLHT6Bjf+W9+0c5GNJMIlhG3+KPZA
	l9hncE/qrAIjXpRp5pTnM4CKPH0ym16DIJqi5S0V7w18Moi7C5rjBTIFWgLtXnOvjGvpUVR7r+4nJ
	8nqBWkTsRpodkoorRNFWPOQHDriXTRdDwp+1kqXH1KgN6Z31MZBI9+yKfzwYOZu+imy/1zHiWOSB8
	oGPoePkRj2MjYiaAjp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCC-00000003pk5-49RD;
	Mon, 08 Jun 2026 14:43:21 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC5-00000003pSK-2tdy
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:17 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4B2B22028B2;
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
Subject: [PATCH 15/60] kvm: Move VCPU scheduling state to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:07 +0200
Message-ID: <20260608144252.351443-16-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074313_886189_D407B4CD 
X-CRM114-Status: GOOD (  16.06  )
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

The scheduling state of the KVM VCPU is shared between all per-plane
VCPU objects. Move it to struct kvm_vcpu_common.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/svm.c   |  2 +-
 include/linux/kvm_host.h | 24 ++++++++++----------
 virt/kvm/kvm_main.c      | 47 +++++++++++++++++++++-------------------
 3 files changed, 39 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 1524c1bb4f37..f5cc30a6732f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -229,7 +229,7 @@ int svm_set_efer(struct kvm_vcpu *vcpu, u64 efer)
 			 * and only if the vCPU is actively running, e.g. to
 			 * avoid positives if userspace is stuffing state.
 			 */
-			if (is_guest_mode(vcpu) && vcpu->wants_to_run)
+			if (is_guest_mode(vcpu) && vcpu->common->wants_to_run)
 				kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
 
 			svm_leave_nested(vcpu);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index d54f299218a4..a6aacd507c02 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -329,15 +329,21 @@ struct kvm_vcpu_common {
 
 	/* Currently active VCPU */
 	struct kvm_vcpu *current_vcpu;
+
+	/* Scheduling state */
+#ifdef CONFIG_PREEMPT_NOTIFIERS
+	struct preempt_notifier preempt_notifier;
+#endif
+	bool wants_to_run;
+	bool preempted;
+	bool ready;
+	bool scheduled_out;
 };
 
 struct kvm_vcpu {
 	struct kvm *kvm;
 	struct kvm_plane *plane;
 
-#ifdef CONFIG_PREEMPT_NOTIFIERS
-	struct preempt_notifier preempt_notifier;
-#endif
 	int cpu;
 	int vcpu_id; /* id given by userspace at creation */
 	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
@@ -392,10 +398,6 @@ struct kvm_vcpu {
 		bool dy_eligible;
 	} spin_loop;
 #endif
-	bool wants_to_run;
-	bool preempted;
-	bool ready;
-	bool scheduled_out;
 	struct kvm_vcpu_arch arch;
 	struct kvm_vcpu_stat stat;
 	char stats_id[KVM_STATS_NAME_SIZE];
@@ -416,22 +418,22 @@ struct kvm_vcpu {
 
 static inline bool kvm_vcpu_wants_to_run(struct kvm_vcpu *vcpu)
 {
-	return vcpu->wants_to_run;
+	return vcpu->common->wants_to_run;
 }
 
 static inline bool kvm_vcpu_preempted(struct kvm_vcpu *vcpu)
 {
-	return READ_ONCE(vcpu->preempted);
+	return READ_ONCE(vcpu->common->preempted);
 }
 
 static inline bool kvm_vcpu_ready(struct kvm_vcpu *vcpu)
 {
-	return READ_ONCE(vcpu->ready);
+	return READ_ONCE(vcpu->common->ready);
 }
 
 static inline bool kvm_vcpu_scheduled_out(struct kvm_vcpu *vcpu)
 {
-	return vcpu->scheduled_out;
+	return vcpu->common->scheduled_out;
 }
 
 /*
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9c07321e30f4..a44f8dc8418a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -166,7 +166,7 @@ void vcpu_load(struct kvm_vcpu *vcpu)
 	int cpu = get_cpu();
 
 	__this_cpu_write(kvm_running_vcpu, vcpu->common);
-	preempt_notifier_register(&vcpu->preempt_notifier);
+	preempt_notifier_register(&vcpu->common->preempt_notifier);
 	kvm_arch_vcpu_load(vcpu, cpu);
 	put_cpu();
 }
@@ -176,7 +176,7 @@ void vcpu_put(struct kvm_vcpu *vcpu)
 {
 	preempt_disable();
 	kvm_arch_vcpu_put(vcpu);
-	preempt_notifier_unregister(&vcpu->preempt_notifier);
+	preempt_notifier_unregister(&vcpu->common->preempt_notifier);
 	__this_cpu_write(kvm_running_vcpu, NULL);
 	preempt_enable();
 }
@@ -468,6 +468,12 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 	common->kvm = kvm;
 	common->current_vcpu = vcpu;
+
+	common->wants_to_run = false;
+	common->preempted = false;
+	common->ready = false;
+	preempt_notifier_init(&common->preempt_notifier, &kvm_preempt_ops);
+
 	vcpu->common = no_free_ptr(common);
 
 	return 0;
@@ -508,9 +514,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
 	kvm_vcpu_set_dy_eligible(vcpu, false);
-	vcpu->preempted = false;
-	vcpu->ready = false;
-	preempt_notifier_init(&vcpu->preempt_notifier, &kvm_preempt_ops);
 	vcpu->last_used_slot = NULL;
 
 	vcpu->plane_level = 0;
@@ -3927,7 +3930,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_halt);
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
 {
 	if (__kvm_vcpu_wake_up(vcpu)) {
-		WRITE_ONCE(vcpu->ready, true);
+		WRITE_ONCE(vcpu->common->ready, true);
 		++vcpu->stat.generic.halt_wakeup;
 		return true;
 	}
@@ -4580,9 +4583,9 @@ static long kvm_vcpu_ioctl(struct file *filp,
 
 			put_pid(oldpid);
 		}
-		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
+		vcpu->common->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
-		vcpu->wants_to_run = false;
+		vcpu->common->wants_to_run = false;
 
 		/*
 		 * FIXME: Remove this hack once all KVM architectures
@@ -6488,36 +6491,36 @@ static void kvm_init_debug(void)
 }
 
 static inline
-struct kvm_vcpu *preempt_notifier_to_vcpu(struct preempt_notifier *pn)
+struct kvm_vcpu_common *preempt_notifier_to_vcpu_common(struct preempt_notifier *pn)
 {
-	return container_of(pn, struct kvm_vcpu, preempt_notifier);
+	return container_of(pn, struct kvm_vcpu_common, preempt_notifier);
 }
 
 static void kvm_sched_in(struct preempt_notifier *pn, int cpu)
 {
-	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
+	struct kvm_vcpu_common *common = preempt_notifier_to_vcpu_common(pn);
 
-	WRITE_ONCE(vcpu->preempted, false);
-	WRITE_ONCE(vcpu->ready, false);
+	WRITE_ONCE(common->preempted, false);
+	WRITE_ONCE(common->ready, false);
 
-	__this_cpu_write(kvm_running_vcpu, vcpu->common);
-	kvm_arch_vcpu_load(vcpu, cpu);
+	__this_cpu_write(kvm_running_vcpu, common);
+	kvm_arch_vcpu_load(common->current_vcpu, cpu);
 
-	WRITE_ONCE(vcpu->scheduled_out, false);
+	WRITE_ONCE(common->scheduled_out, false);
 }
 
 static void kvm_sched_out(struct preempt_notifier *pn,
 			  struct task_struct *next)
 {
-	struct kvm_vcpu *vcpu = preempt_notifier_to_vcpu(pn);
+	struct kvm_vcpu_common *common = preempt_notifier_to_vcpu_common(pn);
 
-	WRITE_ONCE(vcpu->scheduled_out, true);
+	WRITE_ONCE(common->scheduled_out, true);
 
-	if (task_is_runnable(current) && kvm_vcpu_wants_to_run(vcpu)) {
-		WRITE_ONCE(vcpu->preempted, true);
-		WRITE_ONCE(vcpu->ready, true);
+	if (task_is_runnable(current) && common->wants_to_run) {
+		WRITE_ONCE(common->preempted, true);
+		WRITE_ONCE(common->ready, true);
 	}
-	kvm_arch_vcpu_put(vcpu);
+	kvm_arch_vcpu_put(common->current_vcpu);
 	__this_cpu_write(kvm_running_vcpu, NULL);
 }
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
