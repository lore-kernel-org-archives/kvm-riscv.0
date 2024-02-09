From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri,  9 Feb 2024 17:01:40 +1000
Subject: [kvm-unit-tests PATCH v3 7/8] Add common/ directory for architecture-independent tests
In-Reply-To: <20240209070141.421569-1-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
Message-ID: <20240209070141.421569-8-npiggin@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

x86/sieve.c is used by s390x, arm, and riscv via symbolic link. Make a
new directory common/ for architecture-independent tests and move
sieve.c here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/sieve.c    |  2 +-
 common/sieve.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 riscv/sieve.c  |  2 +-
 s390x/sieve.c  |  2 +-
 x86/sieve.c    | 52 +-------------------------------------------------
 5 files changed, 55 insertions(+), 54 deletions(-)
 create mode 100644 common/sieve.c
 mode change 100644 => 120000 x86/sieve.c

diff --git a/arm/sieve.c b/arm/sieve.c
index 8f14a5c3..fe299f30 120000
--- a/arm/sieve.c
+++ b/arm/sieve.c
@@ -1 +1 @@
-../x86/sieve.c
\ No newline at end of file
+../common/sieve.c
\ No newline at end of file
diff --git a/common/sieve.c b/common/sieve.c
new file mode 100644
index 00000000..8150f2d9
--- /dev/null
+++ b/common/sieve.c
@@ -0,0 +1,51 @@
+#include "alloc.h"
+#include "libcflat.h"
+
+static int sieve(char* data, int size)
+{
+    int i, j, r = 0;
+
+    for (i = 0; i < size; ++i)
+	data[i] = 1;
+
+    data[0] = data[1] = 0;
+
+    for (i = 2; i < size; ++i)
+	if (data[i]) {
+	    ++r;
+	    for (j = i*2; j < size; j += i)
+		data[j] = 0;
+	}
+    return r;
+}
+
+static void test_sieve(const char *msg, char *data, int size)
+{
+    int r;
+
+    printf("%s:", msg);
+    r = sieve(data, size);
+    printf("%d out of %d\n", r, size);
+}
+
+#define STATIC_SIZE 1000000
+#define VSIZE 100000000
+char static_data[STATIC_SIZE];
+
+int main(void)
+{
+    void *v;
+    int i;
+
+    printf("starting sieve\n");
+    test_sieve("static", static_data, STATIC_SIZE);
+    setup_vm();
+    test_sieve("mapped", static_data, STATIC_SIZE);
+    for (i = 0; i < 3; ++i) {
+	v = malloc(VSIZE);
+	test_sieve("virtual", v, VSIZE);
+	free(v);
+    }
+
+    return 0;
+}
diff --git a/riscv/sieve.c b/riscv/sieve.c
index 8f14a5c3..fe299f30 120000
--- a/riscv/sieve.c
+++ b/riscv/sieve.c
@@ -1 +1 @@
-../x86/sieve.c
\ No newline at end of file
+../common/sieve.c
\ No newline at end of file
diff --git a/s390x/sieve.c b/s390x/sieve.c
index 8f14a5c3..fe299f30 120000
--- a/s390x/sieve.c
+++ b/s390x/sieve.c
@@ -1 +1 @@
-../x86/sieve.c
\ No newline at end of file
+../common/sieve.c
\ No newline at end of file
diff --git a/x86/sieve.c b/x86/sieve.c
deleted file mode 100644
index 8150f2d9..00000000
--- a/x86/sieve.c
+++ /dev/null
@@ -1,51 +0,0 @@
-#include "alloc.h"
-#include "libcflat.h"
-
-static int sieve(char* data, int size)
-{
-    int i, j, r = 0;
-
-    for (i = 0; i < size; ++i)
-	data[i] = 1;
-
-    data[0] = data[1] = 0;
-
-    for (i = 2; i < size; ++i)
-	if (data[i]) {
-	    ++r;
-	    for (j = i*2; j < size; j += i)
-		data[j] = 0;
-	}
-    return r;
-}
-
-static void test_sieve(const char *msg, char *data, int size)
-{
-    int r;
-
-    printf("%s:", msg);
-    r = sieve(data, size);
-    printf("%d out of %d\n", r, size);
-}
-
-#define STATIC_SIZE 1000000
-#define VSIZE 100000000
-char static_data[STATIC_SIZE];
-
-int main(void)
-{
-    void *v;
-    int i;
-
-    printf("starting sieve\n");
-    test_sieve("static", static_data, STATIC_SIZE);
-    setup_vm();
-    test_sieve("mapped", static_data, STATIC_SIZE);
-    for (i = 0; i < 3; ++i) {
-	v = malloc(VSIZE);
-	test_sieve("virtual", v, VSIZE);
-	free(v);
-    }
-
-    return 0;
-}
diff --git a/x86/sieve.c b/x86/sieve.c
new file mode 120000
index 00000000..fe299f30
--- /dev/null
+++ b/x86/sieve.c
@@ -0,0 +1 @@
+../common/sieve.c
\ No newline@end of file
-- 
2.42.0


