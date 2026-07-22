Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E575C44533
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsXF6rkeZlOCbb/P3eJaaJT0q35rAhSLyLQ2OKQmMXY=; b=r0gx7PtXNq42Ob
	4RR/OGVz+60W3wQ0Kmg1CdleIl3+ckCdbsWwpEEhZ7mkTTVWS9esjN1G2dK81FK7eGLN9LOaum88F
	0qV2Ll48bP6RCJSNlkzIb9aGfeQN/mBMoAryquaLIZQ36i8gs++kut5+rXce+27NHM8PjbuM6msFB
	8GhW+zs3kg3r9YWeQ27+7TruIDJCq1ltD6egHDCZhWyIINAeuvMm/0dqZ0MuJdlq76XVljMefofJb
	e/X4IzsYr6XF0LXf6LNFZWQ9lMK0pxhFOEXEwKOUPiVmeyVK8i81UJ241iIAD1kqAMnfOsh6E7puh
	Xvg2X2h53WVRhV929LpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRTx-0000000B53Y-1yWq;
	Wed, 22 Jul 2026 07:35:09 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRTr-0000000B4nv-23Mt;
	Wed, 22 Jul 2026 07:35:07 +0000
X-QQ-mid: zesmtpsz5t1784705630tb859c73b
X-QQ-Originating-IP: qoiGpSmq/wVHuR9h8at8YO36cWRH2WORRlrkXCG+RvA=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jul 2026 15:33:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10989275502336654131
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
Subject: [PATCH v8] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Wed, 22 Jul 2026 07:33:44 +0000
Message-ID: <33AEC00DC78613A1+20260722073344.771230-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722062804.738428-1-jinrui@haiwei.tech>
References: <20260722062804.738428-1-jinrui@haiwei.tech>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NDW+fwfL9uPKz0reqatPMbRK9ATwD5zS812IN8m9VvvFX9nfUrYTM8Hj
	dilb4adMNpTktNMDtY+AcauEWK+LHmoW4ig7MR37AmUj5E4tztUO3ygH+4iOh32B320nJqa
	J9pNQhg/1kUAdRv6FJ3z77OesyXZ1UWZwT0AcfvANH2LUJc1sCx/+a0Ipu11IGuVL+Fyr2k
	XVT6bkLruc2Dn4e7bM3CHkzalDv7T6aMcTvANm7xew4Jc0D0h8NSt91D18YkwJSrCeQwApG
	IAmB90mh+IDzFddsE/dR14Z3RIST9C8kjhk5TkkDb5tK6gau71msNdeP6PgenqzDLgDEQjP
	YDDzTlpGSIteJvyVMtSxqzceVtTcKzSsjiMuGsh+avihBifMyHxVdEBHxYN+kTXRgimtf3C
	tj2FT525y7OgDK9fDKnHLcOf3XE+B/LxBzHJrc1uON8tFuhBe7REpPBH6Hr6jVYmoHfTHiD
	N1vzrr4sHWOwirEj/CBaElGL3YVsljrdgXyUBN7zfehuywQK8olA3k9EojmMTErOwPZh3m2
	NsTnHPNJXgzY9dkego8KllzroCqcM07M0KZFZHeSfI7MPBh4/Pjh08Sysz8VSkrnp2QTmvG
	iCBvhhmdrhNxioq+DMYjlY3c3sJa4VQWRmB0nVjRMv8RHiy0hhG3GHGjqBi1Cqs/7+4VuF3
	KNGCO80Jy0hh9nFv2nPE7S16C8v73OxNR4e9fGkuW28jCGsjKs9TZcdqTb0hpYHldbg7fGi
	Ws2RsPE5egBIVPCobYRMX1+1N1JOHh38CeuXxrcpgGD9MO968jBDJyFtJk6OSeUOu2uJcvu
	vO5PIHe3Aa1FBGmSyTr3pSw4aghR3aQYHWydUv5TyoZKYM14Rs7M98gcagR8Dw9qLajXw4i
	vtxZGGKwvJDxgfiKMHHasKFQ9JPh9sKLIhpK9RbGFeh0TTH5ePwQHisznjYvrhm00QGW/zw
	uQ01ddcSQju/AiWQFQ7HvGpulaMS0v3NbepWUBmm1NngT1fbvqnhQTU+SA4eJ845bL8ICwP
	39xWALMNeWfKA83fGSxhL3+c7vJF9eftGzEDxbrI1aIxB8bxW0
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_003503_949743_4EBF1C87 
X-CRM114-Status: GOOD (  22.36  )
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
   Track the epc per-vCPU via a flexible array member to avoid
   infinite loops on hardware without V and eliminate races between
   concurrent vCPUs.

