Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36364C44512
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JWXFlF8aU5YGj4TcPop1cIINtuy7gieTXo87ESd4+w=; b=MZIHomOnDvAJHB
	fsEUesUOB2opSspxxxn6V308/IDHGWjiHZ/Ql5cK8ApuccDIViChJ/r0MIerVj7sVm8PwQu5MjdD9
	mc8khWHiN8pq3cmxgwQ5T6v1PEM+Zeerl6B4oPeAt4J9REbuhb8sSA74CrgH7X/mHbhQiQFGnK9gN
	F3LC78U3w/wyFiVzNre9P7ayc2CuW/izijSzLf19hZ1Av3qgmG5Y3mhOzJesBkrl0EU7bTV1tokCl
	WcLMU8ae1ruYs8FaAGEmdnT2E6qQYNgbC+iv9qb7qwng87DknMhQPp0GzYF6CQtU79EB3Ef2Svr22
	zbtWfHtZA0NctsroodJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQSP-0000000AyLX-2fxJ;
	Wed, 22 Jul 2026 06:29:29 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQSL-0000000AyL2-1VXO;
	Wed, 22 Jul 2026 06:29:28 +0000
X-QQ-mid: esmtpgz12t1784701691t24bb549c
X-QQ-Originating-IP: 9oYuK7QuFV4ueBJwUK0W0oO7gIQzndCeg/X3NL+l4rc=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jul 2026 14:28:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14402031847002852684
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
Subject: [PATCH v6] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Wed, 22 Jul 2026 06:28:04 +0000
Message-ID: <A0B8068D0600FC75+20260722062804.738428-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721122442.351865-1-jinrui@haiwei.tech>
References: <20260721122442.351865-1-jinrui@haiwei.tech>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NNCgUTg3ctKTq0/wwhqC6oQ5J0GWDWRD+P4MVH6jhCQr5duYUvhDRDBS
	tWh8ixQFV519vaiMMcmI0e0U5eD+6FfLU+1XmkpVdCg9i9kA00O4CuKpnE5hiVGJ523k0is
	awIMm2WYYMsKGnGxgTa5yTZW+X3nCOBo/Yo8dQIN+Kn37+BOnTOM7LXBASp6qf8S2+Aw7nJ
	ZWwspG1nV89dl0d6TkBEUwncdXEd2oFXxwdVmqQZbG6NIO+f3ds7ZU/0oUIGpG5rUYLKyzd
	QihgVoft/SMCb8a86tSeQu1ctDWRowlntcCVElUcjjllM3Z7rMJk84k9bP8ghBNV8S6G5aR
	sL5jOp5CyWzoa8/Mj09GTfSSAqS21ml2wIhDdfOB8SJgyYiAYxweks0Ou2/U5BqVMvw85g0
	F4LuNDkD93/uaj4NWQYlj42uVrBCNT1/6KfTeYlaxKYlwCRb4gw0dtzYccaCzqFwj7Vga2K
	Y7f3ggZFY8u+QJzJLuxEFmJcogbu6CUk4XxqpXnoVTWbXq+B7Ki50+6yXOJ9/oLod8cokVb
	dWiRaqnk0wrRhElTK57VHGJATVdtBezmz4sWVuBzZF7hEFpdPEv0z6Nucb/P+vpRWI8h5Lr
	GBiU+b45zmUn+Wsd1WsTrr0nFzI9LkLqxIJGUk4sjCPpvn+cRcUytqOvEgIT9pqgIIRHmjw
	g1XoXYnuoWIi8BPjYV4eRN8QouY8CfUyqpw3/+OrxLn+OLvgXbsfZe7G1YEhd8n2po4ys04
	6tgdgfyTKBANY84f80p+wkhk3NMfR/JZSI+0tweDWL9NDDcw/J4onG/l098SAspZNkiMiUH
	68eVC9LT/+VA4sqH/BDkxNC1+nkqIZl8/z4fnTKsV6euCK6IM23L8rYKVaXcjQawvtw2jXb
	Wki7DGCP5UXnQf0KrBHkBC3Y2GTKP3jEsfXSui39zMRMh2twzG0/z79UepHE+zbqIiQ66ic
	ULMTFXf7h2EnvdBFbdy6/JrkZ1O9DbxWOKMNWwkHNo2m0X///gyeJJdioDC1Ny8YkZwhSn/
	qOj5Bb2uS3Fl5Z/dKvkhpQrynxla4=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_232926_283689_EF083A86 
X-CRM114-Status: GOOD (  18.44  )
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
 .../selftests/kvm/lib/riscv/processor.c       | 108 +++++++++++++++---
 1 file changed, 93 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..b7449dffe660 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -17,6 +17,13 @@
 
 static gva_t exception_handlers;
 
+struct handlers {
+	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
+	bool v_available;
+	int v_epc_capacity;
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
@@ -408,15 +432,12 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
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
@@ -432,6 +453,46 @@ void route_exception(struct pt_regs *regs)
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
+			int vcpu_id;
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
 
@@ -448,9 +509,26 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
 void vm_init_vector_tables(struct kvm_vm *vm)
 {
-	vm->handlers = __vm_alloc(vm, sizeof(struct handlers), vm->page_size,
+	int max_vcpus;
+	size_t size;
+
+	if (vm->handlers)
+		return;
+
+	max_vcpus = kvm_check_cap(KVM_CAP_MAX_VCPUS);
+	if (max_vcpus < 1)
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
