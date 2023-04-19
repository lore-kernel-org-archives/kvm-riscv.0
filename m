From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:58 -0700
Subject: [RFC 30/48] RISC-V: KVM: Perform limited operations in hardware enable/disable
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-31-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hardware enable/disable path only need to perform AIA/NACL enable/disable
for TVMs. All other operations i.e. interrupt/exception delegation,
counter access must be provided by the TSM as host doesn't have control
of these operations for a TVM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 45ee62d..842b78d 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -13,6 +13,7 @@
 #include <asm/hwcap.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
+#include <asm/kvm_cove.h>
 
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
@@ -29,6 +30,15 @@ int kvm_arch_hardware_enable(void)
 	if (rc)
 		return rc;
 
+	/*
+	 * We just need to invoke aia enable for CoVE if host is in VS mode
+	 * However, if the host is running in HS mode, we need to initialize
+	 * other CSRs as well for legacy VMs.
+	 * TODO: Handle host in HS mode use case.
+	 */
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto enable_aia;
+
 	hedeleg = 0;
 	hedeleg |= (1UL << EXC_INST_MISALIGNED);
 	hedeleg |= (1UL << EXC_BREAKPOINT);
@@ -49,6 +59,7 @@ int kvm_arch_hardware_enable(void)
 
 	csr_write(CSR_HVIP, 0);
 
+enable_aia:
 	kvm_riscv_aia_enable();
 
 	return 0;
@@ -58,6 +69,8 @@ void kvm_arch_hardware_disable(void)
 {
 	kvm_riscv_aia_disable();
 
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto disable_nacl;
 	/*
 	 * After clearing the hideleg CSR, the host kernel will receive
 	 * spurious interrupts if hvip CSR has pending interrupts and the
@@ -69,6 +82,7 @@ void kvm_arch_hardware_disable(void)
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
 
+disable_nacl:
 	kvm_riscv_nacl_disable();
 }
 
-- 
2.25.1


