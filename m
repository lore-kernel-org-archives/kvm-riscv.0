From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:34 -0700
Subject: [RFC 06/48] RISC-V: KVM: Implement COVH SBI extension
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-7-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

COVH SBI extension defines the SBI functions that the host will
invoke to configure/create/destroy a TEE VM (TVM).

Implement all the COVH SBI extension functions.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kconfig                    |  13 ++
 arch/riscv/include/asm/kvm_cove_sbi.h |  46 +++++
 arch/riscv/kvm/Makefile               |   1 +
 arch/riscv/kvm/cove_sbi.c             | 245 ++++++++++++++++++++++++++
 4 files changed, 305 insertions(+)
 create mode 100644 arch/riscv/include/asm/kvm_cove_sbi.h
 create mode 100644 arch/riscv/kvm/cove_sbi.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4044080..8462941 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -501,6 +501,19 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
+menu "Confidential VM Extension(CoVE) Support"
+
+config RISCV_COVE_HOST
+	bool "Host(KVM) support for Confidential VM Extension(CoVE)"
+	depends on KVM
+	default n
+	help
+            Enable this if the platform supports confidential vm extension.
+	    That means the platform should be capable of running TEE VM (TVM)
+	    using KVM and TEE Security Manager (TSM).
+
+endmenu # "Confidential VM Extension(CoVE) Support"
+
 endmenu # "Platform type"
 
 menu "Kernel features"
diff --git a/arch/riscv/include/asm/kvm_cove_sbi.h b/arch/riscv/include/asm/kvm_cove_sbi.h
new file mode 100644
index 0000000..24562df
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_cove_sbi.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * COVE SBI extension related header file.
+ *
+ * Copyright (c) 2023 RivosInc
+ *
+ * Authors:
+ *     Atish Patra <atishp@rivosinc.com>
+ */
+
+#ifndef __KVM_COVE_SBI_H
+#define __KVM_COVE_SBI_H
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+
+int sbi_covh_tsm_get_info(struct sbi_cove_tsm_info *tinfo_addr);
+int sbi_covh_tvm_initiate_fence(unsigned long tvmid);
+int sbi_covh_tsm_initiate_fence(void);
+int sbi_covh_tsm_local_fence(void);
+int sbi_covh_tsm_create_tvm(struct sbi_cove_tvm_create_params *tparam, unsigned long *tvmid);
+int sbi_covh_tsm_finalize_tvm(unsigned long tvmid, unsigned long sepc, unsigned long entry_arg);
+int sbi_covh_tsm_destroy_tvm(unsigned long tvmid);
+int sbi_covh_add_memory_region(unsigned long tvmid, unsigned long tgpadr, unsigned long rlen);
+
+int sbi_covh_tsm_reclaim_pages(unsigned long phys_addr, unsigned long npages);
+int sbi_covh_tsm_convert_pages(unsigned long phys_addr, unsigned long npages);
+int sbi_covh_tsm_reclaim_page(unsigned long page_addr_phys);
+int sbi_covh_add_pgt_pages(unsigned long tvmid, unsigned long page_addr_phys, unsigned long npages);
+
+int sbi_covh_add_measured_pages(unsigned long tvmid, unsigned long src_addr,
+				unsigned long dest_addr, enum sbi_cove_page_type ptype,
+				unsigned long npages, unsigned long tgpa);
+int sbi_covh_add_zero_pages(unsigned long tvmid, unsigned long page_addr_phys,
+			    enum sbi_cove_page_type ptype, unsigned long npages,
+			    unsigned long tvm_base_page_addr);
+
+int sbi_covh_create_tvm_vcpu(unsigned long tvmid, unsigned long tvm_vcpuid,
+			     unsigned long vpus_page_addr);
+
+int sbi_covh_run_tvm_vcpu(unsigned long tvmid, unsigned long tvm_vcpuid);
+
+#endif
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 6986d3c..40dee04 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -31,3 +31,4 @@ kvm-y += aia.o
 kvm-y += aia_device.o
 kvm-y += aia_aplic.o
 kvm-y += aia_imsic.o
