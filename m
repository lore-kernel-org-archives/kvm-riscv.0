From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu,  8 Aug 2024 17:42:25 +0200
Subject: [kvm-unit-tests PATCH v2 1/4] lib: Add limits.h
In-Reply-To: <20240808154223.79686-6-andrew.jones@linux.dev>
References: <20240808154223.79686-6-andrew.jones@linux.dev>
Message-ID: <20240808154223.79686-7-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We already include limits.h from a couple places (libfdt and the
sbi test for riscv). We should provide our own limits.h rather than
depend on the build environment as some cross environments may not
support it (building riscv with a ilp32d toolchain fails, for
example).

We guard each definition to ensure we only provide them when the
sizes match our expectations. If something is strange then the
define won't be created, and either the includer won't notice since
it wasn't used or the build will break and limits.h can be extended.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/limits.h | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 lib/limits.h

diff --git a/lib/limits.h b/lib/limits.h
new file mode 100644
index 000000000000..650085c68e5d
--- /dev/null
+++ b/lib/limits.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _LIMITS_H_
+#define _LIMITS_H_
+
+#if __CHAR_BIT__ == 8
+# if __CHAR_UNSIGNED__
+#  define CHAR_MIN	0
+#  define CHAR_MAX	__UINT8_MAX__
+# else
+#  define CHAR_MAX	__INT8_MAX__
+#  define CHAR_MIN	(-CHAR_MAX - 1)
+# endif
+#endif
+
+#if __SHRT_WIDTH__ == 16
+# define SHRT_MAX	__INT16_MAX__
+# define SHRT_MIN	(-SHRT_MAX - 1)
+# define USHRT_MAX	__UINT16_MAX__
+#endif
+
+#if __INT_WIDTH__ == 32
+# define INT_MAX	__INT32_MAX__
+# define INT_MIN	(-INT_MAX - 1)
+# define UINT_MAX	__UINT32_MAX__
+#endif
+
+#if __LONG_WIDTH__ == 64
+# define LONG_MAX	__INT64_MAX__
+# define LONG_MIN	(-LONG_MAX - 1)
+# define ULONG_MAX	__UINT64_MAX__
+#elif __LONG_WIDTH__ == 32
+# define LONG_MAX	__INT32_MAX__
+# define LONG_MIN	(-LONG_MAX - 1)
+# define ULONG_MAX	__UINT32_MAX__
+#endif
+
+#if __LONG_LONG_WIDTH__ == 64
+# define LLONG_MAX	__INT64_MAX__
+# define LLONG_MIN	(-LLONG_MAX - 1)
+# define ULLONG_MAX	__UINT64_MAX__
+#endif
+
+#endif /* _LIMITS_H_ */
-- 
2.45.2


