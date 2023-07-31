From: Quentin Perret <qperret@google.com>
Date: Mon, 31 Jul 2023 09:30:43 +0000
Subject: [RFC PATCH v11 06/29] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <ZMRXVZYaJ9wojGtS@google.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-7-seanjc@google.com>
 <ZMOJgnyzzUNIx+Tn@google.com>
 <ZMRXVZYaJ9wojGtS@google.com>
Message-ID: <ZMd/Q4fytFhinDDj@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday 28 Jul 2023 at 17:03:33 (-0700), Sean Christopherson wrote:
> On Fri, Jul 28, 2023, Quentin Perret wrote:
> > On Tuesday 18 Jul 2023 at 16:44:49 (-0700), Sean Christopherson wrote:
> > > --- a/include/uapi/linux/kvm.h
> > > +++ b/include/uapi/linux/kvm.h
> > > @@ -95,6 +95,16 @@ struct kvm_userspace_memory_region {
> > >  	__u64 userspace_addr; /* start of the userspace allocated memory */
> > >  };
> > >  
> > > +/* for KVM_SET_USER_MEMORY_REGION2 */
> > > +struct kvm_userspace_memory_region2 {
> > > +	__u32 slot;
> > > +	__u32 flags;
> > > +	__u64 guest_phys_addr;
> > > +	__u64 memory_size;
> > > +	__u64 userspace_addr;
> > > +	__u64 pad[16];
> > 
> > Should we replace that pad[16] with:
> > 
> > 	__u64 size;
> > 
> > where 'size' is the size of the structure as seen by userspace? This is
> > used in other UAPIs (see struct sched_attr for example) and is a bit
> > more robust for future extensions (e.g. an 'old' kernel can correctly
> > reject a newer version of the struct with additional fields it doesn't
> > know about if that makes sense, etc).
> 
> "flags" serves that purpose, i.e. allows userspace to opt-in to having KVM actually
> consume what is currently just padding.

Sure, I've just grown to dislike static padding of that type -- it ends
up being either a waste a space, or is too small, while the 'superior'
alternative (having a 'size' member) doesn't cost much and avoids those
problems.

But no strong opinion really, this struct really shouldn't grow much,
so I'm sure that'll be fine in practice.

> The padding is there mainly to simplify kernel/KVM code, e.g. the number of bytes
> that KVM needs to copy in is static.
> 
> But now that I think more on this, I don't know why we didn't just unconditionally
> bump the size of kvm_userspace_memory_region.  We tried to play games with unions
> and overlays, but that was a mess[*].
> 
> KVM would need to do multiple uaccess reads, but that's not a big deal.  Am I
> missing something, or did past us just get too clever and miss the obvious solution?
> 
> [*] https://lkml.kernel.org/r/Y7xrtf9FCuYRYm1q%40google.com

Right, so the first uaccess would get_user() the flags, based on that
we'd figure out the size of the struct, copy_from_user() what we need,
and then sanity check the flags are the same from both reads, or
something along those lines?

That doesn't sound too complicated to me, and as long as every extension
to the struct does come with a new flag I can't immediately see what
would go wrong.

