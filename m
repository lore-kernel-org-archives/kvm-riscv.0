From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 24 Oct 2024 14:41:04 +0200
Subject: [kvm-unit-tests PATCH 2/3] riscv: sbi: Clean up env checking
In-Reply-To: <20241024124101.73405-5-andrew.jones@linux.dev>
References: <20241024124101.73405-5-andrew.jones@linux.dev>
Message-ID: <20241024124101.73405-7-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a couple helpers to cleanup checking of test configuration
environment variables.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index d46befa1c6c1..1e7314ec8d98 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -74,6 +74,20 @@ static phys_addr_t get_highest_addr(void)
 	return highest_end - 1;
 }
 
+static bool env_enabled(const char *env)
+{
+	char *s = getenv(env);
+
+	return s && (*s == '1' || *s == 'y' || *s == 'Y');
+}
+
+static bool env_disabled(const char *env)
+{
+	char *s = getenv(env);
+
+	return !(s && (*s == '0' || *s == 'n' || *s == 'N'));
+}
+
 static bool env_or_skip(const char *env)
 {
 	if (!getenv(env)) {
@@ -348,7 +362,6 @@ static void check_dbcn(void)
 	bool highmem_supported = true;
 	phys_addr_t paddr;
 	struct sbiret ret;
-	const char *tmp;
 	char *buf;
 
 	report_prefix_push("dbcn");
@@ -371,13 +384,11 @@ static void check_dbcn(void)
 	dbcn_write_test(&buf[PAGE_SIZE - num_bytes / 2], num_bytes, false);
 	report_prefix_pop();
 
-	tmp = getenv("SBI_HIGHMEM_NOT_SUPPORTED");
-	if (tmp && atol(tmp) != 0)
+	if (env_enabled("SBI_HIGHMEM_NOT_SUPPORTED"))
 		highmem_supported = false;
 
 	report_prefix_push("high boundary");
-	tmp = getenv("SBI_DBCN_SKIP_HIGH_BOUNDARY");
-	if (!tmp || atol(tmp) == 0)
+	if (env_disabled("SBI_DBCN_SKIP_HIGH_BOUNDARY"))
 		dbcn_high_write_test(DBCN_WRITE_TEST_STRING, num_bytes,
 				     HIGH_ADDR_BOUNDARY - PAGE_SIZE, PAGE_SIZE - num_bytes / 2,
 				     highmem_supported);
@@ -386,12 +397,8 @@ static void check_dbcn(void)
 	report_prefix_pop();
 
 	report_prefix_push("high page");
-	tmp = getenv("SBI_DBCN_SKIP_HIGH_PAGE");
-	if (!tmp || atol(tmp) == 0) {
-		paddr = HIGH_ADDR_BOUNDARY;
-		tmp = getenv("HIGH_PAGE");
-		if (tmp)
-			paddr = strtoull(tmp, NULL, 0);
+	if (env_disabled("SBI_DBCN_SKIP_HIGH_PAGE")) {
+		paddr = getenv("HIGH_PAGE") ? strtoull(getenv("HIGH_PAGE"), NULL, 0) : HIGH_ADDR_BOUNDARY;
 		dbcn_high_write_test(DBCN_WRITE_TEST_STRING, num_bytes, paddr, 0, highmem_supported);
 	} else {
 		report_skip("user disabled");
@@ -400,8 +407,7 @@ static void check_dbcn(void)
 
 	/* Bytes are read from memory and written to the console */
 	report_prefix_push("invalid parameter");
-	tmp = getenv("INVALID_ADDR_AUTO");
-	if (tmp && atol(tmp) == 1) {
+	if (env_enabled("INVALID_ADDR_AUTO")) {
 		paddr = get_highest_addr() + 1;
 		do_invalid_addr = true;
 	} else if (env_or_skip("INVALID_ADDR")) {
-- 
2.47.0


