From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:54 -0700
Subject: [RFC 26/48] RISC-V: Add COVI extension definitions
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-27-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

This patch adds the CoVE interrupt management extension(COVI) details
to the sbi header file.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index c5a5526..bbea922 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -33,6 +33,7 @@ enum sbi_ext_id {
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_NACL = 0x4E41434C,
 	SBI_EXT_COVH = 0x434F5648,
+	SBI_EXT_COVI = 0x434F5649,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -369,6 +370,20 @@ enum sbi_ext_covh_fid {
 	SBI_EXT_COVH_TVM_INITIATE_FENCE,
 };
 
+enum sbi_ext_covi_fid {
+	SBI_EXT_COVI_TVM_AIA_INIT,
+	SBI_EXT_COVI_TVM_CPU_SET_IMSIC_ADDR,
+	SBI_EXT_COVI_TVM_CONVERT_IMSIC,
+	SBI_EXT_COVI_TVM_RECLAIM_IMSIC,
+	SBI_EXT_COVI_TVM_CPU_BIND_IMSIC,
+	SBI_EXT_COVI_TVM_CPU_UNBIND_IMSIC_BEGIN,
+	SBI_EXT_COVI_TVM_CPU_UNBIND_IMSIC_END,
+	SBI_EXT_COVI_TVM_CPU_INJECT_EXT_INTERRUPT,
+	SBI_EXT_COVI_TVM_REBIND_IMSIC_BEGIN,
+	SBI_EXT_COVI_TVM_REBIND_IMSIC_CLONE,
+	SBI_EXT_COVI_TVM_REBIND_IMSIC_END,
+};
+
 enum sbi_cove_page_type {
 	SBI_COVE_PAGE_4K,
 	SBI_COVE_PAGE_2MB,
@@ -409,6 +424,21 @@ struct sbi_cove_tvm_create_params {
 	unsigned long tvm_state_addr;
 };
 
+struct sbi_cove_tvm_aia_params {
+	/* The base address is the address of the IMSIC with group ID, hart ID, and guest ID of 0 */
+	uint64_t imsic_base_addr;
+	/* The number of group index bits in an IMSIC address */
+	uint32_t group_index_bits;
+	/* The location of the group index in an IMSIC address. Must be >= 24i. */
+	uint32_t group_index_shift;
+	/* The number of hart index bits in an IMSIC address */
+	uint32_t hart_index_bits;
+	/* The number of guest index bits in an IMSIC address. Must be >= log2(guests/hart + 1) */
+	uint32_t guest_index_bits;
+	/* The number of guest interrupt files to be implemented per vCPU */
+	uint32_t guests_per_hart;
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.25.1


