Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789CBC982F1
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XgcKt3Xguj4lT3HmGCfZNtsh64CoevgjlKeMffzOWs=; b=TJMMzIwcXfTpKm
	++WAYAWeiYMxsyM5madEe22V9S7oszCcObKtnxSQF05etvUNv4CH8+bgPAHe7mXlq7fk8ys9kYD4e
	WWZdhmRzK7DZVxLrAe0XpN/N7fHd/qYvx7OhCs5zUTuTV+W5YGi/Uu1W6rclYWC8KDmIR8kRI3cdw
	3t8TaVHkUNByEdQOA8KTio0m9ZakBUTKfo0kq+AfpPZYuYSRVL3crQehj7v8oFtJrPSZc7my+Lrq/
	Wln67LBxqXJ6os/i+qZMeuz0mhgFnq3gFP4yKkmvDhtwFQ2ttLbmFLAyOf84lSPwNox8tTCXk3yL1
	FVPJCavZsLII+EbYp6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7Y-000000023fR-0iPv;
	Mon, 21 Sep 2026 12:27:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7X-000000023ee-10AH;
	Mon, 21 Sep 2026 12:27:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 03BEE43D7D;
	Mon, 21 Sep 2026 12:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE36A1F00898;
	Mon, 21 Sep 2026 12:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993662;
	bh=QVGKnIWRxvPTWA2suCoWlo2Ot1kTECvUDXRzzxTCpoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KdhQCyIlB9toTwTgP1fKUeF0D9GY67k/HlhBgQCthL9+Bpv51wUpCNkXxQVPmnGdN
	 Hr9YRZp2g9/na6SQKQQSQwpNDakxuzC6PvKUzI/yjkt90TBSRiae5h1hXQrLn1Sua5
	 UYjsQ8MLe73HFumUIWh+RPqqaL6cGzwRtneNo5/6AF2qwJMN4SOuJA9yFikStz4eFP
	 ELYlhNbO9H+Di7qfwuRgYA05o2tCm+GSxzWqcwvoYoRxcRj70c6Mt9JAFy3AioJ7Mf
	 0MykNXAR/pDFVH2l+LQNtWgUouIC/bW4MAVtmKxnupn3grr2nRE7IR9n/xidfBqFuw
	 VbQ1rDWaHluVA==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Mon, 21 Sep 2026 12:27:04 +0000
Subject: [PATCH RFC v4 4/4] RISC-V: paravirt: Support nopvspin to disable
 PARAVIRT_SPINLOCKS
MIME-Version: 1.0
Message-Id: <20260921-pvqspinlock-v4-4-409a22aed6ef@kernel.org>
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
 linux-doc@vger.kernel.org, "GUO Ren (XuanTie)" <guoren@kernel.org>
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

VM guests should fall back to a Test-and-Set spinlock when
PARAVIRT_SPINLOCKS is disabled, because fair locks suffer from severe
lock-holder preemption issues. The virt_spin_lock_key shortcuts
queued_spin_lock_slowpath(), allowing virt_spin_lock() to hijack it.
See commit 43b3f02899f7 ("locking/qspinlock/x86: Fix performance
regression under unaccelerated VMs").

Add a static key controlling whether virt_spin_lock() is called, and
add nopvspin support mirroring x86.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  2 +-
 arch/riscv/include/asm/qspinlock.h              | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/qspinlock_paravirt.c          |  8 ++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..d32bb7db9f91 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4632,7 +4632,7 @@ Kernel parameters
 			as generic guest with no PV drivers. Currently support
 			XEN HVM, KVM, HYPER_V and VMWARE guest.
 
-	nopvspin	[X86,XEN,KVM,EARLY]
+	nopvspin	[X86,RISCV,XEN,KVM,EARLY]
 			Disables the qspinlock slow path using PV optimizations
 			which allow the hypervisor to 'idle' the guest on lock
 			contention.
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
index 330b714edc44..9c7108baa40a 100644
--- a/arch/riscv/include/asm/qspinlock.h
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -12,6 +12,8 @@
 /* How long a lock should spin before we consider blocking */
 #define SPIN_THRESHOLD		(1 << 15)
 
+extern bool nopvspin;
+
 void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
 void __pv_init_lock_hash(void);
 void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
@@ -29,5 +31,27 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
 #endif /* CONFIG_PARAVIRT_SPINLOCKS */
 
 #include <asm-generic/qspinlock.h>
+#include <asm/jump_label.h>
+
+/*
+ * KVM guests fall back to a Test-and-Set spinlock because fair locks suffer
+ * from severe lock-holder-preemption issues. When virt_spin_lock_key is
+ * enabled, virt_spin_lock() shortcuts queued_spin_lock_slowpath() and hijacks
+ * the lock acquisition.
+ */
+DECLARE_STATIC_KEY_FALSE(virt_spin_lock_key);
+
+#define virt_spin_lock rv_virt_spin_lock
+static inline bool rv_virt_spin_lock(struct qspinlock *lock)
+{
+	if (!static_branch_likely(&virt_spin_lock_key))
+		return false;
+
+	do {
+		smp_cond_load_relaxed((s32 *)&lock->val, VAL == 0);
+	} while (atomic_cmpxchg(&lock->val, 0, _Q_LOCKED_VAL) != 0);
+
+	return true;
+}
 
 #endif /* _ASM_RISCV_QSPINLOCK_H */
diff --git a/arch/riscv/kernel/qspinlock_paravirt.c b/arch/riscv/kernel/qspinlock_paravirt.c
index 04b13994e971..28c6c78d7e84 100644
--- a/arch/riscv/kernel/qspinlock_paravirt.c
+++ b/arch/riscv/kernel/qspinlock_paravirt.c
@@ -50,6 +50,8 @@ EXPORT_STATIC_CALL(pv_queued_spin_lock_slowpath);
 DEFINE_STATIC_CALL(pv_queued_spin_unlock, native_queued_spin_unlock);
 EXPORT_STATIC_CALL(pv_queued_spin_unlock);
 
+DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
+
 bool __init pv_qspinlock_init(void)
 {
 	if (num_possible_cpus() == 1)
@@ -58,6 +60,12 @@ bool __init pv_qspinlock_init(void)
 	if (!sbi_probe_extension(SBI_EXT_PVLOCK))
 		return false;
 
+	if (nopvspin) {
+		static_branch_enable(&virt_spin_lock_key);
+		pr_info("virt_spin_lock enabled by nopvspin\n");
+		return true;
+	}
+
 	pr_info("PV qspinlocks enabled\n");
 	__pv_init_lock_hash();
 

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
