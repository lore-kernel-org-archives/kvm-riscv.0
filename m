From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 11 Sep 2024 11:39:09 +0200
Subject: [kvm-unit-tests PATCH v2] lib/stack: Restrengthen base_address
Message-ID: <20240911093908.142619-2-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit a1f2b0e1efd5 ("treewide: lib/stack: Make base_address arch
specific") made base_address() a weak function in order to allow
architectures to override it. Linking for EFI doesn't seem to figure
out the right one to use though [anymore?]. It must have worked at
one point because the commit calls outs EFI as the motivation.
Anyway, just drop the weakness in favor of another HAVE_ define.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
v2:
 - Allow an arch to override base_address without CONFIG_RELOC [Nick]

 lib/riscv/asm/stack.h |  3 +++
 lib/riscv/stack.c     |  2 +-
 lib/stack.c           | 12 ++++++------
 lib/stack.h           |  2 +-
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/lib/riscv/asm/stack.h b/lib/riscv/asm/stack.h
index f003ca37c913..89dea3d2bea8 100644
--- a/lib/riscv/asm/stack.h
+++ b/lib/riscv/asm/stack.h
@@ -8,5 +8,8 @@
 
 #define HAVE_ARCH_BACKTRACE_FRAME
 #define HAVE_ARCH_BACKTRACE
+#ifdef CONFIG_RELOC
+#define HAVE_ARCH_BASE_ADDRESS
+#endif
 
 #endif
diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
index 2cd7f012738b..a143c22a570a 100644
--- a/lib/riscv/stack.c
+++ b/lib/riscv/stack.c
@@ -5,7 +5,7 @@
 #ifdef CONFIG_RELOC
 extern char ImageBase, _text, _etext;
 
-bool arch_base_address(const void *rebased_addr, unsigned long *addr)
+bool base_address(const void *rebased_addr, unsigned long *addr)
 {
 	unsigned long ra = (unsigned long)rebased_addr;
 	unsigned long base = (unsigned long)&ImageBase;
diff --git a/lib/stack.c b/lib/stack.c
index 086fec544a81..cab0d416ea12 100644
--- a/lib/stack.c
+++ b/lib/stack.c
@@ -11,10 +11,10 @@
 
 #define MAX_DEPTH 20
 
-#ifdef CONFIG_RELOC
+#if defined(CONFIG_RELOC) && !defined(HAVE_ARCH_BASE_ADDRESS)
 extern char _text, _etext;
 
-bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned long *addr)
+bool base_address(const void *rebased_addr, unsigned long *addr)
 {
 	unsigned long ra = (unsigned long)rebased_addr;
 	unsigned long start = (unsigned long)&_text;
@@ -26,8 +26,8 @@ bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned
 	*addr = ra - start;
 	return true;
 }
-#else
-bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned long *addr)
+#elif !defined(CONFIG_RELOC) && !defined(HAVE_ARCH_BASE_ADDRESS)
+bool base_address(const void *rebased_addr, unsigned long *addr)
 {
 	*addr = (unsigned long)rebased_addr;
 	return true;
@@ -45,13 +45,13 @@ static void print_stack(const void **return_addrs, int depth,
 	/* @addr indicates a non-return address, as expected by the stack
 	 * pretty printer script. */
 	if (depth > 0 && !top_is_return_address) {
-		if (arch_base_address(return_addrs[0], &addr))
+		if (base_address(return_addrs[0], &addr))
 			printf(" @%lx", addr);
 		i++;
 	}
 
 	for (; i < depth; i++) {
-		if (arch_base_address(return_addrs[i], &addr))
+		if (base_address(return_addrs[i], &addr))
 			printf(" %lx", addr);
 	}
 	printf("\n");
diff --git a/lib/stack.h b/lib/stack.h
index df076d94bf8f..c92112c1744d 100644
--- a/lib/stack.h
+++ b/lib/stack.h
@@ -34,6 +34,6 @@ static inline int backtrace_frame(const void *frame, const void **return_addrs,
 }
 #endif
 
-bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned long *addr);
+bool base_address(const void *rebased_addr, unsigned long *addr);
 
 #endif
-- 
2.46.0


