From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Aug 2024 18:22:03 +0200
Subject: [kvm-unit-tests PATCH 2/3] riscv: Share sbi_time_ecall with framework
In-Reply-To: <20240828162200.1384696-5-andrew.jones@linux.dev>
References: <20240828162200.1384696-5-andrew.jones@linux.dev>
Message-ID: <20240828162200.1384696-7-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Setting timers is a useful thing to do for all types of tests. Not
every platform will have Sstc so make the SBI TIME extension
available as well.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/sbi.h |  1 +
 lib/riscv/sbi.c     |  5 +++++
 riscv/sbi.c         | 13 ++++---------
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index a864e268437b..4a35cf38da70 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -67,6 +67,7 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 void sbi_shutdown(void);
 struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
 struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base);
+struct sbiret sbi_set_timer(unsigned long stime_value);
 long sbi_probe(int ext);
 
 #endif /* !__ASSEMBLY__ */
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index 19d58ab73593..07660e422cbb 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -44,6 +44,11 @@ struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base
 	return sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI, hart_mask, hart_mask_base, 0, 0, 0, 0);
 }
 
+struct sbiret sbi_set_timer(unsigned long stime_value)
+{
+	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, 0, 0, 0, 0);
+}
+
 long sbi_probe(int ext)
 {
 	struct sbiret ret;
diff --git a/riscv/sbi.c b/riscv/sbi.c
index e8598fe721a6..85cb7e589bdc 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -35,11 +35,6 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
 	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
 }
 
-static struct sbiret __time_sbi_ecall(unsigned long stime_value)
-{
-	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, 0, 0, 0, 0);
-}
-
 static struct sbiret __dbcn_sbi_ecall(int fid, unsigned long arg0, unsigned long arg1, unsigned long arg2)
 {
 	return sbi_ecall(SBI_EXT_DBCN, fid, arg0, arg1, arg2, 0, 0, 0);
@@ -198,7 +193,7 @@ static void timer_irq_handler(struct pt_regs *regs)
 	if (timer_info.mask_timer_irq)
 		timer_irq_disable();
 	else
-		__time_sbi_ecall(ULONG_MAX);
+		sbi_set_timer(ULONG_MAX);
 
 	if (!timer_irq_pending())
 		timer_info.timer_irq_cleared = true;
@@ -217,7 +212,7 @@ static void timer_check_set_timer(bool mask_timer_irq)
 
 	timer_info = (struct timer_info){ .mask_timer_irq = mask_timer_irq };
 	begin = timer_get_cycles();
-	ret = __time_sbi_ecall(begin + d);
+	ret = sbi_set_timer(begin + d);
 
 	report(!ret.error, "set timer%s", mask_test_str);
 	if (ret.error)
@@ -268,10 +263,10 @@ static void check_time(void)
 		report_skip("timer irq enable bit is not writable, skipping mask irq test");
 
 	timer_irq_disable();
-	__time_sbi_ecall(0);
+	sbi_set_timer(0);
 	pending = timer_irq_pending();
 	report(pending, "timer immediately pending by setting timer to 0");
-	__time_sbi_ecall(ULONG_MAX);
+	sbi_set_timer(ULONG_MAX);
 	if (pending)
 		report(!timer_irq_pending(), "pending timer cleared while masked");
 	else
-- 
2.45.2


