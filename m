From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:38 +1000
Subject: [kvm-unit-tests RFC PATCH 06/17] shellcheck: Fix SC2155
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-7-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2155 (warning): Declare and assign separately to avoid masking
  return values.

No bug identified.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 10 +++++++---
 scripts/runtime.bash  |  4 +++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index f9d1fade9..ae4b06679 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -411,7 +411,8 @@ initrd_cleanup ()
 {
 	rm -f $KVM_UNIT_TESTS_ENV
 	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
-		export KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD"
+		export KVM_UNIT_TESTS_ENV
+		KVM_UNIT_TESTS_ENV="$KVM_UNIT_TESTS_ENV_OLD"
 	else
 		unset KVM_UNIT_TESTS_ENV
 	fi
@@ -423,7 +424,8 @@ initrd_create ()
 	if [ "$ENVIRON_DEFAULT" = "yes" ]; then
 		trap_exit_push 'initrd_cleanup'
 		[ -f "$KVM_UNIT_TESTS_ENV" ] && export KVM_UNIT_TESTS_ENV_OLD="$KVM_UNIT_TESTS_ENV"
-		export KVM_UNIT_TESTS_ENV=$(mktemp)
+		export KVM_UNIT_TESTS_ENV
+		KVM_UNIT_TESTS_ENV=$(mktemp)
 		env_params
 		env_file
 		env_errata || return $?
@@ -566,7 +568,9 @@ env_generate_errata ()
 
 trap_exit_push ()
 {
-	local old_exit=$(trap -p EXIT | sed "s/^[^']*'//;s/'[^']*$//")
+	local old_exit
+
+	old_exit=$(trap -p EXIT | sed "s/^[^']*'//;s/'[^']*$//")
 	trap -- "$1; $old_exit" EXIT
 }
 
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index f79c4e281..3b76aec9e 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -15,7 +15,9 @@ extract_summary()
 # We assume that QEMU is going to work if it tried to load the kernel
 premature_failure()
 {
-    local log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
+    local log
+
+    log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
     echo "$log" | grep "_NO_FILE_4Uhere_" |
         grep -q -e "[Cc]ould not \(load\|open\) kernel" \
-- 
2.43.0


