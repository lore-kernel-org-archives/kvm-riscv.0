From: Thomas Huth <thuth@redhat.com>
Date: Fri,  3 Feb 2023 10:42:26 +0100
Subject: [PATCH 3/7] KVM: Move KVM_GET_NR_MMU_PAGES into the deprecation section
In-Reply-To: <20230203094230.266952-1-thuth@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
Message-ID: <20230203094230.266952-4-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM_GET_NR_MMU_PAGES ioctl is quite questionable on 64-bit hosts
since it fails to return the full 64 bits of the value that can be
set with the corresponding KVM_SET_NR_MMU_PAGES call. This ioctl
likely has also never really been used by userspace applications
(at least not by QEMU and kvmtool which I checked), so it's better
to move it to the deprecation section in kvm.h to make it clear for
developers that this also should not be used in new code in the
future anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/uapi/linux/kvm.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 55155e262646..f55965a4cec7 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -83,6 +83,8 @@ struct kvm_debug_guest {
 
 #define __KVM_DEPRECATED_VCPU_W_0x87 _IOW(KVMIO, 0x87, struct kvm_debug_guest)
 
+#define KVM_GET_NR_MMU_PAGES _IO(KVMIO, 0x45)
+
 /* *** End of deprecated interfaces *** */
 
 
@@ -1442,7 +1444,6 @@ struct kvm_vfio_spapr_tce {
 #define KVM_CREATE_VCPU           _IO(KVMIO,   0x41)
 #define KVM_GET_DIRTY_LOG         _IOW(KVMIO,  0x42, struct kvm_dirty_log)
 #define KVM_SET_NR_MMU_PAGES      _IO(KVMIO,   0x44)
-#define KVM_GET_NR_MMU_PAGES      _IO(KVMIO,   0x45)
 #define KVM_SET_USER_MEMORY_REGION _IOW(KVMIO, 0x46, \
 					struct kvm_userspace_memory_region)
 #define KVM_SET_TSS_ADDR          _IO(KVMIO,   0x47)
-- 
2.31.1


