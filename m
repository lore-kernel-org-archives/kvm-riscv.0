From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 28 Feb 2022 01:42:30 -0800
Subject: [RFC PATCH 3/6] RISC-V: Prefer sstc extension if available
In-Reply-To: <20220228094234.3773153-1-atishp@rivosinc.com>
References: <20220228094234.3773153-1-atishp@rivosinc.com>
Message-ID: <20220228094234.3773153-4-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V ISA has sstc extension which allows updating the next clock event
via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
if sstc extension is available. Otherwise, it will fallback to SBI call
to maintain backward compatibility.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/timex.h    |  2 ++
 drivers/clocksource/timer-riscv.c | 22 +++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index 507cae273bc6..dc0ffed04ea1 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -48,6 +48,8 @@ static inline unsigned long random_get_entropy(void)
 
 #else /* CONFIG_RISCV_M_MODE */
 
+extern struct static_key_false cpu_sstc_available;
+#define cpu_sstc_ext_available static_branch_likely(&cpu_sstc_available)
 static inline cycles_t get_cycles(void)
 {
 	return csr_read(CSR_TIME);
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..f032da8a4272 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -23,11 +23,25 @@
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
+DEFINE_STATIC_KEY_FALSE(cpu_sstc_available);
+EXPORT_SYMBOL(cpu_sstc_available);
+
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
 {
+	uint64_t next_tval = get_cycles64() + delta;
+
 	csr_set(CSR_IE, IE_TIE);
-	sbi_set_timer(get_cycles64() + delta);
+	if (cpu_sstc_ext_available) {
+#if __riscv_xlen == 32
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMPH, next_tval >> 32);
+#else
+		csr_write(CSR_STIMECMP, get_cycles64() + delta);
+#endif
+	} else
+		sbi_set_timer(get_cycles64() + delta);
+
 	return 0;
 }
 
@@ -165,6 +179,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (error)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
+
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		pr_info("S-mode timer interrupt mode is available via sstc extension\n");
+		static_branch_enable(&cpu_sstc_available);
+	}
+
 	return error;
 }
 
-- 
2.30.2


