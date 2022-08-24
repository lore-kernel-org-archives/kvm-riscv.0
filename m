From: Sean Christopherson <seanjc@google.com>
Date: Wed, 24 Aug 2022 15:32:07 +0000
Subject: [PATCH v4 5/6] KVM: selftests: Make arm64's MMIO ucall multi-VM
 friendly
In-Reply-To: <YwY9BYDUeiT87/Vs@google.com>
References: <20220824032115.3563686-1-seanjc@google.com>
 <20220824032115.3563686-6-seanjc@google.com>
 <YwY9BYDUeiT87/Vs@google.com>
Message-ID: <YwZEdzHtWEfCpr7B@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 24, 2022, Oliver Upton wrote:
> Hi Sean,
> 
> On Wed, Aug 24, 2022 at 03:21:14AM +0000, Sean Christopherson wrote:
> > +/*
> > + * Sync a global pointer to the guest that has a per-VM value, in which case
> > + * writes to the host copy of the "global" must be serialized (in case a test
> > + * is being truly crazy and spawning multiple VMs concurrently).
> > + */
> 
> Do we even care about writes to the host's copy of the global pointer?
> I don't see how the host pointer is used beyond serializing writes into
> a guest.
> 
> IOW, it looks as though we could skip the whole global illusion
> altogether and write straight into guest memory.

*sigh*

This exact thought crossed my mind when I first looked at this code, but somehow
I couldn't come up with the obvious solution of using a temporary on-stack variable
to hold the desired value.

Something like this should work.

#define write_guest_global(vm, g, val) ({			\
	typeof(g) *_p = addr_gva2hva(vm, (vm_vaddr_t)&(g));	\
	typeof(g) _val = val;					\
								\
	memcpy(_p, &(_val), sizeof(g));				\
})

