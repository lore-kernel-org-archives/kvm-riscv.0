From: Sean Christopherson <seanjc@google.com>
Date: Thu, 20 Apr 2023 08:17:29 -0700
Subject: [RFC 10/48] RISC-V: KVM: Implement static memory region measurement
In-Reply-To: <20230419221716.3603068-11-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-11-atishp@rivosinc.com>
Message-ID: <ZEFXiXu+0XLSdRkQ@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 19, 2023, Atish Patra wrote:
> +int kvm_riscv_cove_vm_measure_pages(struct kvm *kvm, struct kvm_riscv_cove_measure_region *mr)
> +{
> +	struct kvm_cove_tvm_context *tvmc = kvm->arch.tvmc;
> +	int rc = 0, idx, num_pages;
> +	struct kvm_riscv_cove_mem_region *conf;
> +	struct page *pinned_page, *conf_page;
> +	struct kvm_riscv_cove_page *cpage;
> +
> +	if (!tvmc)
> +		return -EFAULT;
> +
> +	if (tvmc->finalized_done) {
> +		kvm_err("measured_mr pages can not be added after finalize\n");
> +		return -EINVAL;
> +	}
> +
> +	num_pages = bytes_to_pages(mr->size);
> +	conf = &tvmc->confidential_region;
> +
> +	if (!IS_ALIGNED(mr->userspace_addr, PAGE_SIZE) ||
> +	    !IS_ALIGNED(mr->gpa, PAGE_SIZE) || !mr->size ||
> +	    !cove_is_within_region(conf->gpa, conf->npages << PAGE_SHIFT, mr->gpa, mr->size))
> +		return -EINVAL;
> +
> +	idx = srcu_read_lock(&kvm->srcu);
> +
> +	/*TODO: Iterate one page at a time as pinning multiple pages fail with unmapped panic
> +	 * with a virtual address range belonging to vmalloc region for some reason.

I've no idea what code you had, but I suspect the fact that vmalloc'd memory isn't
guaranteed to be physically contiguous is relevant to the panic.

> +	 */
> +	while (num_pages) {
> +		if (signal_pending(current)) {
> +			rc = -ERESTARTSYS;
> +			break;
> +		}
> +
> +		if (need_resched())
> +			cond_resched();
> +
> +		rc = get_user_pages_fast(mr->userspace_addr, 1, 0, &pinned_page);
> +		if (rc < 0) {
> +			kvm_err("Pinning the userpsace addr %lx failed\n", mr->userspace_addr);
> +			break;
> +		}
> +
> +		/* Enough pages are not available to be pinned */
> +		if (rc != 1) {
> +			rc = -ENOMEM;
> +			break;
> +		}
> +		conf_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +		if (!conf_page) {
> +			rc = -ENOMEM;
> +			break;
> +		}
> +
> +		rc = cove_convert_pages(page_to_phys(conf_page), 1, true);
> +		if (rc)
> +			break;
> +
> +		/*TODO: Support other pages sizes */
> +		rc = sbi_covh_add_measured_pages(tvmc->tvm_guest_id, page_to_phys(pinned_page),
> +						 page_to_phys(conf_page), SBI_COVE_PAGE_4K,
> +						 1, mr->gpa);
> +		if (rc)
> +			break;
> +
> +		/* Unpin the page now */
> +		put_page(pinned_page);
> +
> +		cpage = kmalloc(sizeof(*cpage), GFP_KERNEL_ACCOUNT);
> +		if (!cpage) {
> +			rc = -ENOMEM;
> +			break;
> +		}
> +
> +		cpage->page = conf_page;
> +		cpage->npages = 1;
> +		cpage->gpa = mr->gpa;
> +		cpage->hva = mr->userspace_addr;

Snapshotting the userspace address for the _source_ page can't possibly be useful.

> +		cpage->is_mapped = true;
> +		INIT_LIST_HEAD(&cpage->link);
> +		list_add(&cpage->link, &tvmc->measured_pages);
> +
> +		mr->userspace_addr += PAGE_SIZE;
> +		mr->gpa += PAGE_SIZE;
> +		num_pages--;
> +		conf_page = NULL;
> +
> +		continue;
> +	}
> +	srcu_read_unlock(&kvm->srcu, idx);
> +
> +	if (rc < 0) {
> +		/* We don't to need unpin pages as it is allocated by the hypervisor itself */

This comment makes no sense.  The above code is doing all of the allocation and
pinning, which strongly suggests that KVM is the hypervisor.  But this comment
implies that KVM is not the hypervisor.

And "pinned_page" is cleared unpinned in the loop after the page is added+measured,
which looks to be the same model as TDX where "pinned_page" is the source and
"conf_page" is gifted to the hypervisor.  But on failure, e.g. when allocating
"conf_page", that reference is not put.

> +		cove_delete_page_list(kvm, &tvmc->measured_pages, false);
> +		/* Free the last allocated page for which conversion/measurement failed */
> +		kfree(conf_page);

Assuming my guesses about how the architecture works are correct, this is broken
if sbi_covh_add_measured_pages() fails.  The page has already been gifted to the
TSM by cove_convert_pages(), but there is no call to sbi_covh_tsm_reclaim_pages(),
which I'm guessing is necesary to transition the page back to a state where it can
be safely used by the host.

