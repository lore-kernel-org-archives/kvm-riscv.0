Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7612D116F7
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 00:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gP8TKsnab/puquxybqNyJFVJ3lt4rTWJhngZqGOu/GA=; b=uvTzH22a8wjXEa
	brJk08VEmeihOuIkPmP3UQxH9eQGeLVCpGmSYHmKg7a1tdCNr8aZqBc+r82QSaXejOaNh0vfFEJru
	zHFOzuc0EqcnD10EcHdsevIyIGBLM88btSbf6XXaBwtLtBqQMuzp5DczvBXKP0E6G93wnUtCRHWTX
	FZx3TYGM+9R6t7IOeoPVa23CClEf6CCYerNaQS9FPQIasp3BFLRsXRaypcLRSqEGxOp0AN0uSUxd5
	eFNPsFdtWAAD0zIZwcF90UtT5lilGuxgFeZqe0qFDyJJNd+Uoxeldza/rvqwF/zuT6azjKVbsyUqG
	qVmy+fsFeaCh4fzn5KCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vProw-00000002hrA-1zo3;
	Mon, 01 Dec 2025 00:31:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vProu-00000002hoy-2VdW;
	Mon, 01 Dec 2025 00:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DD6560160;
	Mon,  1 Dec 2025 00:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6688BC19422;
	Mon,  1 Dec 2025 00:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764549071;
	bh=ExgV75nN3+zv3C0lmBXc1FgUeJ7EJlAF0HXaBV/VLSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WRlMEhOkXtNcgdDnQeCE/H0D5KvPjMdvoVc+5Hdr8d0LGfeTeZsV7CrDnuBMVBeNK
	 kP4v7nUGX8y/nweeRQIhOlaRuRnyi2+IN+5XS5MQ+TKsGoqBQD8VfaBq0Ts/n47Sac
	 BwXOL6F/WHVFKt8y1+1wSnqmf4M9YzXl8P2K5Q2RdTLYmJJA+He9tZSKhn7tPpSOC2
	 mD0nS4Zv/mz4YpU4B5QZNO9uvI0c+aNqnASu7EhlgHsi4vBwTyEoM8NRn7ci8HiNQX
	 Oid7psTHyZfkwMzvRiyxCnakpobJXI+ir7RenVlRxkWRUA1NGgLLzRPvbTxItAivsk
	 veXMqAEaJgqiw==
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
Subject: [RFC PATCH V3 4/4] RISC-V: paravirt: Support nopvspin to disable PARAVIRT_SPINLOCKS
Date: Sun, 30 Nov 2025 19:30:41 -0500
Message-Id: <20251201003041.695081-5-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251201003041.695081-1-guoren@kernel.org>
References: <20251201003041.695081-1-guoren@kernel.org>
MIME-Version: 1.0
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

The VM guests should fall back to a Test-and-Set spinlock when
PARAVIRT_SPINLOCKS disabled, because fair locks have horrible lock
'holder' preemption issues. The virt_spin_lock_key would shortcut for
the queued_spin_lock_- slowpath() function that allow virt_spin_lock
to hijack it. ref: 43b3f02899f7 ("locking/qspinlock/x86: Fix
performance regression under unaccelerated VMs").

Add a static key controlling whether virt_spin_lock() should be
called or not. Add nopvspin support as x86.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/riscv/include/asm/qspinlock.h            | 24 +++++++++++++++++++
 arch/riscv/kernel/qspinlock_paravirt.c        |  8 +++++++
 3 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..9e895e9ca655 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4393,7 +4393,7 @@
 			as generic guest with no PV drivers. Currently support
 			XEN HVM, KVM, HYPER_V and VMWARE guest.
 
-	nopvspin	[X86,XEN,KVM,EARLY]
+	nopvspin	[X86,RISCV,XEN,KVM,EARLY]
 			Disables the qspinlock slow path using PV optimizations
 			which allow the hypervisor to 'idle' the guest on lock
 			contention.
diff --git a/arch/riscv/include/asm/qspinlock.h b/arch/riscv/include/asm/qspinlock.h
index b39f23415ec1..70ad7679fce0 100644
--- a/arch/riscv/include/asm/qspinlock.h
+++ b/arch/riscv/include/asm/qspinlock.h
@@ -14,6 +14,8 @@
 /* How long a lock should spin before we consider blocking */
 #define SPIN_THRESHOLD		(1 << 15)
 
+extern bool nopvspin;
+
 void native_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
 void __pv_init_lock_hash(void);
 void __pv_queued_spin_lock_slowpath(struct qspinlock *lock, u32 val);
@@ -31,5 +33,27 @@ static inline void queued_spin_unlock(struct qspinlock *lock)
 #endif /* CONFIG_PARAVIRT_SPINLOCKS */
 
 #include <asm-generic/qspinlock.h>
+#include <asm/jump_label.h>
+
+/*
+ * The KVM guests fall back to a Test-and-Set spinlock, because fair locks
+ * have horrible lock 'holder' preemption issues. The test_and_set_spinlock_key
+ * would shortcut for the queued_spin_lock_slowpath() function that allow
+ * virt_spin_lock to hijack it.
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
index cae991139abe..b89f13d0d6e8 100644
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
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