+kvm-$(CONFIG_RISCV_COVE_HOST) += cove_sbi.o
diff --git a/arch/riscv/kvm/cove_sbi.c b/arch/riscv/kvm/cove_sbi.c
new file mode 100644
index 0000000..c8c63fe
--- /dev/null
+++ b/arch/riscv/kvm/cove_sbi.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * COVE SBI extensions related helper functions.
+ *
+ * Copyright (c) 2023 RivosInc
+ *
+ * Authors:
+ *     Atish Patra <atishp@rivosinc.com>
+ */
+
+#include <linux/align.h>
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/csr.h>
+#include <asm/kvm_cove_sbi.h>
+#include <asm/sbi.h>
+
+#define RISCV_COVE_ALIGN_4KB (1UL << 12)
+
+int sbi_covh_tsm_get_info(struct sbi_cove_tsm_info *tinfo_addr)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TSM_GET_INFO, __pa(tinfo_addr),
+			sizeof(*tinfo_addr), 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tvm_initiate_fence(unsigned long tvmid)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TVM_INITIATE_FENCE, tvmid, 0, 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tsm_initiate_fence(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TSM_INITIATE_FENCE, 0, 0, 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tsm_local_fence(void)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TSM_LOCAL_FENCE, 0, 0, 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tsm_create_tvm(struct sbi_cove_tvm_create_params *tparam, unsigned long *tvmid)
+{
+	struct sbiret ret;
+	int rc = 0;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_CREATE_TVM, __pa(tparam),
+			sizeof(*tparam), 0, 0, 0, 0);
+
+	if (ret.error) {
+		rc = sbi_err_map_linux_errno(ret.error);
+		if (rc == -EFAULT)
+			kvm_err("Invalid phsyical address for tvm params structure\n");
+		goto done;
+	}
+
+	kvm_info("%s: create_tvm tvmid %lx\n", __func__, ret.value);
+	*tvmid = ret.value;
+
+done:
+	return rc;
+}
+
+int sbi_covh_tsm_finalize_tvm(unsigned long tvmid, unsigned long sepc, unsigned long entry_arg)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_FINALIZE_TVM, tvmid,
+			sepc, entry_arg, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tsm_destroy_tvm(unsigned long tvmid)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_DESTROY_TVM, tvmid,
+			0, 0, 0, 0, 0);
+
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_add_memory_region(unsigned long tvmid, unsigned long tgpaddr, unsigned long rlen)
+{
+	struct sbiret ret;
+
+	if (!IS_ALIGNED(tgpaddr, RISCV_COVE_ALIGN_4KB) || !IS_ALIGNED(rlen, RISCV_COVE_ALIGN_4KB))
+		return -EINVAL;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TVM_ADD_MEMORY_REGION, tvmid,
+			tgpaddr, rlen, 0, 0, 0);
+	if (ret.error) {
+		kvm_err("Add memory region failed with sbi error code %ld\n", ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	return 0;
+}
+
+int sbi_covh_tsm_convert_pages(unsigned long phys_addr, unsigned long npages)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TSM_CONVERT_PAGES, phys_addr,
+			npages, 0, 0, 0, 0);
+	if (ret.error) {
+		kvm_err("Convert pages failed ret %ld\n", ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+	return 0;
+}
+
+int sbi_covh_tsm_reclaim_page(unsigned long page_addr_phys)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TSM_RECLAIM_PAGES, page_addr_phys,
+			1, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_tsm_reclaim_pages(unsigned long phys_addr, unsigned long npages)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TSM_RECLAIM_PAGES, phys_addr,
+			npages, 0, 0, 0, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_add_pgt_pages(unsigned long tvmid, unsigned long page_addr_phys, unsigned long npages)
+{
+	struct sbiret ret;
+
+	if (!PAGE_ALIGNED(page_addr_phys))
+		return -EINVAL;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TVM_ADD_PGT_PAGES, tvmid, page_addr_phys,
+			npages, 0, 0, 0);
+	if (ret.error) {
+		kvm_err("Adding page table pages@%lx failed %ld\n", page_addr_phys, ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	return 0;
+}
+
+int sbi_covh_add_measured_pages(unsigned long tvmid, unsigned long src_addr,
+				unsigned long dest_addr, enum sbi_cove_page_type ptype,
+				unsigned long npages, unsigned long tgpa)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TVM_ADD_MEASURED_PAGES, tvmid, src_addr,
+			dest_addr, ptype, npages, tgpa);
+	if (ret.error) {
+		kvm_err("Adding measued pages failed ret %ld\n", ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+
+	return 0;
+}
+
+int sbi_covh_add_zero_pages(unsigned long tvmid, unsigned long page_addr_phys,
+			    enum sbi_cove_page_type ptype, unsigned long npages,
+			    unsigned long tvm_base_page_addr)
+{
+	struct sbiret ret;
+
+	if (!PAGE_ALIGNED(page_addr_phys))
+		return -EINVAL;
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TVM_ADD_ZERO_PAGES, tvmid, page_addr_phys,
+			ptype, npages, tvm_base_page_addr, 0);
+	if (ret.error)
+		return sbi_err_map_linux_errno(ret.error);
+
+	return 0;
+}
+
+int sbi_covh_create_tvm_vcpu(unsigned long tvmid, unsigned long vcpuid,
+			     unsigned long vcpu_state_paddr)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TVM_CREATE_VCPU, tvmid, vcpuid,
+			vcpu_state_paddr, 0, 0, 0);
+	if (ret.error) {
+		kvm_err("create vcpu failed ret %ld\n", ret.error);
+		return sbi_err_map_linux_errno(ret.error);
+	}
+	return 0;
+}
+
+int sbi_covh_run_tvm_vcpu(unsigned long tvmid, unsigned long vcpuid)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_COVH, SBI_EXT_COVH_TVM_VCPU_RUN, tvmid, vcpuid, 0, 0, 0, 0);
+	/* Non-zero return value indicate the vcpu is already terminated */
+	if (ret.error || !ret.value)
+		return ret.error ? sbi_err_map_linux_errno(ret.error) : ret.value;
+
+	return 0;
+}
-- 
2.25.1


