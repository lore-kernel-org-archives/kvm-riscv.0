From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 16:13:58 +0200
Subject: [kvm-unit-tests PATCH 3/4] riscv: sbi: Prefix several environment variables with SBI
In-Reply-To: <20240812141354.119889-6-andrew.jones@linux.dev>
References: <20240812141354.119889-6-andrew.jones@linux.dev>
Message-ID: <20240812141354.119889-9-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Unit tests will likely share the environ so prefix variables that
are specific to specific tests to avoid polluting the name space.
We don't prefix generic stuff since they could be used by any test.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 7b63a97deda6..3f7ca6a78cfc 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -84,30 +84,30 @@ static void check_base(void)
 	}
 
 	report_prefix_push("spec_version");
-	if (env_or_skip("SPEC_VERSION")) {
-		expected = (long)strtoul(getenv("SPEC_VERSION"), NULL, 0);
+	if (env_or_skip("SBI_SPEC_VERSION")) {
+		expected = (long)strtoul(getenv("SBI_SPEC_VERSION"), NULL, 0);
 		gen_report(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
 	report_prefix_push("impl_id");
-	if (env_or_skip("IMPL_ID")) {
-		expected = (long)strtoul(getenv("IMPL_ID"), NULL, 0);
+	if (env_or_skip("SBI_IMPL_ID")) {
+		expected = (long)strtoul(getenv("SBI_IMPL_ID"), NULL, 0);
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_IMP_ID, 0);
 		gen_report(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
 	report_prefix_push("impl_version");
-	if (env_or_skip("IMPL_VERSION")) {
-		expected = (long)strtoul(getenv("IMPL_VERSION"), NULL, 0);
+	if (env_or_skip("SBI_IMPL_VERSION")) {
+		expected = (long)strtoul(getenv("SBI_IMPL_VERSION"), NULL, 0);
 		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_IMP_VERSION, 0);
 		gen_report(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
 	report_prefix_push("probe_ext");
-	expected = getenv("PROBE_EXT") ? (long)strtoul(getenv("PROBE_EXT"), NULL, 0) : 1;
+	expected = getenv("SBI_PROBE_EXT") ? (long)strtoul(getenv("SBI_PROBE_EXT"), NULL, 0) : 1;
 	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE);
 	gen_report(&ret, 0, expected);
 	report_prefix_push("unavailable");
@@ -183,8 +183,8 @@ static void timer_check_set_timer(bool mask_timer_irq)
 	struct sbiret ret;
 	unsigned long begin, end, duration;
 	const char *mask_test_str = mask_timer_irq ? " for mask irq test" : "";
-	unsigned long d = getenv("TIMER_DELAY") ? strtol(getenv("TIMER_DELAY"), NULL, 0) : 200000;
-	unsigned long margin = getenv("TIMER_MARGIN") ? strtol(getenv("TIMER_MARGIN"), NULL, 0) : 200000;
+	unsigned long d = getenv("SBI_TIMER_DELAY") ? strtol(getenv("SBI_TIMER_DELAY"), NULL, 0) : 200000;
+	unsigned long margin = getenv("SBI_TIMER_MARGIN") ? strtol(getenv("SBI_TIMER_MARGIN"), NULL, 0) : 200000;
 
 	d = usec_to_cycles(d);
 	margin = usec_to_cycles(margin);
-- 
2.45.2


