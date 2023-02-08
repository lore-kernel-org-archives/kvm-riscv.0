From: Thomas Huth <thuth@redhat.com>
Date: Wed,  8 Feb 2023 15:01:02 +0100
Subject: [PATCH v2 3/6] KVM: x86: Remove the KVM_GET_NR_MMU_PAGES ioctl
In-Reply-To: <20230208140105.655814-1-thuth@redhat.com>
References: <20230208140105.655814-1-thuth@redhat.com>
Message-ID: <20230208140105.655814-4-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM_GET_NR_MMU_PAGES ioctl is quite questionable on 64-bit hosts
since it fails to return the full 64 bits of the value that can be
set with the corresponding KVM_SET_NR_MMU_PAGES call. Its "long" return
value is truncated into an "int" in the kvm_arch_vm_ioctl() function.

Since this ioctl also never has been used by userspace applications
(QEMU, Google's internal VMM, kvmtool and CrosVM have been checked),
it's likely the best if we remove this badly designed ioctl before
anybody really tries to use it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/x86/kvm/x86.c             | 8 --------
 include/uapi/linux/kvm.h       | 2 +-
 tools/include/uapi/linux/kvm.h | 2 +-
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index da4bbd043a7b..2d210ab47e21 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6007,11 +6007,6 @@ static int kvm_vm_ioctl_set_nr_mmu_pages(struct kvm *kvm,
 	return 0;
 }
 
-static unsigned long kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
-{
-	return kvm->arch.n_max_mmu_pages;
-}
-
 static int kvm_vm_ioctl_get_irqchip(struct kvm *kvm, struct kvm_irqchip *chip)
 {
 	struct kvm_pic *pic = kvm->arch.vpic;
@@ -6689,9 +6684,6 @@ long kvm_arch_vm_ioctl(struct file *filp,
 	case KVM_SET_NR_MMU_PAGES:
 		r = kvm_vm_ioctl_set_nr_mmu_pages(kvm, arg);
 		break;
-	case KVM_GET_NR_MMU_PAGES:
-		r = kvm_vm_ioctl_get_nr_mmu_pages(kvm);
-		break;
 	case KVM_CREATE_IRQCHIP: {
 		mutex_lock(&kvm->lock);
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 55155e262646..59dc7e5d4974 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1442,7 +1442,7 @@ struct kvm_vfio_spapr_tce {
 #define KVM_CREATE_VCPU           _IO(KVMIO,   0x41)
 #define KVM_GET_DIRTY_LOG         _IOW(KVMIO,  0x42, struct kvm_dirty_log)
 #define KVM_SET_NR_MMU_PAGES      _IO(KVMIO,   0x44)
-#define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)
+#define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)  /* deprecated */
 #define KVM_SET_USER_MEMORY_REGION _IOW(KVMIO, 0x46, \
 					struct kvm_userspace_memory_region)
 #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index 55155e262646..59dc7e5d4974 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -1442,7 +1442,7 @@ struct kvm_vfio_spapr_tce {
 #define KVM_CREATE_VCPU           _IO(KVMIO,   0x41)
 #define KVM_GET_DIRTY_LOG         _IOW(KVMIO,  0x42, struct kvm_dirty_log)
 #define KVM_SET_NR_MMU_PAGES      _IO(KVMIO,   0x44)
-#define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)
+#define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)  /* deprecated */
 #define KVM_SET_USER_MEMORY_REGION _IOW(KVMIO, 0x46, \
 					struct kvm_userspace_memory_region)
 #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
-- 
2.31.1


