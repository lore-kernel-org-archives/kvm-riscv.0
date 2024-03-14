From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:21 -0700
Subject: [PATCH 02/18] KVM: sefltests: Add kvm_util_types.h to hold common
 types, e.g. vm_vaddr_t
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the base types unique to KVM selftests out of kvm_util.h and into a
new header, kvm_util_types.h.  This will allow kvm_util_arch.h, i.e. core
arch headers, to reference common types, e.g. vm_vaddr_t and vm_paddr_t.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 16 +--------------
 .../selftests/kvm/include/kvm_util_types.h    | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/kvm_util_types.h

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 95baee5142a7..acdcddf78e3f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -21,28 +21,14 @@
 #include <sys/ioctl.h>
 
 #include "kvm_util_arch.h"
+#include "kvm_util_types.h"
 #include "sparsebit.h"
 
-/*
- * Provide a version of static_assert() that is guaranteed to have an optional
- * message param.  If _ISOC11_SOURCE is defined, glibc (/usr/include/assert.h)
- * #undefs and #defines static_assert() as a direct alias to _Static_assert(),
- * i.e. effectively makes the message mandatory.  Many KVM selftests #define
- * _GNU_SOURCE for various reasons, and _GNU_SOURCE implies _ISOC11_SOURCE.  As
- * a result, static_assert() behavior is non-deterministic and may or may not
- * require a message depending on #include order.
- */
-#define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
-#define kvm_static_assert(expr, ...) __kvm_static_assert(expr, ##__VA_ARGS__, #expr)
-
 #define KVM_DEV_PATH "/dev/kvm"
 #define KVM_MAX_VCPUS 512
 
 #define NSEC_PER_SEC 1000000000L
 
-typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
-typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
-
 struct userspace_mem_region {
 	struct kvm_userspace_memory_region2 region;
 	struct sparsebit *unused_phy_pages;
diff --git a/tools/testing/selftests/kvm/include/kvm_util_types.h b/tools/testing/selftests/kvm/include/kvm_util_types.h
new file mode 100644
index 000000000000..764491366eb9
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/kvm_util_types.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_UTIL_TYPES_H
+#define SELFTEST_KVM_UTIL_TYPES_H
+
+/*
+ * Provide a version of static_assert() that is guaranteed to have an optional
+ * message param.  If _ISOC11_SOURCE is defined, glibc (/usr/include/assert.h)
+ * #undefs and #defines static_assert() as a direct alias to _Static_assert(),
+ * i.e. effectively makes the message mandatory.  Many KVM selftests #define
+ * _GNU_SOURCE for various reasons, and _GNU_SOURCE implies _ISOC11_SOURCE.  As
+ * a result, static_assert() behavior is non-deterministic and may or may not
+ * require a message depending on #include order.
+ */
+#define __kvm_static_assert(expr, msg, ...) _Static_assert(expr, msg)
+#define kvm_static_assert(expr, ...) __kvm_static_assert(expr, ##__VA_ARGS__, #expr)
+
+typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
+typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
+
+#endif /* SELFTEST_KVM_UTIL_TYPES_H */
-- 
2.44.0.291.gc1ea87d7ee-goog


