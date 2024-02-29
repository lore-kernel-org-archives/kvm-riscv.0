From: cem@kernel.org <cem@kernel.org>
Date: Thu, 29 Feb 2024 13:42:07 +0100
Subject: [PATCH 1/6] riscv: Add test to probe SBI Extension
In-Reply-To: <20240229124246.309304-1-cem@kernel.org>
References: <20240229124246.309304-1-cem@kernel.org>
Message-ID: <20240229124246.309304-2-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

Factor out vendor id test to a new helper, and add a new test for probing the
SBI extension.
Compare the retrieved value against an environment variable, as the
implementation can return any non-zero value.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
---
 riscv/sbi.c | 52 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index ffb07a25..9dc82ecb 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -14,28 +14,56 @@ static void help(void)
 	puts("An environ must be provided where expected values are given.\n");
 }
 
-int main(int argc, char **argv)
+static void check_base(void)
 {
 	struct sbiret ret;
 	long expected;
 
-	if (argc > 1 && !strcmp(argv[1], "-h")) {
-		help();
-		exit(0);
-	}
-
-	report_prefix_push("sbi");
+	report_prefix_push("base");
 
 	if (!getenv("MVENDORID")) {
 		report_skip("mvendorid: missing MVENDORID environment variable");
-		goto done;
+		return;
 	}
+
+	report_prefix_push("mvendorid");
 	expected = strtol(getenv("MVENDORID"), NULL, 0);
 
-	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0, 0, 0, 0, 0, 0);
-	report(!ret.error, "mvendorid: no error");
-	report(ret.value == expected, "mvendorid");
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID,
+			0, 0, 0, 0, 0, 0);
+
+	report(!ret.error, "no sbi.error");
+	report(ret.value == expected, "expected sbi.value");
+	report_prefix_pop();
+
+	if (!getenv("PROBE_EXT")) {
+		report_skip("probe_ext: missing PROBE_EXT environment variable");
+		return;
+	}
+
+	report_prefix_push("probe_ext");
+	expected = strtol(getenv("PROBE_EXT"), NULL, 0);
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT,
+			SBI_EXT_BASE, 0, 0, 0, 0, 0);
+
+	report(!ret.error, "no sbi.error");
+	report(ret.value == expected, "expected sbi.value");
+	report_prefix_pop();
+
+	report_prefix_pop();
+}
+
+int main(int argc, char **argv)
+{
+
+	if (argc > 1 && !strcmp(argv[1], "-h")) {
+		help();
+		exit(0);
+	}
+
+	report_prefix_push("sbi");
+	check_base();
 
-done:
 	return report_summary();
 }
-- 
2.43.2


