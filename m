From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:46:59 +0800
Subject: [PATCH RFC v4 11/15] target/riscv: Implement virtual time adjusting
 with vm state changing
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
Message-ID: <20201203124703.168-12-jiangyifei@huawei.com>
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
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/kvm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 79228eb726..1e16d24544 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -40,6 +40,7 @@
 #include "kvm_riscv.h"
 #include "sbi_ecall_interface.h"
 #include "chardev/char-fe.h"
+#include "sysemu/runstate.h"
 
 static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
 {
@@ -448,6 +449,17 @@ unsigned long kvm_arch_vcpu_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
+static void kvm_riscv_vm_state_change(void *opaque, int running, RunState state)
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
@@ -460,6 +472,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     __u64 id;
 
+    qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
+
     id = kvm_riscv_reg_id(KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
     ret = kvm_get_one_reg(cs, id, &isa);
     if (ret) {
-- 
2.19.1


