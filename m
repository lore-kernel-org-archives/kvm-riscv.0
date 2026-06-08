Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E29CD8CB2
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyH08GGX+UlwbTp6pwb8nNNb2m5oWIidCByYIdQ1Zl8=; b=XAfmmEjSvO+Q63
	p+/O4gbLS23c3IoqPNhAlDk7AcBqScuak1jIGxpBANqH6AoIz+oaCZQuWrizH14YcJ70VIF/28Fhz
	nG02eGYKAQjA4dKj9rnmDlMs/MRjyQgtfucMg5TldQya7aM9l17vLVsA3CcwKqlQg/Yd72ZTl3Yvq
	bJ11KAnGfz3Q6q22/GeMvqVCGnp+aTJ2e76Z4l5aLTy8mJaG7CypgGVCaiPDwg+Hg/bbVewwYje3e
	4jxtKBAV/0vhVNS+GxSqSjPgco1jP2zdu0u/OXD3cgj4res10wXmehKNFptusZM3I8xtEcE+PONEE
	ohgjZyI9TcS4Ig1hoURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCG-00000003pqx-1iYY;
	Mon, 08 Jun 2026 14:43:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCB-00000003pg0-3Bx2
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IQVvPGHJGdKrENP/iTp5FAPDw3c3hMze2t29/y8qAkQ=; b=lofLFrvj6AryWNZVk0rUmITmIP
	9B1PPCOvU8k4y11ZbZVtCxCaERZjnvabY8yCr7ETYc15XbaCv+TcZAKFxYSht53oX/jDy1zEOnZSN
	cX49kC9DYc7ny0iWeIvs9bzT8AmH5WT4Q2goJeXnPj+rIa0QI6IzwCNa3CvPQNl6yAzMQ7EDf8X2/
	xMjD9quK4/fedfLLRxJpNqsob4yEVT08hB74g96B30PqHt3Yqt4Tnq05Jt1UbtblUfeZeVV3vZiSh
	BV/4veC1TbvThLoFBzaYlDGRHt2oorenJg51CvCsY+xwh0p+g1/cwKbBcpcb4bHzkvG814khIZSoM
	Xtb09n+w==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbC6-0000000198i-23Qb
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:17 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D1CDA2028B0;
	Mon,  8 Jun 2026 16:43:07 +0200 (CEST)
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
Subject: [PATCH 13/60] kvm: Add read accessors for kvm_vcpu scheduling state
Date: Mon,  8 Jun 2026 16:42:05 +0200
Message-ID: <20260608144252.351443-14-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154315_484860_62302731 
X-CRM114-Status: GOOD (  19.68  )
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

Introduce accessor functions for the scheduling state in struct
kvm_vcpu to make it easier to move these fields to struct
kvm_vcpu_common.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/kvm/arm.c           |  2 +-
 arch/arm64/kvm/nested.c        |  2 +-
 arch/loongarch/kvm/vcpu.c      |  5 +++--
 arch/mips/kvm/mips.c           |  2 +-
 arch/powerpc/kvm/powerpc.c     |  2 +-
 arch/riscv/kvm/vcpu.c          |  2 +-
 arch/s390/kvm/kvm-s390.c       |  2 +-
 arch/x86/kvm/svm/svm.c         |  2 +-
 arch/x86/kvm/vmx/posted_intr.c |  2 +-
 arch/x86/kvm/vmx/vmx.c         |  2 +-
 arch/x86/kvm/x86.c             | 12 ++++++------
 arch/x86/kvm/xen.h             |  2 +-
 include/linux/kvm_host.h       | 20 ++++++++++++++++++++
 virt/kvm/kvm_main.c            |  6 +++---
 14 files changed, 42 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9453321ef8c6..de00088c9a80 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1253,7 +1253,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	vcpu_load(vcpu);
 
