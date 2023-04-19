From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:37 -0700
Subject: [RFC 09/48] RISC-V: KVM: Add CoVE related nacl helpers
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-10-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The NACL SBI extension allows the scratch area to be customizable
per SBI extension. As per the COVH SBI extension, the scratch
area stores the guest gpr state.

Add some helpers to read/write gprs easily.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove_sbi.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove_sbi.h b/arch/riscv/include/asm/kvm_cove_sbi.h
index 24562df..df7d88c 100644
--- a/arch/riscv/include/asm/kvm_cove_sbi.h
+++ b/arch/riscv/include/asm/kvm_cove_sbi.h
@@ -17,6 +17,21 @@
 #include <asm/csr.h>
 #include <asm/sbi.h>
 
+#include <asm/asm-offsets.h>
+
+/**
+ * CoVE SBI extensions defines the NACL scratch memory.
+ * uint64_t gprs[32]
+ * uint64_t reserved[224]
+ */
+#define get_scratch_gpr_offset(goffset) (goffset - KVM_ARCH_GUEST_ZERO)
+
+#define nacl_shmem_gpr_write_cove(__s, __g, __o) \
+	nacl_shmem_scratch_write_long(__s, get_scratch_gpr_offset(__g), __o)
+
+#define nacl_shmem_gpr_read_cove(__s, __g) \
+	nacl_shmem_scratch_read_long(__s, get_scratch_gpr_offset(__g))
+
 int sbi_covh_tsm_get_info(struct sbi_cove_tsm_info *tinfo_addr);
 int sbi_covh_tvm_initiate_fence(unsigned long tvmid);
 int sbi_covh_tsm_initiate_fence(void);
-- 
2.25.1


