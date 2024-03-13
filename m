From: cem@kernel.org <cem@kernel.org>
Date: Wed, 13 Mar 2024 22:50:55 +0100
Subject: [PATCH 4/6] riscv: Implement test for architecture ID register
In-Reply-To: <20240313215106.325766-1-cem@kernel.org>
References: <20240313215106.325766-1-cem@kernel.org>
Message-ID: <20240313215106.325766-5-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

Probe the MARCHID register and compare it to the specified MARCHID
environment variable.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/sbi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 6be78dae..f33c19f4 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -56,6 +56,14 @@ static void check_base(void)
 	gen_report(&ret, expected);
 	report_prefix_pop();
 
+	report_prefix_push("marchid");
+	if (env_or_skip("MARCHID")) {
+		expected = strtol(getenv("MARCHID"), NULL, 0);
+		ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MARCHID, 0);
+		gen_report(&ret, expected);
+	}
+	report_prefix_pop();
+
 	report_prefix_pop();
 }
 
-- 
2.44.0


