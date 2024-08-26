From: Cade Richard <cade.richard@gmail.com>
Date: Sun, 25 Aug 2024 22:33:09 -0700
Subject: [kvm-unit-tests PATCH] Added prefix pop at bottom of DBCN test function.
Message-ID: <20240826053309.10802-1-cade.richard@berkeley.edu>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Added report prefix pop at bottom of DBCN test function.

Fixes: https://lore.kernel.org/kvm/20240812141354.119889-10-andrew.jones at linux.dev/#t

Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
---
 riscv/sbi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 36ddfd48..01697aed 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -418,6 +418,7 @@ static void check_dbcn(void)
 	report(ret.value == 0, "expected ret.value (%ld)", ret.value);
 
 	report_prefix_pop();
+	report_prefix_pop();
 }
 
 int main(int argc, char **argv)
-- 
2.43.0


