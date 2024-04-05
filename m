From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:37 +1000
Subject: [kvm-unit-tests RFC PATCH 05/17] shellcheck: Fix SC2006
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-6-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2006 (style): Use $(...) notation instead of legacy backticks `...`.

No bug identified.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 6 +++---
 scripts/runtime.bash  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 472c31b08..f9d1fade9 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -271,16 +271,16 @@ do_migration ()
 	qmp ${src_qmp} '"migrate", "arguments": { "uri": "unix:'${dst_incoming}'" }' > ${src_qmpout}
 
 	# Wait for the migration to complete
-	migstatus=`qmp ${src_qmp} '"query-migrate"' | grep return`
+	migstatus=$(qmp ${src_qmp} '"query-migrate"' | grep return)
 	while ! grep -q '"completed"' <<<"$migstatus" ; do
 		sleep 0.1
-		if ! migstatus=`qmp ${src_qmp} '"query-migrate"'`; then
+		if ! migstatus=$(qmp ${src_qmp} '"query-migrate"'); then
 			echo "ERROR: Querying migration state failed." >&2
 			echo > ${dst_infifo}
 			qmp ${dst_qmp} '"quit"'> ${dst_qmpout} 2>/dev/null
 			return 2
 		fi
-		migstatus=`grep return <<<"$migstatus"`
+		migstatus=$(grep return <<<"$migstatus")
 		if grep -q '"failed"' <<<"$migstatus"; then
 			echo "ERROR: Migration failed." >&2
 			echo > ${dst_infifo}
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 2d7ff5baa..f79c4e281 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -61,9 +61,9 @@ function print_result()
     local reason="$4"
 
     if [ -z "$reason" ]; then
-        echo "`$status` $testname $summary"
+        echo "$($status) $testname $summary"
     else
-        echo "`$status` $testname ($reason)"
+        echo "$($status) $testname ($reason)"
     fi
 }
 
-- 
2.43.0


