From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 26 Oct 2021 22:31:36 +0530
Subject: [PATCH 3/3] RISC-V: KVM: Fix GPA passed to
 __kvm_riscv_hfence_gvma_xyz() functions
In-Reply-To: <20211026170136.2147619-1-anup.patel@wdc.com>
References: <20211026170136.2147619-1-anup.patel@wdc.com>
Message-ID: <20211026170136.2147619-4-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The parameter passed to HFENCE.GVMA instruction in rs1 register
is guest physical address right shifted by 2 (i.e. divided by 4).

Unfortunately, we overlooked the semantics of rs1 registers for
HFENCE.GVMA instruction and never right shifted guest physical
address by 2. This issue did not manifest for hypervisors till
now because:
  1) Currently, only __kvm_riscv_hfence_gvma_all() and SBI
     HFENCE calls are used to invalidate TLB.
  2) All H-extension implementations (such as QEMU, Spike,
     Rocket Core FPGA, etc) that we tried till now were
     conservatively flushing everything upon any HFENCE.GVMA
     instruction.

This patch fixes GPA passed to __kvm_riscv_hfence_gvma_vmid_gpa()
and __kvm_riscv_hfence_gvma_gpa() functions.

Fixes: fd7bb4a251df ("RISC-V: KVM: Implement VMID allocator")
Reported-by: Ian Huang <ihuang@ventanamicro.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/include/asm/kvm_host.h | 5 +++--
 arch/riscv/kvm/tlb.S              | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d27878d6adf9..25ba21f98504 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -214,9 +214,10 @@ static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
 
 #define KVM_ARCH_WANT_MMU_NOTIFIER
 
-void __kvm_riscv_hfence_gvma_vmid_gpa(unsigned long gpa, unsigned long vmid);
+void __kvm_riscv_hfence_gvma_vmid_gpa(unsigned long gpa_divby_4,
+				      unsigned long vmid);
 void __kvm_riscv_hfence_gvma_vmid(unsigned long vmid);
-void __kvm_riscv_hfence_gvma_gpa(unsigned long gpa);
+void __kvm_riscv_hfence_gvma_gpa(unsigned long gpa_divby_4);
 void __kvm_riscv_hfence_gvma_all(void);
 
 int kvm_riscv_stage2_map(struct kvm_vcpu *vcpu,
diff --git a/arch/riscv/kvm/tlb.S b/arch/riscv/kvm/tlb.S
index c858570f0856..899f75d60bad 100644
--- a/arch/riscv/kvm/tlb.S
+++ b/arch/riscv/kvm/tlb.S
@@ -31,7 +31,7 @@
 
 ENTRY(__kvm_riscv_hfence_gvma_vmid_gpa)
 	/*
-	 * rs1 = a0 (GPA)
+	 * rs1 = a0 (GPA >> 2)
 	 * rs2 = a1 (VMID)
 	 * HFENCE.GVMA a0, a1
 	 * 0110001 01011 01010 000 00000 1110011
@@ -53,7 +53,7 @@ ENDPROC(__kvm_riscv_hfence_gvma_vmid)
 
 ENTRY(__kvm_riscv_hfence_gvma_gpa)
 	/*
-	 * rs1 = a0 (GPA)
+	 * rs1 = a0 (GPA >> 2)
 	 * rs2 = zero
 	 * HFENCE.GVMA a0
 	 * 0110001 00000 01010 000 00000 1110011
-- 
2.25.1