-	if (!vcpu->wants_to_run) {
+	if (!kvm_vcpu_wants_to_run(vcpu)) {
 		ret = -EINTR;
 		goto out;
 	}
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 6f7bc9a9992e..b84b1edb02d8 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -822,7 +822,7 @@ void kvm_vcpu_put_hw_mmu(struct kvm_vcpu *vcpu)
 	 * scheduling out and not in WFI emulation, suggesting it is likely to
 	 * reuse the MMU sometime soon.
 	 */
-	if (vcpu->scheduled_out && !vcpu_get_flag(vcpu, IN_WFI))
+	if (kvm_vcpu_scheduled_out(vcpu) && !vcpu_get_flag(vcpu, IN_WFI))
 		return;
 
 	if (kvm_is_nested_s2_mmu(vcpu->kvm, vcpu->arch.hw_mmu))
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index e28084c49e68..bde8b68b8273 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1847,7 +1847,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	int cpu, idx;
 	unsigned long flags;
 
-	if (vcpu->preempted && kvm_guest_has_pv_feature(vcpu, KVM_FEATURE_PREEMPT)) {
+	if (kvm_vcpu_preempted(vcpu) &&
+	    kvm_guest_has_pv_feature(vcpu, KVM_FEATURE_PREEMPT)) {
 		/*
 		 * Take the srcu lock as memslots will be accessed to check
 		 * the gfn cache generation against the memslots generation.
@@ -1887,7 +1888,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		break;
 	}
 
-	if (!vcpu->wants_to_run)
+	if (!kvm_vcpu_wants_to_run(vcpu))
 		return r;
 
 	/* Clear exit_reason */
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a53abbba43ea..f928ba105104 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -433,7 +433,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		vcpu->mmio_needed = 0;
 	}
 
-	if (!vcpu->wants_to_run)
+	if (!kvm_vcpu_wants_to_run(vcpu))
 		goto out;
 
 	lose_fpu(1);
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 00302399fc37..800867c164c6 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1840,7 +1840,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	kvm_sigset_activate(vcpu);
 
-	if (!vcpu->wants_to_run)
+	if (!kvm_vcpu_wants_to_run(vcpu))
 		r = -EINTR;
 	else
 		r = kvmppc_vcpu_run(vcpu);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a73690eda84b..8519a5bfbdc4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -862,7 +862,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		return ret;
 	}
 
-	if (!vcpu->wants_to_run) {
+	if (!kvm_vcpu_wants_to_run(vcpu)) {
 		kvm_vcpu_srcu_read_unlock(vcpu);
 		return -EINTR;
 	}
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index ffb20a64d328..8401bcad1f37 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -4954,7 +4954,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	if (vcpu->kvm->arch.pv.dumping)
 		return -EINVAL;
 
-	if (!vcpu->wants_to_run)
+	if (!kvm_vcpu_wants_to_run(vcpu))
 		return -EINTR;
 
 	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 295e02c17b9b..1524c1bb4f37 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1475,7 +1475,7 @@ static void svm_prepare_host_switch(struct kvm_vcpu *vcpu)
 
 static void svm_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
-	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
+	if (kvm_vcpu_scheduled_out(vcpu) && !kvm_pause_in_guest(vcpu->kvm))
 		shrink_ple_window(vcpu);
 
 	if (kvm_vcpu_apicv_active(vcpu))
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 4a6d9a17da23..cba1e6346fc5 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -239,7 +239,7 @@ void vmx_vcpu_pi_put(struct kvm_vcpu *vcpu)
 	 * the cost of propagating PIR.IRR to PID.ON is negligible compared to
 	 * the cost of a spurious IRQ, and vCPU put/load is a slow path.
 	 */
-	if (!vcpu->preempted && kvm_vcpu_is_blocking(vcpu) &&
+	if (!kvm_vcpu_preempted(vcpu) && kvm_vcpu_is_blocking(vcpu) &&
 	    ((is_td_vcpu(vcpu) && tdx_interrupt_allowed(vcpu)) ||
 	     (!is_td_vcpu(vcpu) && !vmx_interrupt_blocked(vcpu))))
 		pi_enable_wakeup_handler(vcpu);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index a82a4197d18a..20262855bfe8 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1552,7 +1552,7 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu)
  */
 void vmx_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
-	if (vcpu->scheduled_out && !kvm_pause_in_guest(vcpu->kvm))
+	if (kvm_vcpu_scheduled_out(vcpu) && !kvm_pause_in_guest(vcpu->kvm))
 		shrink_ple_window(vcpu);
 
 	vmx_vcpu_load_vmcs(vcpu, cpu);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4b6b628efa21..6355fe7f546f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5168,7 +5168,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_request_l1tf_flush_l1d();
 
-	if (vcpu->scheduled_out && pmu->version && pmu->event_count) {
+	if (kvm_vcpu_scheduled_out(vcpu) && pmu->version && pmu->event_count) {
 		pmu->need_cleanup = true;
 		kvm_make_request(KVM_REQ_PMU, vcpu);
 	}
@@ -5293,7 +5293,7 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	int idx;
 
-	if (vcpu->preempted) {
+	if (kvm_vcpu_preempted(vcpu)) {
 		/*
 		 * Assume protected guests are in-kernel.  Inefficient yielding
 		 * due to false positives is preferable to never yielding due
@@ -10404,7 +10404,7 @@ static void kvm_sched_yield(struct kvm_vcpu *vcpu, unsigned long dest_id)
 
 	rcu_read_unlock();
 
-	if (!target || !READ_ONCE(target->ready))
+	if (!target || !kvm_vcpu_ready(target))
 		goto no_yield;
 
 	/* Ignore requests to yield to self */
@@ -12041,7 +12041,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	kvm_vcpu_srcu_read_lock(vcpu);
 	if (unlikely(vcpu->arch.mp_state == KVM_MP_STATE_UNINITIALIZED)) {
-		if (!vcpu->wants_to_run) {
+		if (!kvm_vcpu_wants_to_run(vcpu)) {
 			r = -EINTR;
 			goto out;
 		}
@@ -12120,7 +12120,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		WARN_ON_ONCE(vcpu->mmio_needed);
 	}
 
-	if (!vcpu->wants_to_run) {
+	if (!kvm_vcpu_wants_to_run(vcpu)) {
 		r = -EINTR;
 		goto out;
 	}
@@ -13021,7 +13021,7 @@ static void kvm_xstate_reset(struct kvm_vcpu *vcpu, bool init_event)
 	 * only path that can trigger INIT emulation _and_ loads FPU state, and
 	 * KVM_RUN should _always_ load FPU state.
 	 */
-	WARN_ON_ONCE(vcpu->wants_to_run != fpstate->in_use);
+	WARN_ON_ONCE(kvm_vcpu_wants_to_run(vcpu) != fpstate->in_use);
 	fpu_in_use = fpstate->in_use;
 	if (fpu_in_use)
 		kvm_put_guest_fpu(vcpu);
diff --git a/arch/x86/kvm/xen.h b/arch/x86/kvm/xen.h
index 59e6128a7bd3..78793c1ac913 100644
--- a/arch/x86/kvm/xen.h
+++ b/arch/x86/kvm/xen.h
@@ -206,7 +206,7 @@ static inline void kvm_xen_runstate_set_preempted(struct kvm_vcpu *vcpu)
 	 * behalf of the vCPU. Only if the VMM does actually block
 	 * does it need to enter RUNSTATE_blocked.
 	 */
-	if (WARN_ON_ONCE(!vcpu->preempted))
+	if (WARN_ON_ONCE(!kvm_vcpu_preempted(vcpu)))
 		return;
 
 	kvm_xen_update_runstate(vcpu, RUNSTATE_runnable);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 47144a83f9c5..b334c15d834e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -414,6 +414,26 @@ struct kvm_vcpu {
 	unsigned plane_level;
 };
 
+static inline bool kvm_vcpu_wants_to_run(struct kvm_vcpu *vcpu)
+{
+	return vcpu->wants_to_run;
+}
+
+static inline bool kvm_vcpu_preempted(struct kvm_vcpu *vcpu)
+{
+	return READ_ONCE(vcpu->preempted);
+}
+
+static inline bool kvm_vcpu_ready(struct kvm_vcpu *vcpu)
+{
+	return READ_ONCE(vcpu->ready);
+}
+
+static inline bool kvm_vcpu_scheduled_out(struct kvm_vcpu *vcpu)
+{
+	return vcpu->scheduled_out;
+}
+
 /*
  * Start accounting time towards a guest.
  * Must be called before entering guest context.
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 14e74cdc4709..2c16e124a507 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4132,7 +4132,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 			continue;
 
 		vcpu = xa_load(&kvm->planes[0]->vcpu_array, idx);
-		if (!READ_ONCE(vcpu->ready))
+		if (!kvm_vcpu_ready(vcpu))
 			continue;
 		if (kvm_vcpu_is_blocking(vcpu) && !vcpu_dy_runnable(vcpu))
 			continue;
@@ -4143,7 +4143,7 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
 		 * waiting on IPI delivery, i.e. the target vCPU is in-kernel
 		 * for the purposes of directed yield.
 		 */
-		if (READ_ONCE(vcpu->preempted) && yield_to_kernel_mode &&
+		if (kvm_vcpu_preempted(vcpu) && yield_to_kernel_mode &&
 		    !kvm_arch_dy_has_pending_interrupt(vcpu) &&
 		    !kvm_arch_vcpu_preempted_in_kernel(vcpu))
 			continue;
@@ -6513,7 +6513,7 @@ static void kvm_sched_out(struct preempt_notifier *pn,
 
 	WRITE_ONCE(vcpu->scheduled_out, true);
 
-	if (task_is_runnable(current) && vcpu->wants_to_run) {
+	if (task_is_runnable(current) && kvm_vcpu_wants_to_run(vcpu)) {
 		WRITE_ONCE(vcpu->preempted, true);
 		WRITE_ONCE(vcpu->ready, true);
 	}
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
