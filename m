From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 26 Jan 2024 15:23:46 +0100
Subject: [kvm-unit-tests PATCH v2 21/24] lib: Add strcasecmp and strncasecmp
In-Reply-To: <20240126142324.66674-26-andrew.jones@linux.dev>
References: <20240126142324.66674-26-andrew.jones@linux.dev>
Message-ID: <20240126142324.66674-47-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We'll soon want a case insensitive string comparison. Add toupper()
and tolower() too (the latter gets used by the new string functions).

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
---
 lib/ctype.h  | 10 ++++++++++
 lib/string.c | 14 ++++++++++++++
 lib/string.h |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/lib/ctype.h b/lib/ctype.h
index 48a9c16300f8..45c96f111e19 100644
--- a/lib/ctype.h
+++ b/lib/ctype.h
@@ -37,4 +37,14 @@ static inline int isspace(int c)
         return c == ' ' || c == '\t' || c == '\r' || c == '\n' || c == '\v' || c == '\f';
 }
 
+static inline int toupper(int c)
+{
+	return islower(c) ? c - 'a' + 'A' : c;
+}
+
+static inline int tolower(int c)
+{
+	return isupper(c) ? c - 'A' + 'a' : c;
+}
+
 #endif /* _CTYPE_H_ */
diff --git a/lib/string.c b/lib/string.c
index 6d8a6380db92..ab6a724a3144 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -54,11 +54,25 @@ int strncmp(const char *a, const char *b, size_t n)
 	return 0;
 }
 
+int strncasecmp(const char *a, const char *b, size_t n)
+{
+	for (; n--; ++a, ++b)
+		if (tolower(*a) != tolower(*b) || *a == '\0')
+			return tolower(*a) - tolower(*b);
+
+	return 0;
+}
+
 int strcmp(const char *a, const char *b)
 {
 	return strncmp(a, b, SIZE_MAX);
 }
 
+int strcasecmp(const char *a, const char *b)
+{
+	return strncasecmp(a, b, SIZE_MAX);
+}
+
 char *strchr(const char *s, int c)
 {
 	while (*s != (char)c)
diff --git a/lib/string.h b/lib/string.h
index 758dca8af36a..a28d75641530 100644
--- a/lib/string.h
+++ b/lib/string.h
@@ -15,6 +15,8 @@ extern char *strcat(char *dest, const char *src);
 extern char *strcpy(char *dest, const char *src);
 extern int strcmp(const char *a, const char *b);
 extern int strncmp(const char *a, const char *b, size_t n);
+int strcasecmp(const char *a, const char *b);
+int strncasecmp(const char *a, const char *b, size_t n);
 extern char *strchr(const char *s, int c);
 extern char *strrchr(const char *s, int c);
 extern char *strchrnul(const char *s, int c);
-- 
2.43.0


