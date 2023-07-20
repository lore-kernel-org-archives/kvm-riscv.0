From: Sean Christopherson <seanjc@google.com>
Date: Thu, 20 Jul 2023 13:20:11 -0700
Subject: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
In-Reply-To: <20230720190211.GF25699@ls.amr.corp.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-9-seanjc@google.com>
 <20230720080912.g56zi5hywazrhnam@yy-desk-7060> <20230720190211.GF25699@ls.amr.corp.intel.com>
Message-ID: <ZLmW+9G6EbKLkOOz@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 20, 2023, Isaku Yamahata wrote:
> On Thu, Jul 20, 2023 at 04:09:12PM +0800,
> Yuan Yao <yuan.yao@linux.intel.com> wrote:
> 
> > On Tue, Jul 18, 2023 at 04:44:51PM -0700, Sean Christopherson wrote:
> > > @@ -2301,4 +2305,14 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
> > >  /* Max number of entries allowed for each kvm dirty ring */
> > >  #define  KVM_DIRTY_RING_MAX_ENTRIES  65536
> > >
> > > +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > > +static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> > > +{
> > > +	return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> > > +}
> > > +
> > > +bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> > > +					 struct kvm_gfn_range *range);
> > 
> > Used but no definition in this patch, it's defined in next patch 09.
> > How about add weak version in this patch and let ARCHs to overide it ?
> 
> It is guarded by CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.

Yep.  I don't love the ordering, e.g. this patch can't even be compile tested
until later in the series, but I wanted to separate x86 usage from the generic
support code.

