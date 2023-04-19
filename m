From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:43 -0700
Subject: [RFC 15/48] RISC-V: KVM: Add a helper function to trigger fence ops
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-16-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When Cove is enabled in RISC-V, the TLB shootdown happens in co-ordination
with TSM. The host must not issue hfence directly. It relies on TSM
to do that instead. It just needs to initiate the process and make
sure that all the running vcpus exit the guest mode. As a result, it
traps to TSM and TSM issues hfence on behalf of the host.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h |  2 ++
 arch/riscv/kvm/cove.c             | 36 +++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
index 4ea1df1..fc8633d 100644
--- a/arch/riscv/include/asm/kvm_cove.h
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -130,6 +130,8 @@ void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *tr
 int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr);
 int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size);
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva);
+/* Fence related function */
+int kvm_riscv_cove_tvm_fence(struct kvm_vcpu *vcpu);
 #else
 static inline bool kvm_riscv_cove_enabled(void) {return false; };
 static inline int kvm_riscv_cove_init(void) { return -1; }
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 5b4d9ba..4efcae3 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -78,6 +78,42 @@ static int kvm_riscv_cove_fence(void)
 	return rc;
 }
 
+int kvm_riscv_cove_tvm_fence(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
+	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
+	unsigned long i;
+	struct kvm_vcpu *temp_vcpu;
+	int ret;
+
+	if (!tvmc)
+		return -EINVAL;
+
+	spin_lock(&tvmc->tvm_fence_lock);
+	ret = sbi_covh_tvm_initiate_fence(tvmc->tvm_guest_id);
+	if (ret) {
+		spin_unlock(&tvmc->tvm_fence_lock);
+		return ret;
+	}
+
+	bitmap_clear(vcpu_mask, 0, KVM_MAX_VCPUS);
+	kvm_for_each_vcpu(i, temp_vcpu, kvm) {
+		if (temp_vcpu != vcpu)
+			bitmap_set(vcpu_mask, i, 1);
+	}
+
+	/*
+	 * The host just needs to make sure that the running vcpus exit the
+	 * guest mode and traps into TSM so that it can issue hfence.
+	 */
+	kvm_make_vcpus_request_mask(kvm, KVM_REQ_OUTSIDE_GUEST_MODE, vcpu_mask);
+	spin_unlock(&tvmc->tvm_fence_lock);
+
+	return 0;
+}
+
+
 static int cove_convert_pages(unsigned long phys_addr, unsigned long npages, bool fence)
 {
 	int rc;
-- 
2.25.1


