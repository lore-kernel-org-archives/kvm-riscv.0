From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:20 +0100
Subject: [kvm-unit-tests PATCH 04/13] treewide: lib/stack: Make base_address arch specific
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-19-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Calculating the offset of an address is image specific, which is
architecture specific. Until now, all architectures and architecture
configurations which select CONFIG_RELOC were able to subtract
_etext, but the EFI configuration of riscv cannot (it must subtract
ImageBase). Make this function architecture specific, since the
architecture's image layout already is.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/arm64/stack.c | 17 +++++++++++++++++
 lib/riscv/stack.c | 18 ++++++++++++++++++
 lib/stack.c       | 19 ++-----------------
 lib/stack.h       |  2 ++
 lib/x86/stack.c   | 17 +++++++++++++++++
 5 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/lib/arm64/stack.c b/lib/arm64/stack.c
index f5eb57fd8892..3369031a74f7 100644
--- a/lib/arm64/stack.c
+++ b/lib/arm64/stack.c
@@ -6,6 +6,23 @@
 #include <stdbool.h>
 #include <stack.h>
 
+#ifdef CONFIG_RELOC
+extern char _text, _etext;
+
+bool base_address(const void *rebased_addr, unsigned long *addr)
+{
+	unsigned long ra = (unsigned long)rebased_addr;
+	unsigned long start = (unsigned long)&_text;
+	unsigned long end = (unsigned long)&_etext;
+
+	if (ra < start || ra >= end)
+		return false;
+
+	*addr = ra - start;
+	return true;
+}
+#endif
+
 extern char vector_stub_start, vector_stub_end;
 
 int arch_backtrace_frame(const void *frame, const void **return_addrs,
diff --git a/lib/riscv/stack.c b/lib/riscv/stack.c
index d865594b9671..a143c22a570a 100644
--- a/lib/riscv/stack.c
+++ b/lib/riscv/stack.c
@@ -2,6 +2,24 @@
 #include <libcflat.h>
 #include <stack.h>
 
+#ifdef CONFIG_RELOC
+extern char ImageBase, _text, _etext;
+
+bool base_address(const void *rebased_addr, unsigned long *addr)
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
index dd6bfa8dac6e..e5099e207388 100644
--- a/lib/stack.c
+++ b/lib/stack.c
@@ -11,23 +11,8 @@
 
 #define MAX_DEPTH 20
 
-#ifdef CONFIG_RELOC
-extern char _text, _etext;
-
-static bool base_address(const void *rebased_addr, unsigned long *addr)
-{
-	unsigned long ra = (unsigned long)rebased_addr;
-	unsigned long start = (unsigned long)&_text;
-	unsigned long end = (unsigned long)&_etext;
-
-	if (ra < start || ra >= end)
-		return false;
-
-	*addr = ra - start;
-	return true;
-}
-#else
-static bool base_address(const void *rebased_addr, unsigned long *addr)
+#ifndef CONFIG_RELOC
+bool base_address(const void *rebased_addr, unsigned long *addr)
 {
 	*addr = (unsigned long)rebased_addr;
 	return true;
diff --git a/lib/stack.h b/lib/stack.h
index 6edc84344b51..f8def4ad4d49 100644
--- a/lib/stack.h
+++ b/lib/stack.h
@@ -10,6 +10,8 @@
 #include <libcflat.h>
 #include <asm/stack.h>
 
+bool base_address(const void *rebased_addr, unsigned long *addr);
+
 #ifdef HAVE_ARCH_BACKTRACE_FRAME
 extern int arch_backtrace_frame(const void *frame, const void **return_addrs,
 				int max_depth, bool current_frame);
diff --git a/lib/x86/stack.c b/lib/x86/stack.c
index 58ab6c4b293a..7ba73becbd69 100644
--- a/lib/x86/stack.c
+++ b/lib/x86/stack.c
@@ -1,6 +1,23 @@
 #include <libcflat.h>
 #include <stack.h>
 
+#ifdef CONFIG_RELOC
+extern char _text, _etext;
+
+bool base_address(const void *rebased_addr, unsigned long *addr)
+{
+	unsigned long ra = (unsigned long)rebased_addr;
+	unsigned long start = (unsigned long)&_text;
+	unsigned long end = (unsigned long)&_etext;
+
+	if (ra < start || ra >= end)
+		return false;
+
+	*addr = ra - start;
+	return true;
+}
+#endif
+
 int arch_backtrace_frame(const void *frame, const void **return_addrs,
 			 int max_depth, bool current_frame)
 {
-- 
2.43.0


