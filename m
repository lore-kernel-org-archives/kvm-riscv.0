From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:55 -0700
Subject: [RFC 27/48] RISC-V: KVM: Implement COVI SBI extension
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-28-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

CoVE specification defines a separate SBI extension to manage interrupts
in TVM. This extension is known as COVI as both host & guest
interface access these functions.

This patch implements the functions defined by COVI.

Co-developed-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove_sbi.h |  20 ++++
 arch/riscv/kvm/cove_sbi.c             | 164 ++++++++++++++++++++++++++
 2 files changed, 184 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove_sbi.h b/arch/riscv/include/asm/kvm_cove_sbi.h
index df7d88c..0759f70 100644
--- a/arch/riscv/include/asm/kvm_cove_sbi.h
+++ b/arch/riscv/include/asm/kvm_cove_sbi.h
@@ -32,6 +32,7 @@
 #define nacl_shmem_gpr_read_cove(__s, __g) \
 	nacl_shmem_scratch_read_long(__s, get_scratch_gpr_offset(__g))
 
+/* Functions related to CoVE Host Interface (COVH) Extension */
 int sbi_covh_tsm_get_info(struct sbi_cove_tsm_info *tinfo_addr);
 int sbi_covh_tvm_initiate_fence(unsigned long tvmid);
 int sbi_covh_tsm_initiate_fence(void);
@@ -58,4 +59,23 @@ int sbi_covh_create_tvm_vcpu(unsigned long tvmid, unsigned long tvm_vcpuid,
 
 int sbi_covh_run_tvm_vcpu(unsigned long tvmid, unsigned long tvm_vcpuid);
 
+/* Functions related to CoVE Interrupt Management(COVI) Extension */
+int sbi_covi_tvm_aia_init(unsigned long tvm_gid, struct sbi_cove_tvm_aia_params *tvm_aia_params);
+int sbi_covi_set_vcpu_imsic_addr(unsigned long tvm_gid, unsigned long vcpu_id,
+				 unsigned long imsic_addr);
+int sbi_covi_convert_imsic(unsigned long imsic_addr);
+int sbi_covi_reclaim_imsic(unsigned long imsic_addr);
+int sbi_covi_bind_vcpu_imsic(unsigned long tvm_gid, unsigned long vcpu_id,
+			     unsigned long imsic_mask);
+int sbi_covi_unbind_vcpu_imsic_begin(unsigned long tvm_gid, unsigned long vcpu_id);
+int sbi_covi_unbind_vcpu_imsic_end(unsigned long tvm_gid, unsigned long vcpu_id);
+int sbi_covi_inject_external_interrupt(unsigned long tvm_gid, unsigned long vcpu_id,
+					unsigned long interrupt_id);
+int sbi_covi_rebind_vcpu_imsic_begin(unsigned long tvm_gid, unsigned long vcpu_id,
+				      unsigned long imsic_mask);
+int sbi_covi_rebind_vcpu_imsic_clone(unsigned long tvm_gid, unsigned long vcpu_id);
+int sbi_covi_rebind_vcpu_imsic_end(unsigned long tvm_gid, unsigned long vcpu_id);
+
+
+
 #endif
diff --git a/arch/riscv/kvm/cove_sbi.c b/arch/riscv/kvm/cove_sbi.c
index bf037f6..a8901ac 100644
--- a/arch/riscv/kvm/cove_sbi.c
+++ b/arch/riscv/kvm/cove_sbi.c
@@ -18,6 +18,170 @@
 
 #define RISCV_COVE_ALIGN_4KB (1UL << 12)
 
+int sbi_covi_tvm_aia_init(unsigned long tvm_gid,
+			  struct sbi_cove_tvm_aia_params *tvm_aia_params)
+{
+	struct sbiret ret;
+
+	unsigned long pa = __pa(tvm_aia_params);
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_AIA_INIT, tvm_gid, pa,
+			sizeof(*tvm_aia_params), 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covi_set_vcpu_imsic_addr(unsigned long tvm_gid, unsigned long vcpu_id,
+				 unsigned long imsic_addr)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_CPU_SET_IMSIC_ADDR,
+			tvm_gid, vcpu_id, imsic_addr, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+/*
+ * Converts the guest interrupt file@`imsic_addr` for use with a TVM.
+ * The guest interrupt file must not be used by the caller until reclaim.
+ */
+int sbi_covi_convert_imsic(unsigned long imsic_addr)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_CONVERT_IMSIC,
+			imsic_addr, 0, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covi_reclaim_imsic(unsigned long imsic_addr)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_RECLAIM_IMSIC,
+			imsic_addr, 0, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+/*
+ * Binds a vCPU to this physical CPU and the specified set of confidential guest
+ * interrupt files.
+ */
+int sbi_covi_bind_vcpu_imsic(unsigned long tvm_gid, unsigned long vcpu_id,
+			     unsigned long imsic_mask)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_CPU_BIND_IMSIC, tvm_gid,
+			vcpu_id, imsic_mask, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+/*
+ * Begins the unbind process for the specified vCPU from this physical CPU and its guest
+ * interrupt files. The host must complete a TLB invalidation sequence for the TVM before
+ * completing the unbind with `unbind_vcpu_imsic_end()`.
+ */
+int sbi_covi_unbind_vcpu_imsic_begin(unsigned long tvm_gid,
+				     unsigned long vcpu_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_CPU_UNBIND_IMSIC_BEGIN,
+			tvm_gid, vcpu_id, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+/*
+ * Completes the unbind process for the specified vCPU from this physical CPU and its guest
+ * interrupt files.
+ */
+int sbi_covi_unbind_vcpu_imsic_end(unsigned long tvm_gid, unsigned long vcpu_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_CPU_UNBIND_IMSIC_END,
+			tvm_gid, vcpu_id, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+/*
+ * Injects an external interrupt into the specified vCPU. The interrupt ID must
+ * have been allowed with `allow_external_interrupt()` by the guest.
+ */
+int sbi_covi_inject_external_interrupt(unsigned long tvm_gid,
+				       unsigned long vcpu_id,
+				       unsigned long interrupt_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_CPU_INJECT_EXT_INTERRUPT,
+			tvm_gid, vcpu_id, interrupt_id, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covi_rebind_vcpu_imsic_begin(unsigned long tvm_gid,
+				     unsigned long vcpu_id,
+				     unsigned long imsic_mask)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_REBIND_IMSIC_BEGIN,
+			tvm_gid, vcpu_id, imsic_mask, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covi_rebind_vcpu_imsic_clone(unsigned long tvm_gid,
+				     unsigned long vcpu_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_REBIND_IMSIC_CLONE,
+			tvm_gid, vcpu_id, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covi_rebind_vcpu_imsic_end(unsigned long tvm_gid, unsigned long vcpu_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVI, SBI_EXT_COVI_TVM_REBIND_IMSIC_END,
+			tvm_gid, vcpu_id, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
 int sbi_covh_tsm_get_info(struct sbi_cove_tsm_info *tinfo_addr)
 {
 	struct sbiret ret;
-- 
2.25.1


