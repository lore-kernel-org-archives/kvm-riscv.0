From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 17 Apr 2023 12:34:01 +0200
Subject: [RFC PATCH 13/14] KVM: selftests: riscv: Add RISCV_SBI_EXT_REG
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
Message-ID: <20230417103402.798596-14-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Extend __kvm_reg_id() with subtype field support and add
RISCV_SBI_EXT_REG() which uses that field.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/include/riscv/processor.h    | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 1c6908342f22..f052e8be0e42 100644
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
@@ -22,22 +22,26 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U32
 #endif
 
-#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, \
+#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, 0, \
 					     KVM_REG_RISCV_CONFIG_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, \
+#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, 0, \
 					     KVM_REG_RISCV_CORE_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, \
+#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, 0, \
 					     KVM_REG_RISCV_CSR_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, \
+#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, 0, \
 					     KVM_REG_RISCV_TIMER_REG(name), \
 					     KVM_REG_SIZE_U64)
 
+#define RISCV_SBI_EXT_REG(subtype, id)	__kvm_reg_id(KVM_REG_RISCV_SBI_EXT, \
+						     subtype, id, \
+						     KVM_REG_SIZE_ULONG)
+
 /* L3 index Bit[47:39] */
 #define PGTBL_L3_INDEX_MASK			0x0000FF8000000000ULL
 #define PGTBL_L3_INDEX_SHIFT			39
-- 
2.39.2


