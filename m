From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:59 -0700
Subject: [RFC 31/48] RISC-V: KVM: Indicate no support user space emulated IRQCHIP
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-32-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM_INTERRUPT IOCTL is used for the userspace emulated IRQCHIP.
The TEE use case do not support that yet. Return appropriate error
in case any VMM tries to invoke that operation.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 20d4800..65f87e1 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -716,6 +716,9 @@ long kvm_arch_vcpu_async_ioctl(struct file *filp,
 
 	if (ioctl == KVM_INTERRUPT) {
 		struct kvm_interrupt irq;
+		/* We do not support user space emulated IRQCHIP for TVMs yet */
+		if (is_cove_vcpu(vcpu))
+			return -ENXIO;
 
 		if (copy_from_user(&irq, argp, sizeof(irq)))
 			return -EFAULT;
-- 
2.25.1


