From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:23 +0100
Subject: [kvm-unit-tests PATCH 07/13] riscv: Enable building for EFI
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-22-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mimicking arm64 support, add configure and makefile changes to build
for EFI. Since the linker script is replaced also replace the initial
cstart code (also done like arm64). Finally, provide a stub for
setup_efi() in order to allow compiling to complete (even though
tests can't yet run).

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 configure             |  3 ++-
 lib/riscv/asm/setup.h |  5 +++++
 riscv/Makefile        | 24 +++++++++++++++++++++++-
 riscv/cstart.S        |  4 ++++
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 283c959973fd..cb1718ce12e6 100755
--- a/configure
+++ b/configure
@@ -230,7 +230,8 @@ else
     fi
 fi
 
-if [ "$efi" ] && [ "$arch" != "x86_64" ] && [ "$arch" != "arm64" ]; then
+if [ "$efi" ] && [ "$arch" != "x86_64" ] &&
+   [ "$arch" != "arm64" ] && [ "$arch" != "riscv64" ]; then
     echo "--[enable|disable]-efi is not supported for $arch"
     usage
 fi
diff --git a/lib/riscv/asm/setup.h b/lib/riscv/asm/setup.h
index e58dd53071ae..dfc8875fbb3b 100644
--- a/lib/riscv/asm/setup.h
+++ b/lib/riscv/asm/setup.h
@@ -12,4 +12,9 @@ int hartid_to_cpu(unsigned long hartid);
 void io_init(void);
 void setup(const void *fdt, phys_addr_t freemem_start);
 
+#ifdef CONFIG_EFI
+#include <efi.h>
+static inline efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo) { return 0; }
+#endif
+
 #endif /* _ASMRISCV_SETUP_H_ */
diff --git a/riscv/Makefile b/riscv/Makefile
index 85bbca151739..e1803c133e71 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -85,7 +85,29 @@ include $(SRCDIR)/scripts/asm-offsets.mak
 		-DPROGNAME=\"$(notdir $(@:.aux.o=.$(exe)))\" -DAUXFLAGS=$(AUXFLAGS)
 
 ifeq ($(CONFIG_EFI),y)
-	# TODO
+# avoid jump tables before all relocations have been processed
+riscv/efi/reloc_riscv64.o: CFLAGS += -fno-jump-tables
+cflatobjs += riscv/efi/reloc_riscv64.o
+cflatobjs += lib/acpi.o
+cflatobjs += lib/efi.o
+
+#.PRECIOUS: %.so
+
+%.so: EFI_LDFLAGS += -defsym=EFI_SUBSYSTEM=0xa --no-undefined
+%.so: %.o $(FLATLIBS) $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds $(cstart.o) %.aux.o
+	$(LD) $(EFI_LDFLAGS) -o $@ -T $(SRCDIR)/riscv/efi/elf_riscv64_efi.lds \
+		$(filter %.o, $^) $(FLATLIBS) $(EFI_LIBS)
+
+%.efi: %.so
+	$(call arch_elf_check, $^)
+	$(OBJCOPY) --only-keep-debug $^ $@.debug
+	$(OBJCOPY) --strip-debug $^
+	$(OBJCOPY) --add-gnu-debuglink=$@.debug $^
+	$(OBJCOPY) \
+		-j .text -j .sdata -j .data -j .rodata -j .dynamic -j .dynsym \
+		-j .rel -j .rela -j .rel.* -j .rela.* -j .rel* -j .rela* \
+		-j .reloc \
+		-O binary $^ $@
 else
 %.elf: LDFLAGS += -pie -n -z notext
 %.elf: %.o $(FLATLIBS) $(SRCDIR)/riscv/flat.lds $(cstart.o) %.aux.o
diff --git a/riscv/cstart.S b/riscv/cstart.S
index c935467ff6a1..10b5da5779b0 100644
--- a/riscv/cstart.S
+++ b/riscv/cstart.S
@@ -42,6 +42,9 @@
 9997:
 .endm
 
+#ifdef CONFIG_EFI
+#include "efi/crt0-efi-riscv64.S"
+#else
 	.section .init
 
 /*
@@ -109,6 +112,7 @@ start:
 	call	exit
 	j	halt
 
+#endif /* !CONFIG_EFI */
 	.text
 
 .balign 4
-- 
2.43.0


