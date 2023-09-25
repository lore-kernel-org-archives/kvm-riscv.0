From: Sean Christopherson <seanjc@google.com>
Date: Mon, 25 Sep 2023 10:37:42 -0700
Subject: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
In-Reply-To: <ZQuahXpq2fy8rMDV@yzhao56-desk.sh.intel.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <ZQP6ZqXH81V24Lj/@yzhao56-desk.sh.intel.com> <ZQtdZmJ3SekURjiQ@google.com> <ZQuahXpq2fy8rMDV@yzhao56-desk.sh.intel.com>
Message-ID: <ZRHFZmaa/6HQnZD1@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 21, 2023, Yan Zhao wrote:
> On Wed, Sep 20, 2023 at 02:00:22PM -0700, Sean Christopherson wrote:
> > On Fri, Sep 15, 2023, Yan Zhao wrote:
> > > On Wed, Sep 13, 2023 at 06:55:09PM -0700, Sean Christopherson wrote:
> > > > +/* Set @attributes for the gfn range [@start, @end). */
> > > > +static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> > > > +				     unsigned long attributes)
> > > > +{
> > > > +	struct kvm_mmu_notifier_range pre_set_range = {
> > > > +		.start = start,
> > > > +		.end = end,
> > > > +		.handler = kvm_arch_pre_set_memory_attributes,
> > > > +		.on_lock = kvm_mmu_invalidate_begin,
> > > > +		.flush_on_ret = true,
> > > > +		.may_block = true,
> > > > +	};
> > > > +	struct kvm_mmu_notifier_range post_set_range = {
> > > > +		.start = start,
> > > > +		.end = end,
> > > > +		.arg.attributes = attributes,
> > > > +		.handler = kvm_arch_post_set_memory_attributes,
> > > > +		.on_lock = kvm_mmu_invalidate_end,
> > > > +		.may_block = true,
> > > > +	};
> > > > +	unsigned long i;
> > > > +	void *entry;
> > > > +	int r = 0;
> > > > +
> > > > +	entry = attributes ? xa_mk_value(attributes) : NULL;
> > > Also here, do we need to get existing attributes of a GFN first ?
> > 
> > No?  @entry is the new value that will be set for all entries.  This line doesn't
> > touch the xarray in any way.  Maybe I'm just not understanding your question.
> Hmm, I thought this interface was to allow users to add/remove an attribute to a GFN
> rather than overwrite all attributes of a GFN. Now I think I misunderstood the intention.
> 
> But I wonder if there is a way for users to just add one attribute, as I don't find
> ioctl like KVM_GET_MEMORY_ATTRIBUTES for users to get current attributes and then to
> add/remove one based on that. e.g. maybe in future, KVM wants to add one attribute in
> kernel without being told by userspace ?

The plan is that memory attributes will be 100% userspace driven, i.e. that KVM
will never add its own attributes.  That's why there is (currently) no
KVM_GET_MEMORY_ATTRIBUTES, the intended usage model is that userspace is fully
responsible for managing attributes, and so should never need to query information
that it already knows.  If there's a compelling case for getting attributes then
we could certainly add such an ioctl(), but I hope we never need to add a GET
because that likely means we've made mistakes along the way.

Giving userspace full control of attributes allows for a simpler uAPI, e.g. if
userspace doesn't have full control, then setting or clearing bits requires a RMW
operation, which means creating a more complex ioctl().  That's why its a straight
SET operation and not an OR type operation.

