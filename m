From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:22:03 +0000
Subject: [PATCH 11/15] KVM: x86: Introduce generic gva to gpa translation function
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-12-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a function to translate gvas to gpas with the ability to control
set_bit_mode, access mode and flags, as well as receive status codes.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/include/asm/kvm_host.h |  3 +++
 arch/x86/kvm/x86.c              | 11 +++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 7ac1956f6f9b..ae05e917d7ea 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2160,6 +2160,9 @@ static inline bool kvm_mmu_unprotect_gfn_and_retry(struct kvm_vcpu *vcpu,
 void kvm_mmu_free_roots(struct kvm *kvm, struct kvm_mmu *mmu,
 			ulong roots_to_free);
 void kvm_mmu_free_guest_mode_roots(struct kvm *kvm, struct kvm_mmu *mmu);
+gpa_t kvm_mmu_gva_to_gpa(struct kvm_vcpu *vcpu, gva_t gva, u64 access,
+			 u64 flags, struct x86_exception *exception,
+			 u16 *status);
 gpa_t kvm_mmu_gva_to_gpa_read(struct kvm_vcpu *vcpu, gva_t gva,
 			      struct x86_exception *exception);
 gpa_t kvm_mmu_gva_to_gpa_write(struct kvm_vcpu *vcpu, gva_t gva,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index be696b60aba6..27fc71aaa1e4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7577,6 +7577,17 @@ gpa_t translate_nested_gpa(struct kvm_vcpu *vcpu, gpa_t gpa, u64 access,
 	return t_gpa;
 }
 
+gpa_t kvm_mmu_gva_to_gpa(struct kvm_vcpu *vcpu, gva_t gva, u64 access,
+			 u64 flags, struct x86_exception *exception,
+			 u16 *status)
+{
+	struct kvm_mmu *mmu = vcpu->arch.walk_mmu;
+
+	return mmu->gva_to_gpa(vcpu, mmu, gva, access, flags, exception,
+			       status);
+}
+EXPORT_SYMBOL_GPL(kvm_mmu_gva_to_gpa);
+
 gpa_t kvm_mmu_gva_to_gpa_read(struct kvm_vcpu *vcpu, gva_t gva,
 			      struct x86_exception *exception)
 {
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


