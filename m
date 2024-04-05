From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:48 +1000
Subject: [kvm-unit-tests RFC PATCH 16/17] shellcheck: Fix SC2153
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-17-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2153 (info): Possible misspelling: ACCEL may not be assigned. Did
  you mean accel?

Looks like a bug?

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/s390x/func.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/s390x/func.bash b/scripts/s390x/func.bash
index 6c75e89ae..fa47d0191 100644
--- a/scripts/s390x/func.bash
+++ b/scripts/s390x/func.bash
@@ -21,7 +21,7 @@ function arch_cmd_s390x()
 	"$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
 
 	# run PV test case
-	if [ "$ACCEL" = 'tcg' ] || grep -q "migration" <<< "$groups"; then
+	if [ "$accel" = 'tcg' ] || grep -q "migration" <<< "$groups"; then
 		return
 	fi
 	kernel=${kernel%.elf}.pv.bin
-- 
2.43.0


