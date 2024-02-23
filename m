From: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Feb 2024 16:42:58 -0800
Subject: [PATCH v9 11/11] KVM: selftests: Add a basic SEV-ES smoke test
In-Reply-To: <20240223004258.3104051-1-seanjc@google.com>
References: <20240223004258.3104051-1-seanjc@google.com>
Message-ID: <20240223004258.3104051-12-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Extend sev_smoke_test to also run a minimal SEV-ES smoke test so that it's
possible to test KVM's unique VMRUN=>#VMEXIT path for SEV-ES guests
without needing a full blown SEV-ES capable VM, which requires a rather
absurd amount of properly configured collateral.

Punt on proper GHCB and ucall support, and instead use the GHCB MSR
protocol to signal test completion.  The most important thing at this
point is to have _any_ kind of testing of KVM's __svm_sev_es_vcpu_run().

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Cc: Peter Gonda <pgonda@google.com>
Cc: Carlos Bilbao <carlos.bilbao@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86_64/sev.h        |  2 ++
 .../selftests/kvm/lib/x86_64/processor.c      |  2 +-
 tools/testing/selftests/kvm/lib/x86_64/sev.c  |  6 +++-
 .../selftests/kvm/x86_64/sev_smoke_test.c     | 30 +++++++++++++++++++
 4 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86_64/sev.h b/tools/testing/selftests/kvm/include/x86_64/sev.h
index de5283bef752..8a1bf88474c9 100644
--- a/tools/testing/selftests/kvm/include/x86_64/sev.h
+++ b/tools/testing/selftests/kvm/include/x86_64/sev.h
@@ -25,6 +25,8 @@ enum sev_guest_state {
 #define SEV_POLICY_NO_DBG	(1UL << 0)
 #define SEV_POLICY_ES		(1UL << 2)
 
+#define GHCB_MSR_TERM_REQ	0x100
+
 void sev_vm_launch(struct kvm_vm *vm, uint32_t policy);
 void sev_vm_launch_measure(struct kvm_vm *vm, uint8_t *measurement);
 void sev_vm_launch_finish(struct kvm_vm *vm);
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index aa92220bf5da..a33289a5b89a 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -1074,7 +1074,7 @@ void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 
 void kvm_init_vm_address_properties(struct kvm_vm *vm)
 {
-	if (vm->subtype == VM_SUBTYPE_SEV) {
+	if (vm->subtype == VM_SUBTYPE_SEV || vm->subtype == VM_SUBTYPE_SEV_ES) {
 		vm->arch.c_bit = BIT_ULL(this_cpu_property(X86_PROPERTY_SEV_C_BIT));
 		vm->gpa_tag_mask = vm->arch.c_bit;
 	}
diff --git a/tools/testing/selftests/kvm/lib/x86_64/sev.c b/tools/testing/selftests/kvm/lib/x86_64/sev.c
index 9f5a3dbb5e65..e248d3364b9c 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/sev.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/sev.c
@@ -53,6 +53,9 @@ void sev_vm_launch(struct kvm_vm *vm, uint32_t policy)
 	hash_for_each(vm->regions.slot_hash, ctr, region, slot_node)
 		encrypt_region(vm, region);
 
+	if (policy & SEV_POLICY_ES)
+		vm_sev_ioctl(vm, KVM_SEV_LAUNCH_UPDATE_VMSA, NULL);
+
 	vm->arch.is_pt_protected = true;
 }
 
@@ -90,7 +93,8 @@ struct kvm_vm *vm_sev_create_with_one_vcpu(uint32_t policy, void *guest_code,
 	struct vm_shape shape = {
 		.type = VM_TYPE_DEFAULT,
 		.mode = VM_MODE_DEFAULT,
-		.subtype = VM_SUBTYPE_SEV,
+		.subtype = policy & SEV_POLICY_ES ? VM_SUBTYPE_SEV_ES :
+						    VM_SUBTYPE_SEV,
 	};
 	struct kvm_vm *vm;
 	struct kvm_vcpu *cpus[1];
diff --git a/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c b/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
index 54d72efd9b4d..026779f3ed06 100644
--- a/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86_64/sev_smoke_test.c
@@ -12,6 +12,21 @@
 #include "linux/psp-sev.h"
 #include "sev.h"
 
+
+static void guest_sev_es_code(void)
+{
+	/* TODO: Check CPUID after GHCB-based hypercall support is added. */
+	GUEST_ASSERT(rdmsr(MSR_AMD64_SEV) & MSR_AMD64_SEV_ENABLED);
+	GUEST_ASSERT(rdmsr(MSR_AMD64_SEV) & MSR_AMD64_SEV_ES_ENABLED);
+
+	/*
+	 * TODO: Add GHCB and ucall support for SEV-ES guests.  For now, simply
+	 * force "termination" to signal "done" via the GHCB MSR protocol.
+	 */
+	wrmsr(MSR_AMD64_SEV_ES_GHCB, GHCB_MSR_TERM_REQ);
+	__asm__ __volatile__("rep; vmmcall");
+}
+
 static void guest_sev_code(void)
 {
 	GUEST_ASSERT(this_cpu_has(X86_FEATURE_SEV));
@@ -31,6 +46,16 @@ static void test_sev(void *guest_code, uint64_t policy)
 	for (;;) {
 		vcpu_run(vcpu);
 
+		if (policy & SEV_POLICY_ES) {
+			TEST_ASSERT(vcpu->run->exit_reason == KVM_EXIT_SYSTEM_EVENT,
+				    "Wanted SYSTEM_EVENT, got %s",
+				    exit_reason_str(vcpu->run->exit_reason));
+			TEST_ASSERT_EQ(vcpu->run->system_event.type, KVM_SYSTEM_EVENT_SEV_TERM);
+			TEST_ASSERT_EQ(vcpu->run->system_event.ndata, 1);
+			TEST_ASSERT_EQ(vcpu->run->system_event.data[0], GHCB_MSR_TERM_REQ);
+			break;
+		}
+
 		switch (get_ucall(vcpu, &uc)) {
 		case UCALL_SYNC:
 			continue;
@@ -54,5 +79,10 @@ int main(int argc, char *argv[])
 	test_sev(guest_sev_code, SEV_POLICY_NO_DBG);
 	test_sev(guest_sev_code, 0);
 
+	if (kvm_cpu_has(X86_FEATURE_SEV_ES)) {
+		test_sev(guest_sev_es_code, SEV_POLICY_ES | SEV_POLICY_NO_DBG);
+		test_sev(guest_sev_es_code, SEV_POLICY_ES);
+	}
+
 	return 0;
 }
-- 
2.44.0.rc0.258.g7320e95886-goog


