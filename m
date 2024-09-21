From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Sat, 21 Sep 2024 18:08:19 +0800
Subject: [kvm-unit-tests PATCH v5 1/5] riscv: Rewrite hartid_to_cpu in assembly
In-Reply-To: <20240921100824.151761-1-jamestiotio@gmail.com>
References: <20240921100824.151761-1-jamestiotio@gmail.com>
Message-ID: <20240921100824.151761-2-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <andrew.jones@linux.dev>

Some SBI HSM tests run without a stack being setup so they can't
run C code. Those tests still need to know the corresponding cpuid
for the hartid on which they are running. Give those tests
hartid_to_cpu() by reimplementing it in assembly.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm-offsets.c |  5 +++++
 lib/riscv/setup.c       | 10 ----------
 riscv/cstart.S          | 24 ++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/lib/riscv/asm-offsets.c b/lib/riscv/asm-offsets.c
index a2a32438..6c511c14 100644
--- a/lib/riscv/asm-offsets.c
+++ b/lib/riscv/asm-offsets.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <kbuild.h>
 #include <elf.h>
+#include <asm/processor.h>
 #include <asm/ptrace.h>
 #include <asm/smp.h>
 
@@ -58,5 +59,9 @@ int main(void)
 	OFFSET(SECONDARY_FUNC, secondary_data, func);
 	DEFINE(SECONDARY_DATA_SIZE, sizeof(struct secondary_data));
 
+	OFFSET(THREAD_INFO_CPU, thread_info, cpu);
+	OFFSET(THREAD_INFO_HARTID, thread_info, hartid);
+	DEFINE(THREAD_INFO_SIZE, sizeof(struct thread_info));
+
 	return 0;
 }
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index 495db041..f347ad63 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -43,16 +43,6 @@ uint64_t timebase_frequency;
 
 static struct mem_region riscv_mem_regions[NR_MEM_REGIONS + 1];
 
-int hartid_to_cpu(unsigned long hartid)
-{
-	int cpu;
-
-	for_each_present_cpu(cpu)
-		if (cpus[cpu].hartid == hartid)
-			return cpu;
-	return -1;
-}
-
 static void cpu_set_fdt(int fdtnode __unused, u64 regval, void *info __unused)
 {
 	int cpu = nr_cpus++;
diff --git a/riscv/cstart.S b/riscv/cstart.S
index 8f269997..68717370 100644
--- a/riscv/cstart.S
+++ b/riscv/cstart.S
@@ -109,6 +109,30 @@ halt:
 1:	wfi
 	j	1b
 
+/*
+ * hartid_to_cpu
+ *   a0 is a hartid on entry
+ * Returns, in a0, the corresponding cpuid, or -1 if no
+ * thread_info struct with 'hartid' is found.
+ */
+.balign 4
+.global hartid_to_cpu
+hartid_to_cpu:
+	la	t0, cpus
+	la	t1, nr_cpus
+	lw	t1, 0(t1)
+	li	t2, 0
+1:	bne	t2, t1, 2f
+	li	a0, -1
+	ret
+2:	REG_L	t3, THREAD_INFO_HARTID(t0)
+	bne	a0, t3, 3f
+	lw	a0, THREAD_INFO_CPU(t0)
+	ret
+3:	addi	t0, t0, THREAD_INFO_SIZE
+	addi	t2, t2, 1
+	j	1b
+
 .balign 4
 .global secondary_entry
 secondary_entry:
-- 
2.43.0


