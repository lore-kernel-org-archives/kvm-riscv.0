Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F445C5CFCF
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+ab0evvRppVoH4Ty1zPVQV5XiQej+ZRDkREbeZ1McY=; b=tSemo/mqHQvU6b
	cXmhsRzr5BmwA5fmC6eBgKI0kF7Bc7mjvUnStEE6ve2uysQkbP76Aqm4jt2BbZUDu/NBZ6tx1kHEd
	CR/pz9I2kEjD6AFNwsOpS5cZj5mHsFLfvBG2xbYqcenbeWBsy9B3HozPpHKB/jVIa8pmnBJKjrSCd
	ju6/zD48Y6pUyyuaG3fI4W11zf8AjH/+uToCgbU1XzjPCXaN/PRokdL8Gq/O7gzx8G2z567ixytxz
	QCOYaK0CO33vu1wRaoX6pVpj4xvXCrVX4gwJyHyIJ5e8FEgKyJEjt6eDmsXtQgZSKX+YSt9Vbc7iT
	EpAdxoZNqe7MjNZOfwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiDB-0000000Df1F-14YX;
	Tue, 11 Aug 2026 08:51:53 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtiD8-0000000DezG-1XFy;
	Tue, 11 Aug 2026 08:51:52 +0000
X-QQ-mid: zesmtpgz5t1786438248t5bf60429
X-QQ-Originating-IP: gUGxVCIIhUargft6EcdygpOh9PpkRHMlhsJ+yq9STcE=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Aug 2026 16:50:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17194344064745379090
EX-QQ-RecipientCnt: 15
From: JinRui <jinrui@haiwei.tech>
To: anup@brainfault.org,
	pbonzini@redhat.com,
	shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: atish.patra@linux.dev,
	alex@ghiti.fr,
	sashiko-bot@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jinrui <jinrui@haiwei.tech>
Subject: [PATCH v9] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Tue, 11 Aug 2026 08:50:36 +0000
Message-ID: <034CA48A67574B32+20260811085036.2862645-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722073344.771230-1-jinrui@haiwei.tech>
References: <20260722073344.771230-1-jinrui@haiwei.tech>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N17Koc4oSm0pkIoFhlC95tW8hhCGhBoFFWyTjvkqHfdLq1SJAgSI8SWV
	iCg/twJhOMfAPWkMx9ojC682J7Pvqh0oT9JITwWwFHJXoBIw3l6bRn3gfk83ZYYGUWJACbD
	qWSV+xgghajRheFxp1b+ES38OqpslVDBX5kHTZ+E+oMQto3ikutmDsg03Aa5bE8OGnHvWFE
	R0EibPW5beFG+X+PGp/9NujS4oDLMfUgBZh6ELnshvlx5N4X5fuU6h6C6iIhmN7TbvfG2cn
	FDlUhgWrGs1EDpsk0HKC+qwuW3R7iXSx6PlbCgjFCsHW61kFYMQM/xGboGHqlA0sBtS+Ujz
	ZFBjlywum/21tyrS8v7aVBjE7Y/YTdTXwk3o+izR+uDW4Df6htRTuU9saGPuVshJzp2Uzgp
	juUmoVTsIJgprY/ad/YpHxtg0qH/FIPl/izPPmbwwBenVfp9zhchVbsw8V0zLue9sa+fbNQ
	V+vwzbOB5ty8ZeVRweubgLycqRY6LyjPZYXntmMYSI9pGT2PM7/M/qEAtY/LlFJt05rShUz
	B+9v/aNeM5yaD6r1YorbNF5K4D5sdL9aih8YXUPdmO41CkRo21Vsby7/uAQ1gB6Bl3Rpmhk
	koqWSWZ+7tMnZ7BlnjLHwT6fKU0B3Jqx84BqMvGFHrOwKCFw9r7TgLWnxyV0tZjOe9peDX1
	O3vM27A0XJuhXOHY/epNhQL2yD3s3HUCyqwiTWZ4WQ/LZAYFk56dmECuP6fVY7iwaeHraFJ
	n8R+ih+NhRakrcEgyNYrdJp1C2owxLX4Ai+wrsQ7qkrbaDJ62NNJz1pmcBR+XjX9sklBygj
	JqzABwgX9kgctrHklH6qBf5HHLpATVGMNsdTCGFdEc9iPuu60WE3MIDZJ3Vx8+HbcTuZme7
	6Ll1cw2NkejetIQ7iWaYRg1K86J2C+3qjDaE8OuOBJc8uvtsuTFmrueX3B1QVAMWazQdFfV
	rsKbFI4fHq+NcxDB3BxuYQ2yTx6vLhlsczUMqpeDMk3IGwcclQhIsgbq2
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_015150_819578_7BAD54A2 
X-CRM114-Status: GOOD (  19.85  )
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
Changes in v9:
- Size the per-vCPU epc array by KVM_CAP_MAX_VCPU_ID instead of
  KVM_CAP_MAX_VCPUS, since vcpu_id may be sparse and exceed the vCPU
  count (found by sashiko-bot review).

 .../selftests/kvm/lib/riscv/processor.c       | 115 +++++++++++++++---
 1 file changed, 100 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3..05e20ef40 100644
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
@@ -298,13 +305,6 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 		core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
 }
 
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
@@ -348,8 +348,33 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
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
@@ -408,19 +433,17 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
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
@@ -432,6 +455,46 @@ void route_exception(struct pt_regs *regs)
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
 
@@ -448,9 +511,31 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
 void vm_init_vector_tables(struct kvm_vm *vm)
 {
-	vm->handlers = __vm_alloc(vm, sizeof(struct handlers), vm->page_size,
+	unsigned int max_vcpu_id;
+	size_t size;
+
+	if (vm->handlers)
+		return;
+
+	max_vcpu_id = kvm_check_cap(KVM_CAP_MAX_VCPU_ID);
+	if (max_vcpu_id == 0)
+		max_vcpu_id = 512;
+
+	/*
+	 * vcpu_id may be sparse and ranges from 0 to KVM_CAP_MAX_VCPU_ID
+	 * (which can be much larger than KVM_CAP_MAX_VCPUS), so size the
+	 * per-vCPU epc array accordingly.
+	 */
+	size = sizeof(struct handlers) + (max_vcpu_id + 1) * sizeof(unsigned long);
+	vm->handlers = __vm_alloc(vm, size, vm->page_size,
 				  MEM_REGION_DATA);
 
+	{
+		struct handlers *h = addr_gva2hva(vm, vm->handlers);
+
+		h->v_epc_capacity = max_vcpu_id + 1;
+	}
+
 	*(gva_t *)addr_gva2hva(vm, (gva_t)(&exception_handlers)) = vm->handlers;
 }
 
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
