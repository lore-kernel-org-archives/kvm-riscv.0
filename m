From: Yan Zhao <yan.y.zhao@intel.com>
Date: Thu, 21 Sep 2023 09:21:09 +0800
Subject: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
In-Reply-To: <ZQtdZmJ3SekURjiQ@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-12-seanjc@google.com>
 <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com>
 <ZQtdZmJ3SekURjiQ@google.com>
Message-ID: <ZQuahXpq2fy8rMDV@yzhao56-desk.sh.intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 20, 2023 at 02:00:22PM -0700, Sean Christopherson wrote:
> On Fri, Sep 15, 2023, Yan Zhao wrote:
> > On Wed, Sep 13, 2023 at 06:55:09PM -0700, Sean Christopherson wrote:
> > > From: Chao Peng <chao.p.peng@linux.intel.com>
> > > 
> > > In confidential computing usages, whether a page is private or shared is
> > > necessary information for KVM to perform operations like page fault
> > > handling, page zapping etc. There are other potential use cases for
> > > per-page memory attributes, e.g. to make memory read-only (or no-exec,
> > > or exec-only, etc.) without having to modify memslots.
> > > 
> > ...
> > >> +bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > > +				     unsigned long attrs)
> > > +{
> > > +	XA_STATE(xas, &kvm->mem_attr_array, start);
> > > +	unsigned long index;
> > > +	bool has_attrs;
> > > +	void *entry;
> > > +
> > > +	rcu_read_lock();
> > > +
> > > +	if (!attrs) {
> > > +		has_attrs = !xas_find(&xas, end);
> > > +		goto out;
> > > +	}
> > > +
> > > +	has_attrs = true;
> > > +	for (index = start; index < end; index++) {
> > > +		do {
> > > +			entry = xas_next(&xas);
> > > +		} while (xas_retry(&xas, entry));
> > > +
> > > +		if (xas.xa_index != index || xa_to_value(entry) != attrs) {
> > Should "xa_to_value(entry) != attrs" be "!(xa_to_value(entry) & attrs)" ?
> 
> No, the exact comparsion is deliberate.  The intent of the API is to determine
> if the entire range already has the desired attributes, not if there is overlap
> between the two.
> 
> E.g. if/when RWX attributes are supported, the exact comparison is needed to
> handle a RW => R conversion.
> 
> > > +			has_attrs = false;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +out:
> > > +	rcu_read_unlock();
> > > +	return has_attrs;
> > > +}
> > > +
> > ...
> > > +/* Set @attributes for the gfn range [@start, @end). */
> > > +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > > +				     unsigned long attributes)
> > > +{
> > > +	struct kvm_mmu_notifier_range pre_set_range = {
> > > +		.start = start,
> > > +		.end = end,
> > > +		.handler = kvm_arch_pre_set_memory_attributes,
> > > +		.on_lock = kvm_mmu_invalidate_begin,
> > > +		.flush_on_ret = true,
> > > +		.may_block = true,
> > > +	};
> > > +	struct kvm_mmu_notifier_range post_set_range = {
> > > +		.start = start,
> > > +		.end = end,
> > > +		.arg.attributes = attributes,
> > > +		.handler = kvm_arch_post_set_memory_attributes,
> > > +		.on_lock = kvm_mmu_invalidate_end,
> > > +		.may_block = true,
> > > +	};
> > > +	unsigned long i;
> > > +	void *entry;
> > > +	int r = 0;
> > > +
> > > +	entry = attributes ? xa_mk_value(attributes) : NULL;
> > Also here, do we need to get existing attributes of a GFN first ?
> 
> No?  @entry is the new value that will be set for all entries.  This line doesn't
> touch the xarray in any way.  Maybe I'm just not understanding your question.
Hmm, I thought this interface was to allow users to add/remove an attribute to a GFN
rather than overwrite all attributes of a GFN. Now I think I misunderstood the intention.

But I wonder if there is a way for users to just add one attribute, as I don't find
ioctl like KVM_GET_MEMORY_ATTRIBUTES for users to get current attributes and then to
add/remove one based on that. e.g. maybe in future, KVM wants to add one attribute in
kernel without being told by userspace ?


