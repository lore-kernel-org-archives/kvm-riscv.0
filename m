From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue,  5 Mar 2024 18:09:06 +0100
Subject: [kvm-unit-tests PATCH v2 07/13] riscv: Enable building for EFI
In-Reply-To: <20240305170858.395836-15-andrew.jones@linux.dev>
References: <20240305170858.395836-15-andrew.jones@linux.dev>
Message-ID: <20240305170858.395836-22-andrew.jones@linux.dev>
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
 riscv/Makefile        | 27 +++++++++++++++++++++++++--
 riscv/cstart.S        |  4 ++++
 4 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 51edee8cd21b..c1d0fe4adbb0 100755
--- a/configure
+++ b/configure
@@ -231,7 +231,8 @@ else
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
index 85bbca151739..919a3ebb5211 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -17,7 +17,8 @@ tests += $(TEST_DIR)/sieve.$(exe)
 
 all: $(tests)
 
-$(TEST_DIR)/sieve.elf: AUXFLAGS = 0x1
+# When built for EFI sieve needs extra memory, run with e.g. '-m 256' on QEMU
+$(TEST_DIR)/sieve.$(exe): AUXFLAGS = 0x1
 
 cstart.o = $(TEST_DIR)/cstart.o
 
@@ -85,7 +86,29 @@ include $(SRCDIR)/scripts/asm-offsets.mak
 		-DPROGNAME=\"$(notdir $(@:.aux.o=.$(exe)))\" -DAUXFLAGS=$(AUXFLAGS)
 
 ifeq ($(CONFIG_EFI),y)
-	# TODO
+# avoid jump tables before all relocations have been processed
+riscv/efi/reloc_riscv64.o: CFLAGS += -fno-jump-tables
+cflatobjs += riscv/efi/reloc_riscv64.o
+cflatobjs += lib/acpi.o
+cflatobjs += lib/efi.o
+
+.PRECIOUS: %.so
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
2.44.0


