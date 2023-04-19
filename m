From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:05 -0700
Subject: [RFC 37/48] RISC-V: Add COVG SBI extension definitions
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-38-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

CoVE specification defines a separate SBI extension known as CoVG
for the guest side interface. Add the definitions for that extension.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index bbea922..e02ee75 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -34,6 +34,7 @@ enum sbi_ext_id {
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_COVH = 0x434F5648,
 	SBI_EXT_COVI = 0x434F5649,
+	SBI_EXT_COVG = 0x434F5647,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -439,6 +440,16 @@ struct sbi_cove_tvm_aia_params {
 	uint32_t guests_per_hart;
 };
 
+/* SBI COVG extension data structures */
+enum sbi_ext_covg_fid {
+	SBI_EXT_COVG_ADD_MMIO_REGION,
+	SBI_EXT_COVG_REMOVE_MMIO_REGION,
+	SBI_EXT_COVG_SHARE_MEMORY,
+	SBI_EXT_COVG_UNSHARE_MEMORY,
+	SBI_EXT_COVG_ALLOW_EXT_INTERRUPT,
+	SBI_EXT_COVG_DENY_EXT_INTERRUPT,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.25.1


