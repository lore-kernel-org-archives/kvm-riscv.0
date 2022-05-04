From: Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Wed,  4 May 2022 17:48:07 +1000
Subject: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform
 dependent
Message-ID: <20220504074807.3616813-1-aik@ozlabs.ru>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When introduced, IRQFD resampling worked on POWER8 with XICS. However
KVM on POWER9 has never implemented it - the compatibility mode code
("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
XIVE mode does not handle INTx in KVM at all.

This moved the capability support advertising to platforms and stops
advertising it on XIVE, i.e. POWER9 and later.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---


Or I could move this one together with KVM_CAP_IRQFD. Thoughts?

---
 arch/arm64/kvm/arm.c       | 3 +++
 arch/mips/kvm/mips.c       | 3 +++
 arch/powerpc/kvm/powerpc.c | 6 ++++++
 arch/riscv/kvm/vm.c        | 3 +++
 arch/s390/kvm/kvm-s390.c   | 3 +++
 arch/x86/kvm/x86.c         | 3 +++
 virt/kvm/kvm_main.c        | 1 -
 7 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 523bc934fe2f..092f0614bae3 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -210,6 +210,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_VCPU_ATTRIBUTES:
 	case KVM_CAP_PTP_KVM:
+#ifdef CONFIG_HAVE_KVM_IRQFD
+	case KVM_CAP_IRQFD_RESAMPLE:
+#endif
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a25e0b73ee70..0f3de470a73e 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1071,6 +1071,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_SYNC_MMU:
 	case KVM_CAP_IMMEDIATE_EXIT:
+#ifdef CONFIG_HAVE_KVM_IRQFD
+	case KVM_CAP_IRQFD_RESAMPLE:
+#endif
 		r = 1;
 		break;
 	case KVM_CAP_NR_VCPUS:
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 875c30c12db0..87698ffef3be 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -591,6 +591,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 		break;
 #endif
 
+#ifdef CONFIG_HAVE_KVM_IRQFD
+	case KVM_CAP_IRQFD_RESAMPLE:
+		r = !xive_enabled();
+		break;
+#endif
+
 	case KVM_CAP_PPC_ALLOC_HTAB:
 		r = hv_enabled;
 		break;
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index c768f75279ef..b58579b386bb 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -63,6 +63,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_MP_STATE:
 	case KVM_CAP_IMMEDIATE_EXIT:
+#ifdef CONFIG_HAVE_KVM_IRQFD
+	case KVM_CAP_IRQFD_RESAMPLE:
+#endif
 		r = 1;
 		break;
 	case KVM_CAP_NR_VCPUS:
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 156d1c25a3c1..85e093fc8d13 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -564,6 +564,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_SET_GUEST_DEBUG:
 	case KVM_CAP_S390_DIAG318:
 	case KVM_CAP_S390_MEM_OP_EXTENSION:
+#ifdef CONFIG_HAVE_KVM_IRQFD
+	case KVM_CAP_IRQFD_RESAMPLE:
+#endif
 		r = 1;
 		break;
 	case KVM_CAP_SET_GUEST_DEBUG2:
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0c0ca599a353..a0a7b769483d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4273,6 +4273,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_SYS_ATTRIBUTES:
 	case KVM_CAP_VAPIC:
 	case KVM_CAP_ENABLE_CAP:
+#ifdef CONFIG_HAVE_KVM_IRQFD
+	case KVM_CAP_IRQFD_RESAMPLE:
+#endif
 		r = 1;
 		break;
 	case KVM_CAP_EXIT_HYPERCALL:
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 70e05af5ebea..885e72e668a5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4293,7 +4293,6 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 #endif
 #ifdef CONFIG_HAVE_KVM_IRQFD
 	case KVM_CAP_IRQFD:
-	case KVM_CAP_IRQFD_RESAMPLE:
 #endif
 	case KVM_CAP_IOEVENTFD_ANY_LENGTH:
 	case KVM_CAP_CHECK_EXTENSION_VM:
-- 
2.30.2


