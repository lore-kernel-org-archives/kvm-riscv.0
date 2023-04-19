From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:51 -0700
Subject: [RFC 23/48] RISC-V: KVM: Wireup TVM world switch
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-24-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

TVM worlds switch takes a different path from regular VM world switch as
it needs to make an ecall to TSM and TSM actually does the world switch.
The host doesn't need to save/restore any context as TSM is expected
to do that on behalf of the host. The TSM updatess the trap
information in the shared memory which host uses to figure out the
cause of the guest exit.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/cove.c      | 31 +++++++++++++++++++++++++++++--
 arch/riscv/kvm/vcpu.c      | 11 +++++++++++
 arch/riscv/kvm/vcpu_exit.c | 10 ++++++++++
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index c93de9b..c11db7a 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -275,9 +275,36 @@ int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hv
 	return rc;
 }
 
-void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
+void noinstr kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
 {
-	/* TODO */
+	int rc;
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_cove_tvm_context *tvmc;
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	void *nshmem;
+
+	if (!kvm->arch.tvmc)
+		return;
+
+	tvmc = kvm->arch.tvmc;
+
+	nshmem = nacl_shmem();
+	/* Invoke finalize to mark TVM is ready run for the first time */
+	if (unlikely(!tvmc->finalized_done)) {
+
+		rc = sbi_covh_tsm_finalize_tvm(tvmc->tvm_guest_id, cntx->sepc, cntx->a1);
+		if (rc) {
+			kvm_err("TVM Finalized failed with %d\n", rc);
+			return;
+		}
+		tvmc->finalized_done = true;
+	}
+
+	rc = sbi_covh_run_tvm_vcpu(tvmc->tvm_guest_id, vcpu->vcpu_idx);
+	if (rc) {
+		trap->scause = EXC_CUSTOM_KVM_COVE_RUN_FAIL;
+		return;
+	}
 }
 
 void kvm_riscv_cove_vcpu_destroy(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3e04b78..43a0b8c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1042,6 +1042,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_timer_save(vcpu);
 
 	if (kvm_riscv_nacl_available()) {
+		/**
+		 * For TVMs, we don't need a separate case as TSM only updates
+		 * the required CSRs during the world switch. All other CSR
+		 * value should be zeroed out by TSM anyways.
+		 */
 		nshmem = nacl_shmem();
 		csr->vsstatus = nacl_shmem_csr_read(nshmem, CSR_VSSTATUS);
 		csr->vsie = nacl_shmem_csr_read(nshmem, CSR_VSIE);
@@ -1191,6 +1196,12 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 			gcntx->hstatus = csr_swap(CSR_HSTATUS, hcntx->hstatus);
 		}
 
+		trap->htval = nacl_shmem_csr_read(nshmem, CSR_HTVAL);
+		trap->htinst = nacl_shmem_csr_read(nshmem, CSR_HTINST);
+	} else if (is_cove_vcpu(vcpu)) {
+		nshmem = nacl_shmem();
+		kvm_riscv_cove_vcpu_switchto(vcpu, trap);
+
 		trap->htval = nacl_shmem_csr_read(nshmem, CSR_HTVAL);
 		trap->htinst = nacl_shmem_csr_read(nshmem, CSR_HTINST);
 	} else {
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 8944e29..c46e7f2 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -218,6 +218,15 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		else if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_sbi_ecall(vcpu, run);
 		break;
+	case EXC_CUSTOM_KVM_COVE_RUN_FAIL:
+		if (likely(is_cove_vcpu(vcpu))) {
+			ret = -EACCES;
+			run->fail_entry.hardware_entry_failure_reason =
+				KVM_EXIT_FAIL_ENTRY_COVE_RUN_VCPU;
+			run->fail_entry.cpu = vcpu->cpu;
+			run->exit_reason = KVM_EXIT_FAIL_ENTRY;
+		}
+		break;
 	default:
 		break;
 	}
@@ -225,6 +234,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	/* Print details in-case of error */
 	if (ret < 0) {
 		kvm_err("VCPU exit error %d\n", ret);
+		//TODO: These values are bogus/stale for a TVM. Improve it
 		kvm_err("SEPC=0x%lx SSTATUS=0x%lx HSTATUS=0x%lx\n",
 			vcpu->arch.guest_context.sepc,
 			vcpu->arch.guest_context.sstatus,
-- 
2.25.1


