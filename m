From: Oliver Upton <oupton@google.com>
Date: Wed, 23 Feb 2022 04:18:39 +0000
Subject: [PATCH v3 14/19] KVM: arm64: Raise default PSCI version to v1.1
In-Reply-To: <20220223041844.3984439-1-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
Message-ID: <20220223041844.3984439-15-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As it turns out, KVM already implements the requirements of PSCI v1.1.
Raise the default PSCI version to v1.1 to actually advertise as such.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Oliver Upton <oupton@google.com>
---
 arch/arm64/kvm/psci.c  | 4 +++-
 include/kvm/arm_psci.h | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index a7de84cec2e4..0b8a603c471b 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -370,7 +370,7 @@ static int kvm_psci_1_0_call(struct kvm_vcpu *vcpu)
 
 	switch(psci_fn) {
 	case PSCI_0_2_FN_PSCI_VERSION:
-		val = KVM_ARM_PSCI_1_0;
+		val = kvm_psci_version(vcpu);
 		break;
 	case PSCI_1_0_FN_PSCI_FEATURES:
 		feature = smccc_get_arg1(vcpu);
@@ -456,6 +456,7 @@ static int kvm_psci_0_1_call(struct kvm_vcpu *vcpu)
 int kvm_psci_call(struct kvm_vcpu *vcpu)
 {
 	switch (kvm_psci_version(vcpu)) {
+	case KVM_ARM_PSCI_1_1:
 	case KVM_ARM_PSCI_1_0:
 		return kvm_psci_1_0_call(vcpu);
 	case KVM_ARM_PSCI_0_2:
@@ -574,6 +575,7 @@ int kvm_arm_set_fw_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 			return 0;
 		case KVM_ARM_PSCI_0_2:
 		case KVM_ARM_PSCI_1_0:
+		case KVM_ARM_PSCI_1_1:
 			if (!wants_02)
 				return -EINVAL;
 			vcpu->kvm->arch.psci_version = val;
diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
index 297645edcaff..68b96c3826c3 100644
--- a/include/kvm/arm_psci.h
+++ b/include/kvm/arm_psci.h
@@ -13,8 +13,9 @@
 #define KVM_ARM_PSCI_0_1	PSCI_VERSION(0, 1)
 #define KVM_ARM_PSCI_0_2	PSCI_VERSION(0, 2)
 #define KVM_ARM_PSCI_1_0	PSCI_VERSION(1, 0)
+#define KVM_ARM_PSCI_1_1	PSCI_VERSION(1, 1)
 
-#define KVM_ARM_PSCI_LATEST	KVM_ARM_PSCI_1_0
+#define KVM_ARM_PSCI_LATEST	KVM_ARM_PSCI_1_1
 
 static inline int kvm_psci_version(struct kvm_vcpu *vcpu)
 {
-- 
2.35.1.473.g83b2b277ed-goog


