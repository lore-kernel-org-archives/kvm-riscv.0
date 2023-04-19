From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:52 -0700
Subject: [RFC 24/48] RISC-V: KVM: Update timer functionality for TVMs.
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-25-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

TSM manages the htimedelta/vstimecmp for the TVM and shares it
with the host to properly schedule hrtimer to keep timer interrupt ticking.
TSM only sets htimedetla when first VCPU is run to make sure host
is not able to control the start time of the VM. TSM updates vstimemcp
at every vmexit and ignores any write to vstimecmp from the host.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/cove.c       |  8 ++++++++
 arch/riscv/kvm/vcpu_timer.c | 26 +++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index c11db7a..4a8a8db 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -282,6 +282,7 @@ void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_
 	struct kvm_cove_tvm_context *tvmc;
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	void *nshmem;
+	struct kvm_guest_timer *gt = &kvm->arch.timer;
 
 	if (!kvm->arch.tvmc)
 		return;
@@ -305,6 +306,13 @@ void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_
 		trap->scause = EXC_CUSTOM_KVM_COVE_RUN_FAIL;
 		return;
 	}
+
+	/* Read htimedelta from shmem. Given it's written by TSM only when we
+	 * run first VCPU, we need to update this here rather than in timer
+	 * init.
+	 */
+	if (unlikely(!gt->time_delta))
+		gt->time_delta = nacl_shmem_csr_read(nshmem, CSR_HTIMEDELTA);
 }
 
 void kvm_riscv_cove_vcpu_destroy(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 71a4560..f059e14 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -14,6 +14,7 @@
 #include <asm/delay.h>
 #include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_timer.h>
+#include <asm/kvm_cove.h>
 
 static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
 {
@@ -71,6 +72,10 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
+	/* Host is not allowed to update the vstimecmp for the TVM */
+	if (is_cove_vcpu(vcpu))
+		return 0;
+
 #if defined(CONFIG_32BIT)
 	nacl_csr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
 	nacl_csr_write(CSR_VSTIMECMPH, ncycles >> 32);
@@ -221,6 +226,11 @@ int kvm_riscv_vcpu_set_reg_timer(struct kvm_vcpu *vcpu,
 		ret = -EOPNOTSUPP;
 		break;
 	case KVM_REG_RISCV_TIMER_REG(time):
+		/* For trusted VMs we can not update htimedelta. We can just
+		 * read it from shared memory.
+		 */
+		if (is_cove_vcpu(vcpu))
+			return -EOPNOTSUPP;
 		gt->time_delta = reg_val - get_cycles64();
 		break;
 	case KVM_REG_RISCV_TIMER_REG(compare):
@@ -287,6 +297,7 @@ static void kvm_riscv_vcpu_update_timedelta(struct kvm_vcpu *vcpu)
 {
 	struct kvm_guest_timer *gt = &vcpu->kvm->arch.timer;
 
+
 #if defined(CONFIG_32BIT)
 	nacl_csr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
 	nacl_csr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
@@ -299,6 +310,10 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_timer *t = &vcpu->arch.timer;
 
+	/* While in CoVE, HOST must not manage HTIMEDELTA or VSTIMECMP for TVM */
+	if (is_cove_vcpu(vcpu))
+		goto skip_hcsr_update;
+
 	kvm_riscv_vcpu_update_timedelta(vcpu);
 
 	if (!t->sstc_enabled)
@@ -311,6 +326,7 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 	nacl_csr_write(CSR_VSTIMECMP, t->next_cycles);
 #endif
 
+skip_hcsr_update:
 	/* timer should be enabled for the remaining operations */
 	if (unlikely(!t->init_done))
 		return;
@@ -358,5 +374,13 @@ void kvm_riscv_guest_timer_init(struct kvm *kvm)
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
 
 	riscv_cs_get_mult_shift(&gt->nsec_mult, &gt->nsec_shift);
-	gt->time_delta = -get_cycles64();
+	if (is_cove_vm(kvm)) {
+		/* For TVMs htimedelta is managed by TSM and it's communicated using
+		 * NACL shmem interface when first time VCPU is run. so we read it in
+		 * kvm_riscv_cove_vcpu_switchto() where we enter VCPUs.
+		 */
+		gt->time_delta = 0;
+	} else {
+		gt->time_delta = -get_cycles64();
+	}
 }
-- 
2.25.1


