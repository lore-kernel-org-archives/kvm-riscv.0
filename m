From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 29 Jul 2024 00:50:22 +0800
Subject: [kvm-unit-tests PATCH v5 5/5] riscv: sbi: Add test for timer extension
In-Reply-To: <20240728165022.30075-1-jamestiotio@gmail.com>
References: <20240728165022.30075-1-jamestiotio@gmail.com>
Message-ID: <20240728165022.30075-6-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a test for the set_timer function of the time extension. The test
checks that:
- The time extension is available
- The installed timer interrupt handler is called
- The timer interrupt is received within a reasonable time interval
- The timer interrupt pending bit is cleared after the set_timer SBI
  call is made
- The timer interrupt can be cleared either by requesting a timer
  interrupt infinitely far into the future or by masking the timer
  interrupt

The timer interrupt delay can be set using the TIMER_DELAY environment
variable in microseconds. The default delay value is 200 milliseconds.
Since the interrupt can arrive a little later than the specified delay,
allow some margin of error. This margin of error can be specified via
the TIMER_MARGIN environment variable in microseconds. The default
margin of error is 200 milliseconds.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/csr.h   |   8 +++
 lib/riscv/asm/sbi.h   |   5 ++
 lib/riscv/asm/timer.h |  10 +++
 riscv/sbi.c           | 144 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+)

diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
index a9b1bd42..24b333e0 100644
--- a/lib/riscv/asm/csr.h
+++ b/lib/riscv/asm/csr.h
@@ -4,11 +4,15 @@
 #include <linux/const.h>
 
 #define CSR_SSTATUS		0x100
+#define CSR_SIE			0x104
 #define CSR_STVEC		0x105
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142
 #define CSR_STVAL		0x143
+#define CSR_SIP			0x144
+#define CSR_STIMECMP		0x14d
+#define CSR_STIMECMPH		0x15d
 #define CSR_SATP		0x180
 #define CSR_TIME		0xc01
 
@@ -47,6 +51,10 @@
 #define IRQ_S_GEXT		12
 #define IRQ_PMU_OVF		13
 
+#define IE_TIE			(_AC(0x1, UL) << IRQ_S_TIMER)
+
+#define IP_TIP			IE_TIE
+
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\
diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 5e1a674a..73ab5438 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -16,6 +16,7 @@
 
 enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
+	SBI_EXT_TIME = 0x54494d45,
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
 };
@@ -37,6 +38,10 @@ enum sbi_ext_hsm_fid {
 	SBI_EXT_HSM_HART_SUSPEND,
 };
 
+enum sbi_ext_time_fid {
+	SBI_EXT_TIME_SET_TIMER = 0,
+};
+
 struct sbiret {
 	long error;
 	long value;
diff --git a/lib/riscv/asm/timer.h b/lib/riscv/asm/timer.h
index f7504f84..b3514d3f 100644
--- a/lib/riscv/asm/timer.h
+++ b/lib/riscv/asm/timer.h
@@ -11,4 +11,14 @@ static inline uint64_t timer_get_cycles(void)
 	return csr_read(CSR_TIME);
 }
 
+static inline void timer_irq_enable(void)
+{
+	csr_set(CSR_SIE, IE_TIE);
+}
+
+static inline void timer_irq_disable(void)
+{
+	csr_clear(CSR_SIE, IE_TIE);
+}
+
 #endif /* _ASMRISCV_TIMER_H_ */
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 762e9711..044258bb 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -6,7 +6,25 @@
  */
 #include <libcflat.h>
 #include <stdlib.h>
+#include <limits.h>
+#include <asm/barrier.h>
+#include <asm/csr.h>
+#include <asm/delay.h>
+#include <asm/isa.h>
+#include <asm/processor.h>
 #include <asm/sbi.h>
+#include <asm/smp.h>
+#include <asm/timer.h>
+
+struct timer_info {
+	bool timer_works;
+	bool mask_timer_irq;
+	bool timer_irq_set;
+	bool timer_irq_cleared;
+	unsigned long timer_irq_count;
+};
+
+static struct timer_info timer_info_;
 
 static void help(void)
 {
@@ -19,6 +37,36 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
 	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
 }
 
