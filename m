From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue,  5 Mar 2024 18:09:12 +0100
Subject: [kvm-unit-tests PATCH v2 13/13] riscv: efi: Use efi-direct by default
In-Reply-To: <20240305170858.395836-15-andrew.jones@linux.dev>
References: <20240305170858.395836-15-andrew.jones@linux.dev>
Message-ID: <20240305170858.395836-28-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

efi-direct is much faster and riscv makes a lot of use of environment
variables, which can't be as easily used without '-initrd'. When efi
is configured for riscv, assume efi-direct is also desired. Users
can switch to running from the UEFI shell by configuring with
--disable-efi-direct.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 14d2569e9e0d..49f047cb2d7d 100755
--- a/configure
+++ b/configure
@@ -94,7 +94,8 @@ usage() {
 	    --[enable|disable]-efi-direct
 	                           Select whether to run EFI tests directly with QEMU's -kernel
 	                           option. When not enabled, tests will be placed in an EFI file
-	                           system and run from the UEFI shell. Ignored when efi isn't enabled.
+	                           system and run from the UEFI shell. Ignored when efi isn't enabled
+	                           and defaults to enabled when efi is enabled for riscv64.
 	                           (arm64 and riscv64 only)
 EOF
     exit 1
@@ -237,6 +238,10 @@ if [ "$efi" ] && [ "$arch" != "x86_64" ] &&
     usage
 fi
 
+if [ "$efi" ] && [ "$arch" = "riscv64" ] && [ -z "$efi_direct" ]; then
+    efi_direct=y
+fi
+
 if [ -z "$page_size" ]; then
     if [ "$efi" = 'y' ] && [ "$arch" = "arm64" ]; then
         page_size="4096"
-- 
2.44.0


