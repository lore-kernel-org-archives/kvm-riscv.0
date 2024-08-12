From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 16:13:57 +0200
Subject: [kvm-unit-tests PATCH 2/4] riscv: sbi: Use strtoul to avoid overflow
In-Reply-To: <20240812141354.119889-6-andrew.jones@linux.dev>
References: <20240812141354.119889-6-andrew.jones@linux.dev>
Message-ID: <20240812141354.119889-8-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We want to compare the expected values provided by environment
variables with signed long results, but we should parse those
values as unsigned as they may actually represent unsigned
numbers with the MSB set, and, if that's the case, then strtol
will assert when detecting the signed value overflow.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 2393929b965d..7b63a97deda6 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -85,14 +85,14 @@ static void check_base(void)
 
 	report_prefix_push("spec_version");
 	if (env_or_skip("SPEC_VERSION")) {
-		expected = strtol(getenv("SPEC_VERSION"), NULL, 0);
+		expected = (long)strtoul(getenv("SPEC_VERSION"), NULL, 0);
 		gen_report(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
 	report_prefix_push("impl_id");
 	if (env_or_skip("IMPL_ID")) {
-		expected = strtol(getenv("IMPL_ID"), NULL, 0);
+		expected = (long)strtoul(getenv("IMPL_ID"), NULL, 0);
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_IMP_ID, 0);
 		gen_report(&ret, 0, expected);
 	}
@@ -100,14 +100,14 @@ static void check_base(void)
 
 	report_prefix_push("impl_version");
 	if (env_or_skip("IMPL_VERSION")) {
-		expected = strtol(getenv("IMPL_VERSION"), NULL, 0);
+		expected = (long)strtoul(getenv("IMPL_VERSION"), NULL, 0);
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_IMP_VERSION, 0);
 		gen_report(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
 	report_prefix_push("probe_ext");
-	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
+	expected = getenv("PROBE_EXT") ? (long)strtoul(getenv("PROBE_EXT"), NULL, 0) : 1;
 	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE);
 	gen_report(&ret, 0, expected);
 	report_prefix_push("unavailable");
@@ -118,7 +118,8 @@ static void check_base(void)
 
 	report_prefix_push("mvendorid");
 	if (env_or_skip("MVENDORID")) {
-		expected = strtol(getenv("MVENDORID"), NULL, 0);
+		expected = (long)strtoul(getenv("MVENDORID"), NULL, 0);
+		assert(__riscv_xlen == 32 || !(expected >> 32));
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MVENDORID, 0);
 		gen_report(&ret, 0, expected);
 	}
@@ -126,7 +127,7 @@ static void check_base(void)
 
 	report_prefix_push("marchid");
 	if (env_or_skip("MARCHID")) {
-		expected = strtol(getenv("MARCHID"), NULL, 0);
+		expected = (long)strtoul(getenv("MARCHID"), NULL, 0);
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MARCHID, 0);
 		gen_report(&ret, 0, expected);
 	}
@@ -134,7 +135,7 @@ static void check_base(void)
 
 	report_prefix_push("mimpid");
 	if (env_or_skip("MIMPID")) {
-		expected = strtol(getenv("MIMPID"), NULL, 0);
+		expected = (long)strtoul(getenv("MIMPID"), NULL, 0);
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MIMPID, 0);
 		gen_report(&ret, 0, expected);
 	}
-- 
2.45.2


