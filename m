From: Cade Richard <cade.richard@gmail.com>
Date: Wed, 03 Jul 2024 20:43:44 -0700
Subject: [PATCH kvm-unit-tests] This patch adds a unit test for the debug
 console write() and write_byte() functions. It also fixes the
 virt_to_phys() function to return the offset address, not the PTE aligned
 address.
Message-ID: <20240703-sbi-dbcn-write-v1-1-13f08380d768@berkeley.edu>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



---
Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
---
 riscv/run           |  1 +
 lib/riscv/asm/sbi.h |  5 ++++
 riscv/sbi.c         | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/riscv/run b/riscv/run
index 73f2bf54..e4e39d74 100755
--- a/riscv/run
+++ b/riscv/run
@@ -30,6 +30,7 @@ fi
 mach='-machine virt'
 
 command="$qemu -nodefaults -nographic -serial mon:stdio"
+
 command+=" $mach $acc $firmware -cpu $processor "
 command="$(migration_cmd) $(timeout_cmd) $command"
 
diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index d82a384d..4ae15879 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -12,6 +12,11 @@
 #define SBI_ERR_ALREADY_STARTED		-7
 #define SBI_ERR_ALREADY_STOPPED		-8
 
+#define DBCN_WRITE_TEST_STRING "DBCN_WRITE_TEST_STRING\n"
+#define DBCN_READ_TEST_STRING "DBCN_READ_TEST_STRING\n"
+#define DBCN_WRITE_BYTE_TEST_BYTE 'a'
+#define DBCN_WRITE_TEST_BYTE_FLAG "DBCN_WRITE_TEST_CHAR: "
+
 #ifndef __ASSEMBLY__
 
 enum sbi_ext_id {
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 762e9711..0fb7a300 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -7,6 +7,11 @@
 #include <libcflat.h>
 #include <stdlib.h>
 #include <asm/sbi.h>
+#include <asm/csr.h>
+#include <asm/io.h>
+#include <asm/sbi.h>
+
+#define INVALID_RW_ADDR 0x0000000002000000;
 
 static void help(void)
 {
@@ -112,6 +117,72 @@ static void check_base(void)
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
+	report_prefix_pop();
+
+	report_prefix_push("write");
+	
+	num_bytes = strlen(DBCN_WRITE_TEST_STRING);
+	base_addr_hi = 0x0;
+	base_addr_lo = virt_to_phys((void *) &DBCN_WRITE_TEST_STRING);
+
+	do {
+		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
+	} while (ret.value != num_bytes || ret.error != SBI_SUCCESS) ;
+	report(SBI_SUCCESS == ret.error, "write success");
+    report(ret.value == num_bytes, "correct number of bytes written");
+
+	base_addr_lo = INVALID_RW_ADDR;
+	ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
+    report(SBI_ERR_INVALID_PARAM == ret.error, "invalid parameter: address");
+
+	report_prefix_pop();
+	
+	report_prefix_push("read");
+
+/*	num_bytes = strlen(DBCN_READ_TEST_STRING);
+	char *actual = malloc(num_bytes);
+	base_addr_hi = 0x0;
+	base_addr_lo = virt_to_phys(( void *) actual);
+
+	do {
+		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_READ, num_bytes, base_addr_lo, base_addr_hi);
+	} while (ret.value != num_bytes || ret.error != SBI_SUCCESS) ;
+	report(SBI_SUCCESS == ret.error, "read success");
+    report(ret.value == num_bytes, "correct number of bytes read");
+	report(strcmp(actual,DBCN_READ_TEST_STRING) == 0, "correct bytes read");
+*/
+	base_addr_lo = INVALID_RW_ADDR;
+    ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_READ, num_bytes, base_addr_lo, base_addr_hi);
+    report(SBI_ERR_INVALID_PARAM == ret.error, "invalid parameter: address");
+
+	report_prefix_pop();
+	
+	report_prefix_push("write_byte");
+
+	puts(DBCN_WRITE_TEST_BYTE_FLAG);
+	ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, (u8) DBCN_WRITE_BYTE_TEST_BYTE, 0, 0);
+	puts("\n");
+    report(SBI_SUCCESS == ret.error, "write success");
+    report(0 == ret.value, "expected ret.value");
+
+	report_prefix_pop();
+}
+
 int main(int argc, char **argv)
 {
 

---
base-commit: a68956b3fb6f5f308822b20ce0ff8e02db1f7375
change-id: 20240703-sbi-dbcn-write-894334156f6f

Best regards,
-- 
Cade Richard <cade.richard@berkeley.edu>


