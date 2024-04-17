From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 17 Apr 2024 15:45:25 +0800
Subject: [PATCH v2 1/2] RISCV: KVM: Introduce mp_state_lock to avoid lock inversion in SBI_EXT_HSM_HART_START
In-Reply-To: <20240417074528.16506-1-yongxuan.wang@sifive.com>
References: <20240417074528.16506-1-yongxuan.wang@sifive.com>
Message-ID: <20240417074528.16506-2-yongxuan.wang@sifive.com>
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

Additionally, this patch also rename "power_off" to "mp_state" with two
possible values. The vcpu->mp_state_lock also protects the access of
vcpu->mp_state.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h |  7 ++--
 arch/riscv/kvm/vcpu.c             | 56 ++++++++++++++++++++++++-------
 arch/riscv/kvm/vcpu_sbi.c         |  7 ++--
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 23 ++++++++-----
 4 files changed, 68 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 484d04a92fa6..64d35a8c908c 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -252,8 +252,9 @@ struct kvm_vcpu_arch {
 	/* Cache pages needed to program page tables with spinlock held */
 	struct kvm_mmu_memory_cache mmu_page_cache;
 
-	/* VCPU power-off state */
-	bool power_off;
+	/* VCPU power state */
+	struct kvm_mp_state mp_state;
+	spinlock_t mp_state_lock;
 
 	/* Don't run the VCPU (blocked) */
 	bool pause;
@@ -375,7 +376,9 @@ void kvm_riscv_vcpu_flush_interrupts(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu);
 bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
+void __kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
+bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu);
 
 void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..70937f71c3c4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -102,6 +102,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_context *cntx;
 	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
 
+	spin_lock_init(&vcpu->arch.mp_state_lock);
+
 	/* Mark this VCPU never ran */
 	vcpu->arch.ran_atleast_once = false;
 	vcpu->arch.mmu_page_cache.gfp_zero = __GFP_ZERO;
@@ -201,7 +203,7 @@ void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 {
 	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1UL) &&
-		!vcpu->arch.power_off && !vcpu->arch.pause);
+		!kvm_riscv_vcpu_stopped(vcpu) && !vcpu->arch.pause);
 }
 
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
@@ -429,26 +431,50 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 	return kvm_riscv_vcpu_aia_has_interrupts(vcpu, mask);
 }
 
-void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu)
+static void __kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.power_off = true;
+	vcpu->arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
 	kvm_make_request(KVM_REQ_SLEEP, vcpu);
 	kvm_vcpu_kick(vcpu);
 }
 
-void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu)
+{
+	spin_lock(&vcpu->arch.mp_state_lock);
+	__kvm_riscv_vcpu_power_off(vcpu);
+	spin_unlock(&vcpu->arch.mp_state_lock);
+}
+
+void __kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.power_off = false;
+	vcpu->arch.mp_state.mp_state = KVM_MP_STATE_RUNNABLE;
 	kvm_vcpu_wake_up(vcpu);
 }
 
+void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu)
+{
+	spin_lock(&vcpu->arch.mp_state_lock);
+	__kvm_riscv_vcpu_power_on(vcpu);
+	spin_unlock(&vcpu->arch.mp_state_lock);
+}
+
+bool kvm_riscv_vcpu_stopped(struct kvm_vcpu *vcpu)
+{
+	bool ret;
+
+	spin_lock(&vcpu->arch.mp_state_lock);
+	ret = vcpu->arch.mp_state.mp_state == KVM_MP_STATE_STOPPED;
+	spin_unlock(&vcpu->arch.mp_state_lock);
+
+	return ret;
+}
+
 int kvm_arch_vcpu_ioctl_get_mpstate(struct kvm_vcpu *vcpu,
 				    struct kvm_mp_state *mp_state)
 {
-	if (vcpu->arch.power_off)
-		mp_state->mp_state = KVM_MP_STATE_STOPPED;
-	else
-		mp_state->mp_state = KVM_MP_STATE_RUNNABLE;
+	spin_lock(&vcpu->arch.mp_state_lock);
+	*mp_state = vcpu->arch.mp_state;
+	spin_unlock(&vcpu->arch.mp_state_lock);
 
 	return 0;
 }
