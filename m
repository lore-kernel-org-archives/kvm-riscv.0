From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:10 -0700
Subject: [RFC 42/48] RISC-V: Allow host to inject any ext interrupt id to a CoVE guest.
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-43-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Ideally, host must not inject any external interrupt until explicitly
allowed by the guest. This should be done per interrupt id but currently
adding allow-all call in init_IRQ. In future, it will be modified
to allow specific interrupts only.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/irq.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index eb9a68a..b5e0fd8 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -11,6 +11,8 @@
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <asm/sbi.h>
+#include <asm/covg_sbi.h>
+#include <asm/cove.h>
 
 static struct fwnode_handle *(*__get_intc_node)(void);
 
@@ -36,8 +38,18 @@ int arch_show_interrupts(struct seq_file *p, int prec)
 
 void __init init_IRQ(void)
 {
+	int ret;
+
 	irqchip_init();
 	if (!handle_arch_irq)
 		panic("No interrupt controller found.");
 	sbi_ipi_init();
+
+	if (is_cove_guest()) {
+		/* FIXME: For now just allow all interrupts. */
+		ret = sbi_covg_allow_all_external_interrupt();
+
+		if (ret)
+			pr_err("Failed to allow external interrupts.\n");
+	}
 }
-- 
2.25.1


