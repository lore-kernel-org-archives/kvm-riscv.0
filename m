From: Nicholas Piggin <npiggin@gmail.com>
Date: Sat,  6 Apr 2024 22:38:13 +1000
Subject: [RFC kvm-unit-tests PATCH v2 04/14] shellcheck: Fix SC2094
In-Reply-To: <20240406123833.406488-1-npiggin@gmail.com>
References: <20240406123833.406488-1-npiggin@gmail.com>
Message-ID: <20240406123833.406488-5-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2094 (info): Make sure not to read and write the same file in the same
  pipeline.

This is not as clearly bad as overwriting an input file with >, but
could appended characters possibly be read in from the input
redirection?

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 1901a929f..472c31b08 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -492,6 +492,8 @@ env_file ()
 
 env_errata ()
 {
+	local new_env
+
 	if [ "$ACCEL" = "tcg" ]; then
 		export "ERRATA_FORCE=y"
 	elif [ "$ERRATATXT" ] && [ ! -f "$ERRATATXT" ]; then
@@ -500,7 +502,8 @@ env_errata ()
 	elif [ "$ERRATATXT" ]; then
 		env_generate_errata
 	fi
-	sort <(env | grep '^ERRATA_') <(grep '^ERRATA_' $KVM_UNIT_TESTS_ENV) | uniq -u >>$KVM_UNIT_TESTS_ENV
+	new_env=$(sort <(env | grep '^ERRATA_') <(grep '^ERRATA_' $KVM_UNIT_TESTS_ENV) | uniq -u)
+	echo "$new_env" >>$KVM_UNIT_TESTS_ENV
 }
 
 env_generate_errata ()
-- 
2.43.0


