Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB7CCA0FF9
	for <kvm-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 02:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnSE3YyRWCrdN1s2b+/EN76l4M+w9b2tMJcQv+lHSJ8=; b=DCgEhgJ9m+Cel4
	YOje8BvLz2089Jy5CLYNPyXjcQ4dtCmprHyxkElQYba3Q3h2BYtIIDAWOG8ddK52pBNbQkgzlLBGO
	+TZuSa3fLziqiCDwZ6Mt/tzH1PhbZoaGPVMyocrIdYGCSdK8MM+M4bD05jd3esjTHw0WfG0xCNZAp
	06XOaWX1L3I+rW0LdVa2/efSSdNmhuxnwp4zn79tWHHoc2OI72Eepz36gi+Wdl+ooYmtE3S/A5x9N
	g+q51wNJS3a6rMSCmO7dYfp+7P+aSuoCVJlhyWVoPjOAmN/U1RbDnu+5raEQCVQMMk5Iw2h5igVpL
	murCC1lRRddhrDXOHhDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSXA-000000002ES-1FMA;
	Thu, 28 Aug 2025 02:38:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5p-0000000HIBR-1hR0
	for kvm-riscv@bombadil.infradead.org;
	Thu, 28 Aug 2025 00:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t0b6nfV8ACtHngFYCFD4a6X0clQjFgCPW+omDXt4bTs=; b=ENoXSg7hEgkPnjvb9u7rNLBjGO
	YDOWCY1Phy8LuQT2YIPaSHPlV8cWy33KLXbfkWlmPCTO1Ja6NIPutyCoSW0dj4MICoDyCCW27OvXh
	l9Y1L/scvEPon1u8nOvUEwfIEY1MY8ByeY3scfdzs5Mez8ANDDdDgixCndoPSA4rJiQVHwCg5KJzN
	5nh25g8R9XGV+Kimgu9j4tKon3uaLgji9TPATHpEc7U+qqV0+QAeVRQlXS1YDbZZMQ7Nejv9hzMT6
	28REmVfULAqM0jTCNs66QbnK9Sb5Itagm5Y0q5DRdudmf8LQiuTEwztVKTFXxHlEtnMKS61hgCFz0
	fXwe/qzg==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urQ5l-00000002YEv-15nK
	for kvm-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 00:02:16 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-244581ce13aso5913285ad.2
        for <kvm-riscv@lists.infradead.org>; Wed, 27 Aug 2025 17:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756339329; x=1756944129; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=t0b6nfV8ACtHngFYCFD4a6X0clQjFgCPW+omDXt4bTs=;
        b=UuUyboDHhsWqRcAp+EXdFEJpQzxXCfuBSDIsUbBCQ4IGdPXjOFgR/ODu8JAiHV8fA+
         VkpD7OaQhaVqkdZfwTP8JKejHWekXKB0VvOrJnNdSLtrK1UlNI7H44nIO/5FqDIXRUuX
         CbKsFanVMljtttci4qZ9iV3cz6vM2IdNzOD3GAX+eaVDCZmmtGlxdMxeft9PxZz26p7L
         CrCajVKjKUKFw1d4acnpygEMxD5m6IIBiRgl/og1GojrsvoAGAmDXaQ0HVejP312BMz/
         SJiN8D71J6JHorVsZ4ZD+uh1gVrXNV4Nyth2ti+YAf4PHn1gmrJOKzEJnvY8dzYYkHJt
         KY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756339329; x=1756944129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0b6nfV8ACtHngFYCFD4a6X0clQjFgCPW+omDXt4bTs=;
        b=MC8i4Assjre6CpowFKkzWeM7I/j9Q8kputNxUdBdypc8pKNoHIjatztKFXRVQav/yc
         CQ4+dWqq9YtH8LthfiNBwGX3FhDAZyvaLgNW2KtC17uXvVPnhve3MXIA3FdSGzg/7YfB
         A6VUX/wphDhoKP7ramDiel5oWYPS2vO/4H9RsiLghUGIrpr3jDLEEsE2+YAUG4K5xUlD
         6qPxxbSwEeWm9OMMmxItVxwojZjBbJ8kTd4sPyMqGtb6WT6CWLBTgFQSEeDUa6Hr6z9j
         ORPH5wXuTKEmgq0h7bTfj3J2/e9Ih0tGJ1sjo0/RU5a694GzCDGV/IKTWxrVrig1YNgo
         bgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUskOhwHDFcBRtHNEM+zBAilGEo3QrtK7+LkdRZN1Ezw5xpZ7uYFiSMUDmXaQjFFDFNh3Cau364eIc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxwlM78bBny8jNIeqEOvp22xPpiTHwiesqO2QwwqO71CDO0Ke2
	0pvqlfIpDq/bQpAcCz6SPKGfr7XW970gQgpbx0oVI5B0dEmRrxkGacJGHOW+60jycRguTF59Rie
	hp5PSSw==
