From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 29 Jul 2024 00:50:21 +0800
Subject: [kvm-unit-tests PATCH v5 4/5] riscv: Add some delay and timer routines
In-Reply-To: <20240728165022.30075-1-jamestiotio@gmail.com>
References: <20240728165022.30075-1-jamestiotio@gmail.com>
Message-ID: <20240728165022.30075-5-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a delay method that would allow tests to wait for some specified
number of cycles. Also add a conversion helper method between
microseconds and cycles. This conversion is done by using the timebase
frequency, which is obtained during setup via the device tree.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 riscv/Makefile        |  2 ++
 lib/riscv/asm/csr.h   |  1 +
 lib/riscv/asm/delay.h | 16 ++++++++++++++++
 lib/riscv/asm/setup.h |  1 +
 lib/riscv/asm/timer.h | 14 ++++++++++++++
 lib/riscv/delay.c     | 21 +++++++++++++++++++++
 lib/riscv/setup.c     |  4 ++++
 lib/riscv/timer.c     | 28 ++++++++++++++++++++++++++++
 8 files changed, 87 insertions(+)
 create mode 100644 lib/riscv/asm/delay.h
 create mode 100644 lib/riscv/asm/timer.h
 create mode 100644 lib/riscv/delay.c
 create mode 100644 lib/riscv/timer.c

diff --git a/riscv/Makefile b/riscv/Makefile
index 919a3ebb..b0cd613f 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -30,6 +30,7 @@ cflatobjs += lib/memregions.o
 cflatobjs += lib/on-cpus.o
 cflatobjs += lib/vmalloc.o
 cflatobjs += lib/riscv/bitops.o
+cflatobjs += lib/riscv/delay.o
 cflatobjs += lib/riscv/io.o
 cflatobjs += lib/riscv/isa.o
 cflatobjs += lib/riscv/mmu.o
@@ -38,6 +39,7 @@ cflatobjs += lib/riscv/sbi.o
 cflatobjs += lib/riscv/setup.o
 cflatobjs += lib/riscv/smp.o
 cflatobjs += lib/riscv/stack.o
+cflatobjs += lib/riscv/timer.o
 ifeq ($(ARCH),riscv32)
 cflatobjs += lib/ldiv32.o
 endif
diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
index ba810c9f..a9b1bd42 100644
--- a/lib/riscv/asm/csr.h
+++ b/lib/riscv/asm/csr.h
@@ -10,6 +10,7 @@
 #define CSR_SCAUSE		0x142
 #define CSR_STVAL		0x143
 #define CSR_SATP		0x180
+#define CSR_TIME		0xc01
 
 #define SR_SIE			_AC(0x00000002, UL)
 
diff --git a/lib/riscv/asm/delay.h b/lib/riscv/asm/delay.h
new file mode 100644
index 00000000..31379eac
--- /dev/null
+++ b/lib/riscv/asm/delay.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMRISCV_DELAY_H_
+#define _ASMRISCV_DELAY_H_
+
+#include <libcflat.h>
+#include <asm/setup.h>
+
+extern void delay(uint64_t cycles);
+extern void udelay(unsigned long usecs);
+
+static inline uint64_t usec_to_cycles(uint64_t usec)
+{
+	return (timebase_frequency * usec) / 1000000;
+}
+
+#endif /* _ASMRISCV_DELAY_H_ */
diff --git a/lib/riscv/asm/setup.h b/lib/riscv/asm/setup.h
index 7f81a705..a13159bf 100644
--- a/lib/riscv/asm/setup.h
+++ b/lib/riscv/asm/setup.h
@@ -7,6 +7,7 @@
 #define NR_CPUS 16
 extern struct thread_info cpus[NR_CPUS];
 extern int nr_cpus;
+extern uint64_t timebase_frequency;
 int hartid_to_cpu(unsigned long hartid);
 
 void io_init(void);
diff --git a/lib/riscv/asm/timer.h b/lib/riscv/asm/timer.h
new file mode 100644
index 00000000..f7504f84
--- /dev/null
+++ b/lib/riscv/asm/timer.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMRISCV_TIMER_H_
+#define _ASMRISCV_TIMER_H_
+
+#include <asm/csr.h>
+
+extern void timer_get_frequency(void);
+
+static inline uint64_t timer_get_cycles(void)
+{
+	return csr_read(CSR_TIME);
+}
+
+#endif /* _ASMRISCV_TIMER_H_ */
diff --git a/lib/riscv/delay.c b/lib/riscv/delay.c
new file mode 100644
index 00000000..d4f76c29
--- /dev/null
+++ b/lib/riscv/delay.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024, James Raphael Tiovalen <jamestiotio@gmail.com>
+ */
+#include <libcflat.h>
+#include <asm/barrier.h>
+#include <asm/delay.h>
+#include <asm/timer.h>
+
+void delay(uint64_t cycles)
+{
+	uint64_t start = timer_get_cycles();
+
+	while ((timer_get_cycles() - start) < cycles)
+		cpu_relax();
+}
+
+void udelay(unsigned long usecs)
+{
+	delay(usec_to_cycles((uint64_t)usecs));
+}
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index 50ffb0d0..e0b5f6f7 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -20,6 +20,7 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/setup.h>
+#include <asm/timer.h>
 
 #define VA_BASE			((phys_addr_t)3 * SZ_1G)
 #if __riscv_xlen == 64
@@ -38,6 +39,7 @@ u32 initrd_size;
 
 struct thread_info cpus[NR_CPUS];
 int nr_cpus;
+uint64_t timebase_frequency;
 
 static struct mem_region riscv_mem_regions[NR_MEM_REGIONS + 1];
 
@@ -199,6 +201,7 @@ void setup(const void *fdt, phys_addr_t freemem_start)
 
 	mem_init(PAGE_ALIGN(__pa(freemem)));
 	cpu_init();
+	timer_get_frequency();
 	thread_info_init();
 	io_init();
 
@@ -264,6 +267,7 @@ efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo)
 	}
 
 	cpu_init();
+	timer_get_frequency();
 	thread_info_init();
 	io_init();
 	initrd_setup();
diff --git a/lib/riscv/timer.c b/lib/riscv/timer.c
new file mode 100644
index 00000000..d78d254c
--- /dev/null
+++ b/lib/riscv/timer.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024, James Raphael Tiovalen <jamestiotio@gmail.com>
+ */
+#include <libcflat.h>
+#include <devicetree.h>
+#include <asm/setup.h>
+#include <asm/timer.h>
+
+void timer_get_frequency(void)
+{
+	const struct fdt_property *prop;
+	u32 *data;
+	int cpus, len;
+
+	assert_msg(dt_available(), "ACPI not yet supported");
+
+	const void *fdt = dt_fdt();
+
+	cpus = fdt_path_offset(fdt, "/cpus");
+	assert(cpus >= 0);
+
+	prop = fdt_get_property(fdt, cpus, "timebase-frequency", &len);
+	assert(prop != NULL && len == 4);
+
+	data = (u32 *)prop->data;
+	timebase_frequency = fdt32_to_cpu(*data);
+}
-- 
2.43.0