@@ -458,17 +484,21 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 {
 	int ret = 0;
 
+	spin_lock(&vcpu->arch.mp_state_lock);
+
 	switch (mp_state->mp_state) {
 	case KVM_MP_STATE_RUNNABLE:
-		vcpu->arch.power_off = false;
+		vcpu->arch.mp_state.mp_state = KVM_MP_STATE_RUNNABLE;
 		break;
 	case KVM_MP_STATE_STOPPED:
-		kvm_riscv_vcpu_power_off(vcpu);
+		__kvm_riscv_vcpu_power_off(vcpu);
 		break;
 	default:
 		ret = -EINVAL;
 	}
 
+	spin_unlock(&vcpu->arch.mp_state_lock);
+
 	return ret;
 }
 
@@ -584,11 +614,11 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
 			kvm_vcpu_srcu_read_unlock(vcpu);
 			rcuwait_wait_event(wait,
-				(!vcpu->arch.power_off) && (!vcpu->arch.pause),
+				(!kvm_riscv_vcpu_stopped(vcpu)) && (!vcpu->arch.pause),
 				TASK_INTERRUPTIBLE);
 			kvm_vcpu_srcu_read_lock(vcpu);
 
-			if (vcpu->arch.power_off || vcpu->arch.pause) {
+			if (kvm_riscv_vcpu_stopped(vcpu) || vcpu->arch.pause) {
 				/*
 				 * Awaken to handle a signal, request to
 				 * sleep again later.
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 72a2ffb8dcd1..1851fc979bd2 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -138,8 +138,11 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 	unsigned long i;
 	struct kvm_vcpu *tmp;
 
-	kvm_for_each_vcpu(i, tmp, vcpu->kvm)
-		tmp->arch.power_off = true;
+	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
+		spin_lock(&vcpu->arch.mp_state_lock);
+		tmp->arch.mp_state.mp_state = KVM_MP_STATE_STOPPED;
+		spin_unlock(&vcpu->arch.mp_state_lock);
+	}
 	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
 
 	memset(&run->system_event, 0, sizeof(run->system_event));
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 7dca0e9381d9..115a6c6525fd 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -18,12 +18,18 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	struct kvm_vcpu *target_vcpu;
 	unsigned long target_vcpuid = cp->a0;
+	int ret = 0;
 
 	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
 	if (!target_vcpu)
 		return SBI_ERR_INVALID_PARAM;
-	if (!target_vcpu->arch.power_off)
-		return SBI_ERR_ALREADY_AVAILABLE;
+
+	spin_lock(&target_vcpu->arch.mp_state_lock);
+
+	if (target_vcpu->arch.mp_state.mp_state != KVM_MP_STATE_STOPPED) {
+		ret = SBI_ERR_ALREADY_AVAILABLE;
+		goto out;
+	}
 
 	reset_cntx = &target_vcpu->arch.guest_reset_context;
 	/* start address */
@@ -34,14 +40,18 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 	reset_cntx->a1 = cp->a2;
 	kvm_make_request(KVM_REQ_VCPU_RESET, target_vcpu);
 
-	kvm_riscv_vcpu_power_on(target_vcpu);
+	__kvm_riscv_vcpu_power_on(target_vcpu);
+
+out:
+	spin_unlock(&target_vcpu->arch.mp_state_lock);
+
 
 	return 0;
 }
 
 static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
 {
-	if (vcpu->arch.power_off)
+	if (kvm_riscv_vcpu_stopped(vcpu))
 		return SBI_ERR_FAILURE;
 
 	kvm_riscv_vcpu_power_off(vcpu);
@@ -58,7 +68,7 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
 	target_vcpu = kvm_get_vcpu_by_id(vcpu->kvm, target_vcpuid);
 	if (!target_vcpu)
 		return SBI_ERR_INVALID_PARAM;
-	if (!target_vcpu->arch.power_off)
+	if (!kvm_riscv_vcpu_stopped(target_vcpu))
 		return SBI_HSM_STATE_STARTED;
 	else if (vcpu->stat.generic.blocking)
 		return SBI_HSM_STATE_SUSPENDED;
@@ -71,14 +81,11 @@ static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
-	struct kvm *kvm = vcpu->kvm;
 	unsigned long funcid = cp->a6;
 
 	switch (funcid) {
 	case SBI_EXT_HSM_HART_START:
-		mutex_lock(&kvm->lock);
 		ret = kvm_sbi_hsm_vcpu_start(vcpu);
-		mutex_unlock(&kvm->lock);
 		break;
 	case SBI_EXT_HSM_HART_STOP:
 		ret = kvm_sbi_hsm_vcpu_stop(vcpu);
-- 
2.17.1


