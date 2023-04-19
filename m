From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:39 -0700
Subject: [RFC 11/48] RISC-V: KVM: Use the new VM IOCTL for measuring pages
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-12-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The newly introduced VM IOCTL allow the VMM to measure the pages used
to load the blobs. Hookup the VM ioctl.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 29d3221..1b59a8f 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_cove.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
@@ -209,5 +210,20 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 long kvm_arch_vm_ioctl(struct file *filp,
 		       unsigned int ioctl, unsigned long arg)
 {
-	return -EINVAL;
+	struct kvm *kvm = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct kvm_riscv_cove_measure_region mr;
+
+	switch (ioctl) {
+	case KVM_RISCV_COVE_MEASURE_REGION:
+		if (!is_cove_vm(kvm))
+			return -EINVAL;
+		if (copy_from_user(&mr, argp, sizeof(mr)))
+			return -EFAULT;
+
+		return kvm_riscv_cove_vm_measure_pages(kvm, &mr);
+	default:
+		return -EINVAL;
+	}
+
 }
-- 
2.25.1


