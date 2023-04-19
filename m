From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:08 -0700
Subject: [RFC 40/48] RISC-V: COVE: Add COVH invalidate, validate, promote, demote and remove APIs.
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-41-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

SBI_EXT_COVH_TVM_INVALIDATE_PAGES: Invalidates the pages in the specified
range of guest physical address space. The host can now work upon the
range without TVM's interaction. Any access from TVM to the range will
result in a page-fault which will be reported to the host.

SBI_EXT_COVH_TVM_VALIDATE_PAGES: Marks the invalidated pages in the
specified range of guest physical address space as present and TVM
can now access the pages.

SBI_EXT_COVH_TVM_PROMOTE_PAGES: Promotes a set of contiguous mappings
to the requested page size. This is mainly to support huge-pages.

SBI_EXT_COVH_TVM_DEMOTE_PAGES: Demotes a huge page mapping to a set
of contiguous mappings at the target size.

SBI_EXT_COVH_TVM_REMOVE_PAGES: Removes mappings from a TVM. The range
to be unmapped must already have been invalidated and fenced, and must
lie within a removable region of guest physical address space.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove_sbi.h | 16 +++++++
 arch/riscv/include/asm/sbi.h          |  5 +++
 arch/riscv/kvm/cove_sbi.c             | 65 +++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove_sbi.h b/arch/riscv/include/asm/kvm_cove_sbi.h
index 0759f70..b554a8d 100644
--- a/arch/riscv/include/asm/kvm_cove_sbi.h
+++ b/arch/riscv/include/asm/kvm_cove_sbi.h
@@ -59,6 +59,22 @@ int sbi_covh_create_tvm_vcpu(unsigned long tvmid, unsigned long tvm_vcpuid,
 
 int sbi_covh_run_tvm_vcpu(unsigned long tvmid, unsigned long tvm_vcpuid);
 
+int sbi_covh_tvm_invalidate_pages(unsigned long tvmid,
+			     unsigned long tvm_base_page_addr,
+			     unsigned long len);
+int sbi_covh_tvm_validate_pages(unsigned long tvmid,
+			       unsigned long tvm_base_page_addr,
+			       unsigned long len);
+int sbi_covh_tvm_promote_page(unsigned long tvmid,
+			      unsigned long tvm_base_page_addr,
+			      enum sbi_cove_page_type ptype);
+int sbi_covh_tvm_demote_page(unsigned long tvmid,
+			     unsigned long tvm_base_page_addr,
+			     enum sbi_cove_page_type ptype);
+int sbi_covh_tvm_remove_pages(unsigned long tvmid,
+			      unsigned long tvm_base_page_addr,
+			      unsigned long len);
+
 /* Functions related to CoVE Interrupt Management(COVI) Extension */
 int sbi_covi_tvm_aia_init(unsigned long tvm_gid, struct sbi_cove_tvm_aia_params *tvm_aia_params);
 int sbi_covi_set_vcpu_imsic_addr(unsigned long tvm_gid, unsigned long vcpu_id,
diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index e02ee75..03b0cc8 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -369,6 +369,11 @@ enum sbi_ext_covh_fid {
 	SBI_EXT_COVH_TVM_CREATE_VCPU,
 	SBI_EXT_COVH_TVM_VCPU_RUN,
 	SBI_EXT_COVH_TVM_INITIATE_FENCE,
+	SBI_EXT_COVH_TVM_INVALIDATE_PAGES,
+	SBI_EXT_COVH_TVM_VALIDATE_PAGES,
+	SBI_EXT_COVH_TVM_PROMOTE_PAGE,
+	SBI_EXT_COVH_TVM_DEMOTE_PAGE,
+	SBI_EXT_COVH_TVM_REMOVE_PAGES,
 };
 
 enum sbi_ext_covi_fid {
diff --git a/arch/riscv/kvm/cove_sbi.c b/arch/riscv/kvm/cove_sbi.c
index a8901ac..01dc260 100644
--- a/arch/riscv/kvm/cove_sbi.c
+++ b/arch/riscv/kvm/cove_sbi.c
@@ -405,3 +405,68 @@ int sbi_covh_run_tvm_vcpu(unsigned long tvmid, unsigned long vcpuid)
 
 	return 0;
 }
+
+int sbi_covh_tvm_invalidate_pages(unsigned long tvmid,
+			     unsigned long tvm_base_page_addr,
+			     unsigned long len)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_INVALIDATE_PAGES, tvmid,
+				      tvm_base_page_addr, len, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_validate_pages(unsigned long tvmid,
+			       unsigned long tvm_base_page_addr,
+			       unsigned long len)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_VALIDATE_PAGES, tvmid,
+				      tvm_base_page_addr, len, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_promote_page(unsigned long tvmid,
+			      unsigned long tvm_base_page_addr,
+			      enum sbi_cove_page_type ptype)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_PROMOTE_PAGE, tvmid,
+				      tvm_base_page_addr, ptype, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_demote_page(unsigned long tvmid,
+			     unsigned long tvm_base_page_addr,
+			     enum sbi_cove_page_type ptype)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_DEMOTE_PAGE, tvmid,
+				      tvm_base_page_addr, ptype, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_remove_pages(unsigned long tvmid,
+			      unsigned long tvm_base_page_addr,
+			      unsigned long len)
+{
+	struct sbiret ret = sbi_ecall(SBI_EXT_COVH,
+				      SBI_EXT_COVH_TVM_REMOVE_PAGES, tvmid,
+				      tvm_base_page_addr, len, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
-- 
2.25.1


