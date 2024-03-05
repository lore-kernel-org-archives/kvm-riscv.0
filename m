From: Andrew Jones <andrew.jones@linux.dev>
Date: Tue,  5 Mar 2024 18:09:03 +0100
Subject: [kvm-unit-tests PATCH v2 04/13] treewide: lib/stack: Make base_address arch specific
In-Reply-To: <20240305170858.395836-15-andrew.jones@linux.dev>
References: <20240305170858.395836-15-andrew.jones@linux.dev>
Message-ID: <20240305170858.395836-19-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Calculating the offset of an address is image specific, which is
architecture specific. Until now, all architectures and architecture
configurations which select CONFIG_RELOC were able to subtract
_etext, but the EFI configuration of riscv cannot (it must subtract
ImageBase). Make this function weak, such that an architecture may
override it when necessary, to accommodate the image layout. Then,
immediately supply the riscv override.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/stack.c | 18 ++++++++++++++++++
 lib/stack.c       |  8 ++++----
 lib/stack.h       |  2 ++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
index d865594b9671..2cd7f012738b 100644
--- a/lib/riscv/stack.c
+++ b/lib/riscv/stack.c
@@ -2,6 +2,24 @@
 #include <libcflat.h>
 #include <stack.h>
 
+#ifdef CONFIG_RELOC
+extern char ImageBase, _text, _etext;
+
+bool arch_base_address(const void *rebased_addr, unsigned long *addr)
+{
+	unsigned long ra = (unsigned long)rebased_addr;
+	unsigned long base = (unsigned long)&ImageBase;
+	unsigned long start = (unsigned long)&_text;
+	unsigned long end = (unsigned long)&_etext;
+
+	if (ra < start || ra >= end)
+		return false;
+
+	*addr = ra - base;
+	return true;
+}
+#endif
+
 int arch_backtrace_frame(const void *frame, const void **return_addrs,
 			 int max_depth, bool current_frame)
 {
diff --git a/lib/stack.c b/lib/stack.c
index dd6bfa8dac6e..086fec544a81 100644
--- a/lib/stack.c
+++ b/lib/stack.c
@@ -14,7 +14,7 @@
 #ifdef CONFIG_RELOC
 extern char _text, _etext;
 
-static bool base_address(const void *rebased_addr, unsigned long *addr)
+bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned long *addr)
 {
 	unsigned long ra = (unsigned long)rebased_addr;
 	unsigned long start = (unsigned long)&_text;
@@ -27,7 +27,7 @@ static bool base_address(const void *rebased_addr, unsigned long *addr)
 	return true;
 }
 #else
-static bool base_address(const void *rebased_addr, unsigned long *addr)
+bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned long *addr)
 {
 	*addr = (unsigned long)rebased_addr;
 	return true;
@@ -45,13 +45,13 @@ static void print_stack(const void **return_addrs, int depth,
 	/* @addr indicates a non-return address, as expected by the stack
 	 * pretty printer script. */
 	if (depth > 0 && !top_is_return_address) {
-		if (base_address(return_addrs[0], &addr))
+		if (arch_base_address(return_addrs[0], &addr))
 			printf(" @%lx", addr);
 		i++;
 	}
 
 	for (; i < depth; i++) {
-		if (base_address(return_addrs[i], &addr))
+		if (arch_base_address(return_addrs[i], &addr))
 			printf(" %lx", addr);
 	}
 	printf("\n");
diff --git a/lib/stack.h b/lib/stack.h
index 6edc84344b51..df076d94bf8f 100644
--- a/lib/stack.h
+++ b/lib/stack.h
@@ -34,4 +34,6 @@ static inline int backtrace_frame(const void *frame, const void **return_addrs,
 }
 #endif
 
+bool __attribute__((weak)) arch_base_address(const void *rebased_addr, unsigned long *addr);
+
 #endif
-- 
2.44.0


