From: Cade Richard <cade.richard@gmail.com>
Date: Sat, 06 Jul 2024 16:55:46 -0700
Subject: [PATCH kvm-unit-tests v2] riscv: sbi: debug console write tests
Message-ID: <20240706-sbi-dbcn-write-tests-v2-1-a5dc6a749f4a@berkeley.edu>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



---
Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
---
Changes in v2:
- Added prefix pop to exit dbcn tests
- Link to v1: https://lore.kernel.org/r/20240706-sbi-dbcn-write-tests-v1-1-b754e51699f8 at berkeley.edu
---
 lib/riscv/asm/sbi.h |  7 +++++++
 riscv/sbi.c         | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index d82a384d..c5fa84ae 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -18,6 +18,7 @@ enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
+	SBI_EXT_DBCN = 0x4442434E,
 };
 
 enum sbi_ext_base_fid {
@@ -37,6 +38,12 @@ enum sbi_ext_hsm_fid {
 	SBI_EXT_HSM_HART_SUSPEND,
 };
 
+enum sbi_ext_dbcn_fid {
+	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
+	SBI_EXT_DBCN_CONSOLE_READ,
+	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE,
+};
+
 struct sbiret {
 	long error;
 	long value;
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 762e9711..18646842 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -7,6 +7,10 @@
 #include <libcflat.h>
 #include <stdlib.h>
 #include <asm/sbi.h>
+#include <asm/io.h>
+
+#define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
+#define DBCN_WRITE_BYTE_TEST_BYTE	(u8)'a'
 
 static void help(void)
 {
@@ -19,6 +23,11 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
 	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
 }
 
+static struct sbiret __dbcn_sbi_ecall(int fid, unsigned long arg0, unsigned long arg1, unsigned long arg2)
+{
+	return sbi_ecall(SBI_EXT_DBCN, fid, arg0, arg1, arg2, 0, 0, 0);
+}
+
 static bool env_or_skip(const char *env)
 {
 	if (!getenv(env)) {
@@ -112,6 +121,56 @@ static void check_base(void)
 	report_prefix_pop();
 }
 
+static void check_dbcn(void)
+{
+	
+	struct sbiret ret;
+	unsigned long num_bytes, base_addr_lo, base_addr_hi;
+
+	report_prefix_push("dbcn");
+	
+	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_DBCN);
+	if (!ret.value) {
+		report_skip("DBCN extension unavailable");
+		report_prefix_pop();
+		return;
+	}
+
+	report_prefix_push("write");
+
+	num_bytes = strlen(DBCN_WRITE_TEST_STRING);
+	base_addr_hi = 0x0;
+	base_addr_lo = virt_to_phys((void *) &DBCN_WRITE_TEST_STRING);
+
+	do {
+		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
+		num_bytes -= ret.value;
+		base_addr_lo += ret.value;
+	} while (num_bytes != 0 && ret.error == SBI_SUCCESS) ;
+	report(SBI_SUCCESS == ret.error, "write success");
+	report(ret.value == num_bytes, "correct number of bytes written");
+
+	// Bytes are read from memory and written to the console
+	if (env_or_skip("INVALID_READ_ADDR")) {
+		base_addr_lo = strtol(getenv("INVALID_READ_ADDR"), NULL, 0);
+		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
+		report(ret.error == SBI_ERR_INVALID_PARAM, "invalid parameter: address");
+	};
+
+	report_prefix_pop();
+	
+	report_prefix_push("write_byte");
+
+	puts("DBCN_WRITE TEST CHAR: ");
+	ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, (u8)DBCN_WRITE_BYTE_TEST_BYTE, 0, 0);
+	puts("\n");
+	report(ret.error == SBI_SUCCESS, "write success");
+	report(ret.value == 0, "expected ret.value");
+
+	report_prefix_pop();
+	report_prefix_pop();
+}
+
 int main(int argc, char **argv)
 {
 
@@ -122,6 +181,7 @@ int main(int argc, char **argv)
 
 	report_prefix_push("sbi");
 	check_base();
+	check_dbcn();
 
 	return report_summary();
 }

---
base-commit: 40e1fd76ffc80b1d43214e31a023aaf087ece987
change-id: 20240706-sbi-dbcn-write-tests-42289f1391ed

Best regards,
-- 
Cade Richard <cade.richard@berkeley.edu>


