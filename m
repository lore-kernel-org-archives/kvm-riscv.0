From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 10 Jul 2022 20:41:05 +0530
Subject: [PATCH] RISC-V: KVM: Fix SRCU deadlock caused by kvm_riscv_check_vcpu_requests()
Message-ID: <20220710151105.687193-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The kvm_riscv_check_vcpu_requests() is called with SRCU read lock held
and for KVM_REQ_SLEEP request it will block the VCPU without releasing
SRCU read lock. This causes KVM ioctls (such as KVM_IOEVENTFD) from
other VCPUs of the same Guest/VM to hang/deadlock if there is any
synchronize_srcu() or synchronize_srcu_expedited() in the path.

To fix the above in kvm_riscv_check_vcpu_requests(), we should do SRCU
read unlock before blocking the VCPU and do SRCU read lock after VCPU
wakeup.

Fixes: cce69aff689e ("RISC-V: KVM: Implement VCPU interrupts and
requests handling")
Reported-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b7a433c54d0f..5d271b597613 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -845,9 +845,11 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 
 	if (kvm_request_pending(vcpu)) {
 		if (kvm_check_request(KVM_REQ_SLEEP, vcpu)) {
+			kvm_vcpu_srcu_read_unlock(vcpu);
 			rcuwait_wait_event(wait,
 				(!vcpu->arch.power_off) && (!vcpu->arch.pause),
 				TASK_INTERRUPTIBLE);
+			kvm_vcpu_srcu_read_lock(vcpu);
 
 			if (vcpu->arch.power_off || vcpu->arch.pause) {
 				/*
-- 
2.34.1


