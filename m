From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 27 Aug 2020 17:21:30 +0800
Subject: [PATCH RFC v3 07/14] hw/riscv: PLIC update external interrupt by KVM
 when kvm enabled
In-Reply-To: <20200827092137.479-1-jiangyifei@huawei.com>
References: <20200827092137.479-1-jiangyifei@huawei.com>
Message-ID: <20200827092137.479-8-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Only support supervisor external interrupt currently.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 hw/riscv/sifive_plic.c   | 31 ++++++++++++++++++++++---------
 target/riscv/kvm.c       | 19 +++++++++++++++++++
 target/riscv/kvm_riscv.h |  1 +
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index c20c192034..9c5a131e0f 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -30,6 +30,8 @@
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
 #include "hw/riscv/sifive_plic.h"
+#include "sysemu/kvm.h"
+#include "kvm_riscv.h"
 
 #define RISCV_DEBUG_PLIC 0
 
@@ -146,15 +148,26 @@ static void sifive_plic_update(SiFivePLICState *plic)
             continue;
         }
         int level = sifive_plic_irqs_pending(plic, addrid);
-        switch (mode) {
-        case PLICMode_M:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_MEIP, BOOL_TO_MASK(level));
-            break;
-        case PLICMode_S:
-            riscv_cpu_update_mip(RISCV_CPU(cpu), MIP_SEIP, BOOL_TO_MASK(level));
-            break;
-        default:
-            break;
+        if (kvm_enabled()) {
+            if (mode == PLICMode_M) {
+                continue;
+            }
+#ifdef CONFIG_KVM
+            kvm_riscv_set_irq(RISCV_CPU(cpu), IRQ_S_EXT, level);
+#endif
+        } else {
+            switch (mode) {
+            case PLICMode_M:
+                riscv_cpu_update_mip(RISCV_CPU(cpu),
+                                     MIP_MEIP, BOOL_TO_MASK(level));
+                break;
+            case PLICMode_S:
+                riscv_cpu_update_mip(RISCV_CPU(cpu),
+                                     MIP_SEIP, BOOL_TO_MASK(level));
+                break;
+            default:
+                break;
+            }
         }
     }
 
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 69217add16..d510d23da1 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -452,3 +452,22 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
 }
 
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    int ret;
+    unsigned virq = level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
+
+    if (irq != IRQ_S_EXT) {
+        return;
+    }
+
+    if (!kvm_enabled()) {
+        return;
+    }
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
+    if (ret < 0) {
+        perror("Set irq failed");
+        abort();
+    }
+}
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
index f38c82bf59..ed281bdce0 100644
--- a/target/riscv/kvm_riscv.h
+++ b/target/riscv/kvm_riscv.h
@@ -20,5 +20,6 @@
 #define QEMU_KVM_RISCV_H
 
 void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level);
 
 #endif
-- 
2.19.1



