From: Yifei Jiang <jiangyifei@huawei.com>
Date: Tue, 17 Aug 2021 11:24:38 +0800
Subject: [PATCH RFC v6 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
In-Reply-To: <20210817032447.2055-1-jiangyifei@huawei.com>
References: <20210817032447.2055-1-jiangyifei@huawei.com>
Message-ID: <20210817032447.2055-4-jiangyifei@huawei.com>
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
 target/riscv/kvm.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 687dd4b621..dd3bbd7ceb 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -38,6 +38,18 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 
+static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
+{
+    uint64_t id = KVM_REG_RISCV | type | idx;
+
+    if (riscv_cpu_is_32bit(env)) {
+        id |= KVM_REG_SIZE_U32;
+    } else {
+        id |= KVM_REG_SIZE_U64;
+    }
+    return id;
+}
+
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_LAST_INFO
 };
@@ -79,7 +91,20 @@ void kvm_arch_init_irq_routing(KVMState *s)
 
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
+    env->misa |= isa;
+
+    return ret;
 }
 
 int kvm_arch_msi_data_to_gsi(uint32_t data)
-- 
2.19.1


