From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:40 -0700
Subject: [RFC 12/48] RISC-V: KVM: Exit to the user space for trap redirection
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-13-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, the trap redirection to the guest happens in the
following cases.

1. Illegal instruction trap
2. Virtual instruction trap
3. Unsuccesfull unpriv read

Allowing host to cause traps in the TVM directly is problematic.
TSM doesn't support trap redirection yet. Ideally, the host should not end
up in one of these situations where it has to redirect the trap. If it
happens, exit to the userspace with error as it can't forward the trap to
the TVM.

If there is any usecasse arises in the future, it has to be co-ordinated
through TSM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_exit.c |  9 ++++++++-
 arch/riscv/kvm/vcpu_insn.c | 17 +++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 4ea101a..0d0c895 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_cove.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -135,8 +136,14 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 				  struct kvm_cpu_trap *trap)
 {
-	unsigned long vsstatus = csr_read(CSR_VSSTATUS);
+	unsigned long vsstatus;
 
+	if (is_cove_vcpu(vcpu)) {
+		kvm_err("RISC-V KVM do not support redirect to CoVE guest yet\n");
+		return;
+	}
+
+	vsstatus = csr_read(CSR_VSSTATUS);
 	/* Change Guest SSTATUS.SPP bit */
 	vsstatus &= ~SR_SPP;
 	if (vcpu->arch.guest_context.sstatus & SR_SPP)
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 7a6abed..331489f 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -6,6 +6,7 @@
 
 #include <linux/bitops.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_cove.h>
 
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
@@ -153,6 +154,10 @@ static int truly_illegal_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_cpu_trap utrap = { 0 };
 
+	/* The host can not redirect any illegal instruction trap to TVM */
+	if (unlikely(is_cove_vcpu(vcpu)))
+		return -EPERM;
+
 	/* Redirect trap to Guest VCPU */
 	utrap.sepc = vcpu->arch.guest_context.sepc;
 	utrap.scause = EXC_INST_ILLEGAL;
@@ -169,6 +174,10 @@ static int truly_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_cpu_trap utrap = { 0 };
 
+	/* The host can not redirect any virtual instruction trap to TVM */
+	if (unlikely(is_cove_vcpu(vcpu)))
+		return -EPERM;
+
 	/* Redirect trap to Guest VCPU */
 	utrap.sepc = vcpu->arch.guest_context.sepc;
 	utrap.scause = EXC_VIRTUAL_INST_FAULT;
@@ -417,6 +426,10 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (unlikely(INSN_IS_16BIT(insn))) {
 		if (insn == 0) {
 			ct = &vcpu->arch.guest_context;
+
+			if (unlikely(is_cove_vcpu(vcpu)))
+				return -EPERM;
+
 			insn = kvm_riscv_vcpu_unpriv_read(vcpu, true,
 							  ct->sepc,
 							  &utrap);
@@ -469,6 +482,8 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn = htinst | INSN_16BIT_MASK;
 		insn_len = (htinst & BIT(1)) ? INSN_LEN(insn) : 2;
 	} else {
+		if (unlikely(is_cove_vcpu(vcpu)))
+			return -EFAULT;
 		/*
 		 * Bit[0] == 0 implies trapped instruction value is
 		 * zero or special value.
@@ -595,6 +610,8 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn = htinst | INSN_16BIT_MASK;
 		insn_len = (htinst & BIT(1)) ? INSN_LEN(insn) : 2;
 	} else {
+		if (unlikely(is_cove_vcpu(vcpu)))
+			return -EFAULT;
 		/*
 		 * Bit[0] == 0 implies trapped instruction value is
 		 * zero or special value.
-- 
2.25.1


