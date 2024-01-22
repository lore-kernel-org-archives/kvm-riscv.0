From: Haibo Xu <haibo1.xu@intel.com>
Date: Mon, 22 Jan 2024 17:58:38 +0800
Subject: [PATCH v5 08/12] KVM: riscv: selftests: Switch to use macro from csr.h
In-Reply-To: <cover.1705916069.git.haibo1.xu@intel.com>
References: <cover.1705916069.git.haibo1.xu@intel.com>
Message-ID: <4806503d3e8fe4b727eb6df72c8fdd087355495b.1705916069.git.haibo1.xu@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 5b62a3d2aa9b..6f9e1e5e466d 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -7,8 +7,9 @@
 #ifndef SELFTEST_KVM_PROCESSOR_H
 #define SELFTEST_KVM_PROCESSOR_H
 
-#include "kvm_util.h"
 #include <linux/stringify.h>
+#include <asm/csr.h>
+#include "kvm_util.h"
 
 static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 				    uint64_t  size)
@@ -95,13 +96,6 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
 #define PGTBL_PAGE_SIZE				PGTBL_L0_BLOCK_SIZE
 #define PGTBL_PAGE_SIZE_SHIFT			PGTBL_L0_BLOCK_SHIFT
 
-#define SATP_PPN				_AC(0x00000FFFFFFFFFFF, UL)
-#define SATP_MODE_39				_AC(0x8000000000000000, UL)
-#define SATP_MODE_48				_AC(0x9000000000000000, UL)
-#define SATP_ASID_BITS				16
-#define SATP_ASID_SHIFT				44
-#define SATP_ASID_MASK				_AC(0xFFFF, UL)
-
 #define SBI_EXT_EXPERIMENTAL_START		0x08000000
 #define SBI_EXT_EXPERIMENTAL_END		0x08FFFFFF
 
-- 
2.34.1


