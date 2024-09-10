From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:22:06 +0000
Subject: [PATCH 14/15] KVM: x86: Implement KVM_TRANSLATE2
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-15-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement KVM_TRANSLATE2 for x86 using the default KVM page walker.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/kvm/x86.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 27fc71aaa1e4..3bcbad958324 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4683,6 +4683,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_IRQFD_RESAMPLE:
 	case KVM_CAP_MEMORY_FAULT_INFO:
 	case KVM_CAP_X86_GUEST_MODE:
+	case KVM_CAP_TRANSLATE2:
 		r = 1;
 		break;
 	case KVM_CAP_PRE_FAULT_MEMORY:
@@ -12156,6 +12157,81 @@ int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+/*
+ * Translate a guest virtual address to a guest physical address.
+ */
+int kvm_arch_vcpu_ioctl_translate2(struct kvm_vcpu *vcpu,
+				    struct kvm_translation2 *tr)
+{
+	int idx, set_bit_mode = 0, access = 0;
+	struct x86_exception exception = { };
+	gva_t vaddr = tr->linear_address;
+	u16 status = 0;
+	gpa_t gpa;
+
+	if (tr->flags & KVM_TRANSLATE_FLAGS_SET_ACCESSED)
+		set_bit_mode |= PWALK_SET_ACCESSED;
+	if (tr->flags & KVM_TRANSLATE_FLAGS_SET_DIRTY)
+		set_bit_mode |= PWALK_SET_DIRTY;
+	if (tr->flags & KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED)
+		set_bit_mode |= PWALK_FORCE_SET_ACCESSED;
+
+	if (tr->access & KVM_TRANSLATE_ACCESS_WRITE)
+		access |= PFERR_WRITE_MASK;
+	if (tr->access & KVM_TRANSLATE_ACCESS_USER)
+		access |= PFERR_USER_MASK;
+	if (tr->access & KVM_TRANSLATE_ACCESS_EXEC)
+		access |= PFERR_FETCH_MASK;
+
+	vcpu_load(vcpu);
+
+	idx = srcu_read_lock(&vcpu->kvm->srcu);
+
+	/* Even with PAE virtual addresses are still 32-bit */
+	if (is_64_bit_mode(vcpu) ? is_noncanonical_address(vaddr, vcpu) :
+				   tr->linear_address >> 32) {
+		tr->valid = false;
+		tr->error_code = KVM_TRANSLATE_FAULT_INVALID_GVA;
+		goto exit;
+	}
+
+	gpa = kvm_mmu_gva_to_gpa(vcpu, vaddr, access, set_bit_mode, &exception,
+				 &status);
+
+	tr->physical_address = exception.error_code_valid ? exception.gpa_page_fault : gpa;
+	tr->valid = !exception.error_code_valid;
+
+	/*
+	 * Order is important here:
+	 * - If there are access restrictions those will always be set in the
+	 *   error_code
+	 * - If a PTE GPA is unmapped, the present bit in error_code may not
+	 *   have been set already
+	 */
+	if (exception.flags & KVM_X86_UNMAPPED_PTE_GPA)
+		tr->error_code = KVM_TRANSLATE_FAULT_INVALID_GPA;
+	else if (!(exception.error_code & PFERR_PRESENT_MASK))
+		tr->error_code = KVM_TRANSLATE_FAULT_NOT_PRESENT;
+	else if (exception.error_code & PFERR_RSVD_MASK)
+		tr->error_code = KVM_TRANSLATE_FAULT_RESERVED_BITS;
+	else if (exception.error_code & (PFERR_USER_MASK | PFERR_WRITE_MASK |
+					 PFERR_FETCH_MASK))
+		tr->error_code = KVM_TRANSLATE_FAULT_PRIVILEGE_VIOLATION;
+
+	/*
+	 * exceptions.flags and thus tr->set_bits_succeeded have meaning
+	 * regardless of the success of the page walk.
+	 */
+	tr->set_bits_succeeded = tr->flags &&
+				 !(status & PWALK_STATUS_READ_ONLY_PTE_GPA);
+
+exit:
+	srcu_read_unlock(&vcpu->kvm->srcu, idx);
+
+	vcpu_put(vcpu);
+	return 0;
+}
+
 int kvm_arch_vcpu_ioctl_get_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu)
 {
 	struct fxregs_state *fxsave;
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


