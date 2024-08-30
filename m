From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 30 Aug 2024 12:20:08 +0200
Subject: [kvm-unit-tests PATCH] riscv: Fix argc
Message-ID: <20240830102007.2206384-2-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

__argc is 32 bits so even rv64 should load it with lw, not just rv32.
This fixes odd behavior such as getting false when testing argc < 2
even though we know argc should be 1. argc < 2 being false comes from
the register comparison using the full register width and the upper
32 bits being loaded with junk.

Fixes: bd744d465910 ("riscv: Initial port, hello world")
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/cstart.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/cstart.S b/riscv/cstart.S
index d5d8ad253748..a9ac72df4dd2 100644
--- a/riscv/cstart.S
+++ b/riscv/cstart.S
@@ -93,7 +93,7 @@ start:
 
 	/* run the test */
 	la	a0, __argc
-	REG_L	a0, 0(a0)
+	lw	a0, 0(a0)
 	la	a1, __argv
 	la	a2, __environ
 	call	main
-- 
2.45.2


