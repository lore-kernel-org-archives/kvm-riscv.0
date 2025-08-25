Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59936CA0FE7
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 20:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d86fcJl9vCyMZH7MD+xWDlrpHu7yhBVOBu6ULDpkAjs=; b=u8cvHGmgsNqJNh
	o0E0bvMBwQq9pJGjwLVXEZsH/NtMFJOGwyHAbipKw//BQOFXZhnZEB4hd/3Ni3X4qC6NhrmLzRES9
	MSQvyvbdpfwO8EA4aQowtts2ugbg0Kz90I3455oLkxidFEZJfphjailOAxJwv6GV2y3RF/aoGjSV6
	FuIA6ASL6IohhoiRI28JnCx+uPwkT7vjMHF5UAcC4UOonMBnJlRjsXJaAl0YbYhjqsDlzsRY3w5r6
	jr3QBnW8zc7W6/nMm5KYUP/a8ZvgWFSvqmWcgTSm6sYfYiqYrBFLigTODC5H5SKYIfDTOIknnQU+/
	UFE7JEhd15Psltyw/18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdh6-00000009YVz-0F1d;
	Mon, 25 Aug 2025 20:21:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSf-00000009UuK-1k4m
	for kvm-riscv@bombadil.infradead.org;
	Mon, 25 Aug 2025 20:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wbD6+fQUFLj6ZyKIXXe+rz89WoEnq6GRJ4KXesOmIvQ=; b=IjFjPtzfpy8vZlM0f+UGCHbJOE
	POeuq4Kdx97cUIqfgX3jCF+Hh3BHveAey6s8nQMtj7tDFg2+LXz+gzk0XQxdb8m1iAGZaCc/pN6rc
	l2jKsyfSV+UaAOOqvQFw0OmmdYNl55OsDNNCVumCO2vFjSMt2uUpkTOWYxapYr5UydJOqbG5ebI2X
	A0sc2qLFhVuZ+ECgFwTkr+KKu0OlGaQIHKuFE9pV1fosS/ghlN5xsJHEgSviIoxiJR0KpC/w0Et72
	ShKfHN5j+9wYSOJML1MJH5d4GZPun+BcoJS/M/erZlD65sTN34X5XaXRg/6g2yHw1IZxaVH4bJaIu
	aUHdlCNA==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSc-000000021wA-20hC
	for kvm-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 20:06:36 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b47173a00e8so3648655a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 25 Aug 2025 13:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756152393; x=1756757193; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wbD6+fQUFLj6ZyKIXXe+rz89WoEnq6GRJ4KXesOmIvQ=;
        b=FUV8699rv0ZQh65QnA/pVy9PFVQPwqzxscNH3OLF4Gb73m+QvfAbf8SAR2LeedhJRP
         NhrR/o/ca2xkxWgqrkrMQDsEPa8qrbiLUDZp43Uj6lDuEQZdf4RzM5WfkfqtAhZ2hU+i
         A/tVe4PSxyuk1uV5syXd6N7K6qNNzZ2zQ33TsemJ7lgJZgyTKdjJnCORcK1kgIyq4tNE
         ub+sSIJWOHCYSZI1kyYfHolpKJ6rs2l9QYGRdyhGdnxfhPpwnIulXeRFLTMp5VPUdnmz
         1Xd2SfDipXMKvHH9p8TNtAM7sjVSV5o65baVVMCkRG9ysYwVWUrPmZVUuB+VE09U5TD7
         tuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756152393; x=1756757193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbD6+fQUFLj6ZyKIXXe+rz89WoEnq6GRJ4KXesOmIvQ=;
        b=h+7pwB1hpZl9es47I17B1J/SS/vzsC5fxbVH9zXEShs67drqaqSf+sD3F3+eyd3FMp
         tDMo64L78IUfUyo//OgizzzrmvNjcFgeIVUmBd19/TWbx41SeoWEoM1IP/XioP3b9PzS
         lQePxBUaq7sWZB/y1gNLDGi+ju3ytBZKKE4UP6JheJ6oXSlL698/tFUekF9L7V7+YJys
         SPPfxMzRTD/d3hn//TxhuySVO7YveBltSId+t65mxyhG9vwCtsffJQo/Fpy5kGqp9RTO
         zLOqgoVVqIW1HJY2o8m4IWS1BXLyl7YsTQKzUNZnYd8//qOoqIYIXSWasAV2seaAh6pu
         uqNg==
X-Forwarded-Encrypted: i=1; AJvYcCURWZhCdzMO0k8o2+DLsCx++vXFP9xO5tKzj7WPg6ggzmNGbHwuETG4m2zfEeqPaL0wP5b1AsPLCts=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5L6b3O7wAAr+nFoxt2bS0pu9pq5YEusSFGkQtClrJ1O3BvI0V
	FrjO1KQAZkvtWtalG4YxOuBe5qztpqzd/uUW3AX2Y6ZX3KNzkUQbV36ILC7Hy6Sg9tLnQ4/ziS4
	XuoOG5Q==
