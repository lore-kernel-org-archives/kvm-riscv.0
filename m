From: Nicholas Piggin <npiggin@gmail.com>
Date: Wed, 12 Jun 2024 14:42:32 +1000
Subject: [kvm-unit-tests PATCH] build: retain intermediate .aux.o targets
Message-ID: <20240612044234.212156-1-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
in dependency chains that cause them to be made as intermediate files,
which get removed when make finishes. This results in unnecessary
partial rebuilds. If make is run again, this time the .aux.o targets
are not intermediate, possibly due to being made via different
dependencies.

Adding .aux.o files to .PRECIOUS prevents them being removed and solves
the rebuild problem.

s390x does not have the problem because .SECONDARY prevents dependancies
from being built as intermediate. However the same change is made for
s390x, for consistency.

Suggested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/Makefile.common     | 2 +-
 powerpc/Makefile.common | 2 +-
 riscv/Makefile          | 2 +-
 s390x/Makefile          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arm/Makefile.common b/arm/Makefile.common
index f828dbe01..0b26a92a6 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -31,7 +31,7 @@ CFLAGS += -O2
 CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
 
 # We want to keep intermediate files
-.PRECIOUS: %.elf %.o
+.PRECIOUS: %.elf %.o %.aux.o
 
 asm-offsets = lib/$(ARCH)/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index b98f71c2f..16f14577e 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -30,7 +30,7 @@ CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
 CFLAGS += -Wa,-mregnames
 
 # We want to keep intermediate files
-.PRECIOUS: %.o
+.PRECIOUS: %.o %.aux.o
 
 asm-offsets = lib/$(ARCH)/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
diff --git a/riscv/Makefile b/riscv/Makefile
index 919a3ebb5..7207ff988 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -53,7 +53,7 @@ AUXFLAGS ?= 0x0
 KEEP_FRAME_POINTER := y
 
 # We want to keep intermediate files
-.PRECIOUS: %.elf %.o
+.PRECIOUS: %.elf %.o %.aux.o
 
 define arch_elf_check =
 	$(if $(shell ! $(READELF) -rW $(1) >&/dev/null && echo "nok"),
diff --git a/s390x/Makefile b/s390x/Makefile
index 23342bd64..d436c6e9a 100644
--- a/s390x/Makefile
+++ b/s390x/Makefile
@@ -85,7 +85,7 @@ CFLAGS += -fno-delete-null-pointer-checks
 LDFLAGS += -Wl,--build-id=none
 
 # We want to keep intermediate files
-.PRECIOUS: %.o %.lds
+.PRECIOUS: %.o %.aux.o %.lds
 
 asm-offsets = lib/$(ARCH)/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
-- 
2.45.1


