From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue,  9 May 2023 10:30:12 +0000
Subject: [PATCH -next v19 03/24] riscv: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_V
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
Message-ID: <20230509103033.11285-4-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Probing kernel support for Vector extension is available now.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 Documentation/riscv/hwprobe.rst       | 10 ++++++++++
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  3 +++
 arch/riscv/kernel/sys_riscv.c         |  9 +++++++++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 9f0dd62dcb5d..b8755e180fbf 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -53,6 +53,9 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_V`: Support for Vector extension, as
+    defined by verion 1.0 of the RISC-V Vector extension.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing the extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
@@ -64,6 +67,13 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_IMA_C`: The C extension is supported, as defined
     by version 2.2 of the RISC-V ISA manual.
 
+* :c:macro:`RISCV_HWPROBE_KEY_V_EXT_0`: A bitmask containing the extensions
+   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_V`: base
+   system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_V`: The V extension is supported, as defined by
+    version 1.0 of the RISC-V Vector extension manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 78936f4ff513..39df8604fea1 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,6 +8,6 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 5
+#define RISCV_HWPROBE_MAX_KEY 6
 
 #endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 8d745a4ad8a2..93a7fd3fd341 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -22,6 +22,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
 #define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_V	(1 << 1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
@@ -32,6 +33,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_FAST		(3 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
+#define RISCV_HWPROBE_KEY_V_EXT_0	6
+#define		RISCV_HWPROBE_V			(1 << 0)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 #endif
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 5db29683ebee..6280a7f778b3 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -10,6 +10,7 @@
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
+#include <asm/vector.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
@@ -161,6 +162,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_V;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
@@ -173,6 +175,13 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 
 		break;
 
+	case RISCV_HWPROBE_KEY_V_EXT_0:
+		pair->value = 0;
+		if (has_vector())
+			pair->value |= RISCV_HWPROBE_V;
+
+		break;
+
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 		pair->value = hwprobe_misaligned(cpus);
 		break;
-- 
2.17.1


