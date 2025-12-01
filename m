Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01803D116F6
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 00:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq/U0OcHiSM/vKKnhsryAXtzCvGdwa7TQBMFD5KG0L4=; b=J07NW31JzFqKW0
	Um2i7cfjlPwchbvn+Sq4jP2onfM1bf7t4HHZuSkoZfjlZa92qgueI2y9Qo6sJ5Aqpp3+hYhr0yffH
	tbJW+boxNBWz6MziqxUKVbsov5d9Pyy20PlCzZZUYYybos6nxdNfShjp/c4dAE/+up+Y7pUaZTV5s
	tgD0edOxKZwptL/VfOVkIrvJxbDQcvAKOgqDxp0bJxo+WpD8Bq/vHfv1ztkPCeA6yuR8H4lG0ChVN
	nxdAXJBd5rY5xFrSqhNcvbCCGyTxbw/3WKxkRCpZ2xDFqhrX3eq7XU4O92Sdpzhx8sRNyCWLLfX1i
	PmR7cgB26rDIIorU7uFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vProv-00000002hqO-2lGE;
	Mon, 01 Dec 2025 00:31:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vProp-00000002hnL-0ADj;
	Mon, 01 Dec 2025 00:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 41909404C3;
	Mon,  1 Dec 2025 00:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4DCC113D0;
	Mon,  1 Dec 2025 00:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764549066;
	bh=7j/BlkgGFK5EC/71OmyC7KnZz0v6nA7NBOR9HlescRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dvM0mJpUZKJhEBHuYFiEtkl1Oaq1bdTd+k1xs5PRHNjLyNq3SaYdWFnFJRvc3/FrX
	 2lF+FF7UIEuhc0XowRhNDFIbJPiWnwBs9n0Kbc4Ey61FDjKXKaF+UJ8cBQE5O5wYk1
	 Cht5WXipjeXD8bJmO4q3VPaJPP2nawtg1FSB9tncVg64LHTq6tFoenxYTxUo+8NivH
	 Y1lgHyLSLvZX1sKKjXne47Q0KDQ8T5WtTiD91I3KTPBF0hvHNGcvwTsrY7oFPmKonV
	 Hlbet/RR4u5E7lcPJsjaFs/x4mq5luU/Io/5tYgTa8QBFqqyb7zE0+duFXtUC3L3sX
	 L3fo4Fb1Npz/g==
From: guoren@kernel.org
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	guoren@kernel.org,
	leobras@redhat.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	corbet@lwn.net
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH V3 2/4] RISC-V: paravirt: Add pvqspinlock frontend
Date: Sun, 30 Nov 2025 19:30:39 -0500
Message-Id: <20251201003041.695081-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251201003041.695081-1-guoren@kernel.org>
References: <20251201003041.695081-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_163107_131786_0332C7F2 
X-CRM114-Status: GOOD (  17.38  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

Add an unfair qspinlock virtualization-friendly frontend, by halting the
virtual CPU rather than spinning.

Using static_call to switch between:
  native_queued_spin_lock_slowpath()    __pv_queued_spin_lock_slowpath()
  native_queued_spin_unlock()           __pv_queued_spin_unlock()

Add the pv_wait & pv_kick implementations.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/Kconfig                          | 12 ++++
 arch/riscv/include/asm/Kbuild               |  1 -
 arch/riscv/include/asm/qspinlock.h          | 35 +++++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h | 28 +++++++++
 arch/riscv/kernel/Makefile                  |  2 +
 arch/riscv/kernel/qspinlock_paravirt.c      | 69 +++++++++++++++++++++
 arch/riscv/kernel/setup.c                   |  5 ++
 7 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/qspinlock.h
 create mode 100644 arch/riscv/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/riscv/kernel/qspinlock_paravirt.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fadec20b87a8..7d29370e6318 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1111,6 +1111,18 @@ config PARAVIRT_TIME_ACCOUNTING
 
 	  If in doubt, say N here.
 
+config PARAVIRT_SPINLOCKS
+	bool "Paravirtualization layer for spinlocks"
+	depends on QUEUED_SPINLOCKS
+	default y
+	help
+	  Paravirtualized spinlocks allow a unfair qspinlock to replace the
+	  test-set kvm-guest virt spinlock implementation with something
+	  virtualization-friendly, for example, halt the virtual CPU rather
+	  than spinning.
+
+	  If you are unsure how to answer this question, answer Y.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on !XIP_KERNEL
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index bd5fc9403295..1258bd239b49 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -13,6 +13,5 @@ generic-y += spinlock_types.h
 generic-y += ticket_spinlock.h
 generic-y += qrwlock.h
 generic-y += qrwlock_types.h
-generic-y += qspinlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
new file mode 100644
index 000000000000..b39f23415ec1
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c), 2025 Alibaba Damo Academy
+ * Authors:
+ *	Guo Ren <guoren@kernel.org>
+ */
+
+#ifndef _ASM_RISCV_QSPINLOCK_H
+#define _ASM_RISCV_QSPINLOCK_H
+
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+#include <asm/qspinlock_paravirt.h>
+
+/* How long a lock should spin before we consider blocking */
+#define SPIN_THRESHOLD		(1 << 15)
+
+void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+void __pv_init_lock_hash(void);
+void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+
+static inline void queued_spin_lock_slowpath(struct qspinlock *lock, u32 val)
+{
+	static_call(pv_queued_spin_lock_slowpath)(lock, val);
+}
+
+#define queued_spin_unlock	queued_spin_unlock
+static inline void queued_spin_unlock(struct qspinlock *lock)
+{
+	static_call(pv_queued_spin_unlock)(lock);
+}
+#endif /* CONFIG_PARAVIRT_SPINLOCKS */
+
+#include <asm-generic/qspinlock.h>
+
+#endif /* _ASM_RISCV_QSPINLOCK_H */
diff --git a/arch/riscv/include/asm/qspinlock_paravirt.h b/arch/riscv/include/asm/qspinlock_paravirt.h
new file mode 100644
index 000000000000..ded8c5a399bb
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock_paravirt.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c), 2025 Alibaba Damo Academy
+ * Authors:
+ *	Guo Ren <guoren@kernel.org>
+ */
+
+#ifndef _ASM_RISCV_QSPINLOCK_PARAVIRT_H
+#define _ASM_RISCV_QSPINLOCK_PARAVIRT_H
+
+void pv_wait(u8 *ptr, u8 val);
+void pv_kick(int cpu);
+
+void dummy_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
+void dummy_queued_spin_unlock(struct qspinlock *lock);
+
+DECLARE_STATIC_CALL(pv_queued_spin_lock_slowpath, dummy_queued_spin_lock_slowpath);
+DECLARE_STATIC_CALL(pv_queued_spin_unlock, dummy_queued_spin_unlock);
+
+bool __init pv_qspinlock_init(void);
+
+void __pv_queued_spin_unlock_slowpath(struct qspinlock *lock, u8 locked);
+
+bool pv_is_native_spin_unlock(void);
+
+void __pv_queued_spin_unlock(struct qspinlock *lock);
+
+#endif /* _ASM_RISCV_QSPINLOCK_PARAVIRT_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f60fce69b725..6ea874bcd447 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -125,3 +125,5 @@ obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
 
 obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
