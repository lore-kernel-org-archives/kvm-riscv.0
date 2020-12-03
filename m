From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:47:02 +0800
Subject: [PATCH RFC v4 14/15] target/riscv: Synchronize vcpu's frequency with
 KVM
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
Message-ID: <20201203124703.168-15-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If vcpu's frequency is specified by cpu option 'frequency', it
will be set into KVM by KVM_SET_ONE_REG ioctl. Otherwise, vcpu's
frequency will follow KVM by KVM_GET_ONE_REG ioctl.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/kvm.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 1e16d24544..3499efd4eb 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -409,6 +409,8 @@ int kvm_arch_get_registers(CPUState *cs)
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
     int ret = 0;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
 
     ret = kvm_riscv_put_regs_core(cs);
     if (ret) {
@@ -425,6 +427,10 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         return ret;
     }
 
+    if (env->frequency) {
+        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(frequency), &env->frequency);
+    }
+
     return ret;
 }
 
@@ -481,6 +487,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
     }
     env->misa = isa;
 
+    /*
+     * Synchronize vcpu's frequency with KVM. If vcpu's frequency is specified
+     * by cpu option 'frequency', this will be set to KVM. Otherwise, vcpu's
+     * frequency will follow KVM.
+     */
+    if (env->user_frequency) {
+        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(frequency), &env->frequency);
+    } else {
+        ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(frequency), &env->frequency);
+    }
+
     return ret;
 }
 
-- 
2.19.1


