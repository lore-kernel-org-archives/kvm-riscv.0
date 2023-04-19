From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:48 -0700
Subject: [RFC 20/48] RISC-V: KVM: Add gstage mapping for TVMs
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-21-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For TVM, the gstage mapping is managed by the TSM via COVH SBI
calls. The host is responsible for allocating page that must be pinned
to avoid swapping. The page is converted it to confidential before
handing over to the TSM for gstage mapping.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/cove.c      | 63 +++++++++++++++++++++++++++++++++++++-
 arch/riscv/kvm/vcpu_exit.c |  9 ++++--
 2 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 4efcae3..44095f6 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -149,8 +149,68 @@ void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu)
 
 int kvm_riscv_cove_gstage_map(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long hva)
 {
-	/* TODO */
+	struct kvm_riscv_cove_page *tpage;
+	struct mm_struct *mm = current->mm;
+	struct kvm *kvm = vcpu->kvm;
+	unsigned int flags = FOLL_LONGTERM | FOLL_WRITE | FOLL_HWPOISON;
+	struct page *page;
+	int rc;
+	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
+
+	tpage = kmalloc(sizeof(*tpage), GFP_KERNEL_ACCOUNT);
+	if (!tpage)
+		return -ENOMEM;
+
+	mmap_read_lock(mm);
+	rc = pin_user_pages(hva, 1, flags, &page, NULL);
+	mmap_read_unlock(mm);
+
+	if (rc == -EHWPOISON) {
+		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
+				PAGE_SHIFT, current);
+		rc = 0;
+		goto free_tpage;
+	} else if (rc != 1) {
+		rc = -EFAULT;
+		goto free_tpage;
+	} else if (!PageSwapBacked(page)) {
+		rc = -EIO;
+		goto free_tpage;
+	}
+
+	rc = cove_convert_pages(page_to_phys(page), 1, true);
+	if (rc)
+		goto unpin_page;
+
+	rc = sbi_covh_add_zero_pages(tvmc->tvm_guest_id, page_to_phys(page),
+				     SBI_COVE_PAGE_4K, 1, gpa);
+	if (rc) {
+		pr_err("%s: Adding zero pages failed %d\n", __func__, rc);
+		goto zero_page_failed;
+	}
+	tpage->page = page;
+	tpage->npages = 1;
+	tpage->is_mapped = true;
+	tpage->gpa = gpa;
+	tpage->hva = hva;
+	INIT_LIST_HEAD(&tpage->link);
+
+	spin_lock(&kvm->mmu_lock);
+	list_add(&tpage->link, &kvm->arch.tvmc->zero_pages);
+	spin_unlock(&kvm->mmu_lock);
+
 	return 0;
+
+zero_page_failed:
+	//TODO: Do we need to reclaim the page now or VM gets destroyed ?
+
+unpin_page:
+	unpin_user_pages(&page, 1);
+
+free_tpage:
+	kfree(tpage);
+
+	return rc;
 }
 
 void kvm_riscv_cove_vcpu_switchto(struct kvm_vcpu *vcpu, struct kvm_cpu_trap *trap)
@@ -390,6 +450,7 @@ void kvm_riscv_cove_vm_destroy(struct kvm *kvm)
 
 	cove_delete_page_list(kvm, &tvmc->reclaim_pending_pages, false);
 	cove_delete_page_list(kvm, &tvmc->measured_pages, false);
+	cove_delete_page_list(kvm, &tvmc->zero_pages, true);
 
 	/* Reclaim and Free the pages for tvm state management */
 	rc = sbi_covh_tsm_reclaim_pages(page_to_phys(tvmc->tvm_state.page), tvmc->tvm_state.npages);
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0d0c895..d00b9ee5 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -41,8 +41,13 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		};
 	}
 
-	ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
-		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
+	if (is_cove_vcpu(vcpu)) {
+		/* CoVE doesn't care about PTE prots now. No need to compute the prots */
+		ret = kvm_riscv_cove_gstage_map(vcpu, fault_addr, hva);
+	} else {
+		ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
+			(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
+	}
 	if (ret < 0)
 		return ret;
 
-- 
2.25.1


