From: Huang, Kai <kai.huang@intel.com>
Date: Thu, 2 Nov 2023 10:55:31 +0000
Subject: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
In-Reply-To: <a03d0e36-7b38-4841-9c62-66c9029e388d@redhat.com>
References: <20231027182217.3615211-1-seanjc@google.com>
	 <20231027182217.3615211-14-seanjc@google.com>
	 <b486ed5036fab6d6d4e13a6c68abddcb9541d51b.camel@intel.com>
	 <a03d0e36-7b38-4841-9c62-66c9029e388d@redhat.com>
Message-ID: <72e15d0a3f1b2e8ddd2b880f9f433423b6614dcb.camel@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 2023-11-02 at 11:32 +0100, Paolo Bonzini wrote:
> > > +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > > +static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> > > +{
> > > +	return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> > > +}
> > 
> > Only call xa_to_value() when xa_load() returns !NULL?
> 
> This xarray does not store a pointer, therefore xa_load() actually 
> returns an integer that is tagged with 1 in the low bit:
> 
> static inline unsigned long xa_to_value(const void *entry)
> {
> ???????? return (unsigned long)entry >> 1;
> }
> 
> Returning zero for an empty entry is okay, so the result of xa_load() 
> can be used directly.

Thanks for explaining.  I was thinking perhaps it's better to do:

	void *entry = xa_load(...);
	
	return xa_is_value(entry) ? xa_to_value(entry) : 0;

But "NULL (0) >> 1" is still 0, so yes we can use directly.
