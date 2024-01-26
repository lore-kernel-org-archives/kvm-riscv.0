From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 26 Jan 2024 15:23:44 +0100
Subject: [kvm-unit-tests PATCH v2 19/24] riscv: Enable the MMU in secondaries
In-Reply-To: <20240126142324.66674-26-andrew.jones@linux.dev>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
Message-ID: <20240126142324.66674-45-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Set each secondary satp to the same as the primary's and enable the
MMU when starting. We also change the memalign() to alloc_pages()
to prepare for enabling vmalloc_ops. We always want an address
for the stack where its virtual address is the same as its physical
address, but vmalloc_ops.memalign wouldn't provide that.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 lib/riscv/asm-offsets.c | 1 +
 lib/riscv/asm/smp.h     | 1 +
 lib/riscv/smp.c         | 7 +++++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/riscv/asm-offsets.c b/lib/riscv/asm-offsets.c
index f5beeeb45e09..a2a32438e075 100644
--- a/lib/riscv/asm-offsets.c
+++ b/lib/riscv/asm-offsets.c
@@ -53,6 +53,7 @@ int main(void)
 	OFFSET(PT_ORIG_A0, pt_regs, orig_a0);
 	DEFINE(PT_SIZE, sizeof(struct pt_regs));
 
+	OFFSET(SECONDARY_SATP, secondary_data, satp);
 	OFFSET(SECONDARY_STVEC, secondary_data, stvec);
 	OFFSET(SECONDARY_FUNC, secondary_data, func);
 	DEFINE(SECONDARY_DATA_SIZE, sizeof(struct secondary_data));
diff --git a/lib/riscv/asm/smp.h b/lib/riscv/asm/smp.h
index 931766dc3969..b3ead4e86433 100644
--- a/lib/riscv/asm/smp.h
+++ b/lib/riscv/asm/smp.h
@@ -15,6 +15,7 @@ static inline int smp_processor_id(void)
 typedef void (*secondary_func_t)(void);
 
 struct secondary_data {
+	unsigned long satp;
 	unsigned long stvec;
 	secondary_func_t func;
 } __attribute__((aligned(16)));
diff --git a/lib/riscv/smp.c b/lib/riscv/smp.c
index ed7984e75608..7e4bb5b76903 100644
--- a/lib/riscv/smp.c
+++ b/lib/riscv/smp.c
@@ -5,9 +5,10 @@
  * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
  */
 #include <libcflat.h>
-#include <alloc.h>
+#include <alloc_page.h>
 #include <cpumask.h>
 #include <asm/csr.h>
+#include <asm/mmu.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/sbi.h>
@@ -23,6 +24,7 @@ secondary_func_t secondary_cinit(struct secondary_data *data)
 {
 	struct thread_info *info;
 
+	__mmu_enable(data->satp);
 	thread_info_init();
 	info = current_thread_info();
 	set_cpu_online(info->cpu, true);
@@ -33,10 +35,11 @@ secondary_func_t secondary_cinit(struct secondary_data *data)
 
 static void __smp_boot_secondary(int cpu, secondary_func_t func)
 {
-	struct secondary_data *sp = memalign(16, SZ_8K) + SZ_8K - 16;
+	struct secondary_data *sp = alloc_pages(1) + SZ_8K - 16;
 	struct sbiret ret;
 
 	sp -= sizeof(struct secondary_data);
+	sp->satp = csr_read(CSR_SATP);
 	sp->stvec = csr_read(CSR_STVEC);
 	sp->func = func;
 
-- 
2.43.0


