From: Oliver Upton <oupton@google.com>
Date: Wed, 23 Feb 2022 04:18:34 +0000
Subject: [PATCH v3 09/19] KVM: arm64: Implement PSCI SYSTEM_SUSPEND
In-Reply-To: <20220223041844.3984439-1-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
Message-ID: <20220223041844.3984439-10-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ARM DEN0022D.b 5.19 "SYSTEM_SUSPEND" describes a PSCI call that allows
software to request that a system be placed in the deepest possible
low-power state. Effectively, software can use this to suspend itself to
RAM. Note that the semantics of this PSCI call are very similar to
CPU_SUSPEND, which is already implemented in KVM.

Implement the SYSTEM_SUSPEND in KVM. Similar to CPU_SUSPEND, the
low-power state is implemented as a guest WFI. Synchronously reset the
calling CPU before entering the WFI, such that the vCPU may immediately
resume execution when a wakeup event is recognized.

Signed-off-by: Oliver Upton <oupton@google.com>
---
 arch/arm64/kvm/psci.c  | 51 ++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/reset.c |  3 ++-
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 77a00913cdfd..41adaaf2234a 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -208,6 +208,50 @@ static void kvm_psci_system_reset(struct kvm_vcpu *vcpu)
 	kvm_prepare_system_event(vcpu, KVM_SYSTEM_EVENT_RESET);
 }
 
+static int kvm_psci_system_suspend(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_reset_state reset_state;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_vcpu *tmp;
+	bool denied = false;
+	unsigned long i;
+
+	reset_state.pc = smccc_get_arg1(vcpu);
+	if (!kvm_ipa_valid(kvm, reset_state.pc)) {
+		smccc_set_retval(vcpu, PSCI_RET_INVALID_ADDRESS, 0, 0, 0);
+		return 1;
+	}
+
+	reset_state.r0 = smccc_get_arg2(vcpu);
+	reset_state.be = kvm_vcpu_is_be(vcpu);
+	reset_state.reset = true;
+
+	/*
+	 * The SYSTEM_SUSPEND PSCI call requires that all vCPUs (except the
+	 * calling vCPU) be in an OFF state, as determined by the
+	 * implementation.
+	 *
+	 * See ARM DEN0022D, 5.19 "SYSTEM_SUSPEND" for more details.
+	 */
+	mutex_lock(&kvm->lock);
+	kvm_for_each_vcpu(i, tmp, kvm) {
+		if (tmp != vcpu && !kvm_arm_vcpu_powered_off(tmp)) {
+			denied = true;
+			break;
+		}
+	}
+	mutex_unlock(&kvm->lock);
+
+	if (denied) {
+		smccc_set_retval(vcpu, PSCI_RET_DENIED, 0, 0, 0);
+		return 1;
+	}
+
+	__kvm_reset_vcpu(vcpu, &reset_state);
+	kvm_vcpu_wfi(vcpu);
+	return 1;
+}
+
 static void kvm_psci_narrow_to_32bit(struct kvm_vcpu *vcpu)
 {
 	int i;
@@ -343,6 +387,8 @@ static int kvm_psci_1_0_call(struct kvm_vcpu *vcpu)
 		case PSCI_0_2_FN_MIGRATE_INFO_TYPE:
 		case PSCI_0_2_FN_SYSTEM_OFF:
 		case PSCI_0_2_FN_SYSTEM_RESET:
+		case PSCI_1_0_FN_SYSTEM_SUSPEND:
+		case PSCI_1_0_FN64_SYSTEM_SUSPEND:
 		case PSCI_1_0_FN_PSCI_FEATURES:
 		case ARM_SMCCC_VERSION_FUNC_ID:
 			val = 0;
@@ -352,6 +398,11 @@ static int kvm_psci_1_0_call(struct kvm_vcpu *vcpu)
 			break;
 		}
 		break;
+	case PSCI_1_0_FN_SYSTEM_SUSPEND:
+		kvm_psci_narrow_to_32bit(vcpu);
+		fallthrough;
+	case PSCI_1_0_FN64_SYSTEM_SUSPEND:
+		return kvm_psci_system_suspend(vcpu);
 	default:
 		return kvm_psci_0_2_call(vcpu);
 	}
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index f879a8f6a99c..006e7a75ceba 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -215,7 +215,8 @@ static bool vcpu_allowed_register_width(struct kvm_vcpu *vcpu)
  *
  * Note: This function can be called from two paths:
  *  - The KVM_ARM_VCPU_INIT ioctl
- *  - handling a request issued by another VCPU in the PSCI handling code
+ *  - handling a request issued by possibly another VCPU in the PSCI handling
+ *    code
  *
  * In the first case, the VCPU will not be loaded, and in the second case the
  * VCPU will be loaded.  Because this function operates purely on the
-- 
2.35.1.473.g83b2b277ed-goog


