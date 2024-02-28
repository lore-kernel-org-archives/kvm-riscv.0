From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:18 +0100
Subject: [kvm-unit-tests PATCH 02/13] riscv: show_regs: Prepare for EFI images
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-17-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

EFI images start with a header page and then _text, so the load
address should use 'ImageBase' instead of _text. Just add the
ImageBase symbol to the non-efi build too and then change show_regs()
to use it instead. While there, add a couple convenience calculations
for the PC and return address (pre-subtract the load address from
them) in order to make it quicker for looking them up in an objdump
(Note, for EFI, one must dump the .so file, which isn't preserved by
default, but can be by uncommenting out the '.PRECIOUS: %.so' line in
the makefile.)

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/processor.c | 8 ++++----
 riscv/flat.lds        | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/riscv/processor.c b/lib/riscv/processor.c
index 6c868b805cf7..ece7cbffc6dd 100644
--- a/lib/riscv/processor.c
+++ b/lib/riscv/processor.c
@@ -8,20 +8,20 @@
 #include <asm/processor.h>
 #include <asm/setup.h>
 
-extern unsigned long _text;
+extern unsigned long ImageBase;
 
 void show_regs(struct pt_regs *regs)
 {
 	struct thread_info *info = current_thread_info();
-	uintptr_t text = (uintptr_t)&_text;
+	uintptr_t loadaddr = (uintptr_t)&ImageBase;
 	unsigned int w = __riscv_xlen / 4;
 
-	printf("Load address: %" PRIxPTR "\n", text);
+	printf("Load address: %" PRIxPTR "\n", loadaddr);
 	printf("CPU%3d : hartid=%lx\n", info->cpu, info->hartid);
 	printf("status : %.*lx\n", w, regs->status);
 	printf("cause  : %.*lx\n", w, regs->cause);
 	printf("badaddr: %.*lx\n", w, regs->badaddr);
-	printf("pc: %.*lx ra: %.*lx\n", w, regs->epc, w, regs->ra);
+	printf("pc: %.*lx (%lx) ra: %.*lx (%lx)\n", w, regs->epc, regs->epc - loadaddr, w, regs->ra, regs->ra - loadaddr);
 	printf("sp: %.*lx gp: %.*lx tp : %.*lx\n", w, regs->sp, w, regs->gp, w, regs->tp);
 	printf("a0: %.*lx a1: %.*lx a2 : %.*lx a3 : %.*lx\n", w, regs->a0, w, regs->a1, w, regs->a2, w, regs->a3);
 	printf("a4: %.*lx a5: %.*lx a6 : %.*lx a7 : %.*lx\n", w, regs->a4, w, regs->a5, w, regs->a6, w, regs->a7);
diff --git a/riscv/flat.lds b/riscv/flat.lds
index d4853f82ba1c..1ca501e6593b 100644
--- a/riscv/flat.lds
+++ b/riscv/flat.lds
@@ -30,6 +30,7 @@ PHDRS
 
 SECTIONS
 {
+    PROVIDE(ImageBase = .);
     PROVIDE(_text = .);
     .text : { *(.init) *(.text) *(.text.*) } :text
     . = ALIGN(4K);
-- 
2.43.0


