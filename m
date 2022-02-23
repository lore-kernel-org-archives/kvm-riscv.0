From: Oliver Upton <oupton@google.com>
Date: Wed, 23 Feb 2022 04:18:35 +0000
Subject: [PATCH v3 10/19] KVM: Create helper for setting a system event exit
In-Reply-To: <20220223041844.3984439-1-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
Message-ID: <20220223041844.3984439-11-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a helper that appropriately configures kvm_run for a system event
exit.

No functional change intended.

Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Oliver Upton <oupton@google.com>
---
 arch/arm64/kvm/psci.c         | 4 +---
 arch/riscv/kvm/vcpu_sbi_v01.c | 4 +---
 arch/x86/kvm/x86.c            | 6 ++----
 include/linux/kvm_host.h      | 7 +++++++
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/psci.c b/arch/arm64/kvm/psci.c
index 41adaaf2234a..2bb8d047cde4 100644
--- a/arch/arm64/kvm/psci.c
+++ b/arch/arm64/kvm/psci.c
@@ -193,9 +193,7 @@ static void kvm_prepare_system_event(struct kvm_vcpu *vcpu, u32 type)
 		tmp->arch.mp_state = KVM_MP_STATE_STOPPED;
 	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
 
-	memset(&vcpu->run->system_event, 0, sizeof(vcpu->run->system_event));
-	vcpu->run->system_event.type = type;
-	vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+	kvm_vcpu_set_system_event_exit(vcpu, type);
 }
 
 static void kvm_psci_system_off(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 07e2de14433a..7a197d5658d7 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -24,9 +24,7 @@ static void kvm_sbi_system_shutdown(struct kvm_vcpu *vcpu,
 		tmp->arch.power_off = true;
 	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
 
-	memset(&run->system_event, 0, sizeof(run->system_event));
-	run->system_event.type = type;
-	run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+	kvm_vcpu_set_system_event_exit(vcpu, type);
 }
 
 static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7131d735b1ef..109751f89ee3 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9903,14 +9903,12 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		if (kvm_check_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu))
 			kvm_vcpu_reload_apic_access_page(vcpu);
 		if (kvm_check_request(KVM_REQ_HV_CRASH, vcpu)) {
-			vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
-			vcpu->run->system_event.type = KVM_SYSTEM_EVENT_CRASH;
+			kvm_vcpu_set_system_event_exit(vcpu, KVM_SYSTEM_EVENT_CRASH);
 			r = 0;
 			goto out;
 		}
 		if (kvm_check_request(KVM_REQ_HV_RESET, vcpu)) {
-			vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
-			vcpu->run->system_event.type = KVM_SYSTEM_EVENT_RESET;
+			kvm_vcpu_set_system_event_exit(vcpu, KVM_SYSTEM_EVENT_RESET);
 			r = 0;
 			goto out;
 		}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f11039944c08..9085a1b1569a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2202,6 +2202,13 @@ static inline void kvm_handle_signal_exit(struct kvm_vcpu *vcpu)
 }
 #endif /* CONFIG_KVM_XFER_TO_GUEST_WORK */
 
+static inline void kvm_vcpu_set_system_event_exit(struct kvm_vcpu *vcpu, u32 type)
+{
+	memset(&vcpu->run->system_event, 0, sizeof(vcpu->run->system_event));
+	vcpu->run->system_event.type = type;
+	vcpu->run->exit_reason = KVM_EXIT_SYSTEM_EVENT;
+}
+
 /*
  * This defines how many reserved entries we want to keep before we
  * kick the vcpu to the userspace to avoid dirty ring full.  This
-- 
2.35.1.473.g83b2b277ed-goog


