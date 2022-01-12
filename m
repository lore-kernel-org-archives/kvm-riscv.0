From: Yifei Jiang <jiangyifei@huawei.com>
Date: Wed, 12 Jan 2022 16:13:23 +0800
Subject: [PATCH v5 07/13] target/riscv: Support setting external interrupt by
 KVM
In-Reply-To: <20220112081329.1835-1-jiangyifei@huawei.com>
References: <20220112081329.1835-1-jiangyifei@huawei.com>
Message-ID: <20220112081329.1835-8-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When KVM is enabled, set the S-mode external interrupt through
kvm_riscv_set_irq function.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
---
 target/riscv/cpu.c       |  6 +++++-
 target/riscv/kvm-stub.c  |  5 +++++
 target/riscv/kvm.c       | 17 +++++++++++++++++
 target/riscv/kvm_riscv.h |  1 +
 4 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index a6922dde05..53b0524830 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -630,7 +630,11 @@ static void riscv_cpu_set_irq(void *opaque, int irq, int level)
     case IRQ_S_EXT:
     case IRQ_VS_EXT:
     case IRQ_M_EXT:
-        riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        if (kvm_enabled()) {
+            kvm_riscv_set_irq(cpu, irq, level);
+        } else {
+            riscv_cpu_update_mip(cpu, 1 << irq, BOOL_TO_MASK(level));
+        }
         break;
     default:
         g_assert_not_reached();
diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm-stub.c
index 39b96fe3f4..4e8fc31a21 100644
--- a/target/riscv/kvm-stub.c
+++ b/target/riscv/kvm-stub.c
@@ -23,3 +23,8 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
 {
     abort();
 }
+
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    abort();
+}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index d5c6a9d41a..0ba64795d5 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -385,6 +385,23 @@ void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
     env->satp = 0;
 }
 
+void kvm_riscv_set_irq(RISCVCPU *cpu, int irq, int level)
+{
+    int ret;
+    unsigned virq = level ? KVM_INTERRUPT_SET : KVM_INTERRUPT_UNSET;
+
+    if (irq != IRQ_S_EXT) {
+        perror("kvm riscv set irq != IRQ_S_EXT\n");
+        abort();
+    }
+
+    ret = kvm_vcpu_ioctl(CPU(cpu), KVM_INTERRUPT, &virq);
+    if (ret < 0) {
+        perror("Set irq failed");
+        abort();
+    }
+}
+
 bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
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


