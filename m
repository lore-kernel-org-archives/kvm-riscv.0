From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:15 -0700
Subject: [RFC 47/48] RISC-V: Add shared bounce buffer to support DBCN for CoVE Guest.
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-48-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Early console buffer needs to be shared with the host for CoVE Guest.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/tty/serial/earlycon-riscv-sbi.c | 51 ++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
index 311a4f8..9033cca 100644
--- a/drivers/tty/serial/earlycon-riscv-sbi.c
+++ b/drivers/tty/serial/earlycon-riscv-sbi.c
@@ -9,6 +9,14 @@
 #include <linux/init.h>
 #include <linux/serial_core.h>
 #include <asm/sbi.h>
+#include <asm/cove.h>
+#include <asm/covg_sbi.h>
+#include <linux/memblock.h>
+
+#ifdef CONFIG_RISCV_COVE_GUEST
+#define DBCN_BOUNCE_BUF_SIZE (PAGE_SIZE)
+static char dbcn_buf[DBCN_BOUNCE_BUF_SIZE] __aligned(PAGE_SIZE);
+#endif
 
 #ifdef CONFIG_RISCV_SBI_V01
 static void sbi_putc(struct uart_port *port, unsigned char c)
@@ -24,6 +32,33 @@ static void sbi_0_1_console_write(struct console *con,
 }
 #endif
 
+#ifdef CONFIG_RISCV_COVE_GUEST
+static void sbi_dbcn_console_write_cove(struct console *con, const char *s,
+					unsigned int n)
+{
+	phys_addr_t pa = __pa(dbcn_buf);
+	unsigned int off = 0;
+
+	while (off < n) {
+		const unsigned int rem = n - off;
+		const unsigned int size =
+			rem > DBCN_BOUNCE_BUF_SIZE ? DBCN_BOUNCE_BUF_SIZE : rem;
+
+		memcpy(dbcn_buf, &s[off], size);
+
+		sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
+#ifdef CONFIG_32BIT
+			  size, pa, (u64)pa >> 32,
+#else
+			  size, pa, 0,
+#endif
+			  0, 0, 0);
+
+		off += size;
+	}
+}
+#endif
+
 static void sbi_dbcn_console_write(struct console *con,
 				   const char *s, unsigned n)
 {
@@ -45,14 +80,26 @@ static int __init early_sbi_setup(struct earlycon_device *device,
 
 	/* TODO: Check for SBI debug console (DBCN) extension */
 	if ((sbi_spec_version >= sbi_mk_version(1, 0)) &&
-	    (sbi_probe_extension(SBI_EXT_DBCN) > 0))
+	    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
+#ifdef CONFIG_RISCV_COVE_GUEST
+		if (is_cove_guest()) {
+			ret = sbi_covg_share_memory(__pa(dbcn_buf),
+						    DBCN_BOUNCE_BUF_SIZE);
+			if (ret)
+				return ret;
+
+			device->con->write = sbi_dbcn_console_write_cove;
+			return 0;
+		}
+#endif
 		device->con->write = sbi_dbcn_console_write;
-	else
+	} else {
 #ifdef CONFIG_RISCV_SBI_V01
 		device->con->write = sbi_0_1_console_write;
 #else
 		ret = -ENODEV;
 #endif
+	}
 
 	return ret;
 }
-- 
2.25.1


