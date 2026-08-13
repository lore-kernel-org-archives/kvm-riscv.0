Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CBEC5CFDB
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 10:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX2U6CNdQmHQOfw31WNkXBt6rMvSwDj5zfo6yTXGXFY=; b=MfE/WX0rSTOxTr
	dJ9B/8Ayd2r2YwAbjkycUkt+mew/wLrlvOYbquyY5BSQ04GLYErYnJLZDB62TPp+BKvCqAQQJvcec
	hp7rgCrDU1rMUFKPhvHui/pLlskXobZhgcCrm5nhJWzSwae3UNKA6cuWI2D2mLwY9oMvvfMOBPoxS
	JGPh7FBuItvg6DxTqIh/7Aqw9ZGK6kW5ZZpyhXfds4LYpYxtczQDSbo56vVh9SHTIP6ENPVDsyOwK
	a7mK1hmDIQArAPipkDI3FuNAaUpA4SCcxKVbS5+CAnMPZoymlq3HZpBI3D86N2/OxS+J4vfrNOy3M
	jqrfPYzW9DyVe0faUV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSi7-00000000UMp-13KS;
	Thu, 13 Aug 2026 10:30:55 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSi0-00000000UJy-2XXR;
	Thu, 13 Aug 2026 10:30:53 +0000
X-QQ-mid: esmtpgz15t1786616975tae215c51
X-QQ-Originating-IP: OZchcY0gz9zI06/R1UDHEGCx1nSeqfz4hgfoniqGDtE=
Received: from rsl ( [183.242.33.186])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 13 Aug 2026 18:29:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11012683482226331164
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
	jinrui@haiwei.tech
Subject: [PATCH v13] KVM: selftests: riscv: Add lazy V extension enablement for guests
Date: Thu, 13 Aug 2026 10:29:30 +0000
Message-ID: <20EA6EE00884FB87+20260813102930.3892251-1-jinrui@haiwei.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7C0512E558D1614D+20260813095615.3843757-1-jinrui@haiwei.tech>
References: <7C0512E558D1614D+20260813095615.3843757-1-jinrui@haiwei.tech>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:haiwei.tech:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NkbnXpgg1H1R7JDsws/6SRO4bUgh7Ma1apX3OcdxzCmCrcpQAF5gDBVd
	u8/v2w5oLC4ZWGn59bbfjFnDPYoUlXQ3br3Lh2DHg0ggwhGkde9cndQPlg+0MyGM/dwk8sK
	GREFcqeQ9n5xdfZGxyTxRaks+Vbm/2QHqRRizeSshOCukVtas7rKuVZYr4KWR6ImBWhVltq
	t0S8caJNdjKE2nq0PNOyKwQa/op5Z4kGoOCB07ZNW9rMO5mHtH4+QeScYPtL29oDrNc/Cqi
	5JoQQIUHkDBkPVGDJ0QWEfvDi/jqxSTFLjvFn+G2ff7kOGVV+hjE3gPE8wWB791asRJgNYa
	uC4kIGTC/88plwKHwqv2SGwZMTw7TcRaOf7/mdCe6FBCu9IJxi+oQjezQ5DruRfvxC+TIqP
	VkX8I2MjSdQl/eM2I4jDT7mydhQVnSnkWOlotoo19yebAXQAqSaU6moCq1jXDgbJGbYWok3
	3FGdw3HpICX2L3RRuwkMASy6y0rT0p0KCnr/w9pFLe+YAD878Ecx6pawEYYoXZ/R5vzC3Mp
	qZqKUyEun/Bkewa5M/WZepuwCAnj1X6nusHAONpzUJ3PqZIx9epXGKfgQceqXr6pmvF+x4t
	Jt9er7MHBOtuZCgi45/BuQpqwnYx5mHz1wAgHY3d67az8zehdopaYkee7mLnqTIPhGYfPmk
	Fzg/zwfLRnglHbq+3RkPJNQU1RERQml2nqtSjusmdJ/mgn7W6ssCxE5YsSSZHSpPoiCwtw0
	3KQoWUwHnfjDEUN0gPVJbU1ecU+O9LQSCLPT8WKjH7r7dsUDs3uEl0zFB5ySG1iq2b5y1Il
	ffJV+b1VO5U2D4NjHkODZpYtBg3F5hOZj5Ly627sNNE5Rr//WtzKujyjVJ5mL0/rxEYbGOr
	qacu90LN8ZJrKlG/2hAQzKbTfOs7uyYb3qhp5gh+VJjTUWZYaPoJGCBvgV9tl5N4Qv/YmbZ
	zMDlkz0OipQRSv++9uewXL4XCxuFchkemuq4lZ3sgdTW7lPujLJiMxa21i2jRXeIL8uxHO6
	09d4ElBlMCvbI4/VqzPkDhZtB6I1JPwK9gk2eeRx6NiNIuVGcFekZLHCxgOmOyrzt6YKLHg
	lxtXQeE/An+yKHD2izz4+Mrqnp5kDOfwlmOGuH57x8M
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_033049_124068_1091DBCF 
X-CRM114-Status: GOOD (  20.73  )
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
Changes in v13:
- Assemble the 32-bit instruction from two 16-bit halfword reads instead
  of a single 32-bit load, since with IALIGN=16 a 32-bit instruction can
  start on a 2-byte boundary (Sashiko review).

 .../selftests/kvm/include/riscv/processor.h   | 13 +++
 .../selftests/kvm/lib/riscv/processor.c       | 99 ++++++++++++++++---
 2 files changed, 99 insertions(+), 13 deletions(-)

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
index ded5429f3448..d00ac997291c 100644
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
@@ -348,8 +346,26 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
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
+	/*
+	 * Record V availability for route_exception(), which runs in guest
+	 * context. V is enabled uniformly for every vCPU, so this is a
+	 * VM-wide property.
+	 */
+	{
+		struct handlers *h = addr_gva2hva(vm, vm->handlers);
+
+		h->v_available = __vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA_EXT_V);
+	}
 
 	return vcpu;
 }
