From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:04 -0700
Subject: [RFC 36/48] RISC-V: KVM: Read/write gprs from/to shmem in case of TVM VCPU.
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-37-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

For TVM vcpus, TSM uses shared memory to exposes gprs for the trusted
VCPU. This change makes sure we use shmem when doing mmio emulation
for trusted VMs.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_insn.c | 98 +++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 331489f..56eeb86 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -7,6 +7,9 @@
 #include <linux/bitops.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_cove.h>
+#include <asm/kvm_nacl.h>
+#include <asm/kvm_cove_sbi.h>
+#include <asm/asm-offsets.h>
 
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
@@ -116,6 +119,10 @@
 #define REG_OFFSET(insn, pos)		\
 	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
 
+#define REG_INDEX(insn, pos)                                    \
+	((SHIFT_RIGHT((insn), (pos)-LOG_REGBYTES) & REG_MASK) / \
+	 (__riscv_xlen / 8))
+
 #define REG_PTR(insn, pos, regs)	\
 	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
 
@@ -600,6 +607,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	int len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *ct = &vcpu->arch.guest_context;
+	void *nshmem;
 
 	/* Determine trapped instruction */
 	if (htinst & 0x1) {
@@ -627,7 +635,15 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn_len = INSN_LEN(insn);
 	}
 
-	data = GET_RS2(insn, &vcpu->arch.guest_context);
+	if (is_cove_vcpu(vcpu)) {
+		nshmem = nacl_shmem();
+		data = nacl_shmem_gpr_read_cove(nshmem,
+					       REG_INDEX(insn, SH_RS2) * 8 +
+						       KVM_ARCH_GUEST_ZERO);
+	} else {
+		data = GET_RS2(insn, &vcpu->arch.guest_context);
+	}
+
 	data8 = data16 = data32 = data64 = data;
 
 	if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
@@ -643,19 +659,43 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 #ifdef CONFIG_64BIT
 	} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
 		len = 8;
-		data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
+		if (is_cove_vcpu(vcpu)) {
+			data64 = nacl_shmem_gpr_read_cove(
+				nshmem,
+				RVC_RS2S(insn) * 8 + KVM_ARCH_GUEST_ZERO);
+		} else {
+			data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
+		}
 	} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP &&
 		   ((insn >> SH_RD) & 0x1f)) {
 		len = 8;
-		data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		if (is_cove_vcpu(vcpu)) {
+			data64 = nacl_shmem_gpr_read_cove(
+				nshmem, REG_INDEX(insn, SH_RS2C) * 8 +
+						KVM_ARCH_GUEST_ZERO);
+		} else {
+			data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		}
 #endif
 	} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
 		len = 4;
-		data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
+		if (is_cove_vcpu(vcpu)) {
+			data32 = nacl_shmem_gpr_read_cove(
+				nshmem,
+				RVC_RS2S(insn) * 8 + KVM_ARCH_GUEST_ZERO);
+		} else {
+			data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
+		}
 	} else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP &&
 		   ((insn >> SH_RD) & 0x1f)) {
 		len = 4;
-		data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		if (is_cove_vcpu(vcpu)) {
+			data32 = nacl_shmem_gpr_read_cove(
+				nshmem, REG_INDEX(insn, SH_RS2C) * 8 +
+						KVM_ARCH_GUEST_ZERO);
+		} else {
+			data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		}
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -725,6 +765,7 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	u64 data64;
 	ulong insn;
 	int len, shift;
+	void *nshmem;
 
 	if (vcpu->arch.mmio_decode.return_handled)
 		return 0;
@@ -738,26 +779,57 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	len = vcpu->arch.mmio_decode.len;
 	shift = vcpu->arch.mmio_decode.shift;
 
+	if (is_cove_vcpu(vcpu))
+		nshmem = nacl_shmem();
+
 	switch (len) {
 	case 1:
 		data8 = *((u8 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data8 << shift >> shift);
+		if (is_cove_vcpu(vcpu)) {
+			nacl_shmem_gpr_write_cove(nshmem,
+						 REG_INDEX(insn, SH_RD) * 8 +
+							 KVM_ARCH_GUEST_ZERO,
+						 (unsigned long)data8);
+		} else {
+			SET_RD(insn, &vcpu->arch.guest_context,
+			       (ulong)data8 << shift >> shift);
+		}
 		break;
 	case 2:
 		data16 = *((u16 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data16 << shift >> shift);
+		if (is_cove_vcpu(vcpu)) {
+			nacl_shmem_gpr_write_cove(nshmem,
+						 REG_INDEX(insn, SH_RD) * 8 +
+							 KVM_ARCH_GUEST_ZERO,
+						 (unsigned long)data16);
+		} else {
+			SET_RD(insn, &vcpu->arch.guest_context,
+			       (ulong)data16 << shift >> shift);
+		}
 		break;
 	case 4:
 		data32 = *((u32 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data32 << shift >> shift);
+		if (is_cove_vcpu(vcpu)) {
+			nacl_shmem_gpr_write_cove(nshmem,
+						 REG_INDEX(insn, SH_RD) * 8 +
+							 KVM_ARCH_GUEST_ZERO,
+						 (unsigned long)data32);
+		} else {
+			SET_RD(insn, &vcpu->arch.guest_context,
+			       (ulong)data32 << shift >> shift);
+		}
 		break;
 	case 8:
 		data64 = *((u64 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(ulong)data64 << shift >> shift);
+		if (is_cove_vcpu(vcpu)) {
+			nacl_shmem_gpr_write_cove(nshmem,
+						 REG_INDEX(insn, SH_RD) * 8 +
+							 KVM_ARCH_GUEST_ZERO,
+						 (unsigned long)data64);
+		} else {
+			SET_RD(insn, &vcpu->arch.guest_context,
+			       (ulong)data64 << shift >> shift);
+		}
 		break;
 	default:
 		return -EOPNOTSUPP;
-- 
2.25.1


