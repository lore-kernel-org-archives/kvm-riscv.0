From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Oct 2023 10:45:06 +0530
Subject: [PATCH v2 5/8] RISC-V: Add inline version of sbi_console_putchar/getchar() functions
In-Reply-To: <20231012051509.738750-1-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
Message-ID: <20231012051509.738750-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The functions sbi_console_putchar() and sbi_console_getchar() are
not defined when CONFIG_RISCV_SBI_V01 is disabled so let us add
inline version of these functions to avoid "#ifdef" on user side.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 12dfda6bb924..cbcefa344417 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -271,8 +271,13 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
+#ifdef CONFIG_RISCV_SBI_V01
 void sbi_console_putchar(int ch);
 int sbi_console_getchar(void);
+#else
+static inline void sbi_console_putchar(int ch) { }
+static inline int sbi_console_getchar(void) { return -1; }
+#endif
 long sbi_get_mvendorid(void);
 long sbi_get_marchid(void);
 long sbi_get_mimpid(void);
-- 
2.34.1


