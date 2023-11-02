From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:10 +0800
Subject: [RFC PATCH v1 7/8] KVM: selftests: x86: Support vcpu run in user mode
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
Message-ID: <20231102155111.28821-8-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce vcpu_setup_user_mode() to support vcpu run in user mode.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/x86_64/processor.h  |  1 +
 .../selftests/kvm/lib/x86_64/processor.c      | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 9c8224c80664..2534bdf8aa71 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -800,6 +800,7 @@ static inline void cpu_relax(void)
 struct kvm_x86_state *vcpu_save_state(struct kvm_vcpu *vcpu);
 void vcpu_load_state(struct kvm_vcpu *vcpu, struct kvm_x86_state *state);
 void kvm_x86_state_cleanup(struct kvm_x86_state *state);
+void vcpu_setup_user_mode(struct kvm_vcpu *vcpu, void *guest_code);
 
 const struct kvm_msr_list *kvm_get_msr_index_list(void);
 const struct kvm_msr_list *kvm_get_feature_msr_index_list(void);
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 7647c3755ca2..c84292b35f2d 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -1071,6 +1071,25 @@ void vcpu_load_state(struct kvm_vcpu *vcpu, struct kvm_x86_state *state)
 		vcpu_nested_state_set(vcpu, &state->nested);
 }
 
+void vcpu_setup_user_mode(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	struct kvm_sregs sregs;
+	struct kvm_regs regs;
+	struct kvm_vm *vm = vcpu->vm;
+
+	vcpu_sregs_get(vcpu, &sregs);
+	kvm_seg_set_code_64bit(vm, USER_CODE_SELECTOR, &sregs.cs);
+	kvm_seg_set_data_64bit(vm, USER_DATA_SELECTOR, &sregs.ds);
+	kvm_seg_set_data_64bit(vm, USER_DATA_SELECTOR, &sregs.es);
+	kvm_seg_set_data_64bit(vm, USER_DATA_SELECTOR, &sregs.ss);
+	vcpu_sregs_set(vcpu, &sregs);
+
+	vcpu_regs_get(vcpu, &regs);
+	regs.rsp = vcpu->stack_vaddr - (DEFAULT_STACK_PGS >> 1) * getpagesize();
+	regs.rip = (unsigned long) guest_code;
+	vcpu_regs_set(vcpu, &regs);
+}
+
 void kvm_x86_state_cleanup(struct kvm_x86_state *state)
 {
 	free(state->xsave);
-- 
2.21.3


