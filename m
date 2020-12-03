From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:47:01 +0800
Subject: [PATCH RFC v4 13/15] target/riscv: Introduce dynamic time frequency
 for virt machine
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
Message-ID: <20201203124703.168-14-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, time base frequency was fixed as SIFIVE_CLINT_TIMEBASE_FREQ.
Here introduce "time-frequency" property to set time base frequency dynamically
of which default value is still SIFIVE_CLINT_TIMEBASE_FREQ. The virt machine
uses frequency of the first cpu to create clint and fdt.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 hw/riscv/virt.c    | 18 ++++++++++++++----
 target/riscv/cpu.c |  3 +++
 target/riscv/cpu.h |  2 ++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 47b7018193..788a7237b6 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -178,7 +178,7 @@ static void create_pcie_irq_map(void *fdt, char *nodename,
 }
 
 static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
-    uint64_t mem_size, const char *cmdline)
+    uint64_t mem_size, const char *cmdline, uint64_t timebase_frequency)
 {
     void *fdt;
     int i, cpu, socket;
@@ -225,7 +225,7 @@ static void create_fdt(RISCVVirtState *s, const struct MemmapEntry *memmap,
 
     qemu_fdt_add_subnode(fdt, "/cpus");
     qemu_fdt_setprop_cell(fdt, "/cpus", "timebase-frequency",
-                          SIFIVE_CLINT_TIMEBASE_FREQ);
+                          timebase_frequency);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
@@ -510,6 +510,7 @@ static void virt_machine_init(MachineState *machine)
     target_ulong firmware_end_addr, kernel_start_addr;
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
+    uint64_t timebase_frequency = 0;
     DeviceState *mmio_plic, *virtio_plic, *pcie_plic;
     int i, j, base_hartid, hart_count;
     CPUState *cs;
@@ -553,12 +554,20 @@ static void virt_machine_init(MachineState *machine)
                                 hart_count, &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->soc[i]), &error_abort);
 
+        if (!timebase_frequency) {
+            timebase_frequency = RISCV_CPU(first_cpu)->env.frequency;
+        }
+        /* If vcpu's time frequency is not specified, we use default frequency */
+        if (!timebase_frequency) {
+            timebase_frequency = SIFIVE_CLINT_TIMEBASE_FREQ;
+        }
+
         /* Per-socket CLINT */
         sifive_clint_create(
             memmap[VIRT_CLINT].base + i * memmap[VIRT_CLINT].size,
             memmap[VIRT_CLINT].size, base_hartid, hart_count,
             SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE,
-            SIFIVE_CLINT_TIMEBASE_FREQ, true);
+            timebase_frequency, true);
 
         /* Per-socket PLIC hart topology configuration string */
         plic_hart_config_len =
@@ -610,7 +619,8 @@ static void virt_machine_init(MachineState *machine)
         main_mem);
 
     /* create device tree */
-    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline);
+    create_fdt(s, memmap, machine->ram_size, machine->kernel_cmdline,
+               timebase_frequency);
 
     /* boot rom */
     memory_region_init_rom(mask_rom, NULL, "riscv_virt_board.mrom",
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 439dc89ee7..66f35bcbbf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -494,6 +494,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
 
     riscv_cpu_register_gdb_regs_for_features(cs);
 
+    env->user_frequency = env->frequency;
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
@@ -531,6 +533,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVEC),
+    DEFINE_PROP_UINT64("time-frequency", RISCVCPU, env.frequency, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 16d6050ead..f5b6c34176 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -243,6 +243,8 @@ struct CPURISCVState {
     uint64_t kvm_timer_time;
     uint64_t kvm_timer_compare;
     uint64_t kvm_timer_state;
+    uint64_t user_frequency;
+    uint64_t frequency;
 };
 
 OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
-- 
2.19.1