X-Google-Smtp-Source: AGHT+IH/zSg0NOaA8AO8xJkIMVcmzaCiAN5K9jibnSscidupr23ZKkHWPw6r1BmEsVqQvRiXUejojziqfr0=
X-Received: from pjbpm10.prod.google.com ([2002:a17:90b:3c4a:b0:31e:fac4:4723])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:238e:b0:240:50ef:2f00
 with SMTP id d9443c01a7336-2462eea80fbmr326811935ad.26.1756339329158; Wed, 27
 Aug 2025 17:02:09 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:01:53 -0700
In-Reply-To: <20250828000156.23389-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250828000156.23389-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Message-ID: <20250828000156.23389-5-seanjc@google.com>
Subject: [PATCH v2 4/7] entry/kvm: KVM: Move KVM details related to
 signal/-EINTR into KVM proper
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org, 
	Nuno Das Neves <nunodasneves@linux.microsoft.com>, Mukesh R <mrathor@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_010213_508973_5D512144 
X-CRM114-Status: GOOD (  20.44  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Move KVM's morphing of pending signals into userspace exits into KVM
proper, and drop the @vcpu param from xfer_to_guest_mode_handle_work().
How KVM responds to -EINTR is a detail that really belongs in KVM itself,
and invoking kvm_handle_signal_exit() from kernel code creates an inverted
module dependency.  E.g. attempting to move kvm_handle_signal_exit() into
kvm_main.c would generate an linker error when building kvm.ko as a module.

Dropping KVM details will also converting the KVM "entry" code into a more
generic virtualization framework so that it can be used when running as a
Hyper-V root partition.

Lastly, eliminating usage of "struct kvm_vcpu" outside of KVM is also nice
to have for KVM x86 developers, as keeping the details of kvm_vcpu purely
within KVM allows changing the layout of the structure without having to
boot into a new kernel, e.g. allows rebuilding and reloading kvm.ko with a
modified kvm_vcpu structure as part of debug/development.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c      |  3 +--
 arch/loongarch/kvm/vcpu.c |  3 +--
 arch/riscv/kvm/vcpu.c     |  3 +--
 arch/x86/kvm/vmx/vmx.c    |  1 -
 arch/x86/kvm/x86.c        |  3 +--
 include/linux/entry-kvm.h | 11 +++--------
 include/linux/kvm_host.h  | 13 ++++++++++++-
 kernel/entry/kvm.c        | 13 +++++--------
 8 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 888f7c7abf54..418fd3043467 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -6,7 +6,6 @@
 
 #include <linux/bug.h>
 #include <linux/cpu_pm.h>
-#include <linux/entry-kvm.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
@@ -1177,7 +1176,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		/*
 		 * Check conditions before entering the guest
 		 */
-		ret = xfer_to_guest_mode_handle_work(vcpu);
+		ret = kvm_xfer_to_guest_mode_handle_work(vcpu);
 		if (!ret)
 			ret = 1;
 
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index d1b8c50941ca..514256b25ba1 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -4,7 +4,6 @@
  */
 
 #include <linux/kvm_host.h>
-#include <linux/entry-kvm.h>
 #include <asm/fpu.h>
 #include <asm/lbt.h>
 #include <asm/loongarch.h>
@@ -251,7 +250,7 @@ static int kvm_enter_guest_check(struct kvm_vcpu *vcpu)
 	/*
 	 * Check conditions before entering the guest
 	 */
-	ret = xfer_to_guest_mode_handle_work(vcpu);
+	ret = kvm_xfer_to_guest_mode_handle_work(vcpu);
 	if (ret < 0)
 		return ret;
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index f001e56403f9..251e787f2ebc 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -7,7 +7,6 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/entry-kvm.h>
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kdebug.h>
@@ -910,7 +909,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	while (ret > 0) {
 		/* Check conditions before entering the guest */
-		ret = xfer_to_guest_mode_handle_work(vcpu);
+		ret = kvm_xfer_to_guest_mode_handle_work(vcpu);
 		if (ret)
 			continue;
 		ret = 1;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index aa157fe5b7b3..d7c86613e50a 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -28,7 +28,6 @@
 #include <linux/slab.h>
 #include <linux/tboot.h>
 #include <linux/trace_events.h>
-#include <linux/entry-kvm.h>
 
 #include <asm/apic.h>
 #include <asm/asm.h>
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a1c49bc681c4..0b13b8bf69e5 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -59,7 +59,6 @@
 #include <linux/sched/stat.h>
 #include <linux/sched/isolation.h>
 #include <linux/mem_encrypt.h>
-#include <linux/entry-kvm.h>
 #include <linux/suspend.h>
 #include <linux/smp.h>
 
@@ -11241,7 +11240,7 @@ static int vcpu_run(struct kvm_vcpu *vcpu)
 
 		if (__xfer_to_guest_mode_work_pending()) {
 			kvm_vcpu_srcu_read_unlock(vcpu);
-			r = xfer_to_guest_mode_handle_work(vcpu);
+			r = kvm_xfer_to_guest_mode_handle_work(vcpu);
 			kvm_vcpu_srcu_read_lock(vcpu);
 			if (r)
 				return r;
diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
index 16149f6625e4..3644de7e6019 100644
--- a/include/linux/entry-kvm.h
+++ b/include/linux/entry-kvm.h
@@ -21,8 +21,6 @@
 	 _TIF_NOTIFY_SIGNAL | _TIF_NOTIFY_RESUME |			\
 	 ARCH_XFER_TO_GUEST_MODE_WORK)
 
-struct kvm_vcpu;
-
 /**
  * arch_xfer_to_guest_mode_handle_work - Architecture specific xfer to guest
  *					 mode work handling function.
@@ -32,12 +30,10 @@ struct kvm_vcpu;
  * Invoked from xfer_to_guest_mode_handle_work(). Defaults to NOOP. Can be
  * replaced by architecture specific code.
  */
-static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
-						      unsigned long ti_work);
+static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work);
 
 #ifndef arch_xfer_to_guest_mode_work
