From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Sat, 21 Sep 2024 18:08:22 +0800
Subject: [kvm-unit-tests PATCH v5 4/5] riscv: Add helper method to set cpu started mask
In-Reply-To: <20240921100824.151761-1-jamestiotio@gmail.com>
References: <20240921100824.151761-1-jamestiotio@gmail.com>
Message-ID: <20240921100824.151761-5-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When a CPU abruptly stops during the RISC-V SBI hart stop tests, it is
considered to be offline. As such, it should be removed from the
cpu_started mask so that future tests can initiate another
smp_boot_secondary. Add a helper method to allow the RISC-V SBI
boot hart to remove a dead CPU from the mask.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/smp.h | 2 ++
 lib/riscv/smp.c     | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/lib/riscv/asm/smp.h b/lib/riscv/asm/smp.h
index b3ead4e8..5d379a7a 100644
--- a/lib/riscv/asm/smp.h
+++ b/lib/riscv/asm/smp.h
@@ -26,4 +26,6 @@ secondary_func_t secondary_cinit(struct secondary_data *data);
 void smp_boot_secondary(int cpu, void (*func)(void));
 void smp_boot_secondary_nofail(int cpu, void (*func)(void));
 
+void set_cpu_started(int cpu, bool started);
+
 #endif /* _ASMRISCV_SMP_H_ */
diff --git a/lib/riscv/smp.c b/lib/riscv/smp.c
index eb7061ab..eb7cfb72 100644
--- a/lib/riscv/smp.c
+++ b/lib/riscv/smp.c
@@ -74,3 +74,11 @@ void smp_boot_secondary_nofail(int cpu, void (*func)(void))
 	while (!cpu_online(cpu))
 		smp_wait_for_event();
 }
+
+void set_cpu_started(int cpu, bool started)
+{
+	if (started)
+		cpumask_set_cpu(cpu, &cpu_started);
+	else
+		cpumask_clear_cpu(cpu, &cpu_started);
+}
-- 
2.43.0


