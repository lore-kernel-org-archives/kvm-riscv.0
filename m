From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 26 Mar 2024 18:10:52 +0800
Subject: [PATCH 1/1] RISC-V: KVM: Avoid lock inversion in SBI_EXT_HSM_HART_START
Message-ID: <20240326101054.13088-1-yongxuan.wang@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Documentation/virt/kvm/locking.rst advises that kvm->lock should be
acquired outside vcpu->mutex and kvm->srcu. However, when KVM/RISC-V
handling SBI_EXT_HSM_HART_START, the lock ordering is vcpu->mutex,
kvm->srcu then kvm->lock.

Although the lockdep checking no longer complains about this after commit
f0f44752f5f6 ("rcu: Annotate SRCU's update-side lockdep dependencies"),
it's necessary to replace kvm->lock with a new dedicated lock to ensure
only one hart can execute the SBI_EXT_HSM_HART_START call for the target
hart simultaneously.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/vcpu.c             | 1 +
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 5 ++---
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 484d04a92fa6..537099413344 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -254,6 +254,7 @@ struct kvm_vcpu_arch {
 
 	/* VCPU power-off state */
 	bool power_off;
+	struct mutex hsm_start_lock;
 
 	/* Don't run the VCPU (blocked) */
 	bool pause;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..4d89b5b5afbf 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -119,6 +119,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	spin_lock_init(&vcpu->arch.hfence_lock);
 
 	/* Setup reset state of shadow SSTATUS and HSTATUS CSRs */
+	mutex_init(&vcpu->arch.hsm_start_lock);
 	cntx = &vcpu->arch.guest_reset_context;
 	cntx->sstatus = SR_SPP | SR_SPIE;
 	cntx->hstatus = 0;
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 7dca0e9381d9..b528f6e880ae 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -71,14 +71,13 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
-	struct kvm *kvm = vcpu->kvm;
 	unsigned long funcid = cp->a6;
 
 	switch (funcid) {
 	case SBI_EXT_HSM_HART_START:
-		mutex_lock(&kvm->lock);
+		mutex_lock(&vcpu->arch.hsm_start_lock);
 		ret = kvm_sbi_hsm_vcpu_start(vcpu);
-		mutex_unlock(&kvm->lock);
+		mutex_unlock(&vcpu->arch.hsm_start_lock);
 		break;
 	case SBI_EXT_HSM_HART_STOP:
 		ret = kvm_sbi_hsm_vcpu_stop(vcpu);
-- 
2.17.1


