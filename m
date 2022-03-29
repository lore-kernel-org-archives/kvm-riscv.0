From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Mar 2022 12:59:09 +0530
Subject: [PATCH 1/3] KVM: selftests: riscv: Set PTE A and D bits in VS-stage
 page table
In-Reply-To: <20220329072911.1692766-1-apatel@ventanamicro.com>
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
Message-ID: <20220329072911.1692766-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Supporting hardware updates of PTE A and D bits is optional for any
RISC-V implementation so current software strategy is to always set
these bits in both G-stage (hypervisor) and VS-stage (guest kernel).

If PTE A and D bits are not set by software (hypervisor or guest)
then RISC-V implementations not supporting hardware updates of these
bits will cause traps even for perfectly valid PTEs.

Based on above explanation, the VS-stage page table created by various
KVM selftest applications is not correct because PTE A and D bits are
not set. This patch fixes VS-stage page table programming of PTE A and
D bits for KVM selftests.

Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V
64-bit")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index dc284c6bdbc3..eca5c622efd2 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -101,7 +101,9 @@ static inline void set_reg(struct kvm_vm *vm, uint32_t vcpuid, uint64_t id,
 #define PGTBL_PTE_WRITE_SHIFT			2
 #define PGTBL_PTE_READ_MASK			0x0000000000000002ULL
 #define PGTBL_PTE_READ_SHIFT			1
-#define PGTBL_PTE_PERM_MASK			(PGTBL_PTE_EXECUTE_MASK | \
+#define PGTBL_PTE_PERM_MASK			(PGTBL_PTE_ACCESSED_MASK | \
+						 PGTBL_PTE_DIRTY_MASK | \
+						 PGTBL_PTE_EXECUTE_MASK | \
 						 PGTBL_PTE_WRITE_MASK | \
 						 PGTBL_PTE_READ_MASK)
 #define PGTBL_PTE_VALID_MASK			0x0000000000000001ULL
-- 
2.25.1