+
+obj-$(CONFIG_PARAVIRT_SPINLOCKS) += qspinlock_paravirt.o
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
new file mode 100644
index 000000000000..299dddaa14b8
--- /dev/null
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c), 2025 Alibaba Damo Academy
+ * Authors:
+ *	Guo Ren <guoren@kernel.org>
+ */
+
+#include <linux/static_call.h>
+#include <asm/qspinlock_paravirt.h>
+#include <asm/sbi.h>
+
+void pv_kick(int cpu)
+{
+	sbi_ecall(SBI_EXT_PVLOCK, SBI_EXT_PVLOCK_KICK_CPU,
+		  cpuid_to_hartid_map(cpu), 0, 0, 0, 0, 0);
+	return;
+}
+
+void pv_wait(u8 *ptr, u8 val)
+{
+	unsigned long flags;
+
+	if (in_nmi())
+		return;
+
+	local_irq_save(flags);
+	if (READ_ONCE(*ptr) != val)
+		goto out;
+
+	wait_for_interrupt();
+out:
+	local_irq_restore(flags);
+}
+
+static void native_queued_spin_unlock(struct qspinlock *lock)
+{
+	smp_store_release(&lock->locked, 0);
+}
+
+DEFINE_STATIC_CALL(pv_queued_spin_lock_slowpath, native_queued_spin_lock_slowpath);
+EXPORT_STATIC_CALL(pv_queued_spin_lock_slowpath);
+
+DEFINE_STATIC_CALL(pv_queued_spin_unlock, native_queued_spin_unlock);
+EXPORT_STATIC_CALL(pv_queued_spin_unlock);
+
+bool __init pv_qspinlock_init(void)
+{
+	if (num_possible_cpus() == 1)
+		return false;
+
+	if (!sbi_probe_extension(SBI_EXT_PVLOCK))
+		return false;
+
+	pr_info("PV qspinlocks enabled\n");
+	__pv_init_lock_hash();
+
+	static_call_update(pv_queued_spin_lock_slowpath, __pv_queued_spin_lock_slowpath);
+	static_call_update(pv_queued_spin_unlock, __pv_queued_spin_unlock);
+
+	return true;
+}
+
+bool pv_is_native_spin_unlock(void)
+{
+	if (static_call_query(pv_queued_spin_unlock) == native_queued_spin_unlock)
+		return true;
+	else
+		return false;
+}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index b5bc5fc65cea..0df27501e28d 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -288,6 +288,11 @@ static void __init riscv_spinlock_init(void)
 		return;
 	}
 
+#ifdef CONFIG_PARAVIRT_SPINLOCKS
+	if (pv_qspinlock_init())
+		return;
+#endif
+
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
 	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
