From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Apr 2022 16:54:50 +0530
Subject: [PATCH v2 7/7] RISC-V: KVM: Cleanup stale TLB entries when host CPU
 changes
In-Reply-To: <20220420112450.155624-1-apatel@ventanamicro.com>
References: <20220420112450.155624-1-apatel@ventanamicro.com>
Message-ID: <20220420112450.155624-8-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On RISC-V platforms with hardware VMID support, we share same
VMID for all VCPUs of a particular Guest/VM. This means we might
have stale G-stage TLB entries on the current Host CPU due to
some other VCPU of the same Guest which ran previously on the
current Host CPU.

To cleanup stale TLB entries, we simply flush all G-stage TLB
entries by VMID whenever underlying Host CPU changes for a VCPU.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  5 +++++
 arch/riscv/kvm/tlb.c              | 23 +++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c             | 11 +++++++++++
 3 files changed, 39 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index a40e88a9481c..94349a5ffd34 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -166,6 +166,9 @@ struct kvm_vcpu_arch {
 	/* VCPU ran at least once */
 	bool ran_atleast_once;
 
+	/* Last Host CPU on which Guest VCPU exited */
+	int last_exit_cpu;
+
 	/* ISA feature bits (similar to MISA) */
 	unsigned long isa;
 
@@ -256,6 +259,8 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
 				     unsigned long order);
 void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
 
+void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
+
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
 void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index c0f86d09c41d..1a76d0b1907d 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -215,6 +215,29 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
 	csr_write(CSR_HGATP, hgatp);
 }
 
+void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
+{
+	unsigned long vmid;
+
+	if (!kvm_riscv_gstage_vmid_bits() ||
+	    vcpu->arch.last_exit_cpu == vcpu->cpu)
+		return;
+
+	/*
+	 * On RISC-V platforms with hardware VMID support, we share same
+	 * VMID for all VCPUs of a particular Guest/VM. This means we might
+	 * have stale G-stage TLB entries on the current Host CPU due to
+	 * some other VCPU of the same Guest which ran previously on the
+	 * current Host CPU.
+	 *
+	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
+	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
+	 */
+
+	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
+	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
+}
+
 void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
 {
 	local_flush_icache_all();
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 9cd8f6e91c98..a86710fcd2e0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -67,6 +67,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	if (loaded)
 		kvm_arch_vcpu_put(vcpu);
 
+	vcpu->arch.last_exit_cpu = -1;
+
 	memcpy(csr, reset_csr, sizeof(*csr));
 
 	memcpy(cntx, reset_cntx, sizeof(*cntx));
@@ -735,6 +737,7 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 {
 	guest_state_enter_irqoff();
 	__kvm_riscv_switch_to(&vcpu->arch);
+	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
 }
 
@@ -829,6 +832,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			continue;
 		}
 
+		/*
+		 * Cleanup stale TLB enteries
+		 *
+		 * Note: This should be done after G-stage VMID has been
+		 * updated using kvm_riscv_gstage_vmid_ver_changed()
+		 */
+		kvm_riscv_local_tlb_sanitize(vcpu);
+
 		guest_timing_enter_irqoff();
 
 		kvm_riscv_vcpu_enter_exit(vcpu);
-- 
2.25.1


