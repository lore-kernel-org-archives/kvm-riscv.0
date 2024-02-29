From: cem@kernel.org <cem@kernel.org>
Date: Thu, 29 Feb 2024 13:42:08 +0100
Subject: [PATCH 2/6] riscv: Factor out environment variable check
In-Reply-To: <20240229124246.309304-1-cem@kernel.org>
References: <20240229124246.309304-1-cem@kernel.org>
Message-ID: <20240229124246.309304-3-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

Environment variables are checked all the time, so use a helper for that

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
---
 riscv/sbi.c | 49 +++++++++++++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 9dc82ecb..636f907a 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -14,6 +14,23 @@ static void help(void)
 	puts("An environ must be provided where expected values are given.\n");
 }
 
+static bool env_is_defined(const char *env)
+{
+
+	if (!getenv(env)) {
+		report_skip("missing %s environment variable", env);
+		return false;
+	}
+
+	return true;
+}
+
+static void gen_report(struct sbiret *ret, long expected)
+{
+	report(!ret->error, "no sbi.error");
+	report(ret->value == expected, "expected sbi.value");
+}
+
 static void check_base(void)
 {
 	struct sbiret ret;
@@ -21,34 +38,26 @@ static void check_base(void)
 
 	report_prefix_push("base");
 
-	if (!getenv("MVENDORID")) {
-		report_skip("mvendorid: missing MVENDORID environment variable");
-		return;
-	}
-
 	report_prefix_push("mvendorid");
-	expected = strtol(getenv("MVENDORID"), NULL, 0);
+	if (env_is_defined("MVENDORID")) {
+		expected = strtol(getenv("MVENDORID"), NULL, 0);
 
-	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID,
-			0, 0, 0, 0, 0, 0);
+		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID,
+				0, 0, 0, 0, 0, 0);
 
-	report(!ret.error, "no sbi.error");
-	report(ret.value == expected, "expected sbi.value");
-	report_prefix_pop();
-
-	if (!getenv("PROBE_EXT")) {
-		report_skip("probe_ext: missing PROBE_EXT environment variable");
-		return;
+		gen_report(&ret, expected);
 	}
+	report_prefix_pop();
 
 	report_prefix_push("probe_ext");
-	expected = strtol(getenv("PROBE_EXT"), NULL, 0);
+	if (env_is_defined("PROBE_EXT")) {
+		expected = strtol(getenv("PROBE_EXT"), NULL, 0);
 
-	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
-			SBI_EXT_BASE, 0, 0, 0, 0, 0);
+		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
+				SBI_EXT_BASE, 0, 0, 0, 0, 0);
 
-	report(!ret.error, "no sbi.error");
-	report(ret.value == expected, "expected sbi.value");
+		gen_report(&ret, expected);
+	}
 	report_prefix_pop();
 
 	report_prefix_pop();
-- 
2.43.2