+static struct sbiret __time_sbi_ecall(unsigned long stime_value)
+{
+	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, 0, 0, 0, 0);
+}
+
+static bool timer_irq_pending(void)
+{
+	return csr_read(CSR_SIP) & IP_TIP;
+}
+
+static void timer_irq_handler(struct pt_regs *regs)
+{
+	if (timer_info_.timer_irq_count < ULONG_MAX)
+		++timer_info_.timer_irq_count;
+
+	timer_info_.timer_works = true;
+	if (timer_irq_pending())
+		timer_info_.timer_irq_set = true;
+
+	if (timer_info_.mask_timer_irq) {
+		timer_irq_disable();
+		__time_sbi_ecall(0);
+	} else {
+		__time_sbi_ecall(ULONG_MAX);
+	}
+
+	if (!timer_irq_pending())
+		timer_info_.timer_irq_cleared = true;
+}
+
 static bool env_or_skip(const char *env)
 {
 	if (!getenv(env)) {
@@ -112,6 +160,101 @@ static void check_base(void)
 	report_prefix_pop();
 }
 
+static void check_time(void)
+{
+	struct sbiret ret;
+	unsigned long begin, end, duration;
+	unsigned long d = getenv("TIMER_DELAY") ? strtol(getenv("TIMER_DELAY"), NULL, 0)
+						: 200000;
+	unsigned long margin = getenv("TIMER_MARGIN") ? strtol(getenv("TIMER_MARGIN"), NULL, 0)
+						      : 200000;
+
+	d = usec_to_cycles(d);
+	margin = usec_to_cycles(margin);
+
+	report_prefix_push("time");
+
+	if (!sbi_probe(SBI_EXT_TIME)) {
+		report_skip("time extension not available");
+		report_prefix_pop();
+		return;
+	}
+
+	report_prefix_push("set_timer");
+
+	install_irq_handler(IRQ_S_TIMER, timer_irq_handler);
+	local_irq_enable();
+	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
+		csr_write(CSR_STIMECMP, ULONG_MAX);
+#if __riscv_xlen == 32
+		csr_write(CSR_STIMECMPH, ULONG_MAX);
+#endif
+	}
+	timer_irq_enable();
+
+	begin = timer_get_cycles();
+	ret = __time_sbi_ecall(begin + d);
+
+	report(!ret.error, "set timer");
+	if (ret.error)
+		report_info("set timer failed with %ld\n", ret.error);
+
+	report(!timer_irq_pending(), "pending timer interrupt bit cleared");
+
+	while ((end = timer_get_cycles()) <= (begin + d + margin) && !timer_info_.timer_works)
+		cpu_relax();
+
+	report(timer_info_.timer_works, "timer interrupt received");
+	report(timer_info_.timer_irq_set, "pending timer interrupt bit set in irq handler");
+	report(timer_info_.timer_irq_set && timer_info_.timer_irq_cleared,
+	       "pending timer interrupt bit cleared by setting timer to -1");
+
+	if (timer_info_.timer_works) {
+		duration = end - begin;
+		report(duration >= d && duration <= (d + margin), "timer delay honored");
+	}
+
+	if (timer_info_.timer_irq_count > 1)
+		report_fail("timer interrupt received multiple times");
+
+	if (csr_read(CSR_SIE) & IE_TIE) {
+		timer_info_ = (struct timer_info){ .mask_timer_irq = true };
+		begin = timer_get_cycles();
+		ret = __time_sbi_ecall(begin + d);
+
+		report(!ret.error, "set timer for mask irq test");
+		if (ret.error)
+			report_info("set timer for mask irq test failed with %ld\n", ret.error);
+
+		while ((end = timer_get_cycles()) <= (begin + d + margin)
+		       && !timer_info_.timer_works)
+			cpu_relax();
+
+		report(timer_info_.timer_works, "timer interrupt received for mask irq test");
+		report(timer_info_.timer_irq_set,
+		       "pending timer interrupt bit set in irq handler for mask irq test");
+		report(timer_info_.timer_irq_set && timer_info_.timer_irq_cleared,
+		       "pending timer interrupt bit cleared by masking timer irq");
+
+		if (timer_info_.timer_works) {
+			duration = end - begin;
+			report(duration >= d && duration <= (d + margin),
+			"timer delay honored for mask irq test");
+		}
+
+		if (timer_info_.timer_irq_count > 1)
+			report_fail("timer interrupt received multiple times for mask irq test");
+	} else {
+		report_skip("timer irq enable bit is not writable, skipping mask irq test");
+	}
+
+	local_irq_disable();
+	install_irq_handler(IRQ_S_TIMER, NULL);
+
+	report_prefix_pop();
+	report_prefix_pop();
+}
+
 int main(int argc, char **argv)
 {
 
@@ -122,6 +265,7 @@ int main(int argc, char **argv)
 
 	report_prefix_push("sbi");
 	check_base();
+	check_time();
 
 	return report_summary();
 }
-- 
2.43.0


