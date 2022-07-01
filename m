From: Nikolay Borisov <nborisov@suse.com>
Date: Fri,  1 Jul 2022 11:45:18 +0300
Subject: [PATCH] riscv-v: kvm: Make kvm_riscv_guest_timer_init a void function
Message-ID: <20220701084518.1922011-1-nborisov@suse.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It can never fail so convey that fact explicitly by making the function
void. Also in kvm_arch_init_vm it makes it clear that there no need
to do any cleanup after kvm_riscv_gstage_vmid_init has been called.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 arch/riscv/include/asm/kvm_vcpu_timer.h | 2 +-
 arch/riscv/kvm/vcpu_timer.c             | 4 +---
 arch/riscv/kvm/vm.c                     | 4 +++-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 375281eb49e0..50138e2eb91b 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -39,6 +39,6 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
-int kvm_riscv_guest_timer_init(struct kvm *kvm);
+void kvm_riscv_guest_timer_init(struct kvm *kvm);
 
 #endif
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 5c4c37ff2d48..595043857049 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -214,12 +214,10 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 #endif
 }
 
-int kvm_riscv_guest_timer_init(struct kvm *kvm)
+void kvm_riscv_guest_timer_init(struct kvm *kvm)
 {
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
 
 	riscv_cs_get_mult_shift(&gt->nsec_mult, &gt->nsec_shift);
 	gt->time_delta = -get_cycles64();
-
-	return 0;
 }
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 945a2bf5e3f6..65a964d7e70d 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -41,7 +41,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return r;
 	}
 
-	return kvm_riscv_guest_timer_init(kvm);
+	kvm_riscv_guest_timer_init(kvm);
+
+	return 0;
 }
 
 void kvm_arch_destroy_vm(struct kvm *kvm)
-- 
2.25.1


