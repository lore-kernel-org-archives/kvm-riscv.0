From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Mon, 26 Aug 2024 01:08:22 +0800
Subject: [kvm-unit-tests PATCH v2 2/4] riscv: sbi: Add IPI extension support
In-Reply-To: <20240825170824.107467-1-jamestiotio@gmail.com>
References: <20240825170824.107467-1-jamestiotio@gmail.com>
Message-ID: <20240825170824.107467-3-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add IPI EID and FID constants and a helper function to perform the IPI
SBI ecall.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/sbi.h | 6 ++++++
 lib/riscv/sbi.c     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 47e91025..a864e268 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -17,6 +17,7 @@
 enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
 	SBI_EXT_TIME = 0x54494d45,
+	SBI_EXT_IPI = 0x735049,
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
 	SBI_EXT_DBCN = 0x4442434E,
@@ -43,6 +44,10 @@ enum sbi_ext_time_fid {
 	SBI_EXT_TIME_SET_TIMER = 0,
 };
 
+enum sbi_ext_ipi_fid {
+	SBI_EXT_IPI_SEND_IPI = 0,
+};
+
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
 	SBI_EXT_DBCN_CONSOLE_READ,
@@ -61,6 +66,7 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 void sbi_shutdown(void);
 struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
+struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base);
 long sbi_probe(int ext);
 
 #endif /* !__ASSEMBLY__ */
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index 3d4236e5..19d58ab7 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -39,6 +39,11 @@ struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned
 	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START, hartid, entry, sp, 0, 0, 0);
 }
 
+struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base)
+{
+	return sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI, hart_mask, hart_mask_base, 0, 0, 0, 0);
+}
+
 long sbi_probe(int ext)
 {
 	struct sbiret ret;
-- 
2.43.0


