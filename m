From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:49 -0700
Subject: [RFC 21/48] RISC-V: KVM: Handle SBI call forward from the TSM
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-22-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

TSM may forward the some SBI calls to the host as the host
is the best place to handle these calls. Any calls related to hart
state management or console or guest side interface (COVG) falls under
this category.

Add a cove specific ecall handler to take appropriate actions upon
receiving these SBI calls.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h |  5 +++
 arch/riscv/kvm/cove.c             | 54 +++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_exit.c        |  6 +++-
 arch/riscv/kvm/vcpu_sbi.c         |  2 ++
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
index fc8633d..b63682f 100644
--- a/arch/riscv/include/asm/kvm_cove.h
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -126,6 +126,7 @@ int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap);
+int kvm_riscv_cove_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 
 int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr);
 int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size);
@@ -148,6 +149,10 @@ static inline int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu) {return -1; }
 static inline void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap) {}
+static inline int kvm_riscv_cove_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	return -1;
+}
 static inline int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa,
 					       unsigned long size) {return -1; }
 static inline int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm,
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 44095f6..87fa04b 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -147,6 +147,60 @@ void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu)
 	/* TODO */
 }
 
+int kvm_riscv_cove_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
+{
+	void *nshmem;
+	const struct kvm_vcpu_sbi_extension *sbi_ext;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	struct kvm_cpu_trap utrap = { 0 };
+	struct kvm_vcpu_sbi_return sbi_ret = {
+		.out_val = 0,
+		.err_val = 0,
+		.utrap = &utrap,
+	};
+	bool ext_is_01 = false;
+	int ret = 1;
+
+	nshmem = nacl_shmem();
+	cp->a0 = nacl_shmem_gpr_read_cove(nshmem, KVM_ARCH_GUEST_A0);
+	cp->a1 = nacl_shmem_gpr_read_cove(nshmem, KVM_ARCH_GUEST_A1);
+	cp->a6 = nacl_shmem_gpr_read_cove(nshmem, KVM_ARCH_GUEST_A6);
+	cp->a7 = nacl_shmem_gpr_read_cove(nshmem, KVM_ARCH_GUEST_A7);
+
+	/* TSM will only forward legacy console to the host */
+#ifdef CONFIG_RISCV_SBI_V01
+	if (cp->a7 == SBI_EXT_0_1_CONSOLE_PUTCHAR)
+		ext_is_01 = true;
+#endif
+
+	sbi_ext = kvm_vcpu_sbi_find_ext(vcpu, cp->a7);
+	if ((sbi_ext && sbi_ext->handler) && ((cp->a7 == SBI_EXT_DBCN) ||
+	    (cp->a7 == SBI_EXT_HSM) || (cp->a7 == SBI_EXT_SRST) || ext_is_01)) {
+		ret = sbi_ext->handler(vcpu, run, &sbi_ret);
+	} else {
+		kvm_err("%s: SBI EXT %lx not supported for TVM\n", __func__, cp->a7);
+		/* Return error for unsupported SBI calls */
+		sbi_ret.err_val = SBI_ERR_NOT_SUPPORTED;
+		goto ecall_done;
+	}
+
+	if (ret < 0)
+		goto ecall_done;
+
+	ret = (sbi_ret.uexit) ? 0 : 1;
+
+ecall_done:
+	/*
+	 * No need to update the sepc as TSM will take care of SEPC increment
+	 * for ECALLS that won't be forwarded to the user space (e.g. console)
+	 */
+	nacl_shmem_gpr_write_cove(nshmem, KVM_ARCH_GUEST_A0, sbi_ret.err_val);
+	if (!ext_is_01)
+		nacl_shmem_gpr_write_cove(nshmem, KVM_ARCH_GUEST_A1, sbi_ret.out_val);
+
+	return ret;
+}
+
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva)
 {
 	struct kvm_riscv_cove_page *tpage;
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index d00b9ee5..8944e29 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -207,11 +207,15 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case EXC_INST_GUEST_PAGE_FAULT:
 	case EXC_LOAD_GUEST_PAGE_FAULT:
 	case EXC_STORE_GUEST_PAGE_FAULT:
+		//TODO: If the host runs in HS mode, this won't work as we don't
+		//read hstatus from the shared memory yet
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = gstage_page_fault(vcpu, run, trap);
 		break;
 	case EXC_SUPERVISOR_SYSCALL:
-		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
+		if (is_cove_vcpu(vcpu))
+			ret = kvm_riscv_cove_vcpu_sbi_ecall(vcpu, run);
+		else if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_sbi_ecall(vcpu, run);
 		break;
 	default:
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 047ba10..d2f43bc 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -10,6 +10,8 @@
 #include <linux/err.h>
 #include <linux/kvm_host.h>
 #include <asm/sbi.h>
+#include <asm/kvm_nacl.h>
+#include <asm/kvm_cove_sbi.h>
 #include <asm/kvm_vcpu_sbi.h>
 
 #ifndef CONFIG_RISCV_SBI_V01
-- 
2.25.1


