Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8A3C44529
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 12:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3L5dtOt17RYuZbxpglGWKSSzyIIW4rGZ8/oOPciSkew=; b=MG0ilfMUPoj+qW
	nISlxIxamHbiGtCSlKdqwZYv/3KR8VlbFr5dyM4I2+H4ReOpv4g/xroC7fy43JvU3d5fHR6x0brDb
	//RIlhGlQmQjWL/jQ6sF69vIq6KiAgMWvJx7mIDWmXlx6LnwyGTt3RcndK3Zes3A7IgZ1h1Q7oCOW
	1BQxLwzLmWbKv1PWKj6U3kreP/DjOjaA8FTgmG/RoIpNjNGokedgq12qgYi3UIHJpbFA6eijMgsy2
	ZCUbfK4fnjpcKxYNBjFji10nPcajXoNZ/xIu9jO7XHxm5Hs4f9JCPytR4dz/aeJwc45QMbkyXkYOU
	BkbTOs+fiVcLAtkgvZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9Y3-00000009Pog-3Tza;
	Tue, 21 Jul 2026 12:26:11 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm9Xw-00000009Plj-1A18;
	Tue, 21 Jul 2026 12:26:10 +0000
X-QQ-mid: zesmtpgz5t1784636697t1ab0bdb5
X-QQ-Originating-IP: E4jMg68m2VMQeBL41dE2uKWfCFRZ8sl2sAgZLc0GIa0=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 20:24:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8024588964083147569
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
Subject: [PATCH v5] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Tue, 21 Jul 2026 12:24:42 +0000
Message-ID: <2D686C2069E3C0F9+20260721122442.351865-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721115558.341592-1-jinrui@haiwei.tech>
References: <20260721115558.341592-1-jinrui@haiwei.tech>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MwaoY2AN32k1Q53p115PmcpfaJDIr/AK4wKioXOJw69Pn34RaQZh9kzo
	/vE5bG+Ioylh+9OwKm5/jSxW2MKgWVYaoGdq/h1bftvfxnkffinNa66RxNQi4dj5WqQqKmg
	xkmlqIo8NqMQtgT/Rp0K8GmaQvpjjM6jtSsTdelI1iCUkRp2lVJ0gfiabbMw5sHwL+oUCMh
	KDpS3t6H3y8RyJo2EaxxppmgdhjfhLYVygr/IDfV2KSiuxvAjZ/it+facta/u3aRay8B/Xp
	UOGlnVN6XUVdCVMh9f5sDXYLvuA9ZDjNLcwf4eByqnLnbR8Mnw/7p+WsMbBWOX6rDHEx2Kl
	9X2M/OqKrapRGvCA4JP4kx8QleObnsuLzkfwLRRZK8nDdbF6IZEAdd/VedIczOMQRRVZm8o
	Ld+TY6LWgL3Qc/kzDDww0FYc8Bwp7+LTgcYSLPD81+LBqa6m8CFdyLqCdBQZVpzW7yW3zwY
	oLHElB1ukBZ8blQjOFZyBC/IAlpx/PMrLoNMAgCqpMS2627N4sjzSq+rrKE/b+fynGiEW2W
	oC/6gQS42iZr2s+xBz/jRVwQ02Nob974HVZHVHz/DVqjUOSBye85moW6DAiR6gVOKWpxcRi
	aZY0RpMCryPraIKZt9JT2PROfzNUsL4dHyoLmwYk6+fq0EfsfxpgfNTb4AG4Ez3rdHnZ2e1
	faYggu6LhYHrkBE279kLaqYQZCUHyUFZ3fGSdXGJRw+ZrahewzTN/ESTqZvT+SRObcCmVzf
	unndQeCc9bvVD6BF5SMsBgpZtdHLGmltkBIUugD9AKRD7AcEycMPeRrpkuWpAJK8k0ABWQD
	Rq1ywEH1iP5w1CzJ7bCDuo/gXsJsG42JcSnbG6EBNXfPsfu3tPANPvH1XJcwznYpxMv9So7
	5ay1aKAjRc7tBCxlw58WHyq/g/o9KmgDSONFzCRtODviffjE2Q3VRqnxpKxUTM9KEXkj3N1
	H5qHvWJhn4N15GJOHm9PRixZlbYVLHo0vlqZtfZ3E34EM3ADlMlkb1PA8yOuGNWutCMC4tt
	o20P2ot0D8nirWckafm+ln4WRnzjJ7tRd1/6saoaTJQWSf1RBTgM3lph3a7vXmQNe1VgqE/
	c4Prqo913NUUaxho1lZZUfG/D8m/9FZTQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_052604_787185_3EAD6E47 
