From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 17 Apr 2024 15:45:26 +0800
Subject: [PATCH v2 2/2] RISCV: KVM: Introduce vcpu->reset_cntx_lock
In-Reply-To: <20240417074528.16506-1-yongxuan.wang@sifive.com>
References: <20240417074528.16506-1-yongxuan.wang@sifive.com>
Message-ID: <20240417074528.16506-3-yongxuan.wang@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Originally, the use of kvm->lock in SBI_EXT_HSM_HART_START also avoids
the simultaneous updates to the reset context of target VCPU. Since this
lock has been replace with vcpu->mp_state_lock, and this new lock also
protects the vcpu->mp_state. We have to add a separate lock for
vcpu->reset_cntx.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu.c             | 6 ++++++
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 64d35a8c908c..664d1bb00368 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -211,6 +211,7 @@ struct kvm_vcpu_arch {
 
 	/* CPU context upon Guest VCPU reset */
 	struct kvm_cpu_context guest_reset_context;
+	spinlock_t reset_cntx_lock;
 
 	/* CPU CSR context upon Guest VCPU reset */
 	struct kvm_vcpu_csr guest_reset_csr;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 70937f71c3c4..1a2236e4c7f3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -64,7 +64,9 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	memcpy(csr, reset_csr, sizeof(*csr));
 
+	spin_lock(&vcpu->arch.reset_cntx_lock);
 	memcpy(cntx, reset_cntx, sizeof(*cntx));
+	spin_unlock(&vcpu->arch.reset_cntx_lock);
 
 	kvm_riscv_vcpu_fp_reset(vcpu);
 
@@ -121,12 +123,16 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	spin_lock_init(&vcpu->arch.hfence_lock);
 
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
+	spin_lock_init(&vcpu->arch.reset_cntx_lock);
+
+	spin_lock(&vcpu->arch.reset_cntx_lock);
 	cntx = &vcpu->arch.guest_reset_context;
 	cntx->sstatus = SR_SPP | SR_SPIE;
 	cntx->hstatus = 0;
 	cntx->hstatus |= HSTATUS_VTW;
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
+	spin_unlock(&vcpu->arch.reset_cntx_lock);
 
 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
 		return -ENOMEM;
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 115a6c6525fd..cc5038b90e02 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -31,6 +31,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 		goto out;
 	}
 
+	spin_lock(&target_vcpu->arch.reset_cntx_lock);
 	reset_cntx = &target_vcpu->arch.guest_reset_context;
 	/* start address */
 	reset_cntx->sepc = cp->a1;
@@ -38,6 +39,8 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 	reset_cntx->a0 = target_vcpuid;
 	/* private data passed from kernel */
 	reset_cntx->a1 = cp->a2;
+	spin_unlock(&target_vcpu->arch.reset_cntx_lock);
+
 	kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
 
 	__kvm_riscv_vcpu_power_on(target_vcpu);
-- 
2.17.1


