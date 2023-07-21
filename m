From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 21 Jul 2023 13:24:37 +0530
Subject: [PATCH v2 4/6] RISCV: KVM: Add senvcfg context save/restore
In-Reply-To: <20230721075439.454473-1-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
Message-ID: <20230721075439.454473-5-mchitale@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add senvcfg context save/restore for guest VCPUs and also add it to the
ONE_REG interface to allow its access from user space.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h      | 1 +
 arch/riscv/include/asm/kvm_host.h | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 4 ++++
 4 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 38730677dcd5..b52270278733 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -285,6 +285,7 @@
 #define CSR_SIE			0x104
 #define CSR_STVEC		0x105
 #define CSR_SCOUNTEREN		0x106
+#define CSR_SENVCFG		0x10a
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index ee55e5fc8b84..c3cc0cb39cf8 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -162,6 +162,7 @@ struct kvm_vcpu_csr {
 	unsigned long hvip;
 	unsigned long vsatp;
 	unsigned long scounteren;
+	unsigned long senvcfg;
 };
 
 struct kvm_vcpu_config {
@@ -188,6 +189,7 @@ struct kvm_vcpu_arch {
 	unsigned long host_sscratch;
 	unsigned long host_stvec;
 	unsigned long host_scounteren;
+	unsigned long host_senvcfg;
 
 	/* CPU context of Host */
 	struct kvm_cpu_context host_context;
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7bc1634b0a89..74c7f42de29d 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -79,6 +79,7 @@ struct kvm_riscv_csr {
 	unsigned long sip;
 	unsigned long satp;
 	unsigned long scounteren;
+	unsigned long senvcfg;
 };
 
 /* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d3166b676430..37f1ed70d782 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1138,10 +1138,14 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
  */
 static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	vcpu->arch.host_senvcfg = csr_swap(CSR_SENVCFG, csr->senvcfg);
 	guest_state_enter_irqoff();
 	__kvm_riscv_switch_to(&vcpu->arch);
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
+	csr->senvcfg = csr_swap(CSR_SENVCFG, vcpu->arch.host_senvcfg);
 }
 
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
-- 
2.34.1


