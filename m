From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 16:13:59 +0200
Subject: [kvm-unit-tests PATCH 4/4] riscv: sbi: dbcn: Add high address tests
In-Reply-To: <20240812141354.119889-6-andrew.jones@linux.dev>
References: <20240812141354.119889-6-andrew.jones@linux.dev>
Message-ID: <20240812141354.119889-10-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On platforms where we have high memory (above 4G) such as on the QEMU
virt machine model with over 2G of RAM configured, then we can test
DBCN with addresses above 4G on 32-bit and on both 32-bit and 64-bit
we can try crossing page boundaries both below 4G and from below 4G
into 4G. Add those tests along with a bit of refactoring and the
introduction of a couple helpers to find and check high addresses.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 134 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 116 insertions(+), 18 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 3f7ca6a78cfc..4f1e65dd3be6 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -5,18 +5,25 @@
  * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
  */
 #include <libcflat.h>
+#include <alloc_page.h>
 #include <stdlib.h>
+#include <string.h>
 #include <limits.h>
+#include <vmalloc.h>
+#include <memregions.h>
 #include <asm/barrier.h>
 #include <asm/csr.h>
 #include <asm/delay.h>
 #include <asm/io.h>
 #include <asm/isa.h>
+#include <asm/mmu.h>
 #include <asm/processor.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
 #include <asm/timer.h>
 
+#define	HIGH_ADDR_BOUNDARY	((phys_addr_t)1 << 32)
+
 static void help(void)
 {
 	puts("Test SBI\n");
@@ -46,6 +53,25 @@ static void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long
 		*hi = (unsigned long)(paddr >> 32);
 }
 
