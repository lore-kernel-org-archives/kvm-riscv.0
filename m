From: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 Aug 2024 21:35:55 -0700
Subject: [PATCH v4 05/10] KVM: MIPS: Rename virtualization {en,dis}abling APIs
 to match common KVM
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
References: <20240830043600.127750-1-seanjc@google.com>
Message-ID: <20240830043600.127750-6-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename MIPS's trampoline hooks for virtualization enabling to match the
recently renamed arch hooks.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/include/asm/kvm_host.h | 4 ++--
 arch/mips/kvm/mips.c             | 4 ++--
 arch/mips/kvm/vz.c               | 8 ++++----
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 6743a57c1ab4..f7222eb594ea 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -728,8 +728,8 @@ struct kvm_mips_callbacks {
 	int (*handle_fpe)(struct kvm_vcpu *vcpu);
 	int (*handle_msa_disabled)(struct kvm_vcpu *vcpu);
 	int (*handle_guest_exit)(struct kvm_vcpu *vcpu);
-	int (*hardware_enable)(void);
-	void (*hardware_disable)(void);
+	int (*enable_virtualization_cpu)(void);
+	void (*disable_virtualization_cpu)(void);
 	int (*check_extension)(struct kvm *kvm, long ext);
 	int (*vcpu_init)(struct kvm_vcpu *vcpu);
 	void (*vcpu_uninit)(struct kvm_vcpu *vcpu);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 52e1f275351e..60b43ea85c12 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -127,12 +127,12 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 
 int kvm_arch_enable_virtualization_cpu(void)
 {
-	return kvm_mips_callbacks->hardware_enable();
+	return kvm_mips_callbacks->enable_virtualization_cpu();
 }
 
 void kvm_arch_disable_virtualization_cpu(void)
 {
-	kvm_mips_callbacks->hardware_disable();
+	kvm_mips_callbacks->disable_virtualization_cpu();
 }
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index 99d5a71e4300..ccab4d76b126 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -2869,7 +2869,7 @@ static unsigned int kvm_vz_resize_guest_vtlb(unsigned int size)
 	return ret + 1;
 }
 
-static int kvm_vz_hardware_enable(void)
+static int kvm_vz_enable_virtualization_cpu(void)
 {
 	unsigned int mmu_size, guest_mmu_size, ftlb_size;
 	u64 guest_cvmctl, cvmvmconfig;
@@ -2983,7 +2983,7 @@ static int kvm_vz_hardware_enable(void)
 	return 0;
 }
 
-static void kvm_vz_hardware_disable(void)
+static void kvm_vz_disable_virtualization_cpu(void)
 {
 	u64 cvmvmconfig;
 	unsigned int mmu_size;
@@ -3280,8 +3280,8 @@ static struct kvm_mips_callbacks kvm_vz_callbacks = {
 	.handle_msa_disabled = kvm_trap_vz_handle_msa_disabled,
 	.handle_guest_exit = kvm_trap_vz_handle_guest_exit,
 
-	.hardware_enable = kvm_vz_hardware_enable,
-	.hardware_disable = kvm_vz_hardware_disable,
+	.enable_virtualization_cpu = kvm_vz_enable_virtualization_cpu,
+	.disable_virtualization_cpu = kvm_vz_disable_virtualization_cpu,
 	.check_extension = kvm_vz_check_extension,
 	.vcpu_init = kvm_vz_vcpu_init,
 	.vcpu_uninit = kvm_vz_vcpu_uninit,
-- 
2.46.0.469.g59c65b2a67-goog


