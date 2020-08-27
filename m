From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 27 Aug 2020 17:21:29 +0800
Subject: [PATCH RFC v3 06/14] target/riscv: Support start kernel directly by
 KVM
In-Reply-To: <20200827092137.479-1-jiangyifei@huawei.com>
References: <20200827092137.479-1-jiangyifei@huawei.com>
Message-ID: <20200827092137.479-7-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Get kernel and fdt start address in virt.c, and pass them to KVM
when cpu reset. In addition, add kvm_riscv.h to place riscv specific
interface.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 hw/riscv/virt.c          |  8 ++++++++
 target/riscv/cpu.c       |  4 ++++
 target/riscv/cpu.h       |  3 +++
 target/riscv/kvm.c       | 14 ++++++++++++++
 target/riscv/kvm_riscv.h | 24 ++++++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 target/riscv/kvm_riscv.h

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 6e91cf129e..e3336522bf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -41,6 +41,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
+#include "sysemu/kvm.h"
 
 #if defined(TARGET_RISCV32)
 # define BIOS_FILENAME "opensbi-riscv32-generic-fw_dynamic.bin"
@@ -482,6 +483,7 @@ static void virt_machine_init(MachineState *machine)
     uint64_t kernel_entry;
     int i;
     unsigned int smp_cpus = machine->smp.cpus;
+    CPUState *cs;
 
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
@@ -547,6 +549,12 @@ static void virt_machine_init(MachineState *machine)
                               virt_memmap[VIRT_MROM].size, kernel_entry,
                               fdt_load_addr, s->fdt);
 
+    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
+        RISCVCPU *riscv_cpu = RISCV_CPU(cs);
+        riscv_cpu->env.kernel_addr = kernel_entry;
+        riscv_cpu->env.fdt_addr = fdt_load_addr;
+    }
+
     /* create PLIC hart topology configuration string */
     plic_hart_config_len = (strlen(VIRT_PLIC_HART_CONFIG) + 1) * smp_cpus;
     plic_hart_config = g_malloc0(plic_hart_config_len);
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 228b9bdb5d..266e70cc47 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -28,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "fpu/softfloat-helpers.h"
+#include "kvm_riscv.h"
 
 /* RISC-V CPU definitions */
 
@@ -321,6 +322,9 @@ static void riscv_cpu_reset(DeviceState *dev)
     cs->exception_index = EXCP_NONE;
     env->load_res = -1;
     set_default_nan_mode(1, &env->fp_status);
+#ifdef CONFIG_KVM
+    kvm_riscv_reset_vcpu(cpu);
+#endif
 }
 
 static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a804a5d0ba..d4cafe37e1 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -229,6 +229,9 @@ struct CPURISCVState {
 
     /* Fields from here on are preserved across CPU reset. */
     QEMUTimer *timer; /* Internal timer */
+
+    hwaddr kernel_addr;
+    hwaddr fdt_addr;
 };
 
 #define RISCV_CPU_CLASS(klass) \
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 7afb4263e9..69217add16 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -37,6 +37,7 @@
 #include "hw/irq.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
+#include "kvm_riscv.h"
 
 static __u64 kvm_riscv_reg_id(__u64 type, __u64 idx)
 {
@@ -438,3 +439,16 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
     return 0;
 }
+
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu)
+{
+    CPURISCVState *env = &cpu->env;
+
+    if (!kvm_enabled()) {
+        return;
+    }
+    env->pc = cpu->env.kernel_addr;
+    env->gpr[10] = kvm_arch_vcpu_id(CPU(cpu)); /* a0 */
+    env->gpr[11] = cpu->env.fdt_addr;          /* a1 */
+}
+
diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm_riscv.h
new file mode 100644
index 0000000000..f38c82bf59
--- /dev/null
+++ b/target/riscv/kvm_riscv.h
@@ -0,0 +1,24 @@
+/*
+ * QEMU KVM support -- RISC-V specific functions.
+ *
+ * Copyright (c) 2020 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_KVM_RISCV_H
+#define QEMU_KVM_RISCV_H
+
+void kvm_riscv_reset_vcpu(RISCVCPU *cpu);
+
+#endif
-- 
2.19.1