4. Make vm_init_vector_tables() idempotent by checking vm->handlers
   before allocation, so tests that manually call it (ebreak_test,
   arch_timer, sbi_pmu_test) do not leak memory.

The check runs before test-registered EXC_INST_ILLEGAL handlers
(e.g. sbi_pmu_test) to ensure V enablement takes priority.

Tested on a riscv64 host with KVM enabled: all 20 KVM selftest
binaries pass (arch_timer, ebreak_test, steal_time, get-reg-list,
sbi_pmu_test, etc.).

Signed-off-by: jinrui <jinrui@haiwei.tech>
---
Changes in v8:
- Change 'ec' in route_exception() from int to unsigned long to
  match regs->cause (unsigned long), preventing signed truncation
  from bypassing the ec >= NR_EXCEPTIONS bounds check.

Changes in v7:
- Use unsigned int for vcpu_id, v_epc_capacity, and max_vcpus to
  prevent negative-value out-of-bounds array access on v_epc[].

Changes in v6:
- Move struct handlers definition to the top of the file, before its
  first use in vm_arch_vcpu_add().

Changes in v5:
- Allocate the per-vCPU epc table dynamically via a flexible array
  member sized by KVM_CAP_MAX_VCPUS rather than a hardcoded constant,
  making the concurrency fix safe for any vCPU count.

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
---
 .../selftests/kvm/lib/riscv/processor.c       | 111 +++++++++++++++---
 1 file changed, 95 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..624f20f0f476 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -17,6 +17,13 @@
 
 static gva_t exception_handlers;
 
+struct handlers {
+	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
+	bool v_available;
+	unsigned int v_epc_capacity;
+	unsigned long v_epc[];
+};
+
 bool __vcpu_has_ext(struct kvm_vcpu *vcpu, u64 ext)
 {
 	unsigned long value = 0;
@@ -297,14 +304,6 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
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
@@ -348,8 +347,33 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
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
+	}
 
 	return vcpu;
 }
@@ -408,19 +432,17 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 	struct ucall uc;
 
 	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED) {
+		vcpu_dump(stderr, vcpu, 2);
 		TEST_FAIL("Unexpected exception (vector:0x%lx, ec:0x%lx)",
 			uc.args[0], uc.args[1]);
 	}
 }
 
-struct handlers {
-	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
-};
-
 void route_exception(struct pt_regs *regs)
 {
 	struct handlers *handlers = (struct handlers *)exception_handlers;
-	int vector = 0, ec;
+	int vector = 0;
+	unsigned long ec;
 
 	ec = regs->cause & ~CAUSE_IRQ_FLAG;
 	if (ec >= NR_EXCEPTIONS)
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
+		 * Track the epc per-vCPU to avoid an infinite loop when
+		 * V is disabled or the hardware rejects the VS change.
+		 * Using a per-vCPU array avoids races between concurrent
+		 * vCPUs that would occur with a single shared (epc, vcpu)
+		 * pair.
+		 */
+		if (handlers && handlers->v_available && !(regs->status & SR_VS)) {
+			unsigned int vcpu_id;
+
+			asm volatile("csrr %0, sscratch" : "=r" (vcpu_id));
+			if (vcpu_id < handlers->v_epc_capacity &&
+			    handlers->v_epc[vcpu_id] != regs->epc) {
+				handlers->v_epc[vcpu_id] = regs->epc;
+				regs->status |= SR_VS_INITIAL;
+				return;
+			}
+		}
+	}
+
 	if (handlers && handlers->exception_handlers[vector][ec])
 		return handlers->exception_handlers[vector][ec](regs);
 
@@ -448,9 +510,26 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
 void vm_init_vector_tables(struct kvm_vm *vm)
 {
-	vm->handlers = __vm_alloc(vm, sizeof(struct handlers), vm->page_size,
+	unsigned int max_vcpus;
+	size_t size;
+
+	if (vm->handlers)
+		return;
+
+	max_vcpus = kvm_check_cap(KVM_CAP_MAX_VCPUS);
+	if (max_vcpus == 0)
+		max_vcpus = 512;
+
+	size = sizeof(struct handlers) + max_vcpus * sizeof(unsigned long);
+	vm->handlers = __vm_alloc(vm, size, vm->page_size,
 				  MEM_REGION_DATA);
 
+	{
+		struct handlers *h = addr_gva2hva(vm, vm->handlers);
+
+		h->v_epc_capacity = max_vcpus;
+	}
+
 	*(gva_t *)addr_gva2hva(vm, (gva_t)(&exception_handlers)) = vm->handlers;
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
