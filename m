From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 19 Jun 2024 13:35:24 +0200
Subject: [PATCH v7 14/16] riscv: hwprobe: export Zcmop ISA extension
In-Reply-To: <20240619113529.676940-1-cleger@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
Message-ID: <20240619113529.676940-15-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Export Zcmop ISA extension through hwprobe.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 4d9b4ed34c96..25d783be2878 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -231,6 +231,10 @@ The following keys are defined:
        ("Zcf doesn't exist on RV64 as it contains no instructions") of
        riscv-code-size-reduction.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCMOP`: The Zcmop May-Be-Operations extension is
+       supported as defined in the RISC-V ISA manual starting from commit
+       c732a4f39a4 ("Zcmop is ratified/1.0").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index c38f3f2b8382..920fc6a586c9 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -70,6 +70,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 44)
 #define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 45)
 #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
+#define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 89e03cdf38b7..3d1aa13a0bb2 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -115,6 +115,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZIMOP);
 		EXT_KEY(ZCA);
 		EXT_KEY(ZCB);
+		EXT_KEY(ZCMOP);
 
 		/*
 		 * All the following extensions must depend on the kernel
-- 
2.45.2


