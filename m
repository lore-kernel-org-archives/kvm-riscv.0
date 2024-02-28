From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:24 +0100
Subject: [kvm-unit-tests PATCH 08/13] riscv: efi: Switch stack in _start
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-23-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Modify gnu-efi's _start to switch the stack. This allows us to not
map memory regions which have EFI memory type EFI_BOOT_SERVICES_DATA,
as the stack will be in the EFI_LOADER_CODE region instead. We'll
still map the stack as R/W instead of R/X because we'll split the
EFI_LOADER_CODE region on the _etext boundary and map addresses
before _etext as R/X and the rest as R/W.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/efi/crt0-efi-riscv64.S | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/riscv/efi/crt0-efi-riscv64.S b/riscv/efi/crt0-efi-riscv64.S
index cc8551a43c6a..4ed82b14a1d6 100644
--- a/riscv/efi/crt0-efi-riscv64.S
+++ b/riscv/efi/crt0-efi-riscv64.S
@@ -164,7 +164,20 @@ _start:
 	bne		a0, zero, 0f
 	ld		a1, 8(sp)
 	ld		a0, 0(sp)
+
+	/* Switch to our own stack */
+	mv		a2, sp
+	la		sp, stacktop
+	mv		fp, zero
+	push_fp zero
+	addi		sp, sp, -16
+	sd		a2, 0(sp)
+
 	call		efi_main
+
+	/* Restore sp */
+	ld		sp, 0(sp)
+
 	ld		ra, 16(sp)
 0:	addi		sp, sp, 24
 	ret
@@ -172,6 +185,11 @@ _start:
 // hand-craft a dummy .reloc section so EFI knows it's a relocatable executable:
  
  	.data
+
+.balign 16384
+.space 16384
+stacktop:
+
 dummy:	.4byte	0
 
 #define IMAGE_REL_ABSOLUTE	0
-- 
2.43.0


