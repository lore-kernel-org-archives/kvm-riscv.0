From: cem@kernel.org <cem@kernel.org>
Date: Wed, 13 Mar 2024 15:53:28 +0100
Subject: [PATCH 5/6] riscv: Enable gen_report() to print the wrong value in case of failure
In-Reply-To: <20240313145336.311611-1-cem@kernel.org>
References: <20240313145336.311611-1-cem@kernel.org>
Message-ID: <20240313145336.311611-6-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

If the test fails because the expected value doesn't match, it's
useful to know what value was actually printed.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
---
V3:
	- Include expected error check in gen_report()
	- Implement Drew's suggestion on cleaning up the function a bit
	- Update patch to use __base_sbi_ecall()
V2:
	- Reduce subject to fit 70 chars
	- Use report_info() to output expected vs received values,
	  leaving only necessary information for parsers on report()

 riscv/sbi.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 56b27765..a4a16325 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -30,10 +30,18 @@ static bool env_or_skip(const char *env)
 	return true;
 }
 
-static void gen_report(struct sbiret *ret, long expected)
+static void gen_report(struct sbiret *ret,
+		       long expected_error, long expected_value)
 {
-	report(!ret->error, "no sbi.error");
-	report(ret->value == expected, "expected sbi.value");
+	bool check_error = ret->error == expected_error;
+	bool check_value = ret->value == expected_value;
+
+	if (!check_error || !check_value)
+		report_info("expected (error: %ld, value: %ld), received: (error: %ld, value %ld)\n",
+			    expected_error, expected_value, ret->error, ret->value);
+
+	report(check_error, "expected sbi.error");
+	report(check_value, "expected sbi.value");
 }
 
 static void check_base(void)
@@ -47,21 +55,21 @@ static void check_base(void)
 	if (env_or_skip("MVENDORID")) {
 		expected = strtol(getenv("MVENDORID"), NULL, 0);
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MVENDORID, 0);
-		gen_report(&ret, expected);
+		gen_report(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
 	report_prefix_push("probe_ext");
 	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
 	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, 0);
-	gen_report(&ret, expected);
+	gen_report(&ret, 0, expected);
 	report_prefix_pop();
 
 	report_prefix_push("marchid");
 	if (env_or_skip("MARCHID")) {
 		expected = strtol(getenv("MARCHID"), NULL, 0);
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MARCHID, 0);
-		gen_report(&ret, expected);
+		gen_report(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
-- 
2.44.0