X-Google-Smtp-Source: AGHT+IH5IBTx24tzWYAz5h7k7ppjFmo3GXWf3YKN3bogG8Gmm6XMIM/yADKjND6wIF+ApQDKi4M8PqDi2F4=
X-Received: from pjbsp3.prod.google.com ([2002:a17:90b:52c3:b0:31f:2a78:943])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22c9:b0:246:6f78:1fc1
 with SMTP id d9443c01a7336-2466f7820c6mr142747395ad.36.1756152392594; Mon, 25
 Aug 2025 13:06:32 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:06:21 -0700
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250825200622.3759571-5-seanjc@google.com>
Subject: [PATCH 4/5] entry: Rename "kvm" entry code assets to "virt" to
 genericize APIs
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
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_210634_641569_DC1CCA95 
X-CRM114-Status: GOOD (  16.28  )
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

Rename the "kvm" entry code files and Kconfigs to use generic "virt"
nomenclature so that the code can be reused by other hypervisors (or
rather, their root/dom0 partition drivers), without incorrectly suggesting
the code somehow relies on and/or involves KVM.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 MAINTAINERS                                 | 2 +-
 arch/arm64/kvm/Kconfig                      | 2 +-
 arch/loongarch/kvm/Kconfig                  | 2 +-
 arch/riscv/kvm/Kconfig                      | 2 +-
 arch/x86/kvm/Kconfig                        | 2 +-
 include/linux/{entry-kvm.h => entry-virt.h} | 8 ++++----
 include/linux/kvm_host.h                    | 6 +++---
 include/linux/rcupdate.h                    | 2 +-
 kernel/entry/Makefile                       | 2 +-
 kernel/entry/{kvm.c => virt.c}              | 2 +-
 kernel/rcu/tree.c                           | 6 +++---
 virt/kvm/Kconfig                            | 2 +-
 12 files changed, 19 insertions(+), 19 deletions(-)
 rename include/linux/{entry-kvm.h => entry-virt.h} (94%)
 rename kernel/entry/{kvm.c => virt.c} (97%)

diff --git a/MAINTAINERS b/MAINTAINERS
index fed6cd812d79..17b9c9d7958e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10211,7 +10211,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
 F:	include/linux/entry-common.h
-F:	include/linux/entry-kvm.h
+F:	include/linux/entry-virt.h
 F:	include/linux/irq-entry-common.h
 F:	kernel/entry/
 
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 713248f240e0..6f4fc3caa31a 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -25,7 +25,7 @@ menuconfig KVM
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select KVM_MMIO
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
-	select KVM_XFER_TO_GUEST_WORK
+	select VIRT_XFER_TO_GUEST_WORK
 	select KVM_VFIO
 	select HAVE_KVM_DIRTY_RING_ACQ_REL
 	select NEED_KVM_DIRTY_RING_WITH_BITMAP
diff --git a/arch/loongarch/kvm/Kconfig b/arch/loongarch/kvm/Kconfig
index 40eea6da7c25..ae64bbdf83a7 100644
--- a/arch/loongarch/kvm/Kconfig
+++ b/arch/loongarch/kvm/Kconfig
@@ -31,7 +31,7 @@ config KVM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_MMU_NOTIFIER
 	select KVM_MMIO
-	select KVM_XFER_TO_GUEST_WORK
+	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
 	help
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 5a62091b0809..c50328212917 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -30,7 +30,7 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
-	select KVM_XFER_TO_GUEST_WORK
+	select VIRT_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_MMU_NOTIFIER
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 2c86673155c9..f81074b0c0a8 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -40,7 +40,7 @@ config KVM_X86
 	select HAVE_KVM_MSI
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select HAVE_KVM_NO_POLL
-	select KVM_XFER_TO_GUEST_WORK
+	select VIRT_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_VFIO
 	select HAVE_KVM_PM_NOTIFIER if PM
diff --git a/include/linux/entry-kvm.h b/include/linux/entry-virt.h
similarity index 94%
rename from include/linux/entry-kvm.h
rename to include/linux/entry-virt.h
index 3644de7e6019..42c89e3e5ca7 100644
--- a/include/linux/entry-kvm.h
+++ b/include/linux/entry-virt.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LINUX_ENTRYKVM_H
-#define __LINUX_ENTRYKVM_H
+#ifndef __LINUX_ENTRYVIRT_H
+#define __LINUX_ENTRYVIRT_H
 
 #include <linux/static_call_types.h>
 #include <linux/resume_user_mode.h>
@@ -10,7 +10,7 @@
 #include <linux/tick.h>
 
 /* Transfer to guest mode work */
-#ifdef CONFIG_KVM_XFER_TO_GUEST_WORK
+#ifdef CONFIG_VIRT_XFER_TO_GUEST_WORK
 
 #ifndef ARCH_XFER_TO_GUEST_MODE_WORK
 # define ARCH_XFER_TO_GUEST_MODE_WORK	(0)
