Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7ACC4451C
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2F86pYQeKB5dgzjchy+APcmosm8eAgrO8SFv3MgNSws=; b=QZn+2m+DkBrum7
	liz0ch1ywOxMnDatM9S5FSVGEXpzjZ4U0LQ6tFTnjaF8UJCVCi4awROXSoArkF9rwKldsCGLbpn9x
	mCcbkcHkaMf3Gxkxn8t2IS5NMp+IGLFPlJVHe+c9DkjJLosjn0oSSkHWI+ORL6UmrS1dh+8sSbtZ1
	sHoxfk9o/xftleNHpI/mqY0rAOihTxdOzjx04OqQzY+i8W34ThxwYx1Bgj1GBKdPWcxbDRRSqeGK1
	0B9fXcmNRyiJE81o4/djlJgC5m9Ej9rGpo6ZqJSO12V8TDo9+Jlte5+qNfI8ckd9cSxcBCJWurkar
	B4huZHmQJONVLZyHoEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Va-000000095PU-198Y;
	Tue, 21 Jul 2026 10:15:30 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7VV-000000095NW-2ga7;
	Tue, 21 Jul 2026 10:15:29 +0000
X-QQ-mid: esmtpsz17t1784628857t66910cac
X-QQ-Originating-IP: vDikGeTX9xdKaMVcbajN25qy8kQetXWq/mGgRDPtiH4=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 18:14:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13123165881942951496
EX-QQ-RecipientCnt: 14
From: JinRui <jinrui@haiwei.tech>
To: Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jinrui <jinrui@haiwei.tech>
Subject: [PATCH] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Tue, 21 Jul 2026 10:14:06 +0000
Message-ID: <4FAAF34C966898C0+20260721101406.305108-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N2tpK8t46iLIj0Ito0cqf7yOPCpYliaHJ1ueKwPnwN6LayfwrxRkszpq
	dUcRkRh0Nuc3eHGshAu7xe2TIuEb5vzJcztUEuzO9COIPXkNtaZNE4+ViFAa992AgCas8DH
	48D9E3/07NafbSurm62yuudg+xnaTMwWkeW+tOkb5K4Bz3Xhwz01gJU70pvuo5fUnmQYMoQ
	5DVpoPFjjA+fSh47qyrezU8HaUK9EEqFLbzOrX+eaarhWfO8HNu74dT+2YoyeB47RxsS0VC
	CbIIxBFniVLGbqY3FkwBAG6NtKsXAtknJqAAiFSsOCWpF9/g9l2T43+5ZGBKUZ18qSHzQGe
	IMUYtwRlDbO+lcEWL7ffdW7i2i4XSQX2xXi71t4srgKlDriWxjElpK4Ymt6QTkoyjs9gA9B
	Xpx7UhNieurxvM9UjRRnXCIosNudz84YksMogqs4G3oX4NFwnNn/PoU1kij2kVWIISwRKKe
	T3uVzB0lqrXIq39Kf/lhuMQloNOT9VEOA+A4FGPWh3XaOASK8SPMPCOd0MK47ut4SYpOhPV
	bUoedPCswxrYJYeBmXbNNAgYejZvMY0+bN1/neyQCo8qbgoVGFMv+em9AEKwuEGZ7qHJwIa
	RITdZlRsf9H5OyM15dcniLtJiXOm6KuDvbhGRIvnIAgLgLWlLCimpjCQnShTPoNIDk0OGot
	8+iQKTQHFmTnwRI7TQG5/hFo5EVvETuq7JCvarDYbQkp1+4xJR9kiIXSMhcJeUuH5ixH7fG
	4vpPKjwC35DIWdaxjx4Ca4Hd9lhF0fcMJhPDIZl0dJap1pXVcJsRRZv3KFrk9t7qcxPpMyU
	L2waGbHSM++13YrY1Hpt/DHnJ35+itYvpptbWxSvgaLUwfz372UlVLnCTlFHvXXpcD+2DDc
	4Je1ZLZnH+53uGM/9ivpzvr1v1+aNfUbePu/ZNaTvml5OHfgOYbsr3RO7ssF7v0RfvR2INJ
	SS2AZtByh7PWecV1uJmDCis2tcBcdkoZ5/b5nK8C4s4u7m1ILWgsxjm84LU5NQxPBJbpAgQ
	KUvBzC3+FMDwv9yy3c5aqYQGjjrCI=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_031526_055763_587C8AB3 
X-CRM114-Status: GOOD (  13.76  )
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

From: jinrui <jinrui@haiwei.tech>

