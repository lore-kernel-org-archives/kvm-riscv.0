From: Oliver Upton <oupton@google.com>
Date: Wed, 23 Feb 2022 04:18:26 +0000
Subject: [PATCH v3 01/19] KVM: arm64: Drop unused param from kvm_psci_version()
In-Reply-To: <20220223041844.3984439-1-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
Message-ID: <20220223041844.3984439-2-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

kvm_psci_version() consumes a pointer to struct kvm in addition to a
vcpu pointer. Drop the kvm pointer as it is unused. While the comment
suggests the explicit kvm pointer was useful for calling from hyp, there
exist no such callsite in hyp.

Signed-off-by: Oliver Upton <oupton@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20220208012705.640444-1-oupton at google.com
---
 arch/arm64/kvm/psci.c  | 6 +++---
 include/kvm/arm_psci.h | 6 +-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 3eae32876897..a0c10c11f40e 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -85,7 +85,7 @@ static unsigned long kvm_psci_vcpu_on(struct kvm_vcpu *source_vcpu)
 	if (!vcpu)
 		return PSCI_RET_INVALID_PARAMS;
 	if (!vcpu->arch.power_off) {
-		if (kvm_psci_version(source_vcpu, kvm) != KVM_ARM_PSCI_0_1)
+		if (kvm_psci_version(source_vcpu) != KVM_ARM_PSCI_0_1)
 			return PSCI_RET_ALREADY_ON;
 		else
 			return PSCI_RET_INVALID_PARAMS;
@@ -392,7 +392,7 @@ static int kvm_psci_0_1_call(struct kvm_vcpu *vcpu)
  */
 int kvm_psci_call(struct kvm_vcpu *vcpu)
 {
-	switch (kvm_psci_version(vcpu, vcpu->kvm)) {
+	switch (kvm_psci_version(vcpu)) {
 	case KVM_ARM_PSCI_1_0:
 		return kvm_psci_1_0_call(vcpu);
 	case KVM_ARM_PSCI_0_2:
@@ -471,7 +471,7 @@ int kvm_arm_get_fw_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 
 	switch (reg->id) {
 	case KVM_REG_ARM_PSCI_VERSION:
-		val = kvm_psci_version(vcpu, vcpu->kvm);
+		val = kvm_psci_version(vcpu);
 		break;
 	case KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_1:
 	case KVM_REG_ARM_SMCCC_ARCH_WORKAROUND_2:
diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
index 5b58bd2fe088..297645edcaff 100644
--- a/include/kvm/arm_psci.h
+++ b/include/kvm/arm_psci.h
@@ -16,11 +16,7 @@
 
 #define KVM_ARM_PSCI_LATEST	KVM_ARM_PSCI_1_0
 
-/*
- * We need the KVM pointer independently from the vcpu as we can call
- * this from HYP, and need to apply kern_hyp_va on it...
- */
-static inline int kvm_psci_version(struct kvm_vcpu *vcpu, struct kvm *kvm)
+static inline int kvm_psci_version(struct kvm_vcpu *vcpu)
 {
 	/*
 	 * Our PSCI implementation stays the same across versions from
-- 
2.35.1.473.g83b2b277ed-goog