@@ -408,19 +424,43 @@ void assert_on_unhandled_exception(struct kvm_vcpu *vcpu)
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
@@ -432,6 +472,36 @@ void route_exception(struct pt_regs *regs)
 		ec = 0;
 	}
 
+	/*
+	 * Lazily enable V on the first vector instruction: if the faulting
+	 * instruction decodes as vector while VS is off, set VS to Initial
+	 * and re-execute it, like the kernel's riscv_v_first_use_handler().
+	 * Genuinely illegal instructions continue to the unexpected-exception
+	 * path.
+	 */
+	if (!(regs->cause & CAUSE_IRQ_FLAG) && ec == EXC_INST_ILLEGAL &&
+	    handlers && handlers->v_available && !(regs->status & SR_VS)) {
+		u32 insn = (u32)regs->badaddr;
+
+		/*
+		 * stval is not guaranteed to hold the faulting instruction.
+		 * Vector instructions are always 32-bit, so check the first
+		 * 16-bit halfword and, for a 32-bit instruction, assemble it
+		 * from two halfwords to avoid an unaligned 32-bit access.
+		 */
+		if (!insn) {
+			u16 half = *(u16 *)regs->epc;
+
+			if ((half & 0x3) == 0x3)
+				insn = (u32)half | ((u32)*(u16 *)(regs->epc + 2) << 16);
+		}
+
+		if (insn_is_vector(insn)) {
+			regs->status |= SR_VS_INITIAL;
+			return;
+		}
+	}
+
 	if (handlers && handlers->exception_handlers[vector][ec])
 		return handlers->exception_handlers[vector][ec](regs);
 
@@ -448,6 +518,9 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
 
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