When the cross-compiler defaults to an -march that includes the V
(vector) extension, -O2 auto-vectorization generates vector
instructions (e.g. vsetvli, vadd.vv) in Guest binary code. If the
Guest executes a vector instruction while sstatus.VS is Off, an
EXC_INST_ILLEGAL (scause=2) is raised. KVM's hedeleg delegates this
exception to the Guest, but the selftest has no way to handle it as a
bare-metal program, causing all Guest tests to fail.

In contrast, a real OS kernel handles this via riscv_v_first_use_handler(),
which detects the vector instruction, sets sstatus.VS to Initial, and
srets to re-execute.

Fix this with four changes in processor.c:

1. Delete the now-unused guest_unexp_trap() handler, which is replaced
   by the full exception vector table.

2. In vm_arch_vcpu_add(), notify KVM that the Guest is allowed to use
   the V extension via __vcpu_set_reg(V, 1) (best-effort, silently
   ignores errors on hardware without V). Also replace the raw stvec
   handler with the full exception vector table, which provides
   save_context/restore_context for safe lazy enablement.

3. In route_exception(), add a lazy V enablement check that runs
   before any test-registered handler. When the cause is a non-IRQ
   EXC_INST_ILLEGAL and sstatus.VS is Off, set VS to Initial and
   return so the faulting instruction is re-executed via sret.

4. Make vm_init_vector_tables() idempotent by checking vm->handlers
   before allocation, so tests that manually call it (ebreak_test,
   arch_timer, sbi_pmu_test) do not leak memory.

The check runs before test-registered EXC_INST_ILLEGAL handlers
(e.g. sbi_pmu_test) to ensure V enablement takes priority.

Tested on a riscv64 host with KVM enabled: all 12 KVM selftest
binaries pass.

Signed-off-by: jinrui <jinrui@haiwei.tech>
---
 .../selftests/kvm/lib/riscv/processor.c       | 51 +++++++++++++++----
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..68577b2f48f4 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -297,14 +297,6 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 		" T3: 0x%016lx   T4: 0x%016lx T5: 0x%016lx T6: 0x%016lx\n",
 		core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
 }
-
-static void __aligned(16) guest_unexp_trap(void)
-{
-	sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
-		  KVM_RISCV_SELFTESTS_SBI_UNEXP,
-		  0, 0, 0, 0, 0, 0);
-}
-
 void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 {
 	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_code);
@@ -348,8 +340,22 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 	/* Setup sscratch for guest_get_vcpuid() */
 	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(sscratch), vcpu_id);
 
-	/* Setup default exception vector of guest */
-	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
+	/*
+	 * Enable the V (vector) extension in KVM so that the compiler can
+	 * safely generate vector instructions (e.g. via -O2 auto-
+	 * vectorization). Silently ignore errors; the test will still work
+	 * without V.
+	 */
+	__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_V), 1);
+
+	/*
+	 * Use the full exception vector table (which provides lazy V
+	 * extension enablement for EXC_INST_ILLEGAL in route_exception)
+	 * as the default exception handler. vm_init_vector_tables() is
+	 * idempotent; tests that call it again will get a no-op.
+	 */
+	vm_init_vector_tables(vm);
+	vcpu_init_vector_tables(vcpu);
 
 	return vcpu;
 }
@@ -432,6 +438,28 @@ void route_exception(struct pt_regs *regs)
 		ec = 0;
 	}
 
+	/*
+	 * Handle V (vector) extension lazy enablement before any
+	 * registered handler. The compiler's default march may include
+	 * V, and auto-vectorization generates vector instructions that
+	 * trigger EXC_INST_ILLEGAL when VS (Vector Status) in sstatus
+	 * is Off. Enable VS to Initial and re-execute the faulting
+	 * instruction, mimicking what a real OS kernel does.
+	 *
+	 * This check runs before any test-registered handler, so tests
+	 * that install their own EXC_INST_ILLEGAL handler (e.g.
+	 * sbi_pmu_test) are not affected.
+	 */
+	if (!(regs->cause & CAUSE_IRQ_FLAG) && ec == EXC_INST_ILLEGAL) {
+		unsigned long sstatus;
+
+		asm volatile("csrr %0, sstatus" : "=r" (sstatus));
+		if (!(sstatus & SR_VS)) {
+			regs->status |= SR_VS_INITIAL;
+			return;
+		}
+	}
+
 	if (handlers && handlers->exception_handlers[vector][ec])
 		return handlers->exception_handlers[vector][ec](regs);
 
@@ -448,6 +476,9 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
 void vm_init_vector_tables(struct kvm_vm *vm)
 {
+	if (vm->handlers)
+		return;
+
 	vm->handlers = __vm_alloc(vm, sizeof(struct handlers), vm->page_size,
 				  MEM_REGION_DATA);
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
