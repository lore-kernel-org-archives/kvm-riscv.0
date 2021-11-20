From: Yifei Jiang <jiangyifei@huawei.com>
Date: Sat, 20 Nov 2021 15:46:35 +0800
Subject: [PATCH v1 03/12] target/riscv: Implement function kvm_arch_init_vcpu
In-Reply-To: <20211120074644.729-1-jiangyifei@huawei.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
Message-ID: <20211120074644.729-4-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Get isa info from kvm while kvm init.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/kvm.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 687dd4b621..9f9692fb9e 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -38,6 +38,23 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 
+static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
+{
+    uint64_t id = KVM_REG_RISCV | type | idx;
+
+    switch (riscv_cpu_mxl(env)) {
+    case MXL_RV32:
+        id |= KVM_REG_SIZE_U32;
+        break;
+    case MXL_RV64:
+        id |= KVM_REG_SIZE_U64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return id;
+}
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
@@ -79,7 +96,20 @@ void kvm_arch_init_irq_routing(KVMState *s)
 
 int kvm_arch_init_vcpu(CPUState *cs)
 {
-    return 0;
+    int ret = 0;
+    target_ulong isa;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    uint64_t id;
+
+    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
+    ret = kvm_get_one_reg(cs, id, &isa);
+    if (ret) {
+        return ret;
+    }
+    env->misa_mxl |= isa;
+
+    return ret;
 }
 
 int kvm_arch_msi_data_to_gsi(uint32_t data)
-- 
2.19.1


