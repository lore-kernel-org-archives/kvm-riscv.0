From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue,  5 Dec 2023 19:11:23 +0100
Subject: [PATCH v1 03/14] RISC-V: paravirt: Implement steal-time support
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
Message-ID: <20231205181119.207204-19-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the SBI STA extension exists we can use it to implement
paravirt steal-time support. Fill in the empty pv-time functions
with an SBI STA implementation.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/paravirt.c | 67 ++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 141dbcc36fa2..b509bcc7292a 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -6,12 +6,21 @@
 #define pr_fmt(fmt) "riscv-pv: " fmt
 
 #include <linux/cpuhotplug.h>
+#include <linux/compiler.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/jump_label.h>
+#include <linux/kconfig.h>
+#include <linux/kernel.h>
+#include <linux/percpu-defs.h>
 #include <linux/printk.h>
 #include <linux/static_call.h>
 #include <linux/types.h>
 
+#include <asm/barrier.h>
+#include <asm/page.h>
+#include <asm/sbi.h>
+
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
@@ -31,24 +40,76 @@ static int __init parse_no_stealacc(char *arg)
 
 early_param("no-steal-acc", parse_no_stealacc);
 
+DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
+
 static bool __init has_pv_steal_clock(void)
 {
+	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
+	    sbi_probe_extension(SBI_EXT_STA) > 0) {
+		pr_info("SBI STA extension detected\n");
+		return true;
+	}
+
 	return false;
 }
 
-static int pv_time_cpu_online(unsigned int cpu)
+static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
+					unsigned long flags)
 {
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
+			lo, hi, flags, 0, 0, 0);
+	if (ret.error) {
+		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
+			pr_warn("Failed to disable steal-time shmem");
+		else
+			pr_warn("Failed to set steal-time shmem");
+		return -ENOMEM;
+	}
+
 	return 0;
 }
 
+static int pv_time_cpu_online(unsigned int cpu)
+{
+	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
+	phys_addr_t pa = __pa(st);
+	unsigned long lo = (unsigned long)pa;
+	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
+
+	return sbi_sta_steal_time_set_shmem(lo, hi, 0);
+}
+
 static int pv_time_cpu_down_prepare(unsigned int cpu)
 {
-	return 0;
+	return sbi_sta_steal_time_set_shmem(SBI_STA_SHMEM_DISABLE,
+					    SBI_STA_SHMEM_DISABLE, 0);
 }
 
 static u64 pv_time_steal_clock(int cpu)
 {
-	return 0;
+	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
+	u32 sequence;
+	u64 steal;
+
+	if (IS_ENABLED(CONFIG_32BIT)) {
+		/*
+		 * Check the sequence field before and after reading the steal
+		 * field. Repeat the read if it is different or odd.
+		 */
+		do {
+			sequence = READ_ONCE(st->sequence);
+			virt_rmb();
+			steal = READ_ONCE(st->steal);
+			virt_rmb();
+		} while ((le32_to_cpu(sequence) & 1) ||
+			 sequence != READ_ONCE(st->sequence));
+	} else {
+		steal = READ_ONCE(st->steal);
+	}
+
+	return le64_to_cpu(steal);
 }
 
 int __init pv_time_init(void)
-- 
2.43.0


