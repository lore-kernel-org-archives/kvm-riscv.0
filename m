From: Sean Christopherson <seanjc@google.com>
Date: Thu, 5 Oct 2023 20:21:15 -0700
Subject: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
In-Reply-To: <CA+EHjTwTgEVtea7wgef5G6EEgFa0so_GbNXTMZNKyFE=ucyV0g@mail.gmail.com>
References: <CA+EHjTwTgEVtea7wgef5G6EEgFa0so_GbNXTMZNKyFE=ucyV0g@mail.gmail.com>
Message-ID: <ZR99K_ZuWXEtfDuR@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 05, 2023, Fuad Tabba wrote:
> Hi Sean,
> 
> On Tue, Oct 3, 2023 at 9:51?PM Sean Christopherson <seanjc@google.com> wrote:
> > > Like I said, pKVM doesn't need a userspace ABI for managing PRIVATE/SHARED,
> > > just a way of tracking in the host kernel of what is shared (as opposed to
> > > the hypervisor, which already has the knowledge). The solution could simply
> > > be that pKVM does not enable KVM_GENERIC_MEMORY_ATTRIBUTES, has its own
> > > tracking of the status of the guest pages, and only selects KVM_PRIVATE_MEM.
> >
> > At the risk of overstepping my bounds, I think that effectively giving the guest
> > full control over what is shared vs. private is a mistake.  It more or less locks
> > pKVM into a single model, and even within that model, dealing with errors and/or
> > misbehaving guests becomes unnecessarily problematic.
> >
> > Using KVM_SET_MEMORY_ATTRIBUTES may not provide value *today*, e.g. the userspace
> > side of pKVM could simply "reflect" all conversion hypercalls, and terminate the
> > VM on errors.  But the cost is very minimal, e.g. a single extra ioctl() per
> > converion, and the upside is that pKVM won't be stuck if a use case comes along
> > that wants to go beyond "all conversion requests either immediately succeed or
> > terminate the guest".
> 
> Now that I understand the purpose of KVM_SET_MEMORY_ATTRIBUTES, I
> agree. However, pKVM needs to track at the host kernel (i.e., EL1)
> whether guest memory is shared or private.

Why does EL1 need it's own view/opinion?  E.g. is it to avoid a accessing data
that is still private according to EL2 (on behalf of the guest)?

Assuming that's the case, why can't EL1 wait until it gets confirmation from EL2
that the data is fully shared before doing whatever it is that needs to be done?

Ah, is the problem that whether or not .mmap() is allowed keys off of the state
of the memory attributes?  If that's so, then yeah, an internal flag in attributes
is probably the way to go.  It doesn't need to be a "host kernel private" flag
though, e.g. an IN_FLUX flag to capture that the attributes aren't fully realized
might be more intuitive for readers, and might have utility for other attributes
in the future too.

> One approach would be to add another flag to the attributes that
> tracks the host kernel view. The way KVM_SET_MEMORY_ATTRIBUTES is
> implemented now, userspace can zero it, so in that case, that
> operation would need to be masked to avoid that.
> 
> Another approach would be to have a pKVM-specific xarray (or similar)
> to do the tracking, but since there is a structure that's already
> doing something similar (i.e.,the attributes array), it seems like it
> would be unnecessary overhead.
> 
> Do you have any ideas or preferences?
> 
> Cheers,
> /fuad

