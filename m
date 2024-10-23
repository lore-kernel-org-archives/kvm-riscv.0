From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 23 Oct 2024 15:21:33 +0200
Subject: [kvm-unit-tests PATCH 2/4] riscv: Filter unmanaged harts from present mask
In-Reply-To: <20241023132130.118073-6-andrew.jones@linux.dev>
References: <20241023132130.118073-6-andrew.jones@linux.dev>
Message-ID: <20241023132130.118073-8-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We use SBI to manage harts and SBI may have a different idea of which
harts it should manage than our hardware description. Filter out all
harts which fail an SBI HSM status call from the present mask to
ensure we don't try to use them.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/setup.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index f347ad6352d7..211945448b0f 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -19,6 +19,7 @@
 #include <asm/mmu.h>
 #include <asm/page.h>
 #include <asm/processor.h>
+#include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/timer.h>
 
@@ -51,7 +52,9 @@ static void cpu_set_fdt(int fdtnode __unused, u64 regval, void *info __unused)
 
 	cpus[cpu].cpu = cpu;
 	cpus[cpu].hartid = regval;
-	set_cpu_present(cpu, true);
+
+	if (!sbi_hart_get_status(cpus[cpu].hartid).error)
+		set_cpu_present(cpu, true);
 }
 
 static void cpu_init_acpi(void)
@@ -61,7 +64,7 @@ static void cpu_init_acpi(void)
 
 static void cpu_init(void)
 {
-	int ret;
+	int ret, me;
 
 	nr_cpus = 0;
 	if (dt_available()) {
@@ -71,7 +74,9 @@ static void cpu_init(void)
 		cpu_init_acpi();
 	}
 
-	set_cpu_online(hartid_to_cpu(csr_read(CSR_SSCRATCH)), true);
+	me = hartid_to_cpu(csr_read(CSR_SSCRATCH));
+	assert(cpu_present(me));
+	set_cpu_online(me, true);
 	cpu0_calls_idle = true;
 }
 
-- 
2.47.0


