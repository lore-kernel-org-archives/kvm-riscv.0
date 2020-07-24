From: Yifei Jiang <jiangyifei@huawei.com>
Date: Fri, 24 Jul 2020 16:54:40 +0800
Subject: [RFC 1/2] RISC-V: KVM: enable ioeventfd capability and compile for
 risc-v
In-Reply-To: <20200724085441.1514-1-jiangyifei@huawei.com>
References: <20200724085441.1514-1-jiangyifei@huawei.com>
Message-ID: <20200724085441.1514-2-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
---
 arch/riscv/kvm/Kconfig  | 2 ++
 arch/riscv/kvm/Makefile | 2 +-
 arch/riscv/kvm/vm.c     | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 2356dc52ebb3..95d85d893ab6 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -4,6 +4,7 @@
 #
 
 source "virt/kvm/Kconfig"
+source "drivers/vhost/Kconfig"
 
 menuconfig VIRTUALIZATION
 	bool "Virtualization"
@@ -26,6 +27,7 @@ config KVM
 	select KVM_MMIO
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select SRCU
+	select HAVE_KVM_EVENTFD
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index b56dc1650d2c..3ad46fe44900 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -2,7 +2,7 @@
 # Makefile for RISC-V KVM support
 #
 
-common-objs-y = $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o)
+common-objs-y = $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o eventfd.o)
 
 ccflags-y := -Ivirt/kvm -Iarch/riscv/kvm
 
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 4f2498198cb5..473299e71f68 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -52,6 +52,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	int r;
 
 	switch (ext) {
+	case KVM_CAP_IOEVENTFD:
 	case KVM_CAP_DEVICE_CTRL:
 	case KVM_CAP_USER_MEMORY:
 	case KVM_CAP_SYNC_MMU:
-- 
2.19.1



