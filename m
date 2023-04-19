From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:30 -0700
Subject: [RFC 02/48] RISC-V: KVM: Improve KVM error reporting to the user space
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-3-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds RISC-V specific cause for ioctl run failure.
For now, it will be used for the below two cases:

1. Insufficient IMSIC files if VM is configured to run in HWACCEL mode
2. TSM is unable to run run_vcpu SBI call for TVMs

KVM also uses a custom scause bit(48) to distinguish this case
from regular vcpu exit causes.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h      | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3176355..e78503a 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -96,6 +96,8 @@
 #define EXC_VIRTUAL_INST_FAULT		22
 #define EXC_STORE_GUEST_PAGE_FAULT	23
 
+#define EXC_CUSTOM_KVM_COVE_RUN_FAIL	48
+
 /* PMP configuration */
 #define PMP_R			0x01
 #define PMP_W			0x02
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b41d0e7..11440df 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -245,6 +245,10 @@ enum KVM_RISCV_SBI_EXT_ID {
 /* One single KVM irqchip, ie. the AIA */
 #define KVM_NR_IRQCHIPS			1
 
+/* run->fail_entry.hardware_entry_failure_reason codes. */
+#define KVM_EXIT_FAIL_ENTRY_IMSIC_FILE_UNAVAILABLE (1ULL << 0)
+#define KVM_EXIT_FAIL_ENTRY_COVE_RUN_VCPU          (1ULL << 1)
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
-- 
2.25.1


