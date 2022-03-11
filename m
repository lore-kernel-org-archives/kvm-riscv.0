From: Oliver Upton <oupton@google.com>
Date: Fri, 11 Mar 2022 17:39:49 +0000
Subject: [PATCH v4 03/15] KVM: arm64: Don't depend on fallthrough to hide
 SYSTEM_RESET2
In-Reply-To: <20220311174001.605719-1-oupton@google.com>
References: <20220311174001.605719-1-oupton@google.com>
Message-ID: <20220311174001.605719-4-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Depending on a fallthrough to the default case for hiding SYSTEM_RESET2
requires that any new case statements clean up the failure path for this
PSCI call.

Unhitch SYSTEM_RESET2 from the default case by setting val to
PSCI_RET_NOT_SUPPORTED outside of the switch statement. Apply the
cleanup to both the PSCI_1_1_FN_SYSTEM_RESET2 and
PSCI_1_0_FN_PSCI_FEATURES handlers.

No functional change intended.

Signed-off-by: Oliver Upton <oupton@google.com>
---
 arch/arm64/kvm/psci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index cd3ee947485f..2a228744d0c4 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -310,9 +310,9 @@ static int kvm_psci_0_2_call(struct kvm_vcpu *vcpu)
 
 static int kvm_psci_1_x_call(struct kvm_vcpu *vcpu, u32 minor)
 {
+	unsigned long val = PSCI_RET_NOT_SUPPORTED;
 	u32 psci_fn = smccc_get_function(vcpu);
 	u32 arg;
-	unsigned long val;
 	int ret = 1;
 
 	if (minor > 1)
@@ -328,6 +328,8 @@ static int kvm_psci_1_x_call(struct kvm_vcpu *vcpu, u32 minor)
 		if (val)
 			break;
 
+		val = PSCI_RET_NOT_SUPPORTED;
+
 		switch(arg) {
 		case PSCI_0_2_FN_PSCI_VERSION:
 		case PSCI_0_2_FN_CPU_SUSPEND:
@@ -346,13 +348,8 @@ static int kvm_psci_1_x_call(struct kvm_vcpu *vcpu, u32 minor)
 			break;
 		case PSCI_1_1_FN_SYSTEM_RESET2:
 		case PSCI_1_1_FN64_SYSTEM_RESET2:
-			if (minor >= 1) {
+			if (minor >= 1)
 				val = 0;
-				break;
-			}
-			fallthrough;
-		default:
-			val = PSCI_RET_NOT_SUPPORTED;
 			break;
 		}
 		break;
@@ -373,7 +370,7 @@ static int kvm_psci_1_x_call(struct kvm_vcpu *vcpu, u32 minor)
 			val = PSCI_RET_INVALID_PARAMS;
 			break;
 		}
-		fallthrough;
+		break;
 	default:
 		return kvm_psci_0_2_call(vcpu);
 	}
-- 
2.35.1.723.g4982287a31-goog


