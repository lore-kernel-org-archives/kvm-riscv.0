From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Tue, 10 Sep 2024 23:15:35 +0800
Subject: [kvm-unit-tests PATCH v3 1/2] riscv: sbi: Add HSM extension functions
In-Reply-To: <20240910151536.163830-1-jamestiotio@gmail.com>
References: <20240910151536.163830-1-jamestiotio@gmail.com>
Message-ID: <20240910151536.163830-2-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add helper functions to perform hart-related operations to prepare for
the HSM tests. Also add the HSM state IDs and default suspend type
constants.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/sbi.h | 17 +++++++++++++++++
 lib/riscv/sbi.c     | 10 ++++++++++
 riscv/sbi.c         |  5 +++++
 3 files changed, 32 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index e032444d..1319439b 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -49,6 +49,21 @@ enum sbi_ext_ipi_fid {
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
@@ -67,6 +82,8 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 void sbi_shutdown(void);
 struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
+struct sbiret sbi_hart_stop(void);
+struct sbiret sbi_hart_get_status(unsigned long hartid);
 struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base);
 struct sbiret sbi_send_ipi_cpu(int cpu);
 struct sbiret sbi_send_ipi_cpumask(const cpumask_t *mask);
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index ecc63acd..8972e765 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -42,6 +42,16 @@ struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned
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
index f88bf700..c9fbd6db 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -73,6 +73,11 @@ static phys_addr_t get_highest_addr(void)
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


