From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:18:37 +0800
Subject: [PATCH RFC 1/3] RISC-V: KVM: Change the method of calculating cycles
 to nanoseconds
In-Reply-To: <20201203121839.308-1-jiangyifei@huawei.com>
References: <20201203121839.308-1-jiangyifei@huawei.com>
Message-ID: <20201203121839.308-2-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Because we will introduce the dynamic guest frequency later, we
can't use the fixed mult and shift to calculate nanoseconds.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 arch/riscv/include/asm/kvm_vcpu_timer.h | 3 ---
 arch/riscv/kvm/vcpu_timer.c             | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 375281eb49e0..87e00d878999 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -12,9 +12,6 @@
 #include <linux/hrtimer.h>
 
 struct kvm_guest_timer {
-	/* Mult & Shift values to get nanoseconds from cycles */
-	u32 nsec_mult;
-	u32 nsec_shift;
 	/* Time delta value */
 	u64 time_delta;
 };
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ddd0ce727b83..f6b35180199a 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -33,7 +33,7 @@ static u64 kvm_riscv_delta_cycles2ns(u64 cycles,
 		cycles_delta = cycles - cycles_now;
 	else
 		cycles_delta = 0;
-	delta_ns = (cycles_delta * gt->nsec_mult) >> gt->nsec_shift;
+	delta_ns = mul_u64_u64_div_u64(cycles_delta, NSEC_PER_SEC, riscv_timebase);
 	local_irq_restore(flags);
 
 	return delta_ns;
@@ -218,7 +218,6 @@ int kvm_riscv_guest_timer_init(struct kvm *kvm)
 {
 	struct kvm_guest_timer *gt = &kvm->arch.timer;
 
-	riscv_cs_get_mult_shift(&gt->nsec_mult, &gt->nsec_shift);
 	gt->time_delta = -get_cycles64();
 
 	return 0;
-- 
2.19.1


