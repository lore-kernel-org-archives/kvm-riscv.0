From: Oliver Upton <oupton@google.com>
Date: Fri, 11 Mar 2022 17:39:47 +0000
Subject: [PATCH v4 01/15] KVM: arm64: Generalise VM features into a set of
 flags
In-Reply-To: <20220311174001.605719-1-oupton@google.com>
References: <20220311174001.605719-1-oupton@google.com>
Message-ID: <20220311174001.605719-2-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Marc Zyngier <maz@kernel.org>

We currently deal with a set of booleans for VM features,
while they could be better represented as set of flags
contained in an unsigned long, similarily to what we are
doing on the CPU side.

Signed-off-by: Marc Zyngier <maz@kernel.org>
[Oliver: Flag-ify the 'ran_once' boolean]
Signed-off-by: Oliver Upton <oupton@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 15 +++++++++------
 arch/arm64/kvm/arm.c              |  7 ++++---
 arch/arm64/kvm/mmio.c             |  3 ++-
 arch/arm64/kvm/pmu-emul.c         |  4 ++--
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 76f795b628f1..0e96087885fe 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -122,7 +122,12 @@ struct kvm_arch {
 	 * should) opt in to this feature if KVM_CAP_ARM_NISV_TO_USER is
 	 * supported.
 	 */
-	bool return_nisv_io_abort_to_user;
+#define KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER	0
+	/* Memory Tagging Extension enabled for the guest */
+#define KVM_ARCH_FLAG_MTE_ENABLED			1
+	/* At least one vCPU has ran in the VM */
+#define KVM_ARCH_FLAG_HAS_RAN_ONCE			2
+	unsigned long flags;
 
 	/*
 	 * VM-wide PMU filter, implemented as a bitmap and big enough for
@@ -135,10 +140,6 @@ struct kvm_arch {
 
 	u8 pfr0_csv2;
 	u8 pfr0_csv3;
-
-	/* Memory Tagging Extension enabled for the guest */
-	bool mte_enabled;
-	bool ran_once;
 };
 
 struct kvm_vcpu_fault_info {
@@ -810,7 +811,9 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 #define kvm_arm_vcpu_sve_finalized(vcpu) \
 	((vcpu)->arch.flags & KVM_ARM64_VCPU_SVE_FINALIZED)
 
-#define kvm_has_mte(kvm) (system_supports_mte() && (kvm)->arch.mte_enabled)
+#define kvm_has_mte(kvm)					\
+	(system_supports_mte() &&				\
+	 test_bit(KVM_ARCH_FLAG_MTE_ENABLED, &(kvm)->arch.flags))
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(test_bit(KVM_ARM_VCPU_PMU_V3, (vcpu)->arch.features))
 
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f49ebdd9c990..17021bc8ee2c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -84,7 +84,8 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 	switch (cap->cap) {
 	case KVM_CAP_ARM_NISV_TO_USER:
 		r = 0;
-		kvm->arch.return_nisv_io_abort_to_user = true;
+		set_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
+			&kvm->arch.flags);
 		break;
 	case KVM_CAP_ARM_MTE:
 		mutex_lock(&kvm->lock);
@@ -92,7 +93,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			r = -EINVAL;
 		} else {
 			r = 0;
-			kvm->arch.mte_enabled = true;
+			set_bit(KVM_ARCH_FLAG_MTE_ENABLED, &kvm->arch.flags);
 		}
 		mutex_unlock(&kvm->lock);
 		break;
@@ -559,7 +560,7 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
 		kvm_call_hyp_nvhe(__pkvm_vcpu_init_traps, vcpu);
 
 	mutex_lock(&kvm->lock);
-	kvm->arch.ran_once = true;
+	set_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags);
 	mutex_unlock(&kvm->lock);
 
 	return ret;
diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
index 3e2d8ba11a02..3dd38a151d2a 100644
--- a/arch/arm64/kvm/mmio.c
+++ b/arch/arm64/kvm/mmio.c
@@ -135,7 +135,8 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	 * volunteered to do so, and bail out otherwise.
 	 */
 	if (!kvm_vcpu_dabt_isvalid(vcpu)) {
-		if (vcpu->kvm->arch.return_nisv_io_abort_to_user) {
+		if (test_bit(KVM_ARCH_FLAG_RETURN_NISV_IO_ABORT_TO_USER,
+			     &vcpu->kvm->arch.flags)) {
 			run->exit_reason = KVM_EXIT_ARM_NISV;
 			run->arm_nisv.esr_iss = kvm_vcpu_dabt_iss_nisv_sanitized(vcpu);
 			run->arm_nisv.fault_ipa = fault_ipa;
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 4526a5824dac..78fdc443adc7 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -961,7 +961,7 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
 	list_for_each_entry(entry, &arm_pmus, entry) {
 		arm_pmu = entry->arm_pmu;
 		if (arm_pmu->pmu.type == pmu_id) {
-			if (kvm->arch.ran_once ||
+			if (test_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags) ||
 			    (kvm->arch.pmu_filter && kvm->arch.arm_pmu != arm_pmu)) {
 				ret = -EBUSY;
 				break;
@@ -1044,7 +1044,7 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
 
 		mutex_lock(&kvm->lock);
 
-		if (kvm->arch.ran_once) {
+		if (test_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags)) {
 			mutex_unlock(&kvm->lock);
 			return -EBUSY;
 		}
-- 
2.35.1.723.g4982287a31-goog


