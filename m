From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 30 Nov 2023 19:39:00 +0100
Subject: [PATCH 4/6] KVM: riscv: selftests: Add RISCV_SBI_EXT_REG
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
Message-ID: <20231130183859.55829-2-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While adding RISCV_SBI_EXT_REG(), acknowledge that some registers
have subtypes and extend __kvm_reg_id() to take a subtype field.
Then, update all macros to set the new field appropriately. The
general CSR macro gets renamed to include "GENERAL", but the other
macros, like the new RISCV_SBI_EXT_REG, just use the SINGLE subtype.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h   | 40 +++++++++++--------
 .../selftests/kvm/lib/riscv/processor.c       |  4 +-
 2 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 5b62a3d2aa9b..e70ccda2011b 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -10,10 +10,10 @@
 #include "kvm_util.h"
 #include <linux/stringify.h>
 
-static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
-				    uint64_t  size)
+static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
+				    uint64_t idx, uint64_t size)
 {
-	return KVM_REG_RISCV | type | idx | size;
+	return KVM_REG_RISCV | type | subtype | idx | size;
 }
 
 #if __riscv_xlen == 64
@@ -22,24 +22,30 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U32
 #endif
 
-#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, \
-					     KVM_REG_RISCV_CONFIG_REG(name), \
-					     KVM_REG_SIZE_ULONG)
+#define RISCV_CONFIG_REG(name)		__kvm_reg_id(KVM_REG_RISCV_CONFIG, 0,		\
+						     KVM_REG_RISCV_CONFIG_REG(name),	\
+						     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, \
-					     KVM_REG_RISCV_CORE_REG(name), \
-					     KVM_REG_SIZE_ULONG)
+#define RISCV_CORE_REG(name)		__kvm_reg_id(KVM_REG_RISCV_CORE, 0,		\
+						     KVM_REG_RISCV_CORE_REG(name),	\
+						     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, \
-					     KVM_REG_RISCV_CSR_REG(name), \
-					     KVM_REG_SIZE_ULONG)
+#define RISCV_GENERAL_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR,			\
+						     KVM_REG_RISCV_CSR_GENERAL,		\
+						     KVM_REG_RISCV_CSR_REG(name),	\
+						     KVM_REG_SIZE_ULONG)
 
-#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, \
-					     KVM_REG_RISCV_TIMER_REG(name), \
-					     KVM_REG_SIZE_U64)
+#define RISCV_TIMER_REG(name)		__kvm_reg_id(KVM_REG_RISCV_TIMER, 0,		\
+						     KVM_REG_RISCV_TIMER_REG(name),	\
+						     KVM_REG_SIZE_U64)
 
-#define RISCV_ISA_EXT_REG(idx)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
-					     idx, KVM_REG_SIZE_ULONG)
+#define RISCV_ISA_EXT_REG(idx)		__kvm_reg_id(KVM_REG_RISCV_ISA_EXT,		\
+						     KVM_REG_RISCV_ISA_SINGLE,		\
+						     idx, KVM_REG_SIZE_ULONG)
+
+#define RISCV_SBI_EXT_REG(idx)		__kvm_reg_id(KVM_REG_RISCV_SBI_EXT,		\
+						     KVM_REG_RISCV_SBI_SINGLE,		\
+						     idx, KVM_REG_SIZE_ULONG)
 
 /* L3 index Bit[47:39] */
 #define PGTBL_L3_INDEX_MASK			0x0000FF8000000000ULL
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index d146ca71e0c0..6c25f7843ef4 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -201,7 +201,7 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
 	satp = (vm->pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
 	satp |= SATP_MODE_48;
 
-	vcpu_set_reg(vcpu, RISCV_CSR_REG(satp), satp);
+	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(satp), satp);
 }
 
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, uint8_t indent)
@@ -315,7 +315,7 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
 	vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_code);
 
 	/* Setup default exception vector of guest */
-	vcpu_set_reg(vcpu, RISCV_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
+	vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(stvec), (unsigned long)guest_unexp_trap);
 
 	return vcpu;
 }
-- 
2.43.0


