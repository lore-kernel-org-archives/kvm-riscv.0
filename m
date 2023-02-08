From: Thomas Huth <thuth@redhat.com>
Date: Wed,  8 Feb 2023 15:01:05 +0100
Subject: [PATCH v2 6/6] KVM: Change return type of kvm_arch_vm_ioctl() to "int"
In-Reply-To: <20230208140105.655814-1-thuth@redhat.com>
References: <20230208140105.655814-1-thuth@redhat.com>
Message-ID: <20230208140105.655814-7-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

All kvm_arch_vm_ioctl() implementations now only deal with "int"
types as return values, so we can change the return type of these
functions to use "int" instead of "long".

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arm64/kvm/arm.c       | 3 +--
 arch/mips/kvm/mips.c       | 4 ++--
 arch/powerpc/kvm/powerpc.c | 5 ++---
 arch/riscv/kvm/vm.c        | 3 +--
 arch/s390/kvm/kvm-s390.c   | 3 +--
 arch/x86/kvm/x86.c         | 3 +--
 include/linux/kvm_host.h   | 3 +--
 7 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9c5573bc4614..e791ad6137b8 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1449,8 +1449,7 @@ static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
 	}
 }
 
-long kvm_arch_vm_ioctl(struct file *filp,
-		       unsigned int ioctl, unsigned long arg)
+int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
 	struct kvm *kvm = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a25e0b73ee70..84cadaa2c2d3 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1003,9 +1003,9 @@ void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
 	kvm_flush_remote_tlbs(kvm);
 }
 
-long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
+int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
-	long r;
+	int r;
 
 	switch (ioctl) {
 	default:
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 04494a4fb37a..6f6ba55c224f 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2386,12 +2386,11 @@ static int kvmppc_get_cpu_char(struct kvm_ppc_cpu_char *cp)
 }
 #endif
 
-long kvm_arch_vm_ioctl(struct file *filp,
-                       unsigned int ioctl, unsigned long arg)
+int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
 	struct kvm *kvm __maybe_unused = filp->private_data;
 	void __user *argp = (void __user *)arg;
-	long r;
+	int r;
 
 	switch (ioctl) {
 	case KVM_PPC_GET_PVINFO: {
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 65a964d7e70d..c13130ab459a 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -87,8 +87,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	return r;
 }
 
-long kvm_arch_vm_ioctl(struct file *filp,
-		       unsigned int ioctl, unsigned long arg)
+int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
 	return -EINVAL;
 }
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 8ad1972b8a73..86ca49814983 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -2850,8 +2850,7 @@ static int kvm_s390_vm_mem_op(struct kvm *kvm, struct kvm_s390_mem_op *mop)
 	return r;
 }
 
-long kvm_arch_vm_ioctl(struct file *filp,
-		       unsigned int ioctl, unsigned long arg)
+int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
 	struct kvm *kvm = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2d210ab47e21..52a8c993cd55 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6645,8 +6645,7 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
 	return 0;
 }
 
-long kvm_arch_vm_ioctl(struct file *filp,
-		       unsigned int ioctl, unsigned long arg)
+int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 {
 	struct kvm *kvm = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4f26b244f6d0..ed2f1f02976b 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1398,8 +1398,7 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irq_level,
 			bool line_status);
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			    struct kvm_enable_cap *cap);
-long kvm_arch_vm_ioctl(struct file *filp,
-		       unsigned int ioctl, unsigned long arg);
+int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg);
 long kvm_arch_vm_compat_ioctl(struct file *filp, unsigned int ioctl,
 			      unsigned long arg);
 
-- 
2.31.1


