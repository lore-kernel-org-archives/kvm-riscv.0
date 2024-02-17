From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Feb 2024 16:57:37 -0800
Subject: [PATCH RFC 19/20] RISC-V: Add hwprobe support for Counter delegation extensions
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Message-ID: <20240217005738.3744121-20-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Even though the counter delegation extensions are all S-mode extension,
perf tool can use it decide whether it wants to map standard events
or not. Remapping is not required for if SBI PMU is being used
for hardware events.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 10 ++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c       |  3 +++
 3 files changed, 17 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..77fa0ed09366 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,16 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_SMCDELEG`: The Smcdeleg extension is supported as
+       defined in the RISC-V Counter Delegation extension manual starting from
+       commit ff61c1f ("switch to v1.0.0 and frozen")
+  * :c:macro:`RISCV_HWPROBE_EXT_SSCCFG`: The Ssccfg extension is supported as
+       defined in the RISC-V Counter Delegation extension manual starting from
+       commit ff61c1f ("switch to v1.0.0 and frozen")
+  * :c:macro:`RISCV_HWPROBE_EXT_SSCSRIND`: The Sscsrind extension is supported as
+       defined in the RISC-V Indirect CSR extension manual starting from
+       commit a28625c ("mark spec as frozen")
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..fb7c6bd6822a 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,10 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_SSCSRIND	(1ULL << 36)
+#define		RISCV_HWPROBE_EXT_SMCDELEG	(1ULL << 37)
+#define		RISCV_HWPROBE_EXT_SSCCFG	(1ULL << 38)
+
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..befb6582b1ce 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,9 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
+		EXT_KEY(SSCSRIND);
+		EXT_KEY(SMCDELEG);
+		EXT_KEY(SSCCFG);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.34.1


