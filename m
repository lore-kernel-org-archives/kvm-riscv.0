From: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Jul 2023 08:59:53 -0700
Subject: [RFC PATCH v11 08/29] KVM: Introduce per-page memory attributes
In-Reply-To: <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-9-seanjc@google.com>
 <ZL4BiQWihfrD0TOJ@yilunxu-OptiPlex-7050>
Message-ID: <ZMFC+V6Llv1JWLEt@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 24, 2023, Xu Yilun wrote:
> On 2023-07-18 at 16:44:51 -0700, Sean Christopherson wrote:
> > @@ -1346,6 +1350,9 @@ static void kvm_destroy_vm(struct kvm *kvm)
> >  		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
> >  		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
> >  	}
> > +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> > +	xa_destroy(&kvm->mem_attr_array);
> > +#endif
> 
> Is it better to make the destruction in reverse order from the creation?

Yeah.  It _shoudn't_ matter, but there's no reason not keep things tidy and
consistent.

> To put xa_destroy(&kvm->mem_attr_array) after cleanup_srcu_struct(&kvm->srcu),
> or put xa_init(&kvm->mem_attr_array) after init_srcu_struct(&kvm->irq_srcu).

The former, because init_srcu_struct() can fail (allocates memory), whereas
xa_init() is a "pure" initialization routine.

> >  	cleanup_srcu_struct(&kvm->irq_srcu);
> >  	cleanup_srcu_struct(&kvm->srcu);
> >  	kvm_arch_free_vm(kvm);
> > @@ -2346,6 +2353,145 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
> >  }
> >  #endif /* CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT */
> 
> [...]
> 
> > +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > +					   struct kvm_memory_attributes *attrs)
> > +{
> > +	gfn_t start, end;
> > +
> > +	/* flags is currently not used. */
> > +	if (attrs->flags)
> > +		return -EINVAL;
> > +	if (attrs->attributes & ~kvm_supported_mem_attributes(kvm))
> > +		return -EINVAL;
> > +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> > +		return -EINVAL;
> > +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> > +		return -EINVAL;
> > +
> > +	start = attrs->address >> PAGE_SHIFT;
> > +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> 
> As the attrs->address/size are both garanteed to be non-zero, non-wrap
> and page aligned in prevous check. Is it OK to simplify the calculation,
> like:
> 
>   end = (attrs->address + attrs->size) >> PAGE_SHIFT;

Yes, that should work.

Chao, am I missing something?  Or did we just end up with unnecessarly convoluted
code as things evolved?

> > +
> > +	if (WARN_ON_ONCE(start == end))
> > +		return -EINVAL;
> 
> Also, is this check possible to be hit? Maybe remove it?

It should be impossible to, hence the WARN.  I added the check for two reasons:
(1) to help document that end is exclusive, and (2) to guard against future bugs.

