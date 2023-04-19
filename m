From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:03 -0700
Subject: [RFC 35/48] RISC-V: KVM: Add TVM init/destroy calls
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-36-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A TVM can only be created upon explicit request from the VMM via
the vm type if CoVE SBI extensions must supported by the TSM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 1b59a8f..8a1460d 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -42,6 +42,19 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return r;
 	}
 
+	if (unlikely(type == KVM_VM_TYPE_RISCV_COVE)) {
+		if (!kvm_riscv_cove_enabled()) {
+			kvm_err("Unable to init CoVE VM because cove is not enabled\n");
+			return -EPERM;
+		}
+
+		r = kvm_riscv_cove_vm_init(kvm);
+		if (r)
+			return r;
+		kvm->arch.vm_type = type;
+		kvm_info("Trusted VM instance init successful\n");
+	}
+
 	kvm_riscv_aia_init_vm(kvm);
 
 	kvm_riscv_guest_timer_init(kvm);
@@ -54,6 +67,9 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_destroy_vcpus(kvm);
 
 	kvm_riscv_aia_destroy_vm(kvm);
+
+	if (unlikely(is_cove_vm(kvm)))
+		kvm_riscv_cove_vm_destroy(kvm);
 }
 
 int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,
-- 
2.25.1


