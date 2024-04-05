From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:42 +1000
Subject: [kvm-unit-tests RFC PATCH 10/17] shellcheck: Fix SC2013
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-11-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2013 (info): To read lines rather than words, pipe/redirect to a
  'while read' loop.

Not a bug.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 9dc34a54a..e5750cb98 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -487,7 +487,7 @@ env_file ()
 
 	[ ! -f "$KVM_UNIT_TESTS_ENV_OLD" ] && return
 
-	for line in $(grep -E '^[[:blank:]]*[[:alpha:]_][[:alnum:]_]*=' "$KVM_UNIT_TESTS_ENV_OLD"); do
+	grep -E '^[[:blank:]]*[[:alpha:]_][[:alnum:]_]*=' "$KVM_UNIT_TESTS_ENV_OLD" | while IFS= read -r line ; do
 		var=${line%%=*}
 		if ! grep -q "^$var=" $KVM_UNIT_TESTS_ENV; then
 			eval export "$line"
-- 
2.43.0


