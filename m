From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 30 Aug 2024 12:12:25 +0200
Subject: [kvm-unit-tests PATCH 3/3] riscv: Introduce SBI IPI convenience functions
In-Reply-To: <20240830101221.2202707-5-andrew.jones@linux.dev>
References: <20240830101221.2202707-5-andrew.jones@linux.dev>
Message-ID: <20240830101221.2202707-8-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI IPI function interface is a bit painful to use since it
operates on hartids as opposed to cpuids and requires determining a
mask base and a mask. Provide functions allowing IPIs to be sent to
single cpus and to all cpus set in a cpumask in order to simplify
things for unit tests.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/sbi.h |  3 +++
 lib/riscv/sbi.c     | 43 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 4a35cf38da70..e032444dd760 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -13,6 +13,7 @@
 #define SBI_ERR_ALREADY_STOPPED		-8
 
 #ifndef __ASSEMBLY__
+#include <cpumask.h>
 
 enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
@@ -67,6 +68,8 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 void sbi_shutdown(void);
 struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
 struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base);
+struct sbiret sbi_send_ipi_cpu(int cpu);
+struct sbiret sbi_send_ipi_cpumask(const cpumask_t *mask);
 struct sbiret sbi_set_timer(unsigned long stime_value);
 long sbi_probe(int ext);
 
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index 07660e422cbb..ecc63acdebb7 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <libcflat.h>
+#include <cpumask.h>
+#include <limits.h>
 #include <asm/sbi.h>
+#include <asm/setup.h>
 
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
@@ -44,6 +47,46 @@ struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base
 	return sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI, hart_mask, hart_mask_base, 0, 0, 0, 0);
 }
 
+struct sbiret sbi_send_ipi_cpu(int cpu)
+{
+	return sbi_send_ipi(1UL, cpus[cpu].hartid);
+}
+
+struct sbiret sbi_send_ipi_cpumask(const cpumask_t *mask)
+{
+	struct sbiret ret;
+	cpumask_t tmp;
+
+	if (cpumask_full(mask))
+		return sbi_send_ipi(0, -1UL);
+
+	cpumask_copy(&tmp, mask);
+
+	while (!cpumask_empty(&tmp)) {
+		unsigned long base = ULONG_MAX;
+		unsigned long mask = 0;
+		int cpu;
+
+		for_each_cpu(cpu, &tmp) {
+			if (base > cpus[cpu].hartid)
+				base = cpus[cpu].hartid;
+		}
+
+		for_each_cpu(cpu, &tmp) {
+			if (cpus[cpu].hartid < base + BITS_PER_LONG) {
+				mask |= 1UL << (cpus[cpu].hartid - base);
+				cpumask_clear_cpu(cpu, &tmp);
+			}
+		}
+
+		ret = sbi_send_ipi(mask, base);
+		if (ret.error)
+			break;
+	}
+
+	return ret;
+}
+
 struct sbiret sbi_set_timer(unsigned long stime_value)
 {
 	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, 0, 0, 0, 0);
-- 
2.45.2


