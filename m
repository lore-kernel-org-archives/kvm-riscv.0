Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6469E6BF3C
	for <kvm-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 02:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HbsB6YgNVdDxnI6X0FJEJIKtumXij+HbERzUXaLqfu0=; b=ROEy477/5DSEs0
	q6wqtIIDHj2W/w2UK2SXHkDokPm6xuTocWQnVNiXhYUeGEfc0Xmc9s8zFopKjbvhRQRTrQiKE2d5c
	Q1dXTmrhZ8CX2SX0nEgwuNtV4uYU4zW0P8W9JP5TwwMaXQjTIpNo7HLY6QlgTPLx/LXvZG7L3Ol+G
	f1YIFbNKbyeyjBRZCr+1xcBmgimFUZJni2W6dpQf2YD02UlMKWtkmI0suLnVkNewxWwL/BFiOrbFV
	c1Xkq9q15wIjPDeABtIiPF2hc2F9rlZbK6dHfEa7BmeHQEMM7B4dxzL1CTJOFz23RteSKNKmd/ZoZ
	Y9/G0Tlzmiaty8cQlMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1Be-00000002FvA-0B31;
	Sat, 31 Jan 2026 02:58:14 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1Ba-00000002FuB-3XYj;
	Sat, 31 Jan 2026 02:58:12 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowABnEm65b31pOVPLBg--.13268S2;
	Sat, 31 Jan 2026 10:58:02 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Change imsic->vsfile_lock from rwlock_t to raw_spinlock_t
Date: Sat, 31 Jan 2026 02:58:00 +0000
Message-Id: <20260131025800.1550692-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowABnEm65b31pOVPLBg--.13268S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XryDGr4ruFWUJF4fAryUtrb_yoW3ZFWfpr
	4rZF1kCr1xuw1Uuw4qv3Wkuayvg39F9r45WrWUWw1rXr17JwsYgr4xZayxWFWjqrn7GFn2
	yr1rAaySkF17AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBgsECWl8yB384AAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_185811_254280_17BEA420 
X-CRM114-Status: GOOD (  13.93  )
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

The per-vCPU IMSIC context uses a vsfile_lock to protect access
to the VS-file. Currently, this lock is an rwlock_t, and is used
with read_lock_irqsave/write_lock_irqsave in multiple places
inside arch/riscv/kvm/aia_imsic.c.

During fuzz testing of KVM ioctl sequences, an 
"[BUG: Invalid wait context]" crash was observed when holding 
vsfile_lock in certain VCPU scheduling paths, for example during 
kvm_riscv_vcpu_aia_imsic_put(). Log shows that at this point
the task may hold vcpu->mutex and scheduler runqueue locks,
and thus is in a context where acquiring a read/write rwlock
with irqsave is illegal.

The crash manifests as:
  [ BUG: Invalid wait context ]
  (&imsic->vsfile_lock){....}-{3:3}, at:
  kvm_riscv_vcpu_aia_imsic_put arch/riscv/kvm/aia_imsic.c:728
  ...
  2 locks held by syz.4.4541/8252:
   #0: (&vcpu->mutex), at: kvm_vcpu_ioctl virt/kvm/kvm_main.c:4460
   #1: (&rq->__lock), at: raw_spin_rq_lock_nested kernel/sched/core.c:639
   #1: (&rq->__lock), at: raw_spin_rq_lock kernel/sched/sched.h:1580
   #1: (&rq->__lock), at: rq_lock kernel/sched/sched.h:1907
   #1: (&rq->__lock), at: __schedule kernel/sched/core.c:6772
  ...
  Call Trace:
   _raw_read_lock_irqsave kernel/locking/spinlock.c:236
   kvm_riscv_vcpu_aia_imsic_put arch/riscv/kvm/aia_imsic.c:716
   kvm_riscv_vcpu_aia_put arch/riscv/kvm/aia.c:154
   kvm_arch_vcpu_put arch/riscv/kvm/vcpu.c:650
   kvm_sched_out virt/kvm/kvm_main.c:6421
   __fire_sched_out_preempt_notifiers kernel/sched/core.c:4835
   fire_sched_out_preempt_notifiers kernel/sched/core.c:4843
   prepare_task_switch kernel/sched/core.c:5050
   context_switch kernel/sched/core.c:5205
   __schedule kernel/sched/core.c:6867
   __schedule_loop kernel/sched/core.c:6949
   schedule kernel/sched/core.c:6964
   kvm_riscv_check_vcpu_requests arch/riscv/kvm/vcpu.c:699
   kvm_arch_vcpu_ioctl_run arch/riscv/kvm/vcpu.c:920

