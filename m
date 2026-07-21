Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E47C4451C
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEUlQ8GNdPUwsQwKAT6O1Z5VQ5t4hTyReGJu7sPWL00=; b=LTQX/6W+vk9Tn3
	u+me7KlwFambcRCEIj/YXWt2ARSO2XAtJy0mUw4Fgg58iLme4Cab9GVoxEnaZ+N7O63nxECu/fi9p
	mfJEP14p+km56FK17graiDKngQ3gU0xSu+tlYGyMtUe4BwNpB321iikOY0iGPff0B624vzS5nop+0
	zixtG6TgZdAQpnKTBTXbqTvBWSUvxjlbnOvTuOnVyRa8im1LZoeYx7ZG9lrfj5ZYl/bCpBnqmXz3C
	B3PTjTv+/ZwcSqIa96pZ21qAa1U5xa49fbyN+vMW/zSnjiHmNbqe7a5oKZnuRgRcFgnJA7HtHQyZy
	0dUPdV33x8MYrwboPanA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8Bu-00000009GhH-30t3;
	Tue, 21 Jul 2026 10:59:14 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm8Bq-00000009Ggd-3vG0;
	Tue, 21 Jul 2026 10:59:13 +0000
X-QQ-mid: esmtpsz19t1784631473t8bd3dbd8
X-QQ-Originating-IP: zVGL0MIEiXwbehjZG6FBDiiLZOrsJoGfOatAdd6SQLw=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 18:57:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4376131265427308852
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
Subject: [PATCH v2] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Tue, 21 Jul 2026 10:57:36 +0000
Message-ID: <C286E18DD19A86E7+20260721105736.320687-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4FAAF34C966898C0+20260721101406.305108-1-jinrui@haiwei.tech>
References: <4FAAF34C966898C0+20260721101406.305108-1-jinrui@haiwei.tech>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MllZffuBkEb5mwnkd5F36+Am6lsSF/2p72N+t99zqqYoSSvc3tRhaUeV
	fXUKa05e7GUJxCq+a8X50P1cZXRp8hMGRs/PH5sayD3wKnNWF52y4orSHHAOeqpnS3nOvZ3
	jfXeH2IPM0bjrslQEKVJVMhhGk4wfC/GtImsA261U2H4p4sIm3qOJw7PGzKH8VgPYwdXsCI
	s1axCdb6hxQJ6brvyKva1MPQgqe6PuvCDqjuQPOH7vNfM9qXBeF9SzQUwPkORQOtONg7Hit
	OG/LJG00gGCBnRD+rvJfl1s04Nmt7J1+K45asvfy1sRKnb3n68cd7++THLIeyrxYqxorJ0O
	6yGm1BNDVqevwYr9JmrAE4H1ipUtPKOxAEhY9T+w2ofjx4hsstA261kh6tZwUou/kwt+kOg
	FaqYyBN4SRh7iANcsj+rc1lfFAQ9x8rk1g+njF6ldIdHw7Y5LOID/X8IrjFT55rMTIO4Y51
	VA6cK0pjMHAknprg7RxDsusST8quCjomHYJ8nZmhNM2SzdQXEgRUI7Bp4BpcAPUVT8JXn0P
	emT7VTS+Vpu8weFrlwBPiorH678D1yp+J21J3ulCNd+rIWvH2eigslSrQY5soCZO3Fiokr7
	YwIS7IYsdt+RwK417i/4Of1HqWQ7o28SQgEokwx/apAc5tsFalqlSaGu0omKmDGtsKkv2QI
	+vvUDmX8jOja7/CxlsHZK86F+Ow4I7D3I5nuc02KPjd3sem0t5cEnCKO9xEbycUmfAmQ8gX
	69cM/pfcKOydat1lX2Nc/e2nC/WK4tRv7w49AjRZqzKPpIqOSp8U9MLQrf21g8LH72/x73W
	b0Vr6MAloGCnjyy7du59XF0YARYguYQwUAVKbD8K3SQ3cDBAipAUEMDZOleZcx6nFN/buEu
	HFu1byx+WaiwXCOWVA6TmCtFEu0e4icGGTkT/5oA45XSf4KhU142qD6XxUsGJUcNmDYTkpJ
	5XxAxB7JWscBnEw2H0Zk58vn67uABD1N/+Tk8Qp04Ah8UD8azFWTjVnY0OMnrNLB+GbtRIE
	tqPm7PRU+SSUOLqUUWp1up0PTNCSxUEQnsgaTAPaw8uldRCJwSioaZXBmkc6SRdc+u/9Bk8
	vShxLLlkr9n
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_035911_875826_2FE09ED9 
X-CRM114-Status: GOOD (  17.74  )
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
Changes in v2:
- Add a v_available flag to guard lazy V enablement on hosts that do
  not support the V extension, preventing an infinite exception loop
  when an illegal instruction is executed.
- Use regs->status (preserved at exception entry by save_context)
  instead of reading the live sstatus CSR, avoiding a TOCTOU race with
  nested exceptions.

 .../selftests/kvm/lib/riscv/processor.c       | 60 +++++++++++++++----
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..62efd07e5639 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -17,6 +17,9 @@
 
 static gva_t exception_handlers;
 
+/* True if KVM allows the Guest to use the V (vector) extension */
+static bool v_available;
+
 bool __vcpu_has_ext(struct kvm_vcpu *vcpu, u64 ext)
 {
 	unsigned long value = 0;
@@ -297,14 +300,6 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
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
@@ -348,8 +343,23 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
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
+	v_available = __vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA_EXT_V);
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
@@ -432,6 +442,33 @@ void route_exception(struct pt_regs *regs)
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
+		 * Initial and sret to re-execute the faulting instruction.
+		 * Use regs->status (saved at exception entry) rather than
+		 * reading the live CSR to avoid a TOCTOU race with nested
+		 * exceptions.
+		 */
+		if (v_available && !(regs->status & SR_VS)) {
+			regs->status |= SR_VS_INITIAL;
+			return;
+		}
+	}
+
 	if (handlers && handlers->exception_handlers[vector][ec])
 		return handlers->exception_handlers[vector][ec](regs);
 
@@ -448,6 +485,9 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
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
