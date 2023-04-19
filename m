From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:12 -0700
Subject: [RFC 44/48] RISC-V: Add cc_platform_has() for RISC-V for CoVE
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-45-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

All the confidential computing solutions uses the arch specific
cc_platform_has function to enable memory encryption/decryption.
Implement the same for RISC-V to support that as well.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kconfig     |  1 +
 arch/riscv/cove/core.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 414cee1..2ca9e01 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -522,6 +522,7 @@ config RISCV_COVE_GUEST
 	default n
 	select SWIOTLB
 	select RISCV_MEM_ENCRYPT
+	select ARCH_HAS_CC_PLATFORM
 	help
 	  Enables support for running TVMs on platforms supporting CoVE.
 
diff --git a/arch/riscv/cove/core.c b/arch/riscv/cove/core.c
index 7218fe7..582feb1c 100644
--- a/arch/riscv/cove/core.c
+++ b/arch/riscv/cove/core.c
@@ -21,6 +21,18 @@ bool is_cove_guest(void)
 }
 EXPORT_SYMBOL_GPL(is_cove_guest);
 
+bool cc_platform_has(enum cc_attr attr)
+{
+	switch (attr) {
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
+	case CC_ATTR_MEM_ENCRYPT:
+		return is_cove_guest();
+	default:
+		return false;
+	}
+}
+EXPORT_SYMBOL_GPL(cc_platform_has);
+
 void riscv_cove_sbi_init(void)
 {
 	if (sbi_probe_extension(SBI_EXT_COVG) > 0)
-- 
2.25.1