Therefore, replace vsfile_lock with raw_spinlock_t, and update 
all acquire/release calls to 
raw_spin_lock_irqsave()/raw_spin_unlock_irqrestore().

Fixes: db8b7e97d6137a ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/aia_imsic.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index fda0346f0ea1f..8730229442a26 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -47,7 +47,7 @@ struct imsic {
 	 */
 
 	/* IMSIC VS-file */
-	rwlock_t vsfile_lock;
+	raw_spinlock_t vsfile_lock;
 	int vsfile_cpu;
 	int vsfile_hgei;
 	void __iomem *vsfile_va;
@@ -597,13 +597,13 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 	 * VCPU is being destroyed.
 	 */
 
-	write_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
 	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
-	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	memset(imsic->swfile, 0, sizeof(*imsic->swfile));
 
@@ -688,10 +688,10 @@ bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu)
 	 * only check for interrupt when IMSIC VS-file is being used.
 	 */
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	if (imsic->vsfile_cpu > -1)
 		ret = !!(csr_read(CSR_HGEIP) & BIT(imsic->vsfile_hgei));
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	return ret;
 }
@@ -713,10 +713,10 @@ void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
 	if (!kvm_vcpu_is_blocking(vcpu))
 		return;
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	if (imsic->vsfile_cpu > -1)
 		csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 }
 
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
@@ -727,13 +727,13 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
 
 	/* Read and clear IMSIC VS-file details */
-	write_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
 	imsic->vsfile_cpu = imsic->vsfile_hgei = -1;
 	imsic->vsfile_va = NULL;
 	imsic->vsfile_pa = 0;
-	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	/* Do nothing, if no IMSIC VS-file to release */
 	if (old_vsfile_cpu < 0)
@@ -786,10 +786,10 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 		return 1;
 
 	/* Read old IMSIC VS-file details */
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
 	old_vsfile_cpu = imsic->vsfile_cpu;
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	/* Do nothing if we are continuing on same CPU */
 	if (old_vsfile_cpu == vcpu->cpu)
@@ -839,12 +839,12 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 	/* TODO: Update the IOMMU mapping ??? */
 
 	/* Update new IMSIC VS-file details in IMSIC context */
-	write_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 	imsic->vsfile_hgei = new_vsfile_hgei;
 	imsic->vsfile_cpu = vcpu->cpu;
 	imsic->vsfile_va = new_vsfile_va;
 	imsic->vsfile_pa = new_vsfile_pa;
-	write_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	/*
 	 * At this point, all interrupt producers have been moved
@@ -943,7 +943,7 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
 	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	imsic = vcpu->arch.aia_context.imsic_state;
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 
 	rc = 0;
 	vsfile_hgei = imsic->vsfile_hgei;
@@ -958,7 +958,7 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
 					    isel, val, 0, 0);
 	}
 
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	if (!rc && vsfile_cpu >= 0)
 		rc = imsic_vsfile_rw(vsfile_hgei, vsfile_cpu, imsic->nr_eix,
@@ -1015,7 +1015,7 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 	if (imsic->nr_msis <= iid)
 		return -EINVAL;
 
-	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	raw_spin_lock_irqsave(&imsic->vsfile_lock, flags);
 
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
@@ -1025,7 +1025,7 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 		imsic_swfile_extirq_update(vcpu);
 	}
 
-	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+	raw_spin_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	return 0;
 }
@@ -1081,7 +1081,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *vcpu)
 
 	/* Setup IMSIC context  */
 	imsic->nr_msis = kvm->arch.aia.nr_ids + 1;
-	rwlock_init(&imsic->vsfile_lock);
+	raw_spin_lock_init(&imsic->vsfile_lock);
 	imsic->nr_eix = BITS_TO_U64(imsic->nr_msis);
 	imsic->nr_hw_eix = BITS_TO_U64(kvm_riscv_aia_max_ids);
 	imsic->vsfile_hgei = imsic->vsfile_cpu = -1;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
