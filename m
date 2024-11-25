From: Clément Léger <cleger@rivosinc.com>
Date: Mon, 25 Nov 2024 17:21:50 +0100
Subject: [kvm-unit-tests PATCH v4 1/5] kbuild: allow multiple asm-offsets file to be generated
In-Reply-To: <20241125162200.1630845-1-cleger@rivosinc.com>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
Message-ID: <20241125162200.1630845-2-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to allow multiple asm-offsets files to generated the include
guard need to be different between these file. Add a asm_offset_name
makefile macro to obtain an uppercase name matching the original asm
offsets file.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 scripts/asm-offsets.mak | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/scripts/asm-offsets.mak b/scripts/asm-offsets.mak
index 7b64162d..a5fdbf5d 100644
--- a/scripts/asm-offsets.mak
+++ b/scripts/asm-offsets.mak
@@ -15,10 +15,14 @@ define sed-y
 	s:->::; p;}'
 endef
 
+define asm_offset_name
+	$(shell echo $(notdir $(1)) | tr [:lower:]- [:upper:]_)
+endef
+
 define make_asm_offsets
 	(set -e; \
-	 echo "#ifndef __ASM_OFFSETS_H__"; \
-	 echo "#define __ASM_OFFSETS_H__"; \
+	 echo "#ifndef __$(strip $(asm_offset_name))_H__"; \
+	 echo "#define __$(strip $(asm_offset_name))_H__"; \
 	 echo "/*"; \
 	 echo " * Generated file. DO NOT MODIFY."; \
 	 echo " *"; \
@@ -29,12 +33,16 @@ define make_asm_offsets
 	 echo "#endif" ) > $@
 endef
 
-$(asm-offsets:.h=.s): $(asm-offsets:.h=.c)
-	$(CC) $(CFLAGS) -fverbose-asm -S -o $@ $<
+define gen_asm_offsets_rules
+$(1).s: $(1).c
+	$(CC) $(CFLAGS) -fverbose-asm -S -o $$@ $$<
+
+$(1).h: $(1).s
+	$$(call make_asm_offsets,$(1))
+	cp -f $$@ lib/generated/
+endef
 
-$(asm-offsets): $(asm-offsets:.h=.s)
-	$(call make_asm_offsets)
-	cp -f $(asm-offsets) lib/generated/
+$(foreach o,$(asm-offsets),$(eval $(call gen_asm_offsets_rules, $(o:.h=))))
 
 OBJDIRS += lib/generated
 
-- 
2.45.2


