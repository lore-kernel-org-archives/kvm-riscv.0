From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed,  6 Nov 2024 09:39:27 +0100
Subject: [kvm-unit-tests PATCH v2] riscv: sbi: Improve spec version test
Message-ID: <20241106083926.14595-2-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI spec version states that bit 31 must be zero and, when xlen
is greater than 32, that bit 32 and higher must be zero. Check
these bits are zero in the expected value to ensure we test
appropriately.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/sbi.c |  2 +-
 riscv/sbi.c     | 13 +++++++++----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index 8972e765fea2..f25bde169490 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -107,7 +107,7 @@ long sbi_probe(int ext)
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_SPEC_VERSION, 0, 0, 0, 0, 0, 0);
-	assert(!ret.error && ret.value >= 2);
+	assert(!ret.error && (ret.value & 0x7ffffffful) >= 2);
 
 	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, ext, 0, 0, 0, 0, 0);
 	assert(!ret.error);
diff --git a/riscv/sbi.c b/riscv/sbi.c
index 52434e0ca86f..c081953c877c 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -105,18 +105,23 @@ static void check_base(void)
 	report_prefix_push("base");
 
 	ret = sbi_base(SBI_EXT_BASE_GET_SPEC_VERSION, 0);
-	if (ret.error || ret.value < 2) {
-		report_skip("SBI spec version 0.2 or higher required");
-		return;
-	}
 
 	report_prefix_push("spec_version");
 	if (env_or_skip("SBI_SPEC_VERSION")) {
 		expected = (long)strtoul(getenv("SBI_SPEC_VERSION"), NULL, 0);
+		assert_msg(!(expected & BIT(31)), "SBI spec version bit 31 must be zero");
+		assert_msg(__riscv_xlen == 32 || !(expected >> 32), "SBI spec version bits greater than 31 must be zero");
 		gen_report(&ret, 0, expected);
 	}
 	report_prefix_pop();
 
+	ret.value &= 0x7ffffffful;
+
+	if (ret.error || ret.value < 2) {
+		report_skip("SBI spec version 0.2 or higher required");
+		return;
+	}
+
 	report_prefix_push("impl_id");
 	if (env_or_skip("SBI_IMPL_ID")) {
 		expected = (long)strtoul(getenv("SBI_IMPL_ID"), NULL, 0);
-- 
2.47.0


