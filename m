From: cem@kernel.org <cem@kernel.org>
Date: Wed, 13 Mar 2024 15:53:25 +0100
Subject: [PATCH 2/6] riscv: Add test to probe SBI Extension
In-Reply-To: <20240313145336.311611-1-cem@kernel.org>
References: <20240313145336.311611-1-cem@kernel.org>
Message-ID: <20240313145336.311611-3-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

Factor out vendor id test to a new helper, and add a new test for
probing the SBI extension.
Compare the retrieved value against an environment variable, as the
implementation can return any non-zero value.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
---
V3:
	- Adapt patch to use __base_sbi_ecall

 riscv/sbi.c | 44 ++++++++++++++++++++++++++++++++------------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 48d0b06e..55bfcd42 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -19,29 +19,49 @@ static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
 	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
 }
 
-int main(int argc, char **argv)
-
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
 
 	ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MVENDORID, 0);
-	report(!ret.error, "mvendorid: no error");
-	report(ret.value == expected, "mvendorid");
 
-done:
+	report(!ret.error, "no sbi.error");
+	report(ret.value == expected, "expected sbi.value");
+	report_prefix_pop();
+
+	report_prefix_push("probe_ext");
+	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
+
+	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, 0);
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
+
 	return report_summary();
 }
-- 
2.44.0


