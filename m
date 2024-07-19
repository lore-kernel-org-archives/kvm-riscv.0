From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 19 Jul 2024 21:39:12 +0530
Subject: [PATCH 12/13] RISC-V: KVM: Save trap CSRs in kvm_riscv_vcpu_enter_exit()
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
Message-ID: <20240719160913.342027-13-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Save trap CSRs in the kvm_riscv_vcpu_enter_exit() function instead of
the kvm_arch_vcpu_ioctl_run() function so that HTVAL and HTINST CSRs
are accessed in more optimized manner while running under some other
hypervisor.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index fe849fb1aaab..854d98aa165e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -757,12 +757,21 @@ static __always_inline void kvm_riscv_vcpu_swap_in_host_state(struct kvm_vcpu *v
  * This must be noinstr as instrumentation may make use of RCU, and this is not
  * safe during the EQS.
  */
-static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
+static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
+					      struct kvm_cpu_trap *trap)
 {
 	void *nsh;
 	struct kvm_cpu_context *gcntx = &vcpu->arch.guest_context;
 	struct kvm_cpu_context *hcntx = &vcpu->arch.host_context;
 
+	/*
+	 * We save trap CSRs (such as SEPC, SCAUSE, STVAL, HTVAL, and
+	 * HTINST) here because we do local_irq_enable() after this
+	 * function in kvm_arch_vcpu_ioctl_run() which can result in
+	 * an interrupt immediately after local_irq_enable() and can
+	 * potentially change trap CSRs.
+	 */
+
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
@@ -805,14 +814,24 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 		} else {
 			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
 		}
+
+		trap->htval = nacl_csr_read(nsh, CSR_HTVAL);
+		trap->htinst = nacl_csr_read(nsh, CSR_HTINST);
 	} else {
 		hcntx->hstatus = csr_swap(CSR_HSTATUS, gcntx->hstatus);
 
 		__kvm_riscv_switch_to(&vcpu->arch);
 
 		gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
+
+		trap->htval = csr_read(CSR_HTVAL);
+		trap->htinst = csr_read(CSR_HTINST);
 	}
 
+	trap->sepc = gcntx->sepc;
+	trap->scause = csr_read(CSR_SCAUSE);
+	trap->stval = csr_read(CSR_STVAL);
+
 	vcpu->arch.last_exit_cpu = vcpu->cpu;
 	guest_state_exit_irqoff();
 	kvm_riscv_vcpu_swap_in_host_state(vcpu);
@@ -929,22 +948,11 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		guest_timing_enter_irqoff();
 
-		kvm_riscv_vcpu_enter_exit(vcpu);
+		kvm_riscv_vcpu_enter_exit(vcpu, &trap);
 
 		vcpu->mode = OUTSIDE_GUEST_MODE;
 		vcpu->stat.exits++;
 
-		/*
-		 * Save SCAUSE, STVAL, HTVAL, and HTINST because we might
-		 * get an interrupt between __kvm_riscv_switch_to() and
-		 * local_irq_enable() which can potentially change CSRs.
-		 */
-		trap.sepc = vcpu->arch.guest_context.sepc;
-		trap.scause = csr_read(CSR_SCAUSE);
-		trap.stval = csr_read(CSR_STVAL);
-		trap.htval = ncsr_read(CSR_HTVAL);
-		trap.htinst = ncsr_read(CSR_HTINST);
-
 		/* Syncup interrupts state with HW */
 		kvm_riscv_vcpu_sync_interrupts(vcpu);
 
-- 
2.34.1


