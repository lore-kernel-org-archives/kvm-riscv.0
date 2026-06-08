Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCFDCD8CAA
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6j3RYiAXlMJ3LpXaHqx9jCV9HBiNY/PlE292u5Z8q20=; b=HiXL4U9DCUf/VV
	a6hJwsWmxKjsJAGKeKK6NaWRxsEimcdf1c+HWRCdDE/XvLtv+kttO+EXXEn6CGBW20rULJKn4/TsT
	jX64Q0uQyCIKxhaCf7R9NtXRW5GufdBY9uoWxnwNMRvcMOu62w3tqC2PMsc3+a4Q8KIuHAggf9Nej
	0zZo8FRZC4P3H4dqqKsCAANGtPkMug2Phhvr0VHlU9cAUxmkzYJ5JPNca2FvDaklqCRihRWqK82Lr
	FS9Sg83HlGUldBZ5NdRzieeVXI4xMGKH/sDYvt9t1R0/OTbNaDy4Ec7LkDBk5E8V4OX0z1oX3bVzk
	3gMlS0K5I8H6MHpEQ+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCG-00000003prr-2tZm;
	Mon, 08 Jun 2026 14:43:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCC-00000003pgl-0KZ6
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=My5MLwjyzAqnp4jO971RL3doflqPg87miFqNXGSw5vA=; b=WrK6dRhO7pBR4MiFCODqnTn1/1
	e8tLFGnx3LWMOsHj/H3KT5pss1PCbi0PL4NhUKfqN74/OXVhFgUzgFXYGE3HzKc6HacIKQAduILLs
	I984jJVRUSBxzmiiDsulbv6kIvxvK5L0LLZx9X5Q/9WJdRmRAuBiD/+vCzsClLOS5+oSGYDBZFkRB
	PZPUYSs1Y4zTomv0paja68Jc26N9ijT7KNef5giCQfPeTzxakBbL+gc8jS+Z+UTDCUQgTzMuIAdSP
	Si9BD1ZtAq0Yh4VcyeFLLS5bmC+P3ZLkT9vlUFg/LaKny8jakXVXZ1iKV4itwIc0CmRwCiC5WwR3F
	tQwZfk8g==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbC7-0000000198p-2wqR
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:17 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E5D642028B5;
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
Subject: [PATCH 18/60] kvm: Move kvm_vcpu->rcuwait to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:10 +0200
Message-ID: <20260608144252.351443-19-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154315_992591_EA0DFD9E 
X-CRM114-Status: GOOD (  10.97  )
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

The rcuwait member is used to block and wake a VCPU thread. Since all
plane VCPUs share a thread, there must only be a single wait object.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/loongarch/kvm/timer.c | 2 +-
 arch/mips/kvm/mips.c       | 4 ++--
 include/linux/kvm_host.h   | 9 +++++----
 virt/kvm/kvm_main.c        | 7 ++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/loongarch/kvm/timer.c b/arch/loongarch/kvm/timer.c
index 8356fce0043f..9da10aa90558 100644
--- a/arch/loongarch/kvm/timer.c
+++ b/arch/loongarch/kvm/timer.c
@@ -31,7 +31,7 @@ enum hrtimer_restart kvm_swtimer_wakeup(struct hrtimer *timer)
 
 	vcpu = container_of(timer, struct kvm_vcpu, arch.swtimer);
 	kvm_queue_irq(vcpu, INT_TI);
-	rcuwait_wake_up(&vcpu->wait);
+	rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
 
 	return HRTIMER_NORESTART;
 }
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index f928ba105104..6469ec246dd6 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -265,7 +265,7 @@ static enum hrtimer_restart kvm_mips_comparecount_wakeup(struct hrtimer *timer)
 	kvm_mips_callbacks->queue_timer_int(vcpu);
 
 	vcpu->arch.wait = 0;
-	rcuwait_wake_up(&vcpu->wait);
+	rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
 
 	return kvm_mips_count_timeout(vcpu);
 }
@@ -507,7 +507,7 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
 
 	dvcpu->arch.wait = 0;
 
-	rcuwait_wake_up(&dvcpu->wait);
+	rcuwait_wake_up(kvm_arch_vcpu_get_wait(dvcpu));
 
 	return 0;
 }
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c8085c23e18e..c08ede1cefd2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -337,6 +337,10 @@ struct kvm_vcpu_common {
 #endif
 	struct mutex mutex;
 
+#ifndef __KVM_HAVE_ARCH_WQP
+	struct rcuwait wait;
+#endif
+
 	/* Scheduling state */
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
@@ -361,9 +365,6 @@ struct kvm_vcpu {
 
 	struct kvm_run *run;
 
-#ifndef __KVM_HAVE_ARCH_WQP
-	struct rcuwait wait;
-#endif
 	struct pid *pid;
 	rwlock_t pid_lock;
 	int sigset_active;
@@ -1806,7 +1807,7 @@ static inline struct rcuwait *kvm_arch_vcpu_get_wait(struct kvm_vcpu *vcpu)
 #ifdef __KVM_HAVE_ARCH_WQP
 	return vcpu->arch.waitp;
 #else
-	return &vcpu->wait;
+	return &vcpu->common->wait;
 #endif
 }
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 9accca10c249..11e0d4af82df 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -468,6 +468,10 @@ static int kvm_vcpu_init_common(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned
 
 	mutex_init(&common->mutex);
 
+#ifndef __KVM_HAVE_ARCH_WQP
+	rcuwait_init(&common->wait);
+#endif
+
 	common->kvm = kvm;
 	common->current_vcpu = vcpu;
 
@@ -508,9 +512,6 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
 	vcpu->vcpu_id = id;
 	vcpu->pid = NULL;
 	rwlock_init(&vcpu->pid_lock);
-#ifndef __KVM_HAVE_ARCH_WQP
-	rcuwait_init(&vcpu->wait);
-#endif
 	kvm_async_pf_vcpu_init(vcpu);
 
 	kvm_vcpu_set_in_spin_loop(vcpu, false);
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
