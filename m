From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 10 Feb 2023 13:51:36 +0000
Subject: [PATCH 1/1] riscv/kvm: Fix VM hang in case of timer delta being zero.
Message-ID: <20230210135136.1115213-1-rkanwal@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In case when VCPU is blocked due to WFI, we schedule the timer
from `kvm_riscv_vcpu_timer_blocking()` to keep timer interrupt
ticking.

But in case when delta_ns comes to be zero, we never schedule
the timer and VCPU keeps sleeping indefinitely until any activity
is done with VM console.

This is easily reproduce-able using kvmtool.
./lkvm-static run -c1 --console virtio -p "earlycon root=/dev/vda" \
         -k ./Image -d rootfs.ext4

Also, just add a print in kvm_riscv_vcpu_vstimer_expired() to
check the interrupt delivery and run `top` or similar auto-upating
cmd from guest. Within sometime one can notice that print from
timer expiry routine stops and the `top` cmd output will stop
updating.

This change fixes this by making sure we schedule the timer even
with delta_ns being zero to bring the VCPU out of sleep immediately.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/kvm/vcpu_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ad34519c8a13..3ac2ff6a65da 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -147,10 +147,8 @@ static void kvm_riscv_vcpu_timer_blocking(struct kvm_vcpu *vcpu)
 		return;
 
 	delta_ns = kvm_riscv_delta_cycles2ns(t->next_cycles, gt, t);
-	if (delta_ns) {
-		hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
-		t->next_set = true;
-	}
+	hrtimer_start(&t->hrt, ktime_set(0, delta_ns), HRTIMER_MODE_REL);
+	t->next_set = true;
 }
 
 static void kvm_riscv_vcpu_timer_unblocking(struct kvm_vcpu *vcpu)
-- 
2.25.1


