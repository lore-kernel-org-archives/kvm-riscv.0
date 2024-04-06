From: Nicholas Piggin <npiggin@gmail.com>
Date: Sat,  6 Apr 2024 22:38:16 +1000
Subject: [RFC kvm-unit-tests PATCH v2 07/14] shellcheck: Fix SC2143
In-Reply-To: <20240406123833.406488-1-npiggin@gmail.com>
References: <20240406123833.406488-1-npiggin@gmail.com>
Message-ID: <20240406123833.406488-8-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2143 (style): Use ! grep -q instead of comparing output with
  [ -z .. ].

Not a bug.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index ae4b06679..cd75405c8 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -61,7 +61,11 @@ run_qemu ()
 		# Even when ret==1 (unittest success) if we also got stderr
 		# logs, then we assume a QEMU failure. Otherwise we translate
 		# status of 1 to 0 (SUCCESS)
-		if [ -z "$(echo "$errors" | grep -vi warning)" ]; then
+	        if [ "$errors" ]; then
+			if ! grep -qvi warning <<<"$errors" ; then
+				ret=0
+			fi
+		else
 			ret=0
 		fi
 	fi
-- 
2.43.0


