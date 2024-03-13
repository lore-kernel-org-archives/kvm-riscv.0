From: cem@kernel.org <cem@kernel.org>
Date: Wed, 13 Mar 2024 09:46:23 +0100
Subject: [PATCH V2 5/6] riscv: Test for specific SBI implementation ID
In-Reply-To: <20240313084644.277426-1-cem@kernel.org>
References: <20240313084644.277426-1-cem@kernel.org>
Message-ID: <20240313084644.277426-6-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

Retrieve the ID from the SBI, and test it against the SBI_IMPLID
enviroment variable.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
V2:
	- Update commit description to fit 70 chars
	- Move sbi_ecall() after expected assignment to make consistent with
	  other tests

 riscv/sbi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index bc0f5c68..65492fd6 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -51,6 +51,15 @@ static void check_base(void)
 	}
 	report_prefix_pop();
 
+	report_prefix_push("sbi_impl_id");
+	if (env_or_skip("SBI_IMPLID")) {
+		expected = strtol(getenv("SBI_IMPLID"), NULL, 0);
+		ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_IMP_ID,
+				SBI_EXT_BASE, 0, 0, 0, 0, 0);
+		gen_report(&ret, 0, expected);
+	}
+	report_prefix_pop();
+
 	report_prefix_push("probe_ext");
 	expected = getenv("PROBE_EXT") ? strtol(getenv("PROBE_EXT"), NULL, 0) : 1;
 	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, SBI_EXT_BASE, 0, 0, 0, 0, 0);
-- 
2.44.0


