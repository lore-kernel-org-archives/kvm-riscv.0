From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:44 +1000
Subject: [kvm-unit-tests RFC PATCH 12/17] shellcheck: Fix SC2124
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-13-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2124 (warning): Assigning an array to a string! Assign as array, or
  use * instead of @ to concatenate.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index e5750cb98..89a496014 100644
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


