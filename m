Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0986BCD8CAB
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1Yb02qYmcnpgRRZzOS4NjWWcl5QqPW96j8kE86EO64=; b=llwfojHZFuP6hZ
	sKeYF8ox3lCVQocpe+ygmoFjaEPHjRUcu+qi3HfQUrtbD5WMtfH0BugY3CLcT0giV6TkKbxV9DSBz
	B1ldcSYX0Yqevd4f+8DxIHXq0VEj1PJPZU3dhuUty0YiTf0HmJvY/DyAxc66V9ZRwV3yL1e0AFfAV
	FbR7QG3Pnm7z36VrdCnjexZAm8zpeZ+WXajoMvqh33FUmcPiTJFYxFGxYPVh7IkBtpAb3bERUE7c5
	aX7JOJAM5uMLKjh3mCd50Y7WXeFEEl1i635b3anHkIU9qmBtCJ63/LURsDJOUHQkUGef+IYxhfDqi
	v+A+pO4fAXqZtqNf4/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCI-00000003pw9-2Qn8;
	Mon, 08 Jun 2026 14:43:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCC-00000003piA-2Ok6
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GK3GGE9DhTl+C9mVcDok7LIpbBsR+s/tVCtGWQo3hTs=; b=FZQAA5zJ1ufvYlcBTfvUShvlaX
	fo2ID1Q+Df2NVvU2m53L6HqeqzIX/KaWzOH5pXmeY5NxouN0hJLerWWBAmVm9R+lBRltxGdleVtym
	M5jpslv4GLhlISUWw09H1IXY+0Cv40jRBP7radDqSNcjZwIvSJ1O+92TPnnAF3+4ioFa1odYkGuTG
	tdHECUUemFyNoqAo+TEqKllq3Ddl9nNFDe0rcxZKC5sGkJgaGD8Q+Re4xa+F3yytZk/F0m4sXYSN8
	9Puut8eq1kU+IozR9nTAlrWnf2RbFd148zJij6aM27vd8ktD3Nn3eprC6EE6tDP+Woev/ga6MGmVX
	LdQkmY8w==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbC7-0000000198y-2xD6
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:18 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BF5B22028B8;
	Mon,  8 Jun 2026 16:43:09 +0200 (CEST)
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
Subject: [PATCH 22/60] kvm: Move kvm_vcpu pid members to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:14 +0200
Message-ID: <20260608144252.351443-23-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154316_005053_4F0728FB 
X-CRM114-Status: GOOD (  16.41  )
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

These are the same across all planes for one VCPU, so make then
shared.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 +-
 arch/arm64/kvm/arm.c              |  2 +-
 include/linux/kvm_host.h          |  5 ++--
 virt/kvm/kvm_main.c               | 44 ++++++++++++++++---------------
 4 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index a49042bfa801..32dc484781f0 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1270,7 +1270,7 @@ int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 void kvm_arm_halt_guest(struct kvm *kvm);
 void kvm_arm_resume_guest(struct kvm *kvm);
 
-#define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->pid))
+#define vcpu_has_run_once(vcpu)	(!!READ_ONCE((vcpu)->common->pid))
 
 #ifndef __KVM_NVHE_HYPERVISOR__
 #define kvm_call_hyp_nvhe(f, ...)						\
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 001f83f737ea..1e2f42134b74 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -726,7 +726,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (!cpumask_test_cpu(cpu, vcpu->kvm->arch.supported_cpus))
 		vcpu_set_on_unsupported_cpu(vcpu);
 
