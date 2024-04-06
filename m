From: Nicholas Piggin <npiggin@gmail.com>
Date: Sat,  6 Apr 2024 22:38:21 +1000
Subject: [RFC kvm-unit-tests PATCH v2 12/14] shellcheck: Fix SC2178
In-Reply-To: <20240406123833.406488-1-npiggin@gmail.com>
References: <20240406123833.406488-1-npiggin@gmail.com>
Message-ID: <20240406123833.406488-13-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

  SC2178 (warning): Variable was used as an array but is now assigned a
  string.

No bug identified.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/efi/run   | 2 +-
 riscv/efi/run | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arm/efi/run b/arm/efi/run
index cf6d34b0b..8f41fc02d 100755
--- a/arm/efi/run
+++ b/arm/efi/run
@@ -44,7 +44,7 @@ qemu_args=()
 cmd_args=()
 while (( "$#" )); do
 	if [ "$1" = "-append" ]; then
-		cmd_args=$2
+		cmd_args=("$2")
 		shift 2
 	else
 		qemu_args+=("$1")
diff --git a/riscv/efi/run b/riscv/efi/run
index cce068694..5a72683a6 100755
--- a/riscv/efi/run
+++ b/riscv/efi/run
@@ -47,7 +47,7 @@ qemu_args=()
 cmd_args=()
 while (( "$#" )); do
 	if [ "$1" = "-append" ]; then
-		cmd_args=$2
+		cmd_args=("$2")
 		shift 2
 	else
 		qemu_args+=("$1")
-- 
2.43.0


