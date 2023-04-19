From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:35 -0700
Subject: [RFC 07/48] RISC-V: KVM: Add a barebone CoVE implementation
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-8-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch just adds a barebone implementation of CoVE functionality
that exercises the COVH functions to create/manage pages for various
boot time operations such as page directory, page table management,
vcpu/vm state management etc.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h | 154 ++++++++++++
 arch/riscv/include/asm/kvm_host.h |   7 +
 arch/riscv/kvm/Makefile           |   2 +-
 arch/riscv/kvm/cove.c             | 401 ++++++++++++++++++++++++++++++
 arch/riscv/kvm/cove_sbi.c         |   2 -
 include/uapi/linux/kvm.h          |   6 +
 6 files changed, 569 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_cove.h
 create mode 100644 arch/riscv/kvm/cove.c

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
new file mode 100644
index 0000000..3bf1bcd
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * COVE related header file.
+ *
+ * Copyright (c) 2023 RivosInc
+ *
+ * Authors:
+ *     Atish Patra <atishp@rivosinc.com>
+ */
+
+#ifndef __KVM_RISCV_COVE_H
+#define __KVM_RISCV_COVE_H
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <linux/kvm.h>
+#include <linux/list.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+
+#define KVM_COVE_PAGE_SIZE_4K	(1UL << 12)
+#define KVM_COVE_PAGE_SIZE_2MB	(1UL << 21)
+#define KVM_COVE_PAGE_SIZE_1GB	(1UL << 30)
+#define KVM_COVE_PAGE_SIZE_512GB (1UL << 39)
+
+#define bytes_to_pages(n) ((n + PAGE_SIZE - 1) >> PAGE_SHIFT)
+
+/* Allocate 2MB(i.e. 512 pages) for the page table pool */
+#define KVM_COVE_PGTABLE_SIZE_MAX ((1UL << 10) * PAGE_SIZE)
+
+#define get_order_num_pages(n) (get_order(n << PAGE_SHIFT))
+
+/* Describe a confidential or shared memory region */
+struct kvm_riscv_cove_mem_region {
+	unsigned long hva;
+	unsigned long gpa;
+	unsigned long npages;
+};
+
+/* Page management structure for the host */
+struct kvm_riscv_cove_page {
+	struct list_head link;
+
+	/* Pointer to page allocated */
+	struct page *page;
+
+	/* number of pages allocated for page */
+	unsigned long npages;
+
+	/* Described the page type */
+	unsigned long ptype;
+
+	/* set if the page is mapped in guest physical address */
+	bool is_mapped;
+
+	/* The below two fileds are only valid if is_mapped is true */
+	/* host virtual address for the mapping */
+	unsigned long hva;
+	/* guest physical address for the mapping */
+	unsigned long gpa;
+};
+
+struct kvm_cove_tvm_vcpu_context {
+	struct kvm_vcpu *vcpu;
+	/* Pages storing each vcpu state of the TVM in TSM */
+	struct kvm_riscv_cove_page vcpu_state;
+};
+
+struct kvm_cove_tvm_context {
+	struct kvm *kvm;
+
+	/* TODO: This is not really a VMID as TSM returns the page owner ID instead of VMID */
+	unsigned long tvm_guest_id;
+
+	/* Pages where TVM page table is stored */
+	struct kvm_riscv_cove_page pgtable;
+
+	/* Pages storing the TVM state in TSM */
+	struct kvm_riscv_cove_page tvm_state;
+
+	/* Keep track of zero pages */
+	struct list_head zero_pages;
+
+	/* Pages where TVM image is measured & loaded */
+	struct list_head measured_pages;
+
+	/* keep track of shared pages */
+	struct list_head shared_pages;
+
+	/* keep track of pending reclaim confidential pages */
+	struct list_head reclaim_pending_pages;
+
+	struct kvm_riscv_cove_mem_region shared_region;
+	struct kvm_riscv_cove_mem_region confidential_region;
+
+	/* spinlock to protect the tvm fence sequence */
+	spinlock_t tvm_fence_lock;
+
+	/* Track TVM state */
+	bool finalized_done;
+};
+
+static inline bool is_cove_vm(struct kvm *kvm)
+{
+	return kvm->arch.vm_type == KVM_VM_TYPE_RISCV_COVE;
+}
+
+static inline bool is_cove_vcpu(struct kvm_vcpu *vcpu)
+{
+	return is_cove_vm(vcpu->kvm);
+}
+
+#ifdef CONFIG_RISCV_COVE_HOST
+
+bool kvm_riscv_cove_enabled(void);
+int kvm_riscv_cove_init(void);
+
+/* TVM related functions */
+void kvm_riscv_cove_vm_destroy(struct kvm *kvm);
+int kvm_riscv_cove_vm_init(struct kvm *kvm);
+
+/* TVM VCPU related functions */
+void kvm_riscv_cove_vcpu_destroy(struct kvm_vcpu *vcpu);
+int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu);
+void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu);
+void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap);
+
+int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size);
+int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva);
+#else
+static inline bool kvm_riscv_cove_enabled(void) {return false; };
+static inline int kvm_riscv_cove_init(void) { return -1; }
+static inline void kvm_riscv_cove_hardware_disable(void) {}
+static inline int kvm_riscv_cove_hardware_enable(void) {return 0; }
+
+/* TVM related functions */
+static inline void kvm_riscv_cove_vm_destroy(struct kvm *kvm) {}
+static inline int kvm_riscv_cove_vm_init(struct kvm *kvm) {return -1; }
+
+/* TVM VCPU related functions */
+static inline void kvm_riscv_cove_vcpu_destroy(struct kvm_vcpu *vcpu) {}
+static inline int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu) {return -1; }
+static inline void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu) {}
+static inline void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu) {}
+static inline void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap) {}
+static inline int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa,
+					       unsigned long size) {return -1; }
+static inline int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu,
+					    gpa_t gpa, unsigned long hva) {return -1; }
+#endif /* CONFIG_RISCV_COVE_HOST */
+
+#endif /* __KVM_RISCV_COVE_H */
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 63c46af..ca2ebe3 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -88,6 +88,8 @@ struct kvm_vmid {
 };
 
 struct kvm_arch {
+	unsigned long vm_type;
+
 	/* G-stage vmid */
 	struct kvm_vmid vmid;
 
@@ -100,6 +102,9 @@ struct kvm_arch {
 
 	/* AIA Guest/VM context */
 	struct kvm_aia aia;
+
+	/* COVE guest/VM context */
+	struct kvm_cove_tvm_context *tvmc;
 };
 
 struct kvm_cpu_trap {
@@ -242,6 +247,8 @@ struct kvm_vcpu_arch {
 
 	/* Performance monitoring context */
 	struct kvm_pmu pmu_context;
+
+	struct kvm_cove_tvm_vcpu_context *tc;
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 40dee04..8c91551 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -31,4 +31,4 @@ kvm-y += aia.o
 kvm-y += aia_device.o
 kvm-y += aia_aplic.o
 kvm-y += aia_imsic.o
-kvm-$(CONFIG_RISCV_COVE_HOST) += cove_sbi.o
+kvm-$(CONFIG_RISCV_COVE_HOST) += cove_sbi.o cove.o
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
new file mode 100644
index 0000000..d001e36
--- /dev/null
+++ b/arch/riscv/kvm/cove.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * COVE related helper functions.
+ *
+ * Copyright (c) 2023 RivosInc
+ *
+ * Authors:
+ *     Atish Patra <atishp@rivosinc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <linux/smp.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+#include <asm/kvm_nacl.h>
+#include <asm/kvm_cove.h>
+#include <asm/kvm_cove_sbi.h>
+#include <asm/asm-offsets.h>
+
+static struct sbi_cove_tsm_info tinfo;
+struct sbi_cove_tvm_create_params params;
+
+/* We need a global lock as initiate fence can be invoked once per host */
+static DEFINE_SPINLOCK(cove_fence_lock);
+
+static bool riscv_cove_enabled;
+
+static void kvm_cove_local_fence(void *info)
+{
+	int rc;
+
+	rc = sbi_covh_tsm_local_fence();
+
+	if (rc)
+		kvm_err("local fence for TSM failed %d on cpu %d\n", rc, smp_processor_id());
+}
+
+static void cove_delete_page_list(struct kvm *kvm, struct list_head *tpages, bool unpin)
+{
+	struct kvm_riscv_cove_page *tpage, *temp;
+	int rc;
+
+	list_for_each_entry_safe(tpage, temp, tpages, link) {
+		rc = sbi_covh_tsm_reclaim_pages(page_to_phys(tpage->page), tpage->npages);
+		if (rc)
+			kvm_err("Reclaiming page %llx failed\n", page_to_phys(tpage->page));
+		if (unpin)
+			unpin_user_pages_dirty_lock(&tpage->page, 1, true);
+		list_del(&tpage->link);
+		kfree(tpage);
+	}
+}
+
+static int kvm_riscv_cove_fence(void)
+{
+	int rc;
+
+	spin_lock(&cove_fence_lock);
+
+	rc = sbi_covh_tsm_initiate_fence();
+	if (rc) {
+		kvm_err("initiate fence for tsm failed %d\n", rc);
+		goto done;
+	}
+
+	/* initiate local fence on each online hart */
+	on_each_cpu(kvm_cove_local_fence, NULL, 1);
+done:
+	spin_unlock(&cove_fence_lock);
+	return rc;
+}
+
+static int cove_convert_pages(unsigned long phys_addr, unsigned long npages, bool fence)
+{
+	int rc;
+
+	if (!IS_ALIGNED(phys_addr, PAGE_SIZE))
+		return -EINVAL;
+
+	rc = sbi_covh_tsm_convert_pages(phys_addr, npages);
+	if (rc)
+		return rc;
+
+	/* Conversion was successful. Flush the TLB if caller requested */
+	if (fence)
+		rc = kvm_riscv_cove_fence();
+
+	return rc;
+}
+
+__always_inline bool kvm_riscv_cove_enabled(void)
+{
+	return riscv_cove_enabled;
+}
+
+void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu)
+{
+	/* TODO */
+}
+
+void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu)
+{
+	/* TODO */
+}
+
+int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva)
+{
+	/* TODO */
+	return 0;
+}
+
+void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
+{
+	/* TODO */
+}
+
+void kvm_riscv_cove_vcpu_destroy(struct kvm_vcpu *vcpu)
+{
+	struct kvm_cove_tvm_vcpu_context *tvcpuc = vcpu->arch.tc;
+	struct kvm *kvm = vcpu->kvm;
+
+	/*
+	 * Just add the vcpu state pages to a list at this point as these can not
+	 * be claimed until tvm is destroyed. *
+	 */
+	list_add(&tvcpuc->vcpu_state.link, &kvm->arch.tvmc->reclaim_pending_pages);
+}
+
+int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu)
+{
+	int rc;
+	struct kvm *kvm;
+	struct kvm_cove_tvm_vcpu_context *tvcpuc;
+	struct kvm_cove_tvm_context *tvmc;
+	struct page *vcpus_page;
+	unsigned long vcpus_phys_addr;
+
+	if (!vcpu)
+		return -EINVAL;
+
+	kvm = vcpu->kvm;
+
+	if (!kvm->arch.tvmc)
+		return -EINVAL;
+
+	tvmc = kvm->arch.tvmc;
+
+	if (tvmc->finalized_done) {
+		kvm_err("vcpu init must not happen after finalize\n");
+		return -EINVAL;
+	}
+
+	tvcpuc = kzalloc(sizeof(*tvcpuc), GFP_KERNEL);
+	if (!tvcpuc)
+		return -ENOMEM;
+
+	vcpus_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
+				 get_order_num_pages(tinfo.tvcpu_pages_needed));
+	if (!vcpus_page) {
+		rc = -ENOMEM;
+		goto alloc_page_failed;
+	}
+
+	tvcpuc->vcpu = vcpu;
+	tvcpuc->vcpu_state.npages = tinfo.tvcpu_pages_needed;
+	tvcpuc->vcpu_state.page = vcpus_page;
+	vcpus_phys_addr = page_to_phys(vcpus_page);
+
+	rc = cove_convert_pages(vcpus_phys_addr, tvcpuc->vcpu_state.npages, true);
+	if (rc)
+		goto convert_failed;
+
+	rc = sbi_covh_create_tvm_vcpu(tvmc->tvm_guest_id, vcpu->vcpu_idx, vcpus_phys_addr);
+	if (rc)
+		goto vcpu_create_failed;
+
+	vcpu->arch.tc = tvcpuc;
+
+	return 0;
+
+vcpu_create_failed:
+	/* Reclaim all the pages or return to the confidential page pool */
+	sbi_covh_tsm_reclaim_pages(vcpus_phys_addr, tvcpuc->vcpu_state.npages);
+
+convert_failed:
+	__free_pages(vcpus_page, get_order_num_pages(tinfo.tvcpu_pages_needed));
+
+alloc_page_failed:
+	kfree(tvcpuc);
+	return rc;
+}
+
+int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size)
+{
+	int rc;
+	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
+
+	if (!tvmc)
+		return -EFAULT;
+
+	if (tvmc->finalized_done) {
+		kvm_err("Memory region can not be added after finalize\n");
+		return -EINVAL;
+	}
+
+	tvmc->confidential_region.gpa = gpa;
+	tvmc->confidential_region.npages = bytes_to_pages(size);
+
+	rc = sbi_covh_add_memory_region(tvmc->tvm_guest_id, gpa, size);
+	if (rc) {
+		kvm_err("Registering confidential memory region failed with rc %d\n", rc);
+		return rc;
+	}
+
+	kvm_info("%s: Success with gpa %lx size %lx\n", __func__, gpa, size);
+
+	return 0;
+}
+
+/*
+ * Destroying A TVM is expensive because we need to reclaim all the pages by iterating over it.
+ * Few ideas to improve:
+ * 1. At least do the reclaim part in a worker thread in the background
+ * 2. Define a page pool which can contain a pre-allocated/converted pages.
+ *    In this step, we just return to the confidential page pool. Thus, some other TVM
+ *    can use it.
+ */
+void kvm_riscv_cove_vm_destroy(struct kvm *kvm)
+{
+	int rc;
+	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
+	unsigned long pgd_npages;
+
+	if (!tvmc)
+		return;
+
+	/* Release all the confidential pages using COVH SBI call */
+	rc = sbi_covh_tsm_destroy_tvm(tvmc->tvm_guest_id);
+	if (rc) {
+		kvm_err("TVM %ld destruction failed with rc = %d\n", tvmc->tvm_guest_id, rc);
+		return;
+	}
+
+	cove_delete_page_list(kvm, &tvmc->reclaim_pending_pages, false);
+
+	/* Reclaim and Free the pages for tvm state management */
+	rc = sbi_covh_tsm_reclaim_pages(page_to_phys(tvmc->tvm_state.page), tvmc->tvm_state.npages);
+	if (rc)
+		goto reclaim_failed;
+
+	__free_pages(tvmc->tvm_state.page, get_order_num_pages(tvmc->tvm_state.npages));
+
+	/* Reclaim and Free the pages for gstage page table management */
+	rc = sbi_covh_tsm_reclaim_pages(page_to_phys(tvmc->pgtable.page), tvmc->pgtable.npages);
+	if (rc)
+		goto reclaim_failed;
+
+	__free_pages(tvmc->pgtable.page, get_order_num_pages(tvmc->pgtable.npages));
+
+	/* Reclaim the confidential page for pgd */
+	pgd_npages = kvm_riscv_gstage_pgd_size() >> PAGE_SHIFT;
+	rc = sbi_covh_tsm_reclaim_pages(kvm->arch.pgd_phys, pgd_npages);
+	if (rc)
+		goto reclaim_failed;
+
+	kfree(tvmc);
+
+	return;
+
+reclaim_failed:
+	kvm_err("Memory reclaim failed with rc %d\n", rc);
+}
+
+int kvm_riscv_cove_vm_init(struct kvm *kvm)
+{
+	struct kvm_cove_tvm_context *tvmc;
+	struct page *tvms_page, *pgt_page;
+	unsigned long tvm_gid, pgt_phys_addr, tvms_phys_addr;
+	unsigned long gstage_pgd_size = kvm_riscv_gstage_pgd_size();
+	int rc = 0;
+
+	tvmc = kzalloc(sizeof(*tvmc), GFP_KERNEL);
+	if (!tvmc)
+		return -ENOMEM;
+
+	/* Allocate the pages required for gstage page table management */
+	/* TODO: Just give enough pages for page table pool for now */
+	pgt_page = alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(KVM_COVE_PGTABLE_SIZE_MAX));
+	if (!pgt_page)
+		return -ENOMEM;
+
+	/* pgd is always 16KB aligned */
+	rc = cove_convert_pages(kvm->arch.pgd_phys, gstage_pgd_size >> PAGE_SHIFT, false);
+	if (rc)
+		goto done;
+
+	/* Convert the gstage page table pages */
+	tvmc->pgtable.page = pgt_page;
+	tvmc->pgtable.npages = KVM_COVE_PGTABLE_SIZE_MAX >> PAGE_SHIFT;
+	pgt_phys_addr = page_to_phys(pgt_page);
+
+	rc = cove_convert_pages(pgt_phys_addr, tvmc->pgtable.npages, false);
+	if (rc) {
+		kvm_err("%s: page table pool conversion failed rc %d\n", __func__, rc);
+		goto pgt_convert_failed;
+	}
+
+	/* Allocate and convert the pages required for TVM state management */
+	tvms_page = alloc_pages(GFP_KERNEL | __GFP_ZERO,
+				get_order_num_pages(tinfo.tvm_pages_needed));
+	if (!tvms_page) {
+		rc = -ENOMEM;
+		goto tvms_alloc_failed;
+	}
+
+	tvmc->tvm_state.page = tvms_page;
+	tvmc->tvm_state.npages = tinfo.tvm_pages_needed;
+	tvms_phys_addr = page_to_phys(tvms_page);
+
+	rc = cove_convert_pages(tvms_phys_addr, tinfo.tvm_pages_needed, false);
+	if (rc) {
+		kvm_err("%s: tvm state page conversion failed rc %d\n", __func__, rc);
+		goto tvms_convert_failed;
+	}
+
+	rc = kvm_riscv_cove_fence();
+	if (rc)
+		goto tvm_init_failed;
+
+	INIT_LIST_HEAD(&tvmc->measured_pages);
+	INIT_LIST_HEAD(&tvmc->zero_pages);
+	INIT_LIST_HEAD(&tvmc->shared_pages);
+	INIT_LIST_HEAD(&tvmc->reclaim_pending_pages);
+
+	/* The required pages have been converted to confidential memory. Create the TVM now */
+	params.tvm_page_directory_addr = kvm->arch.pgd_phys;
+	params.tvm_state_addr = tvms_phys_addr;
+
+	rc = sbi_covh_tsm_create_tvm(&params, &tvm_gid);
+	if (rc)
+		goto tvm_init_failed;
+
+	tvmc->tvm_guest_id = tvm_gid;
+	spin_lock_init(&tvmc->tvm_fence_lock);
+	kvm->arch.tvmc = tvmc;
+
+	rc = sbi_covh_add_pgt_pages(tvm_gid, pgt_phys_addr, tvmc->pgtable.npages);
+	if (rc)
+		goto tvm_init_failed;
+
+	tvmc->kvm = kvm;
+	kvm_info("Guest VM creation successful with guest id %lx\n", tvm_gid);
+
+	return 0;
+
+tvm_init_failed:
+	/* Reclaim tvm state pages */
+	sbi_covh_tsm_reclaim_pages(tvms_phys_addr, tvmc->tvm_state.npages);
+
+tvms_convert_failed:
+	__free_pages(tvms_page, get_order_num_pages(tinfo.tvm_pages_needed));
+
+tvms_alloc_failed:
+	/* Reclaim pgtable pages */
+	sbi_covh_tsm_reclaim_pages(pgt_phys_addr, tvmc->pgtable.npages);
+
+pgt_convert_failed:
+	__free_pages(pgt_page, get_order(KVM_COVE_PGTABLE_SIZE_MAX));
+	/* Reclaim pgd pages */
+	sbi_covh_tsm_reclaim_pages(kvm->arch.pgd_phys, gstage_pgd_size >> PAGE_SHIFT);
+
+done:
+	kfree(tvmc);
+	return rc;
+}
+
+int kvm_riscv_cove_init(void)
+{
+	int rc;
+
+	/* We currently support host in VS mode. Thus, NACL is mandatory */
+	if (sbi_probe_extension(SBI_EXT_COVH) <= 0 || !kvm_riscv_nacl_available())
+		return -EOPNOTSUPP;
+
+	rc = sbi_covh_tsm_get_info(&tinfo);
+	if (rc < 0)
+		return -EINVAL;
+
+	if (tinfo.tstate != TSM_READY) {
+		kvm_err("TSM is not ready yet. Can't run TVMs\n");
+		return -EAGAIN;
+	}
+
+	riscv_cove_enabled = true;
+	kvm_info("The platform has confidential computing feature enabled\n");
+	kvm_info("TSM version %d is loaded and ready to run\n", tinfo.version);
+
+	return 0;
+}
diff --git a/arch/riscv/kvm/cove_sbi.c b/arch/riscv/kvm/cove_sbi.c
index c8c63fe..bf037f6 100644
--- a/arch/riscv/kvm/cove_sbi.c
+++ b/arch/riscv/kvm/cove_sbi.c
@@ -82,9 +82,7 @@ int sbi_covh_tsm_create_tvm(struct sbi_cove_tvm_create_params *tparam, unsigned
 		goto done;
 	}
 
-	kvm_info("%s: create_tvm tvmid %lx\n", __func__, ret.value);
 	*tvmid = ret.value;
-
 done:
 	return rc;
 }
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 8923319..a55a6a5 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -914,6 +914,12 @@ struct kvm_ppc_resize_hpt {
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
+
+/*
+ * RISCV-V Confidential VM type. The large bit shift is chosen on purpose
+ * to allow other architectures to have their specific VM types if required.
+ */
+#define KVM_VM_TYPE_RISCV_COVE	(1UL << 9)
 /*
  * ioctls for /dev/kvm fds:
  */
-- 
2.25.1