-	vcpu->arch.pid = pid_nr(vcpu->pid);
+	vcpu->arch.pid = pid_nr(vcpu->common->pid);
 }
 
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3c72a462ccfa..73786712495d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -346,6 +346,9 @@ struct kvm_vcpu_common {
 	int mode;
 	u64 requests;
 
+	struct pid *pid;
+	rwlock_t pid_lock;
+
 	/* Scheduling state */
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
@@ -368,8 +371,6 @@ struct kvm_vcpu {
 
 	struct kvm_run *run;
 
-	struct pid *pid;
-	rwlock_t pid_lock;
 	int sigset_active;
 	sigset_t sigset;
 	unsigned int halt_poll_ns;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 7ea20d96bc89..af3c4e0081b8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -475,6 +475,9 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 	common->kvm = kvm;
 	common->current_vcpu = vcpu;
 
+	common->pid = NULL;
+	rwlock_init(&common->pid_lock);
+
 	common->wants_to_run = false;
 	common->preempted = false;
 	common->ready = false;
@@ -510,8 +513,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	vcpu->kvm = kvm;
 	vcpu->plane = kvm->planes[0];
 	vcpu->vcpu_id = id;
-	vcpu->pid = NULL;
-	rwlock_init(&vcpu->pid_lock);
 	kvm_async_pf_vcpu_init(vcpu);
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
@@ -539,6 +540,12 @@ static void kvm_vcpu_common_destroy(struct kvm_vcpu *vcpu)
 	kvm->created_vcpus--;
 	mutex_unlock(&common->kvm->lock);
 
+	/*
+	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
+	 * the common->pid pointer, and at destruction time all file descriptors
+	 * are already gone.
+	 */
+	put_pid(common->pid);
 	kfree(common);
 }
 
@@ -549,13 +556,6 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kvm_vcpu_common_destroy(vcpu);
 	kvm_dirty_ring_free(&vcpu->dirty_ring);
 
-	/*
-	 * No need for rcu_read_lock as VCPU_RUN is the only place that changes
-	 * the vcpu->pid pointer, and at destruction time all file descriptors
-	 * are already gone.
-	 */
-	put_pid(vcpu->pid);
-
 	free_page((unsigned long)vcpu->run);
 	kmem_cache_free(kvm_vcpu_cache, vcpu);
 }
@@ -3996,16 +3996,17 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_vcpu_kick);
 
 int kvm_vcpu_yield_to(struct kvm_vcpu *target)
 {
+	struct kvm_vcpu_common *common = target->common;
 	struct task_struct *task = NULL;
 	int ret;
 
-	if (!read_trylock(&target->pid_lock))
+	if (!read_trylock(&common->pid_lock))
 		return 0;
 
-	if (target->pid)
-		task = get_pid_task(target->pid, PIDTYPE_PID);
+	if (common->pid)
+		task = get_pid_task(common->pid, PIDTYPE_PID);
 
-	read_unlock(&target->pid_lock);
+	read_unlock(&common->pid_lock);
 
 	if (!task)
 		return 0;
@@ -4258,9 +4259,9 @@ static int vcpu_get_pid(void *data, u64 *val)
 {
 	struct kvm_vcpu *vcpu = data;
 
-	read_lock(&vcpu->pid_lock);
-	*val = pid_nr(vcpu->pid);
-	read_unlock(&vcpu->pid_lock);
+	read_lock(&vcpu->common->pid_lock);
+	*val = pid_nr(vcpu->common->pid);
+	read_unlock(&vcpu->common->pid_lock);
 	return 0;
 }
 
@@ -4558,6 +4559,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		return -EINTR;
 	switch (ioctl) {
 	case KVM_RUN: {
+		struct kvm_vcpu_common *common = vcpu->common;
 		struct pid *oldpid;
 		r = -EINVAL;
 		if (arg)
@@ -4569,7 +4571,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		 * read vcpu->pid while this vCPU is in KVM_RUN, e.g. to yield
 		 * directly to this vCPU
 		 */
-		oldpid = vcpu->pid;
+		oldpid = common->pid;
 		if (unlikely(oldpid != task_pid(current))) {
 			/* The thread running this VCPU changed. */
 			struct pid *newpid;
@@ -4579,15 +4581,15 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				break;
 
 			newpid = get_task_pid(current, PIDTYPE_PID);
-			write_lock(&vcpu->pid_lock);
-			vcpu->pid = newpid;
-			write_unlock(&vcpu->pid_lock);
+			write_lock(&common->pid_lock);
+			common->pid = newpid;
+			write_unlock(&common->pid_lock);
 
 			put_pid(oldpid);
 		}
 		vcpu->common->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
-		vcpu->common->wants_to_run = false;
+		common->wants_to_run = false;
 
 		/*
 		 * FIXME: Remove this hack once all KVM architectures
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
