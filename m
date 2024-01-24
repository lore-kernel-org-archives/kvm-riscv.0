From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 24 Jan 2024 08:18:19 +0100
Subject: [kvm-unit-tests PATCH 03/24] arm/arm64: Move cpumask.h to common lib
In-Reply-To: <20240124071815.6898-26-andrew.jones@linux.dev>
References: <20240124071815.6898-26-andrew.jones@linux.dev>
Message-ID: <20240124071815.6898-29-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V will also make use of cpumask.h, so move it to the arch-common
directory.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/arm/asm/gic-v2.h        | 2 +-
 lib/arm/asm/gic-v3.h        | 2 +-
 lib/arm/asm/gic.h           | 2 +-
 lib/arm/asm/smp.h           | 2 +-
 lib/arm/mmu.c               | 2 +-
 lib/arm/smp.c               | 2 +-
 lib/arm64/asm/cpumask.h     | 1 -
 lib/{arm/asm => }/cpumask.h | 9 ++++-----
 8 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 lib/arm64/asm/cpumask.h
 rename lib/{arm/asm => }/cpumask.h (94%)

diff --git a/lib/arm/asm/gic-v2.h b/lib/arm/asm/gic-v2.h
index 1fcfd43c8075..ff11afb15d30 100644
--- a/lib/arm/asm/gic-v2.h
+++ b/lib/arm/asm/gic-v2.h
@@ -18,7 +18,7 @@
 #define GICC_IAR_INT_ID_MASK		0x3ff
 
 #ifndef __ASSEMBLY__
-#include <asm/cpumask.h>
+#include <cpumask.h>
 
 struct gicv2_data {
 	void *dist_base;
diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
index b4ce130e56c6..a1cc62a298b8 100644
--- a/lib/arm/asm/gic-v3.h
+++ b/lib/arm/asm/gic-v3.h
@@ -67,10 +67,10 @@
 #include <asm/arch_gicv3.h>
 
 #ifndef __ASSEMBLY__
+#include <cpumask.h>
 #include <asm/setup.h>
 #include <asm/processor.h>
 #include <asm/delay.h>
-#include <asm/cpumask.h>
 #include <asm/smp.h>
 #include <asm/io.h>
 
diff --git a/lib/arm/asm/gic.h b/lib/arm/asm/gic.h
index 189840014b02..dc8cc18c0fbd 100644
--- a/lib/arm/asm/gic.h
+++ b/lib/arm/asm/gic.h
@@ -47,7 +47,7 @@
 #define SPI(irq)			((irq) + GIC_FIRST_SPI)
 
 #ifndef __ASSEMBLY__
-#include <asm/cpumask.h>
+#include <cpumask.h>
 
 enum gic_irq_state {
 	GIC_IRQ_STATE_INACTIVE,
diff --git a/lib/arm/asm/smp.h b/lib/arm/asm/smp.h
index dee4c1a883e7..bb3e71a55e8c 100644
--- a/lib/arm/asm/smp.h
+++ b/lib/arm/asm/smp.h
@@ -5,8 +5,8 @@
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
+#include <cpumask.h>
 #include <asm/thread_info.h>
-#include <asm/cpumask.h>
 
 #define smp_processor_id()		(current_thread_info()->cpu)
 
diff --git a/lib/arm/mmu.c b/lib/arm/mmu.c
index 2f4ec815a35d..b16517a3200d 100644
--- a/lib/arm/mmu.c
+++ b/lib/arm/mmu.c
@@ -5,9 +5,9 @@
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
+#include <cpumask.h>
 #include <asm/setup.h>
 #include <asm/thread_info.h>
-#include <asm/cpumask.h>
 #include <asm/mmu.h>
 #include <asm/setup.h>
 #include <asm/page.h>
diff --git a/lib/arm/smp.c b/lib/arm/smp.c
index 1d470d1aab45..78fc1656cefa 100644
--- a/lib/arm/smp.c
+++ b/lib/arm/smp.c
@@ -7,9 +7,9 @@
  */
 #include <libcflat.h>
 #include <auxinfo.h>
+#include <cpumask.h>
 #include <asm/thread_info.h>
 #include <asm/spinlock.h>
-#include <asm/cpumask.h>
 #include <asm/barrier.h>
 #include <asm/mmu.h>
 #include <asm/psci.h>
diff --git a/lib/arm64/asm/cpumask.h b/lib/arm64/asm/cpumask.h
deleted file mode 100644
index d1421e7abe31..000000000000
--- a/lib/arm64/asm/cpumask.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../arm/asm/cpumask.h"
diff --git a/lib/arm/asm/cpumask.h b/lib/cpumask.h
similarity index 94%
rename from lib/arm/asm/cpumask.h
rename to lib/cpumask.h
index 3fa57bfb17c6..d30e14cda09e 100644
--- a/lib/arm/asm/cpumask.h
+++ b/lib/cpumask.h
@@ -1,12 +1,11 @@
-#ifndef _ASMARM_CPUMASK_H_
-#define _ASMARM_CPUMASK_H_
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Simple cpumask implementation
  *
  * Copyright (C) 2015, Red Hat Inc, Andrew Jones <drjones@redhat.com>
- *
- * This work is licensed under the terms of the GNU LGPL, version 2.
  */
+#ifndef _CPUMASK_H_
+#define _CPUMASK_H_
 #include <asm/setup.h>
 #include <bitops.h>
 
@@ -120,4 +119,4 @@ static inline int cpumask_next(int cpu, const cpumask_t *mask)
 			(cpu) < nr_cpus; 			\
 			(cpu) = cpumask_next(cpu, mask))
 
-#endif /* _ASMARM_CPUMASK_H_ */
+#endif /* _CPUMASK_H_ */
-- 
2.43.0


