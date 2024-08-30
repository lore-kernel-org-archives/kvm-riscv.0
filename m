From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 30 Aug 2024 13:01:36 +0200
Subject: [kvm-unit-tests PATCH 4/3] riscv: Provide helpers for IPIs
In-Reply-To: <20240830101221.2202707-5-andrew.jones@linux.dev>
References: <20240830101221.2202707-5-andrew.jones@linux.dev>
Message-ID: <20240830110135.2232665-2-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a few functions to enable/disable/acknowledge IPIs.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/csr.h       |  3 ++-
 lib/riscv/asm/processor.h | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/lib/riscv/asm/csr.h b/lib/riscv/asm/csr.h
index 24b333e02589..16f5ddd762de 100644
--- a/lib/riscv/asm/csr.h
+++ b/lib/riscv/asm/csr.h
@@ -51,7 +51,8 @@
 #define IRQ_S_GEXT		12
 #define IRQ_PMU_OVF		13
 
-#define IE_TIE			(_AC(0x1, UL) << IRQ_S_TIMER)
+#define IE_SSIE			(_AC(1, UL) << IRQ_S_SOFT)
+#define IE_TIE			(_AC(1, UL) << IRQ_S_TIMER)
 
 #define IP_TIP			IE_TIE
 
diff --git a/lib/riscv/asm/processor.h b/lib/riscv/asm/processor.h
index 4c9ad968460d..8989d8d686f9 100644
--- a/lib/riscv/asm/processor.h
+++ b/lib/riscv/asm/processor.h
@@ -32,6 +32,21 @@ static inline void local_irq_disable(void)
 	csr_clear(CSR_SSTATUS, SR_SIE);
 }
 
+static inline void local_ipi_enable(void)
+{
+	csr_set(CSR_SIE, IE_SSIE);
+}
+
+static inline void local_ipi_disable(void)
+{
+	csr_clear(CSR_SIE, IE_SSIE);
+}
+
+static inline void ipi_ack(void)
+{
+	csr_clear(CSR_SIP, IE_SSIE);
+}
+
 void install_exception_handler(unsigned long cause, void (*handler)(struct pt_regs *));
 void install_irq_handler(unsigned long cause, void (*handler)(struct pt_regs *));
 void do_handle_exception(struct pt_regs *regs);
-- 
2.45.2


