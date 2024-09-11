From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 13:33:40 +0200
Subject: [kvm-unit-tests PATCH 1/2] riscv: sbi: Highmem isn't always supported
In-Reply-To: <20240911113338.156844-4-andrew.jones@linux.dev>
References: <20240911113338.156844-4-andrew.jones@linux.dev>
Message-ID: <20240911113338.156844-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When an SBI implementation has opted not to support memory accesses
above 4G (highmem), such as 32-bit OpenSBI, then report failures to
access that memory as "expected failures". Use yet another
environment variable to inform the testsuite of this SBI
implementation behavior.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 093c20a096da..300d5ae63084 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -288,7 +288,7 @@ static void check_time(void)
 #define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
 #define DBCN_WRITE_BYTE_TEST_BYTE	((u8)'a')
 
-static void dbcn_write_test(const char *s, unsigned long num_bytes)
+static void dbcn_write_test(const char *s, unsigned long num_bytes, bool xfail)
 {
 	unsigned long base_addr_lo, base_addr_hi;
 	phys_addr_t paddr = virt_to_phys((void *)s);
@@ -305,12 +305,13 @@ static void dbcn_write_test(const char *s, unsigned long num_bytes)
 		num_calls++;
 	} while (num_bytes != 0 && ret.error == SBI_SUCCESS);
 
-	report(ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
+	report_xfail(xfail, ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
 	report_info("%d sbi calls made", num_calls);
 }
 
 static void dbcn_high_write_test(const char *s, unsigned long num_bytes,
-				 phys_addr_t page_addr, size_t page_offset)
+				 phys_addr_t page_addr, size_t page_offset,
+				 bool highmem_supported)
 {
 	int nr_pages = page_offset ? 2 : 1;
 	void *vaddr;
@@ -326,7 +327,7 @@ static void dbcn_high_write_test(const char *s, unsigned long num_bytes,
 	for (int i = 0; i < nr_pages; ++i)
 		install_page(current_pgtable(), page_addr + i * PAGE_SIZE, vaddr + i * PAGE_SIZE);
 	memcpy(vaddr + page_offset, DBCN_WRITE_TEST_STRING, num_bytes);
-	dbcn_write_test(vaddr + page_offset, num_bytes);
+	dbcn_write_test(vaddr + page_offset, num_bytes, !highmem_supported);
 }
 
 /*
@@ -338,6 +339,7 @@ static void check_dbcn(void)
 	unsigned long num_bytes = strlen(DBCN_WRITE_TEST_STRING);
 	unsigned long base_addr_lo, base_addr_hi;
 	bool do_invalid_addr = false;
+	bool highmem_supported = true;
 	phys_addr_t paddr;
 	struct sbiret ret;
 	const char *tmp;
@@ -353,21 +355,26 @@ static void check_dbcn(void)
 
 	report_prefix_push("write");
 
-	dbcn_write_test(DBCN_WRITE_TEST_STRING, num_bytes);
+	dbcn_write_test(DBCN_WRITE_TEST_STRING, num_bytes, false);
 
 	assert(num_bytes < PAGE_SIZE);
 
 	report_prefix_push("page boundary");
 	buf = alloc_pages(1);
 	memcpy(&buf[PAGE_SIZE - num_bytes / 2], DBCN_WRITE_TEST_STRING, num_bytes);
-	dbcn_write_test(&buf[PAGE_SIZE - num_bytes / 2], num_bytes);
+	dbcn_write_test(&buf[PAGE_SIZE - num_bytes / 2], num_bytes, false);
 	report_prefix_pop();
 
+	tmp = getenv("SBI_HIGHMEM_NOT_SUPPORTED");
+	if (tmp && atol(tmp) != 0)
+		highmem_supported = false;
+
 	report_prefix_push("high boundary");
 	tmp = getenv("SBI_DBCN_SKIP_HIGH_BOUNDARY");
 	if (!tmp || atol(tmp) == 0)
 		dbcn_high_write_test(DBCN_WRITE_TEST_STRING, num_bytes,
-				     HIGH_ADDR_BOUNDARY - PAGE_SIZE, PAGE_SIZE - num_bytes / 2);
+				     HIGH_ADDR_BOUNDARY - PAGE_SIZE, PAGE_SIZE - num_bytes / 2,
+				     highmem_supported);
 	else
 		report_skip("user disabled");
 	report_prefix_pop();
@@ -379,7 +386,7 @@ static void check_dbcn(void)
 		tmp = getenv("HIGH_PAGE");
 		if (tmp)
 			paddr = strtoull(tmp, NULL, 0);
-		dbcn_high_write_test(DBCN_WRITE_TEST_STRING, num_bytes, paddr, 0);
+		dbcn_high_write_test(DBCN_WRITE_TEST_STRING, num_bytes, paddr, 0, highmem_supported);
 	} else {
 		report_skip("user disabled");
 	}
-- 
2.46.0


