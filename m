From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:33 -0700
Subject: [RFC 05/48] RISC-V: Add COVH SBI extensions definitions
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-6-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V Confidential Virtualization Extension(COVE) specification defines
following 3 SBI extensions.

COVH (Host side interface)
COVG (Guest side interface)
COVI (Interrupt management interface)

Few acronyms introduced in this patch:

TSM - TEE Security Manager
TVM - TEE VM

This patch adds the definitions for COVH extension only.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 62d00c7..c5a5526 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -32,6 +32,7 @@ enum sbi_ext_id {
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_COVH = 0x434F5648,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -348,6 +349,66 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+/* SBI COVH extension data structures */
+enum sbi_ext_covh_fid {
+	SBI_EXT_COVH_TSM_GET_INFO = 0,
+	SBI_EXT_COVH_TSM_CONVERT_PAGES,
+	SBI_EXT_COVH_TSM_RECLAIM_PAGES,
+	SBI_EXT_COVH_TSM_INITIATE_FENCE,
+	SBI_EXT_COVH_TSM_LOCAL_FENCE,
+	SBI_EXT_COVH_CREATE_TVM,
+	SBI_EXT_COVH_FINALIZE_TVM,
+	SBI_EXT_COVH_DESTROY_TVM,
+	SBI_EXT_COVH_TVM_ADD_MEMORY_REGION,
+	SBI_EXT_COVH_TVM_ADD_PGT_PAGES,
+	SBI_EXT_COVH_TVM_ADD_MEASURED_PAGES,
+	SBI_EXT_COVH_TVM_ADD_ZERO_PAGES,
+	SBI_EXT_COVH_TVM_ADD_SHARED_PAGES,
+	SBI_EXT_COVH_TVM_CREATE_VCPU,
+	SBI_EXT_COVH_TVM_VCPU_RUN,
+	SBI_EXT_COVH_TVM_INITIATE_FENCE,
+};
+
+enum sbi_cove_page_type {
+	SBI_COVE_PAGE_4K,
+	SBI_COVE_PAGE_2MB,
+	SBI_COVE_PAGE_1GB,
+	SBI_COVE_PAGE_512GB,
+};
+
+enum sbi_cove_tsm_state {
+	/* TSM has not been loaded yet */
+	TSM_NOT_LOADED,
+	/* TSM has been loaded but not initialized yet */
+	TSM_LOADED,
+	/* TSM has been initialized and ready to run */
+	TSM_READY,
+};
+
+struct sbi_cove_tsm_info {
+	/* Current state of the TSM */
+	enum sbi_cove_tsm_state tstate;
+
+	/* Version of the loaded TSM */
+	uint32_t version;
+
+	/* Number of 4K pages required per TVM */
+	unsigned long tvm_pages_needed;
+
+	/* Maximum VCPUs supported per TVM */
+	unsigned long tvm_max_vcpus;
+
+	/* Number of 4K pages each vcpu per TVM */
+	unsigned long tvcpu_pages_needed;
+};
+
+struct sbi_cove_tvm_create_params {
+	/* Root page directory for TVM's page table management */
+	unsigned long tvm_page_directory_addr;
+	/* Confidential memory address used to store TVM state information. Must be page aligned */
+	unsigned long tvm_state_addr;
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.25.1


