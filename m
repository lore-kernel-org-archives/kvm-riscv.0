From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 30 Aug 2024 12:12:23 +0200
Subject: [kvm-unit-tests PATCH 1/3] lib/cpumask: Fix and simplify a few functions
In-Reply-To: <20240830101221.2202707-5-andrew.jones@linux.dev>
References: <20240830101221.2202707-5-andrew.jones@linux.dev>
Message-ID: <20240830101221.2202707-6-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Simplify cpumask_setall and cpumask_clear by just using memset. Also
simplify cpumask_empty and cpumask_full. This is a fix for
cpumask_empty as it would have reported non-empty for cpumasks that
had uninitialized junk following nr_cpus when nr_cpus < NR_CPUS.
There aren't currently any users of cpumask_empty though so that bug
has never appeared. cpumask_full was just convoluted and can now
follow cpumask_empty's new pattern. I've already yelled at a mirror
to scold the author of the original implementations!

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/cpumask.h | 47 ++++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/lib/cpumask.h b/lib/cpumask.h
index be1919234d8e..e1e92aacd1f1 100644
--- a/lib/cpumask.h
+++ b/lib/cpumask.h
@@ -6,8 +6,9 @@
  */
 #ifndef _CPUMASK_H_
 #define _CPUMASK_H_
-#include <asm/setup.h>
 #include <bitops.h>
+#include <limits.h>
+#include <asm/setup.h>
 
 #define CPUMASK_NR_LONGS ((NR_CPUS + BITS_PER_LONG - 1) / BITS_PER_LONG)
 
@@ -49,46 +50,34 @@ static inline int cpumask_test_and_clear_cpu(int cpu, cpumask_t *mask)
 
 static inline void cpumask_setall(cpumask_t *mask)
 {
-	int i;
-	for (i = 0; i < nr_cpus; i += BITS_PER_LONG)
-		cpumask_bits(mask)[BIT_WORD(i)] = ~0UL;
-	i -= BITS_PER_LONG;
-	if ((nr_cpus - i) < BITS_PER_LONG)
-		cpumask_bits(mask)[BIT_WORD(i)] = BIT_MASK(nr_cpus - i) - 1;
+	memset(mask, 0xff, sizeof(*mask));
 }
 
 static inline void cpumask_clear(cpumask_t *mask)
 {
-	int i;
-	for (i = 0; i < nr_cpus; i += BITS_PER_LONG)
-		cpumask_bits(mask)[BIT_WORD(i)] = 0UL;
+	memset(mask, 0, sizeof(*mask));
 }
 
 static inline bool cpumask_empty(const cpumask_t *mask)
 {
-	int i;
-	for (i = 0; i < nr_cpus; i += BITS_PER_LONG) {
-		if (i < NR_CPUS) { /* silence crazy compiler warning */
-			if (cpumask_bits(mask)[BIT_WORD(i)] != 0UL)
-				return false;
-		}
-	}
-	return true;
+	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
+
+	for (int i = 0; i < BIT_WORD(nr_cpus); ++i)
+		if (cpumask_bits(mask)[i])
+			return false;
+
+	return !lastmask || !(cpumask_bits(mask)[BIT_WORD(nr_cpus)] & lastmask);
 }
 
 static inline bool cpumask_full(const cpumask_t *mask)
 {
-	int i;
-	for (i = 0; i < nr_cpus; i += BITS_PER_LONG) {
-		if (cpumask_bits(mask)[BIT_WORD(i)] != ~0UL) {
-			if ((nr_cpus - i) >= BITS_PER_LONG)
-				return false;
-			if (cpumask_bits(mask)[BIT_WORD(i)]
-					!= BIT_MASK(nr_cpus - i) - 1)
-				return false;
-		}
-	}
-	return true;
+	unsigned long lastmask = BIT_MASK(nr_cpus) - 1;
+
+	for (int i = 0; i < BIT_WORD(nr_cpus); ++i)
+		if (cpumask_bits(mask)[i] != ULONG_MAX)
+			return false;
+
+	return !lastmask || (cpumask_bits(mask)[BIT_WORD(nr_cpus)] & lastmask) == lastmask;
 }
 
 static inline int cpumask_weight(const cpumask_t *mask)
-- 
2.45.2


