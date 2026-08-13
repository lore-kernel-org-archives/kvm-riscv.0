Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E327C5CFDB
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNWmJPiizH7LjunHTuJXfxex4uRCAuerUCsjcmJTD3w=; b=y0IZLRGrWKBKRz
	hj6QFufHmQbO+ll2IWqv0+eMvVhATRs8c33cxqPF+jC9ZsE7dQPEJgi+JPzserlI7HNpkq+1qORyL
	7PjXVcw6DAzjvSKIWalZ3rQx0bxXofywWnoGCrSvDVQWIuEXT5YcefCbkGrr+dnSiXdCx6CdkYR4b
	SP3U5Du+Fyex723KWrl6n8r/hpupjFfCOycwffaH/ebjZ0v2WsfigePGFN+0sftwuEm3oXj+HUjZ3
	i+L95WSfR3N+UxQDnl1tcvqbXgsz2eeth/as9Br++i/TS391d/AfNI+ZEIVgbs38b6sYzFIp2u9G8
	sgGW2CFsoxQunyYvT7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRMd-00000000Ewf-428r;
	Thu, 13 Aug 2026 09:04:39 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRMa-00000000EuN-2nYj;
	Thu, 13 Aug 2026 09:04:39 +0000
X-QQ-mid: zesmtpsz5t1786611793tcd0fa4e6
X-QQ-Originating-IP: R9Ej3Mabn7TW3eBk3l+R5rLw0xXXsSI9t86r56myLeo=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 13 Aug 2026 17:03:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4575981333641780540
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
Subject: [PATCH v10] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Thu, 13 Aug 2026 09:03:06 +0000
Message-ID: <733FC2542EECADE1+20260813090306.3756434-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <034CA48A67574B32+20260811085036.2862645-1-jinrui@haiwei.tech>
References: <034CA48A67574B32+20260811085036.2862645-1-jinrui@haiwei.tech>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M4K5T4TFHUAHl8dlpPbV/IMNFF08u9arvqRwpzOatw+OAVnK8J159hga
	QaaVuhOt5sU7YGZrLquNUU4vyyNnGtn7Cj3IZBpiTonyefm7wWzc7WDNoT8LV0xSGjK+dPV
	fVmaim8akKeBGcAkpuHmrstEXieyU+PK499N/wftf/KyWeDfg/x7WXDM9BdChuoBrLvWawt
	N41kDy0Of7rJweAubW8FCXalmbXQy77Uqc068j6vSSLvvqYG5Em5Qcmf0pYDaC81Ln6kPvC
	SzHyukawNEN8K/1hG55kpkFvvn290SFvjKKEnUZHDAdMbpIdnF5gd84OI6qxbKfKdqHjELu
	RZ2S4IHO07KBoA7a1SLrncUVLjdfEVuaEh7tzSiwUW2m22HtjF29FoV8mLmpcfFx/EESV0M
	cCvq2UCSjTwPVn++pjsz8y5ArvGjMEeYoAF244OaHau9DvyIfCmuHj8/3V2JuszKkQcPBPX
	pPdzeZJOapusS3/Oy+WKGEV/zjbrTN7uTqUkjBuzpWcazow33wubTrfRM75zq3CWErghynV
	/CcStN2jFrslN0kEselQiDGmqdxKuViFpJ66KIqPJU/dO2nSNFSHH+Y5KClSSfUu1jQFlpQ
	19W5GHMETAYpztZc8uNrichmbF26hZucsMPoWt5UIz69TThDRRTs15o92CkGDW4rtJAh9JI
	axpvtZOklJFauAtDCrImxo0ciWUXmp7VNgVaP+CJ6LAfVI1yz+WHajK6olgBYtGkmhme7Nl
	itBUfglP45r+VRWd7P3RvdvoxJ5Y7DV0ZeqWKwmnKmBqsJy4azbFze+/W5bkrFCAUGjpWOY
	wwi3aYjx9ZdzlcaKOos0WeqFnN9riiRzy881uyosxB7AgLvaNUE3gy+uHndNSrvgyDrTlLN
	w3r39WfKk4iE8km25OxQnxLBV/WH5CbhfWHNCmSPI++HHxqCNlRFW6GbO3c5S+Uzq5PPN7F
	ivi4asp3wzkfzvkB2lSG6y3D5MS9XBNYG8E3nzrRZiobf+g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_020437_068632_1DDDEC74 
X-CRM114-Status: GOOD (  19.02  )
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
(vector) extension, -O2 auto-vectorization generates vector instructions
(e.g. vsetvli, vadd.vv) in guest code. Executing such an instruction with
sstatus.VS Off raises EXC_INST_ILLEGAL (scause=2); KVM's hedeleg forwards
it to the guest, but the bare-metal selftest cannot handle it, so all
guest tests fail. A real kernel handles this via
riscv_v_first_use_handler(), which enables V and re-executes the
instruction.

Fix it in processor.c:

1. Delete the now-unused guest_unexp_trap() handler, replaced by the full
   exception vector table.

2. In vm_arch_vcpu_add(), advertise V to KVM via __vcpu_set_reg(V, 1)
   (best-effort, errors ignored on hardware without V) and install the
   full exception vector table instead of a raw stvec handler.

3. In route_exception(), decode the faulting instruction (stval) with
   insn_is_vector() and, when it is a vector instruction while sstatus.VS
   is Off, set VS to Initial and sret to re-execute it, before any
   test-registered handler. Genuinely illegal instructions still reach
   the unexpected-exception path.

4. Make vm_init_vector_tables() idempotent by checking vm->handlers
   before allocating, so tests that call it directly (ebreak_test,
   arch_timer, sbi_pmu_test) do not leak memory.

