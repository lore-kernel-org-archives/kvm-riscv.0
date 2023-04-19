From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:32 -0700
Subject: [RFC 04/48] RISC-V: KVM: Add a helper function to get pgd size
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-5-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The cove support will require to find out the pgd size to be used for
the gstage page table directory. Export the value via an additional
helper.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/mmu.c              | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8714325..63c46af 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -313,6 +313,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
 void __init kvm_riscv_gstage_mode_detect(void);
 unsigned long __init kvm_riscv_gstage_mode(void);
 int kvm_riscv_gstage_gpa_bits(void);
+unsigned long kvm_riscv_gstage_pgd_size(void);
 
 void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index f0fff56..6b037f7 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -797,3 +797,8 @@ int kvm_riscv_gstage_gpa_bits(void)
 {
 	return gstage_gpa_bits;
 }
+
+unsigned long kvm_riscv_gstage_pgd_size(void)
+{
+	return gstage_pgd_size;
+}
-- 
2.25.1


