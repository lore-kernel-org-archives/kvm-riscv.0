From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu,  8 Aug 2024 17:42:27 +0200
Subject: [kvm-unit-tests PATCH v2 3/4] riscv: Fix out-of-tree builds
In-Reply-To: <20240808154223.79686-6-andrew.jones@linux.dev>
References: <20240808154223.79686-6-andrew.jones@linux.dev>
Message-ID: <20240808154223.79686-9-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

My riscv compiler doesn't seem to want to create directories as other
compilers are apparently doing. There's only a few of them, so let's
just manually create them in configure. And riscv also needed
'-I lib' in CFLAGS.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure      | 8 ++++++--
 riscv/Makefile | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index db15e85d6ac7..27ae9cc89657 100755
--- a/configure
+++ b/configure
@@ -418,12 +418,16 @@ rm -f lib/asm
 asm="asm-generic"
 if [ -d "$srcdir/lib/$arch/asm" ]; then
 	asm="$srcdir/lib/$arch/asm"
+	mkdir -p "lib/$arch"
+elif [ -d "$srcdir/lib/$arch_libdir/asm" ]; then
+	asm="$srcdir/lib/$arch_libdir/asm"
+	mkdir -p "lib/$arch_libdir"
 elif [ -d "$srcdir/lib/$testdir/asm" ]; then
 	asm="$srcdir/lib/$testdir/asm"
+	mkdir -p "lib/$testdir"
 fi
-mkdir -p lib
 ln -sf "$asm" lib/asm
-
+mkdir -p lib/generated lib/libfdt
 
 # create the config
 cat <<EOF > config.mak
diff --git a/riscv/Makefile b/riscv/Makefile
index 7906cef7f199..179a373dbacf 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -80,7 +80,7 @@ CFLAGS += -mstrict-align
 CFLAGS += -std=gnu99
 CFLAGS += -ffreestanding
 CFLAGS += -O2
-CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt
+CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
 
 asm-offsets = lib/riscv/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
-- 
2.45.2


