From: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 Apr 2022 00:43:42 +0000
Subject: [PATCH 2/3] KVM: RISC-V: Use kvm_vcpu.srcu_idx, drop RISC-V's
 unnecessary copy
In-Reply-To: <20220415004343.2203171-1-seanjc@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
Message-ID: <20220415004343.2203171-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the generic kvm_vcpu's srcu_idx instead of using an indentical field
in RISC-V's version of kvm_vcpu_arch.  Generic KVM very intentionally
does not touch vcpu->srcu_idx, i.e. there's zero chance of running afoul
of common code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/include/asm/kvm_host.h |  3 ---
 arch/riscv/kvm/vcpu.c             | 16 ++++++++--------
 arch/riscv/kvm/vcpu_exit.c        |  4 ++--
 3 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 78da839657e5..cd4bbcecb0fb 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -193,9 +193,6 @@ struct kvm_vcpu_arch {
 
 	/* Don't run the VCPU (blocked) */
 	bool pause;
-
-	/* SRCU lock index for in-kernel run loop */
-	int srcu_idx;
 };
 
 static inline void kvm_arch_hardware_unsetup(void) {}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6785aef4cbd4..2f1caf23eed4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -724,13 +724,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	/* Mark this VCPU ran at least once */
 	vcpu->arch.ran_atleast_once = true;
 
-	vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+	vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
 	/* Process MMIO value returned from user-space */
 	if (run->exit_reason == KVM_EXIT_MMIO) {
 		ret = kvm_riscv_vcpu_mmio_return(vcpu, vcpu->run);
 		if (ret) {
-			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 			return ret;
 		}
 	}
@@ -739,13 +739,13 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	if (run->exit_reason == KVM_EXIT_RISCV_SBI) {
 		ret = kvm_riscv_vcpu_sbi_return(vcpu, vcpu->run);
 		if (ret) {
-			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+			srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 			return ret;
 		}
 	}
 
 	if (run->immediate_exit) {
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		return -EINTR;
 	}
 
@@ -784,7 +784,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 */
 		vcpu->mode = IN_GUEST_MODE;
 
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		smp_mb__after_srcu_read_unlock();
 
 		/*
@@ -802,7 +802,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			vcpu->mode = OUTSIDE_GUEST_MODE;
 			local_irq_enable();
 			preempt_enable();
-			vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+			vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 			continue;
 		}
 
@@ -846,7 +846,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		preempt_enable();
 
-		vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 
 		ret = kvm_riscv_vcpu_exit(vcpu, run, &trap);
 	}
@@ -855,7 +855,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	vcpu_put(vcpu);
 
-	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+	srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 
 	return ret;
 }
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index aa8af129e4bb..2d56faddb9d1 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -456,9 +456,9 @@ static int stage2_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 void kvm_riscv_vcpu_wfi(struct kvm_vcpu *vcpu)
 {
 	if (!kvm_arch_vcpu_runnable(vcpu)) {
-		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->arch.srcu_idx);
+		srcu_read_unlock(&vcpu->kvm->srcu, vcpu->srcu_idx);
 		kvm_vcpu_halt(vcpu);
-		vcpu->arch.srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
+		vcpu->srcu_idx = srcu_read_lock(&vcpu->kvm->srcu);
 		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
 	}
 }
-- 
2.36.0.rc0.470.gd361397f0d-goog


