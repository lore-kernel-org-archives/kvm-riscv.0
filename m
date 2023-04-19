From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:38 -0700
Subject: [RFC 10/48] RISC-V: KVM: Implement static memory region measurement
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-11-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To support attestation of any images loaded by the VMM, the COVH allows
measuring these memory regions. Currently, it will be used for the
kernel image, device tree and initrd images.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_cove.h |   6 ++
 arch/riscv/kvm/cove.c             | 110 ++++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_cove.h b/arch/riscv/include/asm/kvm_cove.h
index 3bf1bcd..4ea1df1 100644
--- a/arch/riscv/include/asm/kvm_cove.h
+++ b/arch/riscv/include/asm/kvm_cove.h
@@ -127,6 +127,7 @@ void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu);
 void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap);
 
+int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr);
 int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size);
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva);
 #else
@@ -147,6 +148,11 @@ static inline void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu) {}
 static inline void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap) {}
 static inline int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa,
 					       unsigned long size) {return -1; }
+static inline int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm,
+						  struct kvm_riscv_cove_measure_region *mr)
+{
+	return -1;
+}
 static inline int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu,
 					    gpa_t gpa, unsigned long hva) {return -1; }
 #endif /* CONFIG_RISCV_COVE_HOST */
diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index d001e36..5b4d9ba 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -27,6 +27,12 @@ static DEFINE_SPINLOCK(cove_fence_lock);
 
 static bool riscv_cove_enabled;
 
+static inline bool cove_is_within_region(unsigned long addr1, unsigned long size1,
+				       unsigned long addr2, unsigned long size2)
+{
+	return ((addr1 <= addr2) && ((addr1 + size1) >= (addr2 + size2)));
+}
+
 static void kvm_cove_local_fence(void *info)
 {
 	int rc;
@@ -192,6 +198,109 @@ int kvm_riscv_cove_vcpu_init(struct kvm_vcpu *vcpu)
 	return rc;
 }
 
+int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr)
+{
+	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
+	int rc = 0, idx, num_pages;
+	struct kvm_riscv_cove_mem_region *conf;
+	struct page *pinned_page, *conf_page;
+	struct kvm_riscv_cove_page *cpage;
+
+	if (!tvmc)
+		return -EFAULT;
+
+	if (tvmc->finalized_done) {
+		kvm_err("measured_mr pages can not be added after finalize\n");
+		return -EINVAL;
+	}
+
+	num_pages = bytes_to_pages(mr->size);
+	conf = &tvmc->confidential_region;
+
+	if (!IS_ALIGNED(mr->userspace_addr, PAGE_SIZE) ||
+	    !IS_ALIGNED(mr->gpa, PAGE_SIZE) || !mr->size ||
+	    !cove_is_within_region(conf->gpa, conf->npages << PAGE_SHIFT, mr->gpa, mr->size))
+		return -EINVAL;
+
+	idx = srcu_read_lock(&kvm->srcu);
+
+	/*TODO: Iterate one page at a time as pinning multiple pages fail with unmapped panic
+	 * with a virtual address range belonging to vmalloc region for some reason.
+	 */
+	while (num_pages) {
+		if (signal_pending(current)) {
+			rc = -ERESTARTSYS;
+			break;
+		}
+
+		if (need_resched())
+			cond_resched();
+
+		rc = get_user_pages_fast(mr->userspace_addr, 1, 0, &pinned_page);
+		if (rc < 0) {
+			kvm_err("Pinning the userpsace addr %lx failed\n", mr->userspace_addr);
+			break;
+		}
+
+		/* Enough pages are not available to be pinned */
+		if (rc != 1) {
+			rc = -ENOMEM;
+			break;
+		}
+		conf_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!conf_page) {
+			rc = -ENOMEM;
+			break;
+		}
+
+		rc = cove_convert_pages(page_to_phys(conf_page), 1, true);
+		if (rc)
+			break;
+
+		/*TODO: Support other pages sizes */
+		rc = sbi_covh_add_measured_pages(tvmc->tvm_guest_id, page_to_phys(pinned_page),
+						 page_to_phys(conf_page), SBI_COVE_PAGE_4K,
+						 1, mr->gpa);
+		if (rc)
+			break;
+
+		/* Unpin the page now */
+		put_page(pinned_page);
+
+		cpage = kmalloc(sizeof(*cpage), GFP_KERNEL_ACCOUNT);
+		if (!cpage) {
+			rc = -ENOMEM;
+			break;
+		}
+
+		cpage->page = conf_page;
+		cpage->npages = 1;
+		cpage->gpa = mr->gpa;
+		cpage->hva = mr->userspace_addr;
+		cpage->is_mapped = true;
+		INIT_LIST_HEAD(&cpage->link);
+		list_add(&cpage->link, &tvmc->measured_pages);
+
+		mr->userspace_addr += PAGE_SIZE;
+		mr->gpa += PAGE_SIZE;
+		num_pages--;
+		conf_page = NULL;
+
+		continue;
+	}
+	srcu_read_unlock(&kvm->srcu, idx);
+
+	if (rc < 0) {
+		/* We don't to need unpin pages as it is allocated by the hypervisor itself */
+		cove_delete_page_list(kvm, &tvmc->measured_pages, false);
+		/* Free the last allocated page for which conversion/measurement failed */
+		kfree(conf_page);
+		kvm_err("Adding/Converting measured pages failed %d\n", num_pages);
+	}
+
+	return rc;
+}
+
 int kvm_riscv_cove_vm_add_memreg(struct kvm *kvm, unsigned long gpa, unsigned long size)
 {
 	int rc;
@@ -244,6 +353,7 @@ void kvm_riscv_cove_vm_destroy(struct kvm *kvm)
 	}
 
 	cove_delete_page_list(kvm, &tvmc->reclaim_pending_pages, false);
+	cove_delete_page_list(kvm, &tvmc->measured_pages, false);
 
 	/* Reclaim and Free the pages for tvm state management */
 	rc = sbi_covh_tsm_reclaim_pages(page_to_phys(tvmc->tvm_state.page), tvmc->tvm_state.npages);
-- 
2.25.1


