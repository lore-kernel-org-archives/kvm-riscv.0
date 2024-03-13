From: cem@kernel.org <cem@kernel.org>
Date: Wed, 13 Mar 2024 15:53:29 +0100
Subject: [PATCH 6/6] riscv: Test for specific SBI implementation ID
In-Reply-To: <20240313145336.311611-1-cem@kernel.org>
References: <20240313145336.311611-1-cem@kernel.org>
Message-ID: <20240313145336.311611-7-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

Retrieve the ID from the SBI, and test it against IMPL_ID
enviroment variable.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
---
V3:
	- Update to use __base_sbi_ecall (also fixes the correct paramenters)
	- Rename env var to IMPL_ID to match the other tests
V2:
	- Update commit description to fit 70 chars
	- Move sbi_ecall() after expected assignment to make consistent with
	  other tests

 riscv/sbi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index a4a16325..8a624655 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -59,6 +59,14 @@ static void check_base(void)
 	}
 	report_prefix_pop();
 
+	report_prefix_push("impl_id");
+	if (env_or_skip("IMPL_ID")) {
+		expected = strtol(getenv("IMPL_ID"), NULL, 0);
+		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID, 0, 0, 0, 0, 0, 0);
+		gen_report(&ret, 0, expected);
+	}
+	report_prefix_pop();
+
 	report_prefix_push("probe_ext");
 	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
 	ret = __base_sbi_ecall(SBI_EXT_BASE_PROBE_EXT, 0);
-- 
2.44.0


