Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0062C982EE
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oRWCQFk5T7bYZGOoO1MPsqGgqQoeU5Iwh3cxmCKimeU=; b=idkw7YeNmyHkm/
	0nCoKKsgHbSwh6sXfYuqbhwTZCvZOlXUa49vNkIiDGQTRxEH3iLCW0ttjEhhpIa/X5AwDbOjqlvW2
	0clSn0Sj+10jyRoKasLMwh7JZ1bH6U9O3gjV4057J7xtm/W+A3JkqKOnWoHxekmLTbrPVw03Z3rRO
	zFbl2FU8D/34UutxzRcpuA/YZX67W9Ti4+ObjGefg1eWn+ggbPFyZSrCbtOBJUETbXEJ1y6o+rO/Y
	rNaGUuS0Vh0oKGKlIdSS/Bc8dG0HXP63+bnHyp/vrgURBzVekdu50pWURuDEivgu44t5qjWv5yVrV
	7lfNE0u9TsA7l71vTOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7N-000000023Z6-474Z;
	Mon, 21 Sep 2026 12:27:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7M-000000023YL-3J33;
	Mon, 21 Sep 2026 12:27:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 626FD43D8F;
	Mon, 21 Sep 2026 12:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA321F000FF;
	Mon, 21 Sep 2026 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993652;
	bh=ZL+jHBhm3Lazx2elITuFIbb5JJW3ttCHLqLMtnrVQrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FizKey6Agi7E+O7B943oOu9OU8rX9A6+d+R5RAdFZstk/eu0fKvoM8/gcUDsap1QM
	 v8HwFrI7KOQdTw7ftgDofA98CMyyMWD4kb/zvBUdBOFAG4la7VzUcYt+0YiZKfLf9F
	 TJvD2cqFvmVk5DBDZSbg6LqVxKjYX6gOFaGa3SQv4Mf+W+CMruCT1Nto8PQIAHha7d
	 eu/TXsUvKj7jSAMJwAFaMVEUuYe9jlpFyiskfVZgnj9SljcwikOLG8YisyIB437ldQ
	 1v59Rdmf5jezzqvjwlPUCjNb3bd5F1Y6/Ot3zoDZWvYc+qnNsehKJHs8umS3XPqE91
	 OkpvmJ8Tm2sLA==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Mon, 21 Sep 2026 12:27:02 +0000
Subject: [PATCH RFC v4 2/4] RISC-V: paravirt: Add pvqspinlock frontend
MIME-Version: 1.0
Message-Id: <20260921-pvqspinlock-v4-2-409a22aed6ef@kernel.org>
References: <20260921-pvqspinlock-v4-0-409a22aed6ef@kernel.org>
In-Reply-To: <20260921-pvqspinlock-v4-0-409a22aed6ef@kernel.org>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
 CHEN Jiankang <yubin.cjk@alibaba-inc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Leonardo Bras <leobras@redhat.com>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

Add a virtualization-friendly unfair qspinlock frontend that halts the
virtual CPU instead of spinning.

Use static_call to switch between:
  native_queued_spin_lock_slowpath()    __pv_queued_spin_lock_slowpath()
  native_queued_spin_unlock()           __pv_queued_spin_unlock()

Add the pv_wait and pv_kick implementations.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 arch/riscv/Kconfig                          | 12 ++++++
 arch/riscv/include/asm/Kbuild               |  1 -
 arch/riscv/include/asm/qspinlock.h          | 33 ++++++++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h | 26 +++++++++++
 arch/riscv/kernel/Makefile                  |  2 +
 arch/riscv/kernel/qspinlock_paravirt.c      | 67 +++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c                   |  5 +++
 7 files changed, 145 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455c..9af53ef5ee95 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1165,6 +1165,18 @@ config PARAVIRT_TIME_ACCOUNTING
 
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
 	select MODULE_SECTIONS if MODULES
diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index 7721b63642f4..3d8800d4fe48 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -13,7 +13,6 @@ generic-y += spinlock_types.h
 generic-y += ticket_spinlock.h
 generic-y += qrwlock.h
 generic-y += qrwlock_types.h
-generic-y += qspinlock.h
 generic-y += ring_buffer.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
new file mode 100644
index 000000000000..330b714edc44
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 GUO Ren (XuanTie) <guoren@kernel.org>
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
index 000000000000..7261cd9b13b2
--- /dev/null
+++ b/arch/riscv/include/asm/qspinlock_paravirt.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 GUO Ren (XuanTie) <guoren@kernel.org>
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
index ebe1c3588177..b9b0763dba32 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -130,3 +130,5 @@ obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
 obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
 
 obj-$(CONFIG_RISCV_ISA_SSQOSID) += qos.o
+
+obj-$(CONFIG_PARAVIRT_SPINLOCKS) += qspinlock_paravirt.o
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
new file mode 100644
index 000000000000..c534447437fe
--- /dev/null
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 GUO Ren (XuanTie) <guoren@kernel.org>
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
+	/*
+	 * unlock() needs release semantics:
+	 */
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
+	return static_call_query(pv_queued_spin_unlock) ==
+	       native_queued_spin_unlock;
+}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index a32344bb220d..ccfa92b7c81a 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -281,6 +281,11 @@ static void __init riscv_spinlock_init(void)
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
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
