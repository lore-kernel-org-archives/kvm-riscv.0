From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Tue, 10 Sep 2024 23:08:41 +0800
Subject: [kvm-unit-tests PATCH 1/2] lib/report: Add helper method to clear multiple prefixes
In-Reply-To: <20240910150842.156949-1-jamestiotio@gmail.com>
References: <20240910150842.156949-1-jamestiotio@gmail.com>
Message-ID: <20240910150842.156949-2-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a method to pop a specified number of prefixes. This method is
useful when tests want to clear multiple prefixes at once.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/libcflat.h |  1 +
 lib/report.c   | 21 +++++++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index 16a83880..eec34c3f 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -96,6 +96,7 @@ void report_prefix_pushf(const char *prefix_fmt, ...)
 					__attribute__((format(printf, 1, 2)));
 extern void report_prefix_push(const char *prefix);
 extern void report_prefix_pop(void);
+extern void report_prefix_popn(int n);
 extern void report(bool pass, const char *msg_fmt, ...)
 		__attribute__((format(printf, 2, 3), nonnull(2)));
 extern void report_xfail(bool xfail, bool pass, const char *msg_fmt, ...)
diff --git a/lib/report.c b/lib/report.c
index 7f3c4f05..0756e64e 100644
--- a/lib/report.c
+++ b/lib/report.c
@@ -60,23 +60,32 @@ void report_prefix_push(const char *prefix)
 	report_prefix_pushf("%s", prefix);
 }
 
-void report_prefix_pop(void)
+static void __report_prefix_pop(void)
 {
 	char *p, *q;
 
-	spin_lock(&lock);
-
-	if (!*prefixes) {
-		spin_unlock(&lock);
+	if (!*prefixes)
 		return;
-	}
 
 	for (p = prefixes, q = strstr(p, PREFIX_DELIMITER) + 2;
 			*q;
 			p = q, q = strstr(p, PREFIX_DELIMITER) + 2)
 		;
 	*p = '\0';
+}
 
+void report_prefix_pop(void)
+{
+	spin_lock(&lock);
+	__report_prefix_pop();
+	spin_unlock(&lock);
+}
+
+void report_prefix_popn(int n)
+{
+	spin_lock(&lock);
+	while (n--)
+		__report_prefix_pop();
 	spin_unlock(&lock);
 }
 
-- 
2.43.0


