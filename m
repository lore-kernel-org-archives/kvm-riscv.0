From: Sean Christopherson <seanjc@google.com>
Date: Fri, 21 Jul 2023 15:33:15 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <20230721222704.GJ25699@ls.amr.corp.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <20230721061314.3ls6stdawz53drv3@yy-desk-7060> <20230721222704.GJ25699@ls.amr.corp.intel.com>
Message-ID: <ZLsHq69sMG7pmRiz@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 21, 2023, Isaku Yamahata wrote:
> On Fri, Jul 21, 2023 at 02:13:14PM +0800,
> Yuan Yao <yuan.yao@linux.intel.com> wrote:
> > > +static int kvm_gmem_error_page(struct address_space *mapping, struct page *page)
> > > +{
> > > +	struct list_head *gmem_list = &mapping->private_list;
> > > +	struct kvm_memory_slot *slot;
> > > +	struct kvm_gmem *gmem;
> > > +	unsigned long index;
> > > +	pgoff_t start, end;
> > > +	gfn_t gfn;
> > > +
> > > +	filemap_invalidate_lock_shared(mapping);
> > > +
> > > +	start = page->index;
> > > +	end = start + thp_nr_pages(page);
> > > +
> > > +	list_for_each_entry(gmem, gmem_list, entry) {
> > > +		xa_for_each_range(&gmem->bindings, index, slot, start, end - 1) {
> > > +			for (gfn = start; gfn < end; gfn++) {
> > 
> > Why the start end range used as gfn here ?

Math is hard?  I almost always mess up these types of things, and then catch my
bugs via tests.  But I don't have tests for this particular flow...   Which
reminds me, we need tests for this :-)  Hopefully error injection provides most
of what we need?

> > the page->index is offset of inode's page cache mapping and
> > gmem address space, IIUC, gfn calculation should follow same
> > way as kvm_gmem_invalidate_begin().
> 
> Also instead of sending signal multiple times, we can utilize lsb argument.

As Vishal pointed out, this code shouldn't be sending signals in the first place.

