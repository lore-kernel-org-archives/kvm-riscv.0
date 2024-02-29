From: cem@kernel.org <cem@kernel.org>
Date: Thu, 29 Feb 2024 13:42:12 +0100
Subject: [PATCH 6/6] riscv: Test for a SBI implementation ID range
In-Reply-To: <20240229124246.309304-1-cem@kernel.org>
References: <20240229124246.309304-1-cem@kernel.org>
Message-ID: <20240229124246.309304-7-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

This tests the SBI ID against SBI_IMPLID_MAX, so it can be used to test a SBI
against the available IDs from a specification version.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
---
 riscv/sbi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 9daab9dc..37f5680c 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -64,6 +64,14 @@ static void check_base(void)
 	}
 	report_prefix_pop();
 
+	report_prefix_push("sbi_impl_id_max");
+	if (env_is_defined("SBI_IMPLID_MAX")) {
+		expected = strtol(getenv("SBI_IMPLID_MAX"), NULL, 0);
+
+		gen_report(&ret, (ret.value <= expected));
+	}
+	report_prefix_pop();
+
 	report_prefix_push("probe_ext");
 	if (env_is_defined("PROBE_EXT")) {
 		expected = strtol(getenv("PROBE_EXT"), NULL, 0);
-- 
2.43.2


