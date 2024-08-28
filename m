From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Aug 2024 18:22:02 +0200
Subject: [kvm-unit-tests PATCH 1/3] riscv: Introduce local_timer_init
In-Reply-To: <20240828162200.1384696-5-andrew.jones@linux.dev>
References: <20240828162200.1384696-5-andrew.jones@linux.dev>
Message-ID: <20240828162200.1384696-6-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When Sstc is available make sure that even if we enable timer
interrupts nothing will happen. This is necessary for cases where
the unit tests actually intend to use the SBI TIME extension and
aren't thinking about Sstc at all, like the SBI TIME test in
riscv/sbi where we can now remove the initialization.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/timer.h |  1 +
 lib/riscv/setup.c     |  2 ++
 lib/riscv/smp.c       |  2 ++
 lib/riscv/timer.c     | 13 +++++++++++++
 riscv/sbi.c           |  5 -----
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/lib/riscv/asm/timer.h b/lib/riscv/asm/timer.h
index b3514d3f6a78..fd12251a3a6b 100644
--- a/lib/riscv/asm/timer.h
+++ b/lib/riscv/asm/timer.h
@@ -5,6 +5,7 @@
 #include <asm/csr.h>
 
 extern void timer_get_frequency(void);
+extern void local_timer_init(void);
 
 static inline uint64_t timer_get_cycles(void)
 {
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index 9a16f00093d7..7c4321b1c30f 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -210,6 +210,7 @@ void setup(const void *fdt, phys_addr_t freemem_start)
 	cpu_init();
 	timer_get_frequency();
 	thread_info_init();
+	local_timer_init();
 	io_init();
 
 	ret = dt_get_bootargs(&bootargs);
@@ -276,6 +277,7 @@ efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo)
 	cpu_init();
 	timer_get_frequency();
 	thread_info_init();
+	local_timer_init();
 	io_init();
 	initrd_setup();
 
diff --git a/lib/riscv/smp.c b/lib/riscv/smp.c
index 4d373e0a29a8..18d0393c0cc2 100644
--- a/lib/riscv/smp.c
+++ b/lib/riscv/smp.c
@@ -14,6 +14,7 @@
 #include <asm/processor.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
+#include <asm/timer.h>
 
 cpumask_t cpu_present_mask;
 cpumask_t cpu_online_mask;
@@ -27,6 +28,7 @@ secondary_func_t secondary_cinit(struct secondary_data *data)
 
 	__mmu_enable(data->satp);
 	thread_info_init();
+	local_timer_init();
 	info = current_thread_info();
 	set_cpu_online(info->cpu, true);
 	smp_send_event();
diff --git a/lib/riscv/timer.c b/lib/riscv/timer.c
index d78d254c8eca..92826d6ec3fe 100644
--- a/lib/riscv/timer.c
+++ b/lib/riscv/timer.c
@@ -4,7 +4,11 @@
  */
 #include <libcflat.h>
 #include <devicetree.h>
+#include <limits.h>
+#include <asm/csr.h>
+#include <asm/isa.h>
 #include <asm/setup.h>
+#include <asm/smp.h>
 #include <asm/timer.h>
 
 void timer_get_frequency(void)
@@ -26,3 +30,12 @@ void timer_get_frequency(void)
 	data = (u32 *)prop->data;
 	timebase_frequency = fdt32_to_cpu(*data);
 }
+
+void local_timer_init(void)
+{
+	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
+		csr_write(CSR_STIMECMP, ULONG_MAX);
+		if (__riscv_xlen == 32)
+			csr_write(CSR_STIMECMPH, ULONG_MAX);
+	}
+}
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 01697aed3457..e8598fe721a6 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -258,11 +258,6 @@ static void check_time(void)
 
 	install_irq_handler(IRQ_S_TIMER, timer_irq_handler);
 	local_irq_enable();
-	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
-		csr_write(CSR_STIMECMP, ULONG_MAX);
-		if (__riscv_xlen == 32)
-			csr_write(CSR_STIMECMPH, ULONG_MAX);
-	}
 	timer_irq_enable();
 
 	timer_check_set_timer(false);
-- 
2.45.2


