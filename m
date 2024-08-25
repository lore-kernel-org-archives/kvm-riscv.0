From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 26 Aug 2024 01:08:23 +0800
Subject: [kvm-unit-tests PATCH v2 3/4] riscv: sbi: Add HSM extension functions
In-Reply-To: <20240825170824.107467-1-jamestiotio@gmail.com>
References: <20240825170824.107467-1-jamestiotio@gmail.com>
Message-ID: <20240825170824.107467-4-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add helper functions to perform hart-related operations to prepare for
the HSM tests. Also add the HSM state IDs and default suspend type
constants.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/sbi.h | 17 +++++++++++++++++
 lib/riscv/sbi.c     | 10 ++++++++++
 riscv/sbi.c         |  5 +++++
 3 files changed, 32 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index a864e268..4e48ceaa 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -48,6 +48,21 @@ enum sbi_ext_ipi_fid {
 	SBI_EXT_IPI_SEND_IPI = 0,
 };
 
+enum sbi_ext_hsm_sid {
+	SBI_EXT_HSM_STARTED = 0,
+	SBI_EXT_HSM_STOPPED,
+	SBI_EXT_HSM_START_PENDING,
+	SBI_EXT_HSM_STOP_PENDING,
+	SBI_EXT_HSM_SUSPENDED,
+	SBI_EXT_HSM_SUSPEND_PENDING,
+	SBI_EXT_HSM_RESUME_PENDING,
+};
+
+enum sbi_ext_hsm_hart_suspend_type {
+	SBI_EXT_HSM_HART_SUSPEND_RETENTIVE = 0,
+	SBI_EXT_HSM_HART_SUSPEND_NON_RETENTIVE = 0x80000000,
+};
+
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
 	SBI_EXT_DBCN_CONSOLE_READ,
@@ -66,6 +81,8 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 void sbi_shutdown(void);
 struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
+struct sbiret sbi_hart_stop(void);
+struct sbiret sbi_hart_get_status(unsigned long hartid);
 struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base);
 long sbi_probe(int ext);
 
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index 19d58ab7..256196b7 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -39,6 +39,16 @@ struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned
 	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START, hartid, entry, sp, 0, 0, 0);
 }
 
+struct sbiret sbi_hart_stop(void)
+{
+	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STOP, 0, 0, 0, 0, 0, 0);
+}
+
+struct sbiret sbi_hart_get_status(unsigned long hartid)
+{
+	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_STATUS, hartid, 0, 0, 0, 0, 0);
+}
+
 struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base)
 {
 	return sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI, hart_mask, hart_mask_base, 0, 0, 0, 0);
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 36ddfd48..6469304b 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -72,6 +72,11 @@ static phys_addr_t get_highest_addr(void)
 	return highest_end - 1;
 }
 
+static struct sbiret sbi_hart_suspend(uint32_t suspend_type, unsigned long resume_addr, unsigned long opaque)
+{
+	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND, suspend_type, resume_addr, opaque, 0, 0, 0);
+}
+
 static bool env_or_skip(const char *env)
 {
 	if (!getenv(env)) {
-- 
2.43.0


