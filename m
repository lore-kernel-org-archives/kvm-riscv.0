From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Aug 2024 18:22:04 +0200
Subject: [kvm-unit-tests PATCH 3/3] riscv: Provide timer_start and timer_stop
In-Reply-To: <20240828162200.1384696-5-andrew.jones@linux.dev>
References: <20240828162200.1384696-5-andrew.jones@linux.dev>
Message-ID: <20240828162200.1384696-8-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For unit tests that need a timer but don't care if they use Sstc or
SBI TIME, provide timer_start and timer_stop which will try Sstc
first and fallback to SBI TIME.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/timer.h |  2 ++
 lib/riscv/timer.c     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/lib/riscv/asm/timer.h b/lib/riscv/asm/timer.h
index fd12251a3a6b..9e790a97bd24 100644
--- a/lib/riscv/asm/timer.h
+++ b/lib/riscv/asm/timer.h
@@ -6,6 +6,8 @@
 
 extern void timer_get_frequency(void);
 extern void local_timer_init(void);
+extern void timer_start(unsigned long duration_us);
+extern void timer_stop(void);
 
 static inline uint64_t timer_get_cycles(void)
 {
diff --git a/lib/riscv/timer.c b/lib/riscv/timer.c
index 92826d6ec3fe..67fd031ab95f 100644
--- a/lib/riscv/timer.c
+++ b/lib/riscv/timer.c
@@ -6,7 +6,9 @@
 #include <devicetree.h>
 #include <limits.h>
 #include <asm/csr.h>
+#include <asm/delay.h>
 #include <asm/isa.h>
+#include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
 #include <asm/timer.h>
@@ -39,3 +41,34 @@ void local_timer_init(void)
 			csr_write(CSR_STIMECMPH, ULONG_MAX);
 	}
 }
+
+void timer_start(unsigned long duration_us)
+{
+	uint64_t next = timer_get_cycles() + usec_to_cycles((uint64_t)duration_us);
+
+	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
+		csr_write(CSR_STIMECMP, (unsigned long)next);
+		if (__riscv_xlen == 32)
+			csr_write(CSR_STIMECMPH, (unsigned long)(next >> 32));
+	} else if (sbi_probe(SBI_EXT_TIME)) {
+		struct sbiret ret = sbi_set_timer(next);
+		assert(ret.error == SBI_SUCCESS);
+		assert(!(next >> 32));
+	} else {
+		assert_msg(false, "No timer to start!");
+	}
+}
+
+void timer_stop(void)
+{
+	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
+		csr_write(CSR_STIMECMP, ULONG_MAX);
+		if (__riscv_xlen == 32)
+			csr_write(CSR_STIMECMPH, ULONG_MAX);
+	} else if (sbi_probe(SBI_EXT_TIME)) {
+		struct sbiret ret = sbi_set_timer(ULONG_MAX);
+		assert(ret.error == SBI_SUCCESS);
+	} else {
+		assert_msg(false, "No timer to stop!");
+	}
+}
-- 
2.45.2


