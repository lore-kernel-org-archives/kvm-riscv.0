From: Cade Richard <cade.richard@gmail.com>
Date: Tue, 06 Aug 2024 22:51:54 -0700
Subject: [PATCH kvm-unit-tests] riscv: sbi: add dbcn write test
Message-ID: <20240806-sbi-dbcn-write-test-v1-1-7f198bb55525@berkeley.edu>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



---
Added a unit test for the RISC-V SBI debug console write() and write_byte() functions. The output of the tests must be inspected manually to verify that the correct bytes are written. For write(), the expected output is 'DBCN_WRITE_TEST_STRING'. For write_byte(), the expected output is 'a'.

Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
---
 lib/riscv/asm/sbi.h |  7 ++++++
 riscv/sbi.c         | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 73ab5438..47e91025 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -19,6 +19,7 @@ enum sbi_ext_id {
 	SBI_EXT_TIME = 0x54494d45,
 	SBI_EXT_HSM = 0x48534d,
 	SBI_EXT_SRST = 0x53525354,
+	SBI_EXT_DBCN = 0x4442434E,
 };
 
 enum sbi_ext_base_fid {
@@ -42,6 +43,12 @@ enum sbi_ext_time_fid {
 	SBI_EXT_TIME_SET_TIMER = 0,
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
index 2438c497..61993f08 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -15,6 +15,10 @@
 #include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/timer.h>
+#include <asm/io.h>
+
+#define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
+#define DBCN_WRITE_BYTE_TEST_BYTE	(u8)'a'
 
 static void help(void)
 {
@@ -32,6 +36,11 @@ static struct sbiret __time_sbi_ecall(unsigned long stime_value)
 	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0, 0, 0, 0, 0);
 }
 
+static struct sbiret __dbcn_sbi_ecall(int fid, unsigned long arg0, unsigned long arg1, unsigned long arg2)
+{
+	return sbi_ecall(SBI_EXT_DBCN, fid, arg0, arg1, arg2, 0, 0, 0);
+}
+
 static bool env_or_skip(const char *env)
 {
 	if (!getenv(env)) {
@@ -248,6 +257,62 @@ static void check_time(void)
 	report_prefix_pop();
 }
 
+static void check_dbcn(void)
+{
+	
+	struct sbiret ret;
+	unsigned long num_bytes, base_addr_lo, base_addr_hi;
+	int num_calls = 0;
+	
+	num_bytes = strlen(DBCN_WRITE_TEST_STRING);
+	phys_addr_t p = virt_to_phys((void *)&DBCN_WRITE_TEST_STRING);
+	base_addr_lo = (unsigned long)p;
+	base_addr_hi = (unsigned long)(p >> __riscv_xlen);
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
+	do {
+		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
+		num_bytes -= ret.value;
+		base_addr_lo += ret.value;
+		num_calls++;
+	} while (num_bytes != 0 && ret.error == SBI_SUCCESS) ;
+	report(ret.error == SBI_SUCCESS, "write success");
+	report_info("%d sbi calls made", num_calls);
+	
+	/*
+		Bytes are read from memory and written to the console
+	*/
+	if (env_or_skip("INVALID_READ_ADDR")) {
+		phys_addr_t p = strtoull(getenv("INVALID_READ_ADDR"), NULL, 0);
+		base_addr_lo = (unsigned long)p;
+		base_addr_hi = (unsigned long)(p >> __riscv_xlen);
+		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, 1, base_addr_lo, base_addr_hi);
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
+}
+
 int main(int argc, char **argv)
 {
 
@@ -259,6 +324,7 @@ int main(int argc, char **argv)
 	report_prefix_push("sbi");
 	check_base();
 	check_time();
+	check_dbcn();
 
 	return report_summary();
 }

---
base-commit: 1878b4b663fd50b87de7ba2b1c90614e2703542f
change-id: 20240806-sbi-dbcn-write-test-70d305d511cf

Best regards,
-- 
Cade Richard <cade.richard@berkeley.edu>


