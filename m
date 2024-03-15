From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 15 Mar 2024 14:32:46 +0100
Subject: [kvm-unit-tests PATCH 1/2] riscv: sbi: Check and test spec version
In-Reply-To: <20240315133244.579425-4-ajones@ventanamicro.com>
References: <20240315133244.579425-4-ajones@ventanamicro.com>
Message-ID: <20240315133244.579425-5-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The base extension tests are only valid for spec versions 0.2 and
later, so ensure we have that before proceeding. Also check the
spec version matches an expected value, as we do the other functions.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/sbi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index cd36290ce11e..707ce8dd1c57 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -50,6 +50,19 @@ static void check_base(void)
 
 	report_prefix_push("base");
 
+	ret = __base_sbi_ecall(SBI_EXT_BASE_GET_SPEC_VERSION, 0);
+	if (ret.error || ret.value < 2) {
+		report_skip("SBI spec version 0.2 or higher required");
+		return;
+	}
+
+	report_prefix_push("spec_version");
+	if (env_or_skip("SPEC_VERSION")) {
+		expected = strtol(getenv("SPEC_VERSION"), NULL, 0);
+		gen_report(&ret, 0, expected);
+	}
+	report_prefix_pop();
+
 	report_prefix_push("impl_id");
 	if (env_or_skip("IMPL_ID")) {
 		expected = strtol(getenv("IMPL_ID"), NULL, 0);
-- 
2.44.0


