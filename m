From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:22 +0100
Subject: [kvm-unit-tests PATCH 06/13] riscv: Tweak the gnu-efi imported code
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-21-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change _relocate to match the prototype in efi.h (it doesn't
matter that 'handle' and 'sys_tab' are unused). Also add
R_RISCV_RELATIVE to efi.h and replace '_entry' with 'efi_main'.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/elf.h                    | 5 +++++
 riscv/efi/crt0-efi-riscv64.S | 2 +-
 riscv/efi/reloc_riscv64.c    | 3 ++-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/elf.h b/lib/elf.h
index 7a7db57774cd..fee20289e1fc 100644
--- a/lib/elf.h
+++ b/lib/elf.h
@@ -65,4 +65,9 @@ typedef struct elf64_rela {
 /* The following are used with relocations */
 #define ELF64_R_TYPE(i)		((i) & 0xffffffff)
 
+/*
+ * riscv static relocation types.
+ */
+#define R_RISCV_RELATIVE	3
+
 #endif /* _ELF_H_ */
diff --git a/riscv/efi/crt0-efi-riscv64.S b/riscv/efi/crt0-efi-riscv64.S
index 712ed03fc06e..cc8551a43c6a 100644
--- a/riscv/efi/crt0-efi-riscv64.S
+++ b/riscv/efi/crt0-efi-riscv64.S
@@ -164,7 +164,7 @@ _start:
 	bne		a0, zero, 0f
 	ld		a1, 8(sp)
 	ld		a0, 0(sp)
-	call		_entry
+	call		efi_main
 	ld		ra, 16(sp)
 0:	addi		sp, sp, 24
 	ret
diff --git a/riscv/efi/reloc_riscv64.c b/riscv/efi/reloc_riscv64.c
index e4296026e2a4..8504ad595e51 100644
--- a/riscv/efi/reloc_riscv64.c
+++ b/riscv/efi/reloc_riscv64.c
@@ -44,7 +44,8 @@
 #define Elf_Rela	Elf64_Rela
 #define ELF_R_TYPE	ELF64_R_TYPE
 
-EFI_STATUS EFIAPI _relocate(long ldbase, Elf_Dyn *dyn)
+efi_status_t _relocate(long ldbase, Elf64_Dyn *dyn, efi_handle_t handle,
+		       efi_system_table_t *sys_tab)
 {
 	long relsz = 0, relent = 0;
 	Elf_Rela *rel = NULL;
-- 
2.43.0


