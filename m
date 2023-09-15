From: Yan Zhao <yan.y.zhao@intel.com>
Date: Fri, 15 Sep 2023 14:11:18 +0800
Subject: [RFC PATCH v12 14/33] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl()
 for guest-specific backing memory
In-Reply-To: <20230914015531.1419405-15-seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-15-seanjc@google.com>
Message-ID: <ZQP1hiV7c9UGLRfu@yzhao56-desk.sh.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 13, 2023 at 06:55:12PM -0700, Sean Christopherson wrote:
> +static struct folio *kvm_gmem_get_folio(struct file *file, pgoff_t index)
> +{
> +	struct folio *folio;
> +
> +	/* TODO: Support huge pages. */
> +	folio = filemap_grab_folio(file->f_mapping, index);
> +	if (IS_ERR_OR_NULL(folio))
> +		return NULL;
> +
> +	/*
> +	 * Use the up-to-date flag to track whether or not the memory has been
> +	 * zeroed before being handed off to the guest.  There is no backing
> +	 * storage for the memory, so the folio will remain up-to-date until
> +	 * it's removed.
> +	 *
> +	 * TODO: Skip clearing pages when trusted firmware will do it when
> +	 * assigning memory to the guest.
> +	 */
> +	if (!folio_test_uptodate(folio)) {
> +		unsigned long nr_pages = folio_nr_pages(folio);
> +		unsigned long i;
> +
> +		for (i = 0; i < nr_pages; i++)
> +			clear_highpage(folio_page(folio, i));
> +
> +		folio_mark_uptodate(folio);
> +	}
> +
> +	/*
> +	 * Ignore accessed, referenced, and dirty flags.  The memory is
> +	 * unevictable and there is no storage to write back to.
> +	 */
> +	return folio;
> +}
If VFIO wants to map a private page, is it required to call this function for PFN?


