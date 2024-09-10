From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Tue, 10 Sep 2024 23:08:42 +0800
Subject: [kvm-unit-tests PATCH 2/2] riscv: sbi: Tidy up report prefix pops
In-Reply-To: <20240910150842.156949-1-jamestiotio@gmail.com>
References: <20240910150842.156949-1-jamestiotio@gmail.com>
Message-ID: <20240910150842.156949-3-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace multiple consecutive calls of the `report_prefix_pop` function
with the new `report_prefix_popn` function.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 riscv/sbi.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 093c20a0..f88bf700 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -140,8 +140,7 @@ static void check_base(void)
 	report_prefix_push("unavailable");
 	ret = sbi_base(SBI_EXT_BASE_PROBE_EXT, 0xb000000);
 	gen_report(&ret, 0, 0);
-	report_prefix_pop();
-	report_prefix_pop();
+	report_prefix_popn(2);
 
 	report_prefix_push("mvendorid");
 	if (env_or_skip("MVENDORID")) {
@@ -166,9 +165,7 @@ static void check_base(void)
 		ret = sbi_base(SBI_EXT_BASE_GET_MIMPID, 0);
 		gen_report(&ret, 0, expected);
 	}
-	report_prefix_pop();
-
-	report_prefix_pop();
+	report_prefix_popn(2);
 }
 
 struct timer_info {
@@ -281,8 +278,7 @@ static void check_time(void)
 	local_irq_disable();
 	install_irq_handler(IRQ_S_TIMER, NULL);
 
-	report_prefix_pop();
-	report_prefix_pop();
+	report_prefix_popn(2);
 }
 
 #define DBCN_WRITE_TEST_STRING		"DBCN_WRITE_TEST_STRING\n"
@@ -401,9 +397,7 @@ static void check_dbcn(void)
 		ret = sbi_dbcn_write(1, base_addr_lo, base_addr_hi);
 		report(ret.error == SBI_ERR_INVALID_PARAM, "address (error=%ld)", ret.error);
 	}
-	report_prefix_pop();
-
-	report_prefix_pop();
+	report_prefix_popn(2);
 	report_prefix_push("write_byte");
 
 	puts("DBCN_WRITE_BYTE TEST BYTE: ");
@@ -418,8 +412,7 @@ static void check_dbcn(void)
 	report(ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
 	report(ret.value == 0, "expected ret.value (%ld)", ret.value);
 
-	report_prefix_pop();
-	report_prefix_pop();
+	report_prefix_popn(2);
 }
 
 int main(int argc, char **argv)
-- 
2.43.0


