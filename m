From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:46:53 +0800
Subject: [PATCH RFC v4 05/15] target/riscv: Implement kvm_arch_put_registers
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
Message-ID: <20201203124703.168-6-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/kvm.c | 142 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index e679619e79..8b206ce99c 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -85,6 +85,31 @@ static int kvm_riscv_get_regs_core(CPUState *cs)
     return ret;
 }
 
+static int kvm_riscv_put_regs_core(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    target_ulong reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    reg = env->pc;
+    ret = kvm_set_one_reg(cs, RISCV_CORE_REG(regs.pc), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    for (i = 1; i < 32; i++) {
+        __u64 id = kvm_riscv_reg_id(KVM_REG_RISCV_CORE, i);
+        reg = env->gpr[i];
+        ret = kvm_set_one_reg(cs, id, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return ret;
+}
+
 static int kvm_riscv_get_regs_csr(CPUState *cs)
 {
     int ret = 0;
@@ -148,6 +173,70 @@ static int kvm_riscv_get_regs_csr(CPUState *cs)
     return ret;
 }
 
+static int kvm_riscv_put_regs_csr(CPUState *cs)
+{
+    int ret = 0;
+    target_ulong reg;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    reg = env->mstatus;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sstatus), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->mie;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sie), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->stvec;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(stvec), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->sscratch;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sscratch), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->sepc;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sepc), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->scause;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(scause), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->sbadaddr;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(stval), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->mip;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(sip), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg = env->satp;
+    ret = kvm_set_one_reg(cs, RISCV_CSR_REG(satp), &reg);
+    if (ret) {
+        return ret;
+    }
+
+    return ret;
+}
+
+
 static int kvm_riscv_get_regs_fp(CPUState *cs)
 {
     int ret = 0;
@@ -181,6 +270,40 @@ static int kvm_riscv_get_regs_fp(CPUState *cs)
     return ret;
 }
 
+static int kvm_riscv_put_regs_fp(CPUState *cs)
+{
+    int ret = 0;
+    int i;
+    CPURISCVState *env = &RISCV_CPU(cs)->env;
+
+    if (riscv_has_ext(env, RVD)) {
+        uint64_t reg;
+        for (i = 0; i < 32; i++) {
+            reg = env->fpr[i];
+            ret = kvm_set_one_reg(cs, RISCV_FP_D_REG(i), &reg);
+            if (ret) {
+                return ret;
+            }
+        }
+        return ret;
+    }
+
+    if (riscv_has_ext(env, RVF)) {
+        uint32_t reg;
+        for (i = 0; i < 32; i++) {
+            reg = env->fpr[i];
+            ret = kvm_set_one_reg(cs, RISCV_FP_F_REG(i), &reg);
+            if (ret) {
+                return ret;
+            }
+        }
+        return ret;
+    }
+
+    return ret;
+}
+
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
@@ -209,7 +332,24 @@ int kvm_arch_get_registers(CPUState *cs)
 
 int kvm_arch_put_registers(CPUState *cs, int level)
 {
-    return 0;
+    int ret = 0;
+
+    ret = kvm_riscv_put_regs_core(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_riscv_put_regs_csr(cs);
+    if (ret) {
+        return ret;
+    }
+
+    ret = kvm_riscv_put_regs_fp(cs);
+    if (ret) {
+        return ret;
+    }
+
+    return ret;
 }
 
 int kvm_arch_release_virq_post(int virq)
-- 
2.19.1


