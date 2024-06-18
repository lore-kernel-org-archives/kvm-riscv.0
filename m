From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Wed, 19 Jun 2024 01:30:53 +0800
Subject: [kvm-unit-tests PATCH 4/4] riscv: sbi: Add test for timer extension
In-Reply-To: <20240618173053.364776-1-jamestiotio@gmail.com>
References: <20240618173053.364776-1-jamestiotio@gmail.com>
Message-ID: <20240618173053.364776-5-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a test for the set_timer function of the time extension. The test
checks that:
- The time extension is available
- The time counter monotonically increases
- The installed timer interrupt handler is called
- The timer interrupt is received within a reasonable time frame

The timer interrupt delay can be set using the TIMER_DELAY environment
variable. If the variable is not set, the default delay value is
1000000. The time interval used to validate the timer interrupt is
between the specified delay and double the delay. Because of this, the
test might fail if the delay is too short. Hence, we set the default
delay value as the minimum value.

This test has been verified on RV32 and RV64 with OpenSBI using QEMU.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/csr.h |  6 ++++
 lib/riscv/asm/sbi.h |  5 +++
 riscv/sbi.c         | 87 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
index da58b0ce..c4435650 100644
--- a/lib/riscv/asm/csr.h
+++ b/lib/riscv/asm/csr.h
@@ -12,6 +12,7 @@
 #define CSR_STVAL		0x143
 #define CSR_SIP			0x144
 #define CSR_SATP		0x180
+#define CSR_TIME		0xc01
 
 #define SSTATUS_SIE		(_AC(1, UL) << 1)
 
@@ -108,5 +109,10 @@
 				: "memory");			\
 })
 
+#define wfi()							\
+({								\
+	__asm__ __volatile__("wfi" ::: "memory");		\
+})
+
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMRISCV_CSR_H_ */
diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index d82a384d..eb4c77ef 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -18,6 +18,7 @@ enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
+	SBI_EXT_TIME = 0x54494D45,
 };
 
 enum sbi_ext_base_fid {
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
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 762e9711..6ad1dff6 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -6,8 +6,13 @@
  */
 #include <libcflat.h>
 #include <stdlib.h>
+#include <asm/csr.h>
+#include <asm/interrupt.h>
+#include <asm/processor.h>
 #include <asm/sbi.h>
 
+static bool timer_work;
+
 static void help(void)
 {
 	puts("Test SBI\n");
@@ -19,6 +24,18 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
 	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
 }
 
+static struct sbiret __time_sbi_ecall(int fid, unsigned long arg0)
+{
+	return sbi_ecall(SBI_EXT_TIME, fid, arg0, 0, 0, 0, 0, 0);
+}
+
+static void timer_interrupt_handler(struct pt_regs *regs)
+{
+	timer_work = true;
+	toggle_timer_interrupt(false);
+	local_irq_disable();
+}
+
 static bool env_or_skip(const char *env)
 {
 	if (!getenv(env)) {
@@ -112,6 +129,75 @@ static void check_base(void)
 	report_prefix_pop();
 }
 
+static void check_time(void)
+{
+	struct sbiret ret;
+	unsigned long begin, end, duration;
+	const unsigned long default_delay = 1000000;
+	unsigned long delay = getenv("TIMER_DELAY")
+				? MAX(strtol(getenv("TIMER_DELAY"), NULL, 0), default_delay)
+				: default_delay;
+
+	report_prefix_push("time");
+
+	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_TIME);
+
+	if (ret.error) {
+		report_fail("probing for time extension failed");
+		report_prefix_pop();
+		return;
+	}
+
+	if (!ret.value) {
+		report_skip("time extension not available");
+		report_prefix_pop();
+		return;
+	}
+
+	begin = csr_read(CSR_TIME);
+	end = csr_read(CSR_TIME);
+	if (begin >= end) {
+		report_fail("time counter has decreased");
+		report_prefix_pop();
+		return;
+	}
+
+	report_prefix_push("set_timer");
+
+	install_irq_handler(IRQ_SUPERVISOR_TIMER, timer_interrupt_handler);
+	local_irq_enable();
+
+	begin = csr_read(CSR_TIME);
+	ret = __time_sbi_ecall(SBI_EXT_TIME_SET_TIMER, csr_read(CSR_TIME) + delay);
+
+	if (ret.error) {
+		report_fail("setting timer failed");
+		install_irq_handler(IRQ_SUPERVISOR_TIMER, NULL);
+		report_prefix_pop();
+		report_prefix_pop();
+		return;
+	}
+
+	toggle_timer_interrupt(true);
+
+	while ((!timer_work) && (csr_read(CSR_TIME) <= (begin + delay)))
+		wfi();
+
+	end = csr_read(CSR_TIME);
+	report(timer_work, "timer interrupt received");
+
+	install_irq_handler(IRQ_SUPERVISOR_TIMER, NULL);
+	__time_sbi_ecall(SBI_EXT_TIME_SET_TIMER,  -1);
+
+	duration = end - begin;
+	if (timer_work)
+		report((duration >= delay) && (duration <= (delay + delay)), "timer delay honored");
+
+	report_prefix_pop();
+
+	report_prefix_pop();
+}
+
 int main(int argc, char **argv)
 {
 
@@ -122,6 +208,7 @@ int main(int argc, char **argv)
 
 	report_prefix_push("sbi");
 	check_base();
+	check_time();
 
 	return report_summary();
 }
-- 
2.43.0