+static bool check_addr(phys_addr_t start, phys_addr_t size)
+{
+	struct mem_region *r = memregions_find(start);
+	return r && r->end - start >= size && r->flags == MR_F_UNUSED;
+}
+
+static phys_addr_t get_highest_addr(void)
+{
+	phys_addr_t highest_end = 0;
+	struct mem_region *r;
+
+	for (r = mem_regions; r->end; ++r) {
+		if (r->end > highest_end)
+			highest_end = r->end;
+	}
+
+	return highest_end - 1;
+}
+
 static bool env_or_skip(const char *env)
 {
 	if (!getenv(env)) {
@@ -266,16 +292,60 @@ static void check_time(void)
 #define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
 #define DBCN_WRITE_BYTE_TEST_BYTE	(u8)'a'
 
+static void dbcn_write_test(const char *s, unsigned long num_bytes)
+{
+	unsigned long base_addr_lo, base_addr_hi;
+	phys_addr_t paddr = virt_to_phys((void *)s);
+	int num_calls = 0;
+	struct sbiret ret;
+
+	split_phys_addr(paddr, &base_addr_hi, &base_addr_lo);
+
+	do {
+		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
+		num_bytes -= ret.value;
+		paddr += ret.value;
+		split_phys_addr(paddr, &base_addr_hi, &base_addr_lo);
+		num_calls++;
+	} while (num_bytes != 0 && ret.error == SBI_SUCCESS);
+
+	report(ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
+	report_info("%d sbi calls made", num_calls);
+}
+
+static void dbcn_high_write_test(const char *s, unsigned long num_bytes,
+				 phys_addr_t page_addr, size_t page_offset)
+{
+	int nr_pages = page_offset ? 2 : 1;
+	void *vaddr;
+
+	if (page_addr != PAGE_ALIGN(page_addr) || page_addr + PAGE_SIZE < HIGH_ADDR_BOUNDARY ||
+	    !check_addr(page_addr, nr_pages * PAGE_SIZE)) {
+		report_skip("Memory above 4G required");
+		return;
+	}
+
+	vaddr = alloc_vpages(nr_pages);
+
+	for (int i = 0; i < nr_pages; ++i)
+		install_page(current_pgtable(), page_addr + i * PAGE_SIZE, vaddr + i * PAGE_SIZE);
+	memcpy(vaddr + page_offset, DBCN_WRITE_TEST_STRING, num_bytes);
+	dbcn_write_test(vaddr + page_offset, num_bytes);
+}
+
 /*
  * Only the write functionality is tested here. There's no easy way to
  * non-interactively test the read functionality.
  */
 static void check_dbcn(void)
 {
-	unsigned long num_bytes, base_addr_lo, base_addr_hi;
+	unsigned long num_bytes = strlen(DBCN_WRITE_TEST_STRING);
+	unsigned long base_addr_lo, base_addr_hi;
+	bool do_invalid_addr = false;
 	phys_addr_t paddr;
-	int num_calls = 0;
 	struct sbiret ret;
+	const char *tmp;
+	char *buf;
 
 	report_prefix_push("dbcn");
 
@@ -286,33 +356,61 @@ static void check_dbcn(void)
 		return;
 	}
 
-	num_bytes = strlen(DBCN_WRITE_TEST_STRING);
-	paddr = virt_to_phys((void *)&DBCN_WRITE_TEST_STRING);
-	split_phys_addr(paddr, &base_addr_hi, &base_addr_lo);
-
 	report_prefix_push("write");
 
-	do {
-		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, num_bytes, base_addr_lo, base_addr_hi);
-		num_bytes -= ret.value;
-		paddr += ret.value;
-		split_phys_addr(paddr, &base_addr_hi, &base_addr_lo);
-		num_calls++;
-	} while (num_bytes != 0 && ret.error == SBI_SUCCESS);
+	dbcn_write_test(DBCN_WRITE_TEST_STRING, num_bytes);
 
-	report(ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
-	report_info("%d sbi calls made", num_calls);
+	assert(num_bytes < PAGE_SIZE);
+
+	report_prefix_push("page boundary");
+	buf = alloc_pages(1);
+	memcpy(&buf[PAGE_SIZE - num_bytes / 2], DBCN_WRITE_TEST_STRING, num_bytes);
+	dbcn_write_test(&buf[PAGE_SIZE - num_bytes / 2], num_bytes);
+	report_prefix_pop();
+
+	report_prefix_push("high boundary");
+	tmp = getenv("SBI_DBCN_SKIP_HIGH_BOUNDARY");
+	if (!tmp || atol(tmp) == 0)
+		dbcn_high_write_test(DBCN_WRITE_TEST_STRING, num_bytes,
+				     HIGH_ADDR_BOUNDARY - PAGE_SIZE, PAGE_SIZE - num_bytes / 2);
+	else
+		report_skip("user disabled");
+	report_prefix_pop();
+
+	if (__riscv_xlen == 32) {
+		report_prefix_push("high page");
+		tmp = getenv("SBI_DBCN_SKIP_HIGH_PAGE");
+		if (!tmp || atol(tmp) == 0) {
+			paddr = HIGH_ADDR_BOUNDARY;
+			tmp = getenv("HIGH_PAGE");
+			if (tmp)
+				paddr = strtoull(tmp, NULL, 0);
+			dbcn_high_write_test(DBCN_WRITE_TEST_STRING, num_bytes, paddr, 0);
+		} else {
+			report_skip("user disabled");
+		}
+		report_prefix_pop();
+	}
 
 	/* Bytes are read from memory and written to the console */
-	if (env_or_skip("INVALID_ADDR")) {
+	report_prefix_push("invalid parameter");
+	tmp = getenv("INVALID_ADDR_AUTO");
+	if (tmp && atol(tmp) == 1) {
+		paddr = get_highest_addr() + 1;
+		do_invalid_addr = true;
+	} else if (env_or_skip("INVALID_ADDR")) {
 		paddr = strtoull(getenv("INVALID_ADDR"), NULL, 0);
+		do_invalid_addr = true;
+	}
+
+	if (do_invalid_addr) {
 		split_phys_addr(paddr, &base_addr_hi, &base_addr_lo);
 		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, 1, base_addr_lo, base_addr_hi);
-		report(ret.error == SBI_ERR_INVALID_PARAM, "invalid parameter: address (error=%ld)", ret.error);
+		report(ret.error == SBI_ERR_INVALID_PARAM, "address (error=%ld)", ret.error);
 	}
-
 	report_prefix_pop();
 
+	report_prefix_pop();
 	report_prefix_push("write_byte");
 
 	puts("DBCN_WRITE TEST CHAR: ");
-- 
2.45.2