Tested on a riscv64 host with KVM enabled.

Signed-off-by: jinrui <jinrui@haiwei.tech>
---
Changes in v10:
- Decode the faulting instruction (insn_is_vector()) and only lazily
  enable V for actual vector instructions, so genuinely illegal
  instructions still reach the unexpected-exception path (Anup).
- Drop the per-vCPU v_epc[] guard and KVM_CAP_MAX_VCPU_ID sizing, as
  they are redundant with v_available and the sstatus.VS check.

 .../selftests/kvm/include/riscv/processor.h   | 13 +++
 .../selftests/kvm/lib/riscv/processor.c       | 79 ++++++++++++++++---
 2 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index e3acf2ae9881..685baefebdb1 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -25,6 +25,19 @@
 #define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHIFT_FUNCT3)
 #define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SHIFT)
 
+/* Vector (V) instruction decoding, matching arch/riscv/include/asm/insn.h */
+#define RV_INSN_OPCODE_MASK	0x7f
+#define RVG_OPCODE_SYSTEM	0x73
+#define RVV_OPCODE_VECTOR	0x57
+#define RVV_OPCODE_VL		0x07
+#define RVV_OPCODE_VS		0x27
+#define RVV_VL_VS_WIDTH_8	0
+#define RVV_VL_VS_WIDTH_16	5
+#define RVV_VL_VS_WIDTH_32	6
+#define RVV_VL_VS_WIDTH_64	7
+#define RVV_EXTRACT_VL_VS_WIDTH(insn)	(((insn) >> 12) & 0x7)
+#define RVG_EXTRACT_SYSTEM_CSR(insn)	(((insn) >> 20) & 0xfff)
+
 static inline u64 __kvm_reg_id(u64 type, u64 subtype, u64 idx, u64 size)
 {
 	return KVM_REG_RISCV | type | subtype | idx | size;
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..ffd84212c9b0 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -17,6 +17,11 @@
 
 static gva_t exception_handlers;
 
+struct handlers {
+	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
+	bool v_available;
+};
+
 bool __vcpu_has_ext(struct kvm_vcpu *vcpu, u64 ext)
 {
 	unsigned long value = 0;
@@ -298,13 +303,6 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
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
@@ -348,8 +346,22 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
 	/* Setup sscratch for guest_get_vcpuid() */
 	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(sscratch), vcpu_id);
 
-	/* Setup default exception vector of guest */
-	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
+	/*
+	 * Advertise V to KVM so -O2 auto-vectorization in guest code is valid;
+	 * ignore errors since the tests work without V too. Use the full
+	 * exception vector table (which lazily enables V in route_exception())
+	 * as the default handler; vm_init_vector_tables() is idempotent.
+	 */
+	__vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_V), 1);
+	vm_init_vector_tables(vm);
+	vcpu_init_vector_tables(vcpu);
+
+	/* Record V availability for route_exception(), which runs in guest context. */
+	{
+		struct handlers *h = addr_gva2hva(vm, vm->handlers);
+
+		h->v_available = __vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA_EXT_V);
+	}
 
 	return vcpu;
 }
@@ -408,19 +420,43 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
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
+static bool insn_is_vector(u32 insn)
+{
+	u32 opcode = insn & RV_INSN_OPCODE_MASK;
+	u32 width, csr;
+
+	/* All V-related instructions are 4-byte, i.e. not compressed. */
+	if ((insn & 0x3) != 0x3)
+		return false;
+
+	switch (opcode) {
+	case RVV_OPCODE_VECTOR:
+		return true;
+	case RVV_OPCODE_VL:
+	case RVV_OPCODE_VS:
+		width = RVV_EXTRACT_VL_VS_WIDTH(insn);
+		return width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
+		       width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64;
+	case RVG_OPCODE_SYSTEM:
+		csr = RVG_EXTRACT_SYSTEM_CSR(insn);
+		return (csr >= CSR_VSTART && csr <= CSR_VCSR) ||
+		       (csr >= CSR_VL && csr <= CSR_VLENB);
+	}
+
+	return false;
+}
 
 void route_exception(struct pt_regs *regs)
 {
 	struct handlers *handlers = (struct handlers *)exception_handlers;
-	int vector = 0, ec;
+	int vector = 0;
+	unsigned long ec;
 
 	ec = regs->cause & ~CAUSE_IRQ_FLAG;
 	if (ec >= NR_EXCEPTIONS)
@@ -432,6 +468,20 @@ void route_exception(struct pt_regs *regs)
 		ec = 0;
 	}
 
+	/*
+	 * Lazily enable V on the first vector instruction: if the faulting
+	 * instruction (stval) decodes as vector while VS is off, set VS to
+	 * Initial and re-execute it, like the kernel's
+	 * riscv_v_first_use_handler(). Genuinely illegal instructions fall
+	 * through to the unexpected-exception path.
+	 */
+	if (!(regs->cause & CAUSE_IRQ_FLAG) && ec == EXC_INST_ILLEGAL &&
+	    handlers && handlers->v_available && !(regs->status & SR_VS) &&
+	    insn_is_vector((u32)regs->badaddr)) {
+		regs->status |= SR_VS_INITIAL;
+		return;
+	}
+
 	if (handlers && handlers->exception_handlers[vector][ec])
 		return handlers->exception_handlers[vector][ec](regs);
 
@@ -448,6 +498,9 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
 void vm_init_vector_tables(struct kvm_vm *vm)
 {
+	if (vm->handlers)
+		return;
+
 	vm->handlers = __vm_alloc(vm, sizeof(struct handlers), vm->page_size,
 				  MEM_REGION_DATA);
 
-- 
2.53.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