X-CRM114-Status: GOOD (  20.32  )
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
Changes in v5:
- Replace the one-shot v_available flag with per-vcpu (epc, vcpu_id)
  tracking to correctly handle multi-vCPU tests and the case where V
  is disabled after vCPU creation without causing false-positive
  bailouts on other vCPUs.
Changes in v4:
- Add vcpu_dump() in assert_on_unhandled_exception() to restore the
  register dump lost when guest_unexp_trap() was removed.
Changes in v3:
- Move v_available from a host-side static variable into struct
  handlers (Guest memory), fixing host-to-Guest synchronization.
Changes in v2:
- Add a v_available flag to prevent infinite exception loops on
  hosts without the V extension.
- Use regs->status instead of reading the live sstatus CSR.

 .../selftests/kvm/lib/riscv/processor.c       | 85 ++++++++++++++++---
 1 file changed, 75 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..03a3223a0466 100644
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
@@ -348,8 +340,34 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
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
+
+	/*
+	 * Record V extension availability in the handlers struct so that
+	 * route_exception() (called from Guest context) can check it
+	 * without relying on a host-side global variable.
+	 */
+	{
+		struct handlers *h = addr_gva2hva(vm, vm->handlers);
+
+		h->v_available = __vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA_EXT_V);
+		h->v_vcpu = -1;
+	}
 
 	return vcpu;
 }
@@ -408,6 +426,7 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 	struct ucall uc;
 
 	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED) {
+		vcpu_dump(stderr, vcpu, 2);
 		TEST_FAIL("Unexpected exception (vector:0x%lx, ec:0x%lx)",
 			uc.args[0], uc.args[1]);
 	}
@@ -415,6 +434,9 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 
 struct handlers {
 	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
+	bool v_available;
+	unsigned long v_epc;
+	int v_vcpu;
 };
 
 void route_exception(struct pt_regs *regs)
@@ -432,6 +454,46 @@ void route_exception(struct pt_regs *regs)
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
+		/*
+		 * If KVM supports the V extension for this Guest and VS
+		 * (Vector Status) is Off in the saved sstatus, set it to
+		 * Initial and re-execute the faulting instruction.
+		 *
+		 * Use regs->status (saved at exception entry) rather than
+		 * reading the live CSR to avoid a TOCTOU race.
+		 *
+		 * Compare (epc, vcpu_id) against the last attempted
+		 * enablement to avoid an infinite loop when V is available
+		 * but the test later disabled it or the hardware rejects
+		 * the VS change.
+		 */
+		if (handlers && handlers->v_available && !(regs->status & SR_VS)) {
+			int vcpu_id = 0;
+
+			asm volatile("csrr %0, sscratch" : "=r" (vcpu_id));
+			if (handlers->v_epc != regs->epc ||
+			    handlers->v_vcpu != vcpu_id) {
+				handlers->v_epc = regs->epc;
+				handlers->v_vcpu = vcpu_id;
+				regs->status |= SR_VS_INITIAL;
+				return;
+			}
+		}
+	}
+
 	if (handlers && handlers->exception_handlers[vector][ec])
 		return handlers->exception_handlers[vector][ec](regs);
 
@@ -448,6 +510,9 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
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
