From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 12 Jul 2023 22:04:53 +0530
Subject: [kvmtool PATCH v4 1/9] kvm tools: Add __DECLARE_FLEX_ARRAY() in include/linux/stddef.h
In-Reply-To: <20230712163501.1769737-1-apatel@ventanamicro.com>
References: <20230712163501.1769737-1-apatel@ventanamicro.com>
Message-ID: <20230712163501.1769737-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Latest x86 UAPI headers uses __DECLARE_FLEX_ARRAY() macro so let us take
this macro from Linux UAPI header and add it to include/linux/stddef.h.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/stddef.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/stddef.h b/include/linux/stddef.h
index 39da808..d94e900 100644
--- a/include/linux/stddef.h
+++ b/include/linux/stddef.h
@@ -7,4 +7,20 @@
 #undef offsetof
 #define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
 
+/**
+ * __DECLARE_FLEX_ARRAY() - Declare a flexible array usable in a union
+ *
+ * @TYPE: The type of each flexible array element
+ * @NAME: The name of the flexible array member
+ *
+ * In order to have a flexible array member in a union or alone in a
+ * struct, it needs to be wrapped in an anonymous struct with at least 1
+ * named member, but that member can be empty.
+ */
+#define __DECLARE_FLEX_ARRAY(TYPE, NAME)	\
+	struct { \
+		struct { } __empty_ ## NAME; \
+		TYPE NAME[]; \
+	}
+
 #endif
-- 
2.34.1


