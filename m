From: Chao Du <duchao@eswincomputing.com>
Date: Tue,  6 Feb 2024 07:49:29 +0000
Subject: [PATCH v1 1/3] RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
In-Reply-To: <20240206074931.22930-1-duchao@eswincomputing.com>
References: <20240206074931.22930-1-duchao@eswincomputing.com>
Message-ID: <20240206074931.22930-2-duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

kvm_vm_ioctl_check_extension(): Return 1 if KVM_CAP_SET_GUEST_DEBUG is
being checked.

kvm_arch_vcpu_ioctl_set_guest_debug(): Update the guest_debug flags
from userspace accordingly. Route the breakpoint exceptions to HS mode
if the VM is being debugged by userspace, by clearing the corresponding
bit in hedeleg CSR.

Signed-off-by: Chao Du <duchao@eswincomputing.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu.c             | 15 +++++++++++++--
 arch/riscv/kvm/vm.c               |  1 +
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index d6b7a5b95874..8890977836f0 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -17,6 +17,7 @@

 #define __KVM_HAVE_IRQ_LINE
 #define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_GUEST_DEBUG

 #define KVM_COALESCED_MMIO_PAGE_OFFSET 1

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b5ca9f2e98ac..6cee974592ac 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -475,8 +475,19 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 					struct kvm_guest_debug *dbg)
 {
-	/* TODO; To be implemented later. */
-	return -EINVAL;
+	if (dbg->control & KVM_GUESTDBG_ENABLE) {
+		if (vcpu->guest_debug != dbg->control) {
+			vcpu->guest_debug = dbg->control;
+			csr_clear(CSR_HEDELEG, BIT(EXC_BREAKPOINT));
+		}
+	} else {
+		if (vcpu->guest_debug != 0) {
+			vcpu->guest_debug = 0;
+			csr_set(CSR_HEDELEG, BIT(EXC_BREAKPOINT));
+		}
+	}
+
+	return 0;
 }

 static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index ce58bc48e5b8..7396b8654f45 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -186,6 +186,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_READONLY_MEM:
 	case KVM_CAP_MP_STATE:
 	case KVM_CAP_IMMEDIATE_EXIT:
+	case KVM_CAP_SET_GUEST_DEBUG:
 		r = 1;
 		break;
 	case KVM_CAP_NR_VCPUS:
--
2.17.1


