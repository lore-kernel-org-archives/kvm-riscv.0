From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:31 -0700
Subject: [RFC 03/48] RISC-V: KVM: Invoke aia_update with preempt disabled/irq enabled
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-4-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Some of the aia_update operations required to invoke IPIs that
needs interrupts to be enabled. Currently, entire aia_update
is being called from irqs disabled context while only preemption
disable is necessary.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e65852d..c53bf98 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -1247,15 +1247,16 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		kvm_riscv_check_vcpu_requests(vcpu);
 
-		local_irq_disable();
-
 		/* Update AIA HW state before entering guest */
+		preempt_disable();
 		ret = kvm_riscv_vcpu_aia_update(vcpu);
 		if (ret <= 0) {
-			local_irq_enable();
+			preempt_enable();
 			continue;
 		}
+		preempt_enable();
 
+		local_irq_disable();
 		/*
 		 * Ensure we set mode to IN_GUEST_MODE after we disable
 		 * interrupts and before the final VCPU requests check.
-- 
2.25.1


