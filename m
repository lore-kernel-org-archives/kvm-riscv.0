From: Chao Du <duchao@eswincomputing.com>
Date: Thu, 21 Dec 2023 09:50:00 +0000
Subject: [RFC PATCH 1/3] RISC-V: KVM: Enable the KVM_CAP_SET_GUEST_DEBUG capability
In-Reply-To: <20231221095002.7404-1-duchao@eswincomputing.com>
References: <20231221095002.7404-1-duchao@eswincomputing.com>
Message-ID: <20231221095002.7404-2-duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To indicate that the hypervisor has the capability for guest debug.
Also update the uapi header file.

Signed-off-by: Chao Du <duchao@eswincomputing.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vm.c               | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 60d3b21dead7..288788f5faa0 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -17,6 +17,7 @@
 
 #define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_GUEST_DEBUG
 
 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1
 
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 7e2b50c692c1..235b40ab82ea 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -187,6 +187,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_MP_STATE:
 	case KVM_CAP_IMMEDIATE_EXIT:
+	case KVM_CAP_SET_GUEST_DEBUG:
 		r = 1;
 		break;
 	case KVM_CAP_NR_VCPUS:
-- 
2.17.1


