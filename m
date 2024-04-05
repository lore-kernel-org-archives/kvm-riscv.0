From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  5 Apr 2024 19:00:39 +1000
Subject: [kvm-unit-tests RFC PATCH 07/17] shellcheck: Fix SC2235
In-Reply-To: <20240405090052.375599-1-npiggin@gmail.com>
References: <20240405090052.375599-1-npiggin@gmail.com>
Message-ID: <20240405090052.375599-8-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2235 (style): Use { ..; } instead of (..) to avoid subshell
  overhead.

No bug identified. Overhead is pretty irrelevant.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index ae4b06679..d1edd1d69 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -580,15 +580,15 @@ kvm_available ()
 		return 1
 
 	[ "$HOST" = "$ARCH_NAME" ] ||
-		( [ "$HOST" = aarch64 ] && [ "$ARCH" = arm ] ) ||
-		( [ "$HOST" = x86_64 ] && [ "$ARCH" = i386 ] )
+		{ [ "$HOST" = aarch64 ] && [ "$ARCH" = arm ] ; } ||
+		{ [ "$HOST" = x86_64 ] && [ "$ARCH" = i386 ] ; }
 }
 
 hvf_available ()
 {
 	[ "$(sysctl -n kern.hv_support 2>/dev/null)" = "1" ] || return 1
 	[ "$HOST" = "$ARCH_NAME" ] ||
-		( [ "$HOST" = x86_64 ] && [ "$ARCH" = i386 ] )
+		{ [ "$HOST" = x86_64 ] && [ "$ARCH" = i386 ] ; }
 }
 
 set_qemu_accelerator ()
-- 
2.43.0