@@ -90,6 +90,6 @@ static inline bool xfer_to_guest_mode_work_pending(void)
 	lockdep_assert_irqs_disabled();
 	return __xfer_to_guest_mode_work_pending();
 }
-#endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
+#endif /* CONFIG_VIRT_XFER_TO_GUEST_WORK */
 
 #endif
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 598b9473e46d..70ac2267d5d0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2,7 +2,7 @@
 #ifndef __KVM_HOST_H
 #define __KVM_HOST_H
 
-#include <linux/entry-kvm.h>
+#include <linux/entry-virt.h>
 #include <linux/types.h>
 #include <linux/hardirq.h>
 #include <linux/list.h>
@@ -2444,7 +2444,7 @@ static inline int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 }
 #endif /* CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE */
 
-#ifdef CONFIG_KVM_XFER_TO_GUEST_WORK
+#ifdef CONFIG_VIRT_XFER_TO_GUEST_WORK
 static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 {
 	vcpu->run->exit_reason = KVM_EXIT_INTR;
@@ -2461,7 +2461,7 @@ static inline int kvm_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu)
 	}
 	return r;
 }
-#endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
+#endif /* CONFIG_VIRT_XFER_TO_GUEST_WORK */
 
 /*
  * If more than one page is being (un)accounted, @virt must be the address of
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 120536f4c6eb..1e1f3aa375d9 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -129,7 +129,7 @@ static inline void rcu_sysrq_start(void) { }
 static inline void rcu_sysrq_end(void) { }
 #endif /* #else #ifdef CONFIG_RCU_STALL_COMMON */
 
-#if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_KVM_XFER_TO_GUEST_WORK))
+#if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_VIRT_XFER_TO_GUEST_WORK))
 void rcu_irq_work_resched(void);
 #else
 static __always_inline void rcu_irq_work_resched(void) { }
diff --git a/kernel/entry/Makefile b/kernel/entry/Makefile
index 77fcd83dd663..2333d70802e4 100644
--- a/kernel/entry/Makefile
+++ b/kernel/entry/Makefile
@@ -14,4 +14,4 @@ CFLAGS_common.o		+= -fno-stack-protector
 
 obj-$(CONFIG_GENERIC_IRQ_ENTRY) 	+= common.o
 obj-$(CONFIG_GENERIC_SYSCALL) 		+= syscall-common.o syscall_user_dispatch.o
-obj-$(CONFIG_KVM_XFER_TO_GUEST_WORK)	+= kvm.o
+obj-$(CONFIG_VIRT_XFER_TO_GUEST_WORK)	+= virt.o
diff --git a/kernel/entry/kvm.c b/kernel/entry/virt.c
similarity index 97%
rename from kernel/entry/kvm.c
rename to kernel/entry/virt.c
index 6fc762eaacca..c52f99249763 100644
--- a/kernel/entry/kvm.c
+++ b/kernel/entry/virt.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/entry-kvm.h>
+#include <linux/entry-virt.h>
 
 static int xfer_to_guest_mode_work(unsigned long ti_work)
 {
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 8eff357b0436..371447651929 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -573,7 +573,7 @@ void rcutorture_format_gp_seqs(unsigned long long seqs, char *cp, size_t len)
 }
 EXPORT_SYMBOL_GPL(rcutorture_format_gp_seqs);
 
-#if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_KVM_XFER_TO_GUEST_WORK))
+#if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_VIRT_XFER_TO_GUEST_WORK))
 /*
  * An empty function that will trigger a reschedule on
  * IRQ tail once IRQs get re-enabled on userspace/guest resume.
@@ -602,7 +602,7 @@ noinstr void rcu_irq_work_resched(void)
 	if (IS_ENABLED(CONFIG_GENERIC_ENTRY) && !(current->flags & PF_VCPU))
 		return;
 
-	if (IS_ENABLED(CONFIG_KVM_XFER_TO_GUEST_WORK) && (current->flags & PF_VCPU))
+	if (IS_ENABLED(CONFIG_VIRT_XFER_TO_GUEST_WORK) && (current->flags & PF_VCPU))
 		return;
 
 	instrumentation_begin();
@@ -611,7 +611,7 @@ noinstr void rcu_irq_work_resched(void)
 	}
 	instrumentation_end();
 }
-#endif /* #if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_KVM_XFER_TO_GUEST_WORK)) */
+#endif /* #if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_VIRT_XFER_TO_GUEST_WORK)) */
 
 #ifdef CONFIG_PROVE_RCU
 /**
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 727b542074e7..ce843db53831 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -87,7 +87,7 @@ config HAVE_KVM_VCPU_RUN_PID_CHANGE
 config HAVE_KVM_NO_POLL
        bool
 
-config KVM_XFER_TO_GUEST_WORK
+config VIRT_XFER_TO_GUEST_WORK
        bool
 
 config HAVE_KVM_PM_NOTIFIER
-- 
2.51.0.261.g7ce5a0a67e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
