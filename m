From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  4 Apr 2023 21:04:46 +0530
Subject: [PATCH v4 3/9] RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
Message-ID: <20230404153452.2405681-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hgatp.VMID mask defines are used before shifting when extracting
VMID value from hgatp CSR value so based on the convention followed
in the other parts of asm/csr.h, the hgatp.VMID mask defines should
not have a _MASK suffix.

While we are here, let's use GENMASK() for hgatp.VMID and hgatp.PPN.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 12 ++++++------
 arch/riscv/kvm/mmu.c         |  3 +--
 arch/riscv/kvm/vmid.c        |  4 ++--
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3c8d68152bce..3176355cf4e9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -131,25 +131,25 @@
 
 #define HGATP32_MODE_SHIFT	31
 #define HGATP32_VMID_SHIFT	22
-#define HGATP32_VMID_MASK	_AC(0x1FC00000, UL)
-#define HGATP32_PPN		_AC(0x003FFFFF, UL)
+#define HGATP32_VMID		GENMASK(28, 22)
+#define HGATP32_PPN		GENMASK(21, 0)
 
 #define HGATP64_MODE_SHIFT	60
 #define HGATP64_VMID_SHIFT	44
-#define HGATP64_VMID_MASK	_AC(0x03FFF00000000000, UL)
-#define HGATP64_PPN		_AC(0x00000FFFFFFFFFFF, UL)
+#define HGATP64_VMID		GENMASK(57, 44)
+#define HGATP64_PPN		GENMASK(43, 0)
 
 #define HGATP_PAGE_SHIFT	12
 
 #ifdef CONFIG_64BIT
 #define HGATP_PPN		HGATP64_PPN
 #define HGATP_VMID_SHIFT	HGATP64_VMID_SHIFT
-#define HGATP_VMID_MASK		HGATP64_VMID_MASK
+#define HGATP_VMID		HGATP64_VMID
 #define HGATP_MODE_SHIFT	HGATP64_MODE_SHIFT
 #else
 #define HGATP_PPN		HGATP32_PPN
 #define HGATP_VMID_SHIFT	HGATP32_VMID_SHIFT
-#define HGATP_VMID_MASK		HGATP32_VMID_MASK
+#define HGATP_VMID		HGATP32_VMID
 #define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
 #endif
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 46d692995830..f2eb47925806 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -755,8 +755,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 	unsigned long hgatp = gstage_mode;
 	struct kvm_arch *k = &vcpu->kvm->arch;
 
-	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) &
-		 HGATP_VMID_MASK;
+	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
 	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
 
 	csr_write(CSR_HGATP, hgatp);
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 5246da1c9167..ddc98714ce8e 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -26,9 +26,9 @@ void __init kvm_riscv_gstage_vmid_detect(void)
 
 	/* Figure-out number of VMID bits in HW */
 	old = csr_read(CSR_HGATP);
-	csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
+	csr_write(CSR_HGATP, old | HGATP_VMID);
 	vmid_bits = csr_read(CSR_HGATP);
-	vmid_bits = (vmid_bits & HGATP_VMID_MASK) >> HGATP_VMID_SHIFT;
+	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
 	vmid_bits = fls_long(vmid_bits);
 	csr_write(CSR_HGATP, old);
 
-- 
2.34.1


