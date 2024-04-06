From: Nicholas Piggin <npiggin@gmail.com>
Date: Sat,  6 Apr 2024 22:38:19 +1000
Subject: [RFC kvm-unit-tests PATCH v2 10/14] shellcheck: Fix SC2124
In-Reply-To: <20240406123833.406488-1-npiggin@gmail.com>
References: <20240406123833.406488-1-npiggin@gmail.com>
Message-ID: <20240406123833.406488-11-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2124 (warning): Assigning an array to a string! Assign as array, or
  use * instead of @ to concatenate.

Shouldn't be a bug since bash concatenates with space and eval is
used on the result.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 45ec8f57d..95b6fa64d 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -150,7 +150,7 @@ run_migration ()
 		return 77
 	fi
 
-	migcmdline=$@
+	migcmdline=("$@")
 
 	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
 	trap 'rm -f ${src_out} ${dst_out} ${src_outfifo} ${dst_outfifo} ${dst_incoming} ${src_qmp} ${dst_qmp} ${src_infifo} ${dst_infifo}' RETURN EXIT
@@ -179,7 +179,7 @@ run_migration ()
 	exec {src_infifo_fd}<>${src_infifo}
 	exec {dst_infifo_fd}<>${dst_infifo}
 
-	eval "$migcmdline" \
+	eval "${migcmdline[@]}" \
 		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control \
 		< ${src_infifo} > ${src_outfifo} &
@@ -219,7 +219,7 @@ run_migration ()
 
 do_migration ()
 {
-	eval "$migcmdline" \
+	eval "${migcmdline[@]}" \
 		-chardev socket,id=mon,path=${dst_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
 		< ${dst_infifo} > ${dst_outfifo} &
-- 
2.43.0


