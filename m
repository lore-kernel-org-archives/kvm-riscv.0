From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:46:58 +0800
Subject: [PATCH RFC v4 10/15] target/riscv: Add kvm_riscv_get/put_regs_timer
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
Message-ID: <20201203124703.168-11-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add kvm_riscv_get/put_regs_timer to synchronize virtual time context
from KVM.

To set register of RISCV_TIMER_REG(state) will occur a error from KVM
on kvm_timer_state == 0. It's better to adapt in KVM, but it doesn't matter
that adaping in QEMU.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu.h |  6 ++++
 target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 4288898019..16d6050ead 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -237,6 +237,12 @@ struct CPURISCVState {
 
     hwaddr kernel_addr;
     hwaddr fdt_addr;
+
+    /* kvm timer */
+    bool kvm_timer_dirty;
+    uint64_t kvm_timer_time;
+    uint64_t kvm_timer_compare;
+    uint64_t kvm_timer_state;
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index afd99b3315..79228eb726 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -59,6 +59,9 @@ static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
 #define RISCV_CSR_REG(name)  kvm_riscv_reg_id(KVM_REG_RISCV_CSR, \
                  KVM_REG_RISCV_CSR_REG(name))
 
+#define RISCV_TIMER_REG(name)  kvm_riscv_reg_id(KVM_REG_RISCV_TIMER, \
+                 KVM_REG_RISCV_TIMER_REG(name))
+
 #define RISCV_FP_F_REG(idx)  kvm_riscv_reg_id(KVM_REG_RISCV_FP_F, idx)
 
 #define RISCV_FP_D_REG(idx)  kvm_riscv_reg_id(KVM_REG_RISCV_FP_D, idx)
@@ -306,6 +309,75 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
     return ret;
 }
 
+static void kvm_riscv_get_regs_timer(CPUState *cs)
+{
+    int ret;
+    uint64_t reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (env->kvm_timer_dirty) {
+        return;
+    }
+
+    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(time), &reg);
+    if (ret) {
+        abort();
+    }
+    env->kvm_timer_time = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(compare), &reg);
+    if (ret) {
+        abort();
+    }
+    env->kvm_timer_compare = reg;
+
+    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(state), &reg);
+    if (ret) {
+        abort();
+    }
+    env->kvm_timer_state = reg;
+
+    env->kvm_timer_dirty = true;
+}
+
+static void kvm_riscv_put_regs_timer(CPUState *cs)
+{
+    int ret;
+    uint64_t reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (!env->kvm_timer_dirty) {
+        return;
+    }
+
+    reg = env->kvm_timer_time;
+    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(time), &reg);
+    if (ret) {
+        abort();
+    }
+
+    reg = env->kvm_timer_compare;
+    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(compare), &reg);
+    if (ret) {
+        abort();
+    }
+
+    /*
+     * To set register of RISCV_TIMER_REG(state) will occur a error from KVM
+     * on env->kvm_timer_state == 0, It's better to adapt in KVM, but it
+     * doesn't matter that adaping in QEMU now.
+     * TODO If KVM changes, adapt here.
+     */
+    if (env->kvm_timer_state) {
+        reg = env->kvm_timer_state;
+        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(state), &reg);
+        if (ret) {
+            abort();
+        }
+    }
+
+    env->kvm_timer_dirty = false;
+}
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
-- 
2.19.1


