From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 27 Aug 2020 17:21:36 +0800
Subject: [PATCH RFC v3 13/14] target/riscv: Implement virtual time adjusting
 with vm state changing
In-Reply-To: <20200827092137.479-1-jiangyifei@huawei.com>
References: <20200827092137.479-1-jiangyifei@huawei.com>
Message-ID: <20200827092137.479-14-jiangyifei@huawei.com>
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
index 59c537b1cb..943d733539 100644
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
@@ -459,6 +471,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
     RISCVCPU *cpu = RISCV_CPU(cs);
     __u64 id;
 
+    qemu_add_vm_change_state_handler(kvm_riscv_vm_state_change, cs);
+
     id = kvm_riscv_reg_id(KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
     ret = kvm_get_one_reg(cs, id, &isa);
     if (ret) {
-- 
2.19.1



