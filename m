From: Chao Du <duchao@eswincomputing.com>
Date: Thu, 21 Dec 2023 09:50:01 +0000
Subject: [RFC PATCH 2/3] RISC-V: KVM: Implement kvm_arch_vcpu_ioctl_set_guest_debug()
In-Reply-To: <20231221095002.7404-1-duchao@eswincomputing.com>
References: <20231221095002.7404-1-duchao@eswincomputing.com>
Message-ID: <20231221095002.7404-3-duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Update the guest_debug flags from userspace accordingly.
Route the breakpoint exceptions to HS mode if the VM is being debugged
by userspace, by clearing the corresponding bit in hedeleg CSR.

Signed-off-by: Chao Du <duchao@eswincomputing.com>
---
 arch/riscv/kvm/vcpu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e087c809073c..b8144434ff23 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -473,8 +473,19 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
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
-- 
2.17.1