-static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
-						      unsigned long ti_work)
+static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work)
 {
 	return 0;
 }
@@ -46,11 +42,10 @@ static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
 /**
  * xfer_to_guest_mode_handle_work - Check and handle pending work which needs
  *				    to be handled before going to guest mode
- * @vcpu:	Pointer to current's VCPU data
  *
  * Returns: 0 or an error code
  */
-int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu);
+int xfer_to_guest_mode_handle_work(void);
 
 /**
  * xfer_to_guest_mode_prepare - Perform last minute preparation work that
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..598b9473e46d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_HOST_H
 #define __KVM_HOST_H
 
-
+#include <linux/entry-kvm.h>
 #include <linux/types.h>
 #include <linux/hardirq.h>
 #include <linux/list.h>
@@ -2450,6 +2450,17 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 	vcpu->run->exit_reason = KVM_EXIT_INTR;
 	vcpu->stat.signal_exits++;
 }
+
+static inline int kvm_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
+{
+	int r = xfer_to_guest_mode_handle_work();
+
+	if (r) {
+		WARN_ON_ONCE(r != -EINTR);
+		kvm_handle_signal_exit(vcpu);
+	}
+	return r;
+}
 #endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
 
 /*
diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
index 8485f63863af..6fc762eaacca 100644
--- a/kernel/entry/kvm.c
+++ b/kernel/entry/kvm.c
@@ -1,17 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/entry-kvm.h>
-#include <linux/kvm_host.h>
 
-static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
+static int xfer_to_guest_mode_work(unsigned long ti_work)
 {
 	do {
 		int ret;
 
-		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL)) {
-			kvm_handle_signal_exit(vcpu);
+		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 			return -EINTR;
-		}
 
 		if (ti_work & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
 			schedule();
@@ -19,7 +16,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 		if (ti_work & _TIF_NOTIFY_RESUME)
 			resume_user_mode_work(NULL);
 
-		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
+		ret = arch_xfer_to_guest_mode_handle_work(ti_work);
 		if (ret)
 			return ret;
 
@@ -28,7 +25,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 	return 0;
 }
 
-int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
+int xfer_to_guest_mode_handle_work(void)
 {
 	unsigned long ti_work;
 
@@ -44,6 +41,6 @@ int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
 	if (!(ti_work & XFER_TO_GUEST_MODE_WORK))
 		return 0;
 
-	return xfer_to_guest_mode_work(vcpu, ti_work);
+	return xfer_to_guest_mode_work(ti_work);
 }
 EXPORT_SYMBOL_GPL(xfer_to_guest_mode_handle_work);
-- 
2.51.0.268.g9569e192d0-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
