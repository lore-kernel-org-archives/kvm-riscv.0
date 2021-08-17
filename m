From: Yifei Jiang <jiangyifei@huawei.com>
Date: Tue, 17 Aug 2021 11:24:46 +0800
Subject: [PATCH RFC v6 11/12] target/riscv: Implement virtual time adjusting
 with vm state changing
In-Reply-To: <20210817032447.2055-1-jiangyifei@huawei.com>
References: <20210817032447.2055-1-jiangyifei@huawei.com>
Message-ID: <20210817032447.2055-12-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We hope that virtual time adjusts with vm state changing. When a vm
is stopped, guest virtual time should stop counting and kvm_timer
should be stopped. When the vm is resumed, guest virtual time should
continue to count and kvm_timer should be restored.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
---
 target/riscv/kvm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index d1ab4b1247..60c61ba924 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -40,6 +40,7 @@
 #include "kvm_riscv.h"
 #include "sbi_ecall_interface.h"
 #include "chardev/char-fe.h"
+#include "sysemu/runstate.h"
 
 static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx)
 {
@@ -447,6 +448,17 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
+static void kvm_riscv_vm_state_change(void *opaque, bool running, RunState state)
+{
+    CPUState *cs = opaque;
+
+    if (running) {
+        kvm_riscv_put_regs_timer(cs);
+    } else {
+        kvm_riscv_get_regs_timer(cs);
+    }
+}
+
 void kvm_arch_init_irq_routing(KVMState *s)
 {
 }
@@ -459,6 +471,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     uint64_t id;
 
+    qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
+
     id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
     ret = kvm_get_one_reg(cs, id, &isa);
     if (ret) {
-- 
2.19.1


