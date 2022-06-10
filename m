From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 10 Jun 2022 10:35:54 +0530
Subject: [PATCH 2/3] RISC-V: KVM: Add extensible system instruction emulation framework
In-Reply-To: <20220610050555.288251-1-apatel@ventanamicro.com>
References: <20220610050555.288251-1-apatel@ventanamicro.com>
Message-ID: <20220610050555.288251-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We will be emulating more system instructions in near future with
upcoming AIA, PMU, Nested and other virtualization features.

To accommodate above, we add an extensible system instruction emulation
framework in vcpu_insn.c.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  9 +++
 arch/riscv/kvm/vcpu_insn.c             | 82 +++++++++++++++++++++++---
 2 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 4e3ba4e84d0f..3351eb61a251 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -18,6 +18,15 @@ struct kvm_mmio_decode {
 	int return_handled;
 };
 
+/* Return values used by function emulating a particular instruction */
+enum kvm_insn_return {
+	KVM_INSN_EXIT_TO_USER_SPACE = 0,
+	KVM_INSN_CONTINUE_NEXT_SEPC,
+	KVM_INSN_CONTINUE_SAME_SEPC,
+	KVM_INSN_ILLEGAL_TRAP,
+	KVM_INSN_VIRTUAL_TRAP
+};
+
 void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				struct kvm_cpu_trap *trap);
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index be756879c2ee..75ca62a7fba5 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -118,8 +118,24 @@
 				 (s32)(((insn) >> 7) & 0x1f))
 #define MASK_FUNCT3		0x7000
 
-static int truly_illegal_insn(struct kvm_vcpu *vcpu,
-			      struct kvm_run *run,
+struct insn_func {
+	unsigned long mask;
+	unsigned long match;
+	/*
+	 * Possible return values are as follows:
+	 * 1) Returns < 0 for error case
+	 * 2) Returns 0 for exit to user-space
+	 * 3) Returns 1 to continue with next sepc
+	 * 4) Returns 2 to continue with same sepc
+	 * 5) Returns 3 to inject illegal instruction trap and continue
+	 * 6) Returns 4 to inject virtual instruction trap and continue
+	 *
+	 * Use enum kvm_insn_return for return values
+	 */
+	int (*func)(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn);
+};
+
+static int truly_illegal_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      ulong insn)
 {
 	struct kvm_cpu_trap utrap = { 0 };
@@ -128,6 +144,24 @@ static int truly_illegal_insn(struct kvm_vcpu *vcpu,
 	utrap.sepc = vcpu->arch.guest_context.sepc;
 	utrap.scause = EXC_INST_ILLEGAL;
 	utrap.stval = insn;
+	utrap.htval = 0;
+	utrap.htinst = 0;
+	kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
+
+	return 1;
+}
+
+static int truly_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
+			      ulong insn)
+{
+	struct kvm_cpu_trap utrap = { 0 };
+
+	/* Redirect trap to Guest VCPU */
+	utrap.sepc = vcpu->arch.guest_context.sepc;
+	utrap.scause = EXC_VIRTUAL_INST_FAULT;
+	utrap.stval = insn;
+	utrap.htval = 0;
+	utrap.htinst = 0;
 	kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
 
 	return 1;
@@ -148,18 +182,48 @@ void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
 	}
 }
 
-static int system_opcode_insn(struct kvm_vcpu *vcpu,
-			      struct kvm_run *run,
+static int wfi_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
+{
+	vcpu->stat.wfi_exit_stat++;
+	kvm_riscv_vcpu_wfi(vcpu);
+	return KVM_INSN_CONTINUE_NEXT_SEPC;
+}
+
+static const struct insn_func system_opcode_funcs[] = {
+	{
+		.mask  = INSN_MASK_WFI,
+		.match = INSN_MATCH_WFI,
+		.func  = wfi_insn,
+	},
+};
+
+static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      ulong insn)
 {
-	if ((insn & INSN_MASK_WFI) == INSN_MATCH_WFI) {
-		vcpu->stat.wfi_exit_stat++;
-		kvm_riscv_vcpu_wfi(vcpu);
+	int i, rc = KVM_INSN_ILLEGAL_TRAP;
+	const struct insn_func *ifn;
+
+	for (i = 0; i < ARRAY_SIZE(system_opcode_funcs); i++) {
+		ifn = &system_opcode_funcs[i];
+		if ((insn & ifn->mask) == ifn->match) {
+			rc = ifn->func(vcpu, run, insn);
+			break;
+		}
+	}
+
+	switch (rc) {
+	case KVM_INSN_ILLEGAL_TRAP:
+		return truly_illegal_insn(vcpu, run, insn);
+	case KVM_INSN_VIRTUAL_TRAP:
+		return truly_virtual_insn(vcpu, run, insn);
+	case KVM_INSN_CONTINUE_NEXT_SEPC:
 		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
-		return 1;
+		break;
+	default:
+		break;
 	}
 
-	return truly_illegal_insn(vcpu, run, insn);
+	return (rc <= 0) ? rc : 1;
 }
 
 /**
-- 
2.34.1


