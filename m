From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 23 Oct 2024 15:21:34 +0200
Subject: [kvm-unit-tests PATCH 3/4] riscv: Fix secondary_entry
In-Reply-To: <20241023132130.118073-6-andrew.jones@linux.dev>
References: <20241023132130.118073-6-andrew.jones@linux.dev>
Message-ID: <20241023132130.118073-9-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The last few instructions of secondary_entry had the right concept,
but were the totally wrong implementation. Without setting ra, then,
when the boot function doesn't stay in an infinite loop, like
do_idle() would, we'd go off into the weeds when trying to return
from it. Make sure we set ra to come back to where we can then call
do_idle() instead. The bug was found by inspection since nobody is
calling smp_boot_secondary() with anything other than do_idle() at
this time.

Fixes: 9c92b28e6b7b ("riscv: Add SMP support")
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/cstart.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/riscv/cstart.S b/riscv/cstart.S
index bae1d2f5b4d5..687173706d83 100644
--- a/riscv/cstart.S
+++ b/riscv/cstart.S
@@ -154,9 +154,9 @@ secondary_entry:
 	mv	a0, sp
 	call	secondary_cinit
 	addi	sp, sp, SECONDARY_DATA_SIZE
-	jr	a0
-	la	a0, do_idle
-	jr	a0
+	jalr	ra, a0
+	call	do_idle
+	j	.	/* unreachable */
 
 /*
  * Save context to address in a0.
-- 
2.47.0


