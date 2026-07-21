Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A29C4451C
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ihmdJQIdILS5lX/DSv3flKsgHCy4U2XKUC7YkBrMKAY=; b=Cgq4Hg3K8QOJrb
	7NzZ0ft9mrGAGDH3uPpOHd/88COOk/DeSRzY7jROlTBXibfmpiy35OB8y4c224NW/Iq/eRciPWsns
	nr+rwlJrcYBSvkYV9vgkH+Vt9dqesm18/vAbEpnIPIPWTg/dfwAwbsb8NZRfFwYQ1s24YiZ07Gg1N
	QRDGVIwKL38DmLxJJXgsc6C/GOIvSekLe+dhBO8GadE4Ce6vMEq0HABWnNg70Qgj/2xEgFsCx3j5c
	mKO0ZflEDv0OzurdqnW/02E3UVfNTI152j1fi+g3QquNRST3zhXL2/hWYh9ZwUat0MiaEDvKE6W6j
	BTo2jFvs7omUo/mq7YFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm961-00000009MQr-2veq;
	Tue, 21 Jul 2026 11:57:13 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm95x-00000009MQ1-1Fsw;
	Tue, 21 Jul 2026 11:57:11 +0000
X-QQ-mid: zesmtpsz6t1784634963t6e8a6e90
X-QQ-Originating-IP: 7UTGWJP3KrvUOqnlyru4WDx7yxHshRvG5L4FHHW3S5o=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 21 Jul 2026 19:56:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18011628127360508405
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
Subject: [PATCH v4] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Tue, 21 Jul 2026 11:55:58 +0000
Message-ID: <759A31C23819178D+20260721115558.341592-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721112454.330498-1-jinrui@haiwei.tech>
References: <20260721112454.330498-1-jinrui@haiwei.tech>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MWqDrZRYA17xUkBBiUuWLwKBGYHEGnwmnclZeyLeIWUaajabgXgqhpXS
	VyGC0+zay4rO8M1CQrdDzeMKPffAW33/CDT7IFMKU09GFV+5C4eD5iAXzc4DP3tlhZiAmob
	GTzI+QR1mYF57d/EeO50jBOKNcYi/cBKM841+/7NhC9PAcgCHVwcnW7pBGRmRiYmwUYRnbr
	GDNjuwcw7PnlW1g/RWpE8Qe4+GuEleMriwN+1pmSuzNkr22qW8/gBWYASpOc4SJB2a6fY7m
	zgOk8VTakWr3h6aXYZcqzMw/uRtxR4ISmtTaYY/rzTa3FK7f/aqyUkF+Yefe0FJ1oFd093Y
	4YLNr0fVh/Lu2skBusl5wSXZExpZWSxYrn80DmyDvNG0X5zGrHAM19jMgT2HEXgIcv8lH4p
	ToWw1D16GKbHYxaisRD8UrNv3i0TKhgj6pN6yRx5KMG0mj4tNxD2m88Na1dVI9X86HOFG0W
	YrBElMlZqa3mpUKI8ZtaYgEUQKy0ISUXuh/FTZw4F/RUtCNyM0O1EhgOuGoCIPl8hTfoZP5
	HL6AplEJcpCibcxfjmnQ4ztQuQTBbLfpdrIIxkqXgWuMZn4L772+nG5GwfmXpNcYakf3Lx/
	StoN+V9S69SZ73MJIrGuHx+zP0SN6yHrLETCmC5/ohEpeetCVqKe87Dq1M1xTQRD9+17mkE
	AwugxaLWJUTbpuyutFCJuO5i+L7u6492sjCmx4HRxq7YKC+41cOIyU6cgm2J19Cw9NTuWuK
	jyNn8UZ5aUHzwaklJaapx4IEN1y9qgpHtBdxtutpJ16j8JjHbjdcuYbzjcmI6GPc0ywCGSj
	Oh9h5/frYrfmDlfiSljc6eu6m3OKXOckyfPEd1YjUxdgdsF+MJWoOZo3RRjuRiJnQ3DKp5F
	BxQnf57R+srDWaDGJCr3vXs4C8baiDKEw/zkYE0wcZNPNocvQ7+ECz3RWJBfyuYUmAuBhOS
	I/wLd67fP8AymGbdYACDQ0J/a7PP3gQBSuIU6hvnsBcFDyCahQffbMZTct0SMogs0Tmylzq
	GzU3UoAHIGX8P37l7b5clqtQtvvQDLvhvtjnOhe00z885BBHGAjvBAOWTnwa87zXBuRV3NV
	BTK4LkqcCF9Gklnf4AEexo=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_045709_864673_38683391 
X-CRM114-Status: GOOD (  18.17  )
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
Changes in v4:
- Add vcpu_dump() call in assert_on_unhandled_exception() to restore
  the register dump that was lost when guest_unexp_trap() was removed.
Changes in v3:
- Move v_available from a host-side static variable into struct
  handlers (Guest memory), fixing synchronization issue between
  host (writer) and Guest (reader).
Changes in v2:
- Add a v_available flag to prevent infinite exception loops on
  hosts without the V extension.
- Use regs->status instead of reading the live sstatus CSR.

 .../selftests/kvm/lib/riscv/processor.c       | 69 ++++++++++++++++---
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..bf0675cc86d6 100644
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
@@ -348,8 +340,33 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
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
@@ -408,6 +425,7 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 	struct ucall uc;
 
 	if (get_ucall(vcpu, &uc) == UCALL_UNHANDLED) {
+		vcpu_dump(stderr, vcpu, 2);
 		TEST_FAIL("Unexpected exception (vector:0x%lx, ec:0x%lx)",
 			uc.args[0], uc.args[1]);
 	}
@@ -415,6 +433,7 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
 
 struct handlers {
 	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
+	bool v_available;
 };
 
 void route_exception(struct pt_regs *regs)
@@ -432,6 +451,33 @@ void route_exception(struct pt_regs *regs)
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
+		if (handlers && handlers->v_available && !(regs->status & SR_VS)) {
+			regs->status |= SR_VS_INITIAL;
+			return;
+		}
+	}
+
 	if (handlers && handlers->exception_handlers[vector][ec])
 		return handlers->exception_handlers[vector][ec](regs);
 
@@ -448,6 +494,9 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
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
