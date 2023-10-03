From: Sean Christopherson <seanjc@google.com>
Date: Tue, 3 Oct 2023 08:59:27 -0700
Subject: [RFC PATCH v12 11/33] KVM: Introduce per-page memory attributes
In-Reply-To: <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
References: <20230914015531.1419405-1-seanjc@google.com> <20230914015531.1419405-12-seanjc@google.com>
 <CA+EHjTzSUXx8P9gWmUERg4owxH6r6yNPm1_RL-BzS_2CNPtRKw@mail.gmail.com>
Message-ID: <ZRw6X2BptZnRPNK7@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 03, 2023, Fuad Tabba wrote:
> Hi,
> 
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index d2d913acf0df..f8642ff2eb9d 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -1227,6 +1227,7 @@ struct kvm_ppc_resize_hpt {
> >  #define KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE 228
> >  #define KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES 229
> >  #define KVM_CAP_USER_MEMORY2 230
> > +#define KVM_CAP_MEMORY_ATTRIBUTES 231
> >
> >  #ifdef KVM_CAP_IRQ_ROUTING
> >
> > @@ -2293,4 +2294,17 @@ struct kvm_s390_zpci_op {
> >  /* flags for kvm_s390_zpci_op->u.reg_aen.flags */
> >  #define KVM_S390_ZPCIOP_REGAEN_HOST    (1 << 0)
> >
> > +/* Available with KVM_CAP_MEMORY_ATTRIBUTES */
> > +#define KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES    _IOR(KVMIO,  0xd2, __u64)
> > +#define KVM_SET_MEMORY_ATTRIBUTES              _IOW(KVMIO,  0xd3, struct kvm_memory_attributes)
> > +
> > +struct kvm_memory_attributes {
> > +       __u64 address;
> > +       __u64 size;
> > +       __u64 attributes;
> > +       __u64 flags;
> > +};
> > +
> > +#define KVM_MEMORY_ATTRIBUTE_PRIVATE           (1ULL << 3)
> > +
> 
> In pKVM, we don't want to allow setting (or clearing) of PRIVATE/SHARED
> attributes from userspace.

Why not?  The whole thing falls apart if userspace doesn't *know* the state of a
page, and the only way for userspace to know the state of a page at a given moment
in time is if userspace controls the attributes.  E.g. even if KVM were to provide
a way for userspace to query attributes, the attributes exposed to usrspace would
become stale the instant KVM drops slots_lock (or whatever lock protects the attributes)
since userspace couldn't prevent future changes.

Why does pKVM need to prevent userspace from stating *its* view of attributes?

If the goal is to reduce memory overhead, that can be solved by using an internal,
non-ABI attributes flag to track pKVM's view of SHARED vs. PRIVATE.  If the guest
attempts to access memory where pKVM and userspace don't agree on the state,
generate an exit to userspace.  Or kill the guest.  Or do something else entirely.

> However, we'd like to use the attributes xarray to track the sharing state of
> guest pages at the host kernel.
> 
> Moreover, we'd rather the default guest page state be PRIVATE, and
> only specify which pages are shared. All pKVM guest pages start off as
> private, and the majority will remain so.

I would rather optimize kvm_vm_set_mem_attributes() to generate range-based
xarray entries, at which point it shouldn't matter all that much whether PRIVATE
or SHARED is the default "empty" state.  We opted not to do that for the initial
merge purely to keep the code as simple as possible (which is obviously still not
exactly simple).

With range-based xarray entries, the cost of tagging huge chunks of memory as
PRIVATE should be a non-issue.  And if that's not enough for whatever reason, I
would rather define the polarity of PRIVATE on a per-VM basis, but only for internal
storage.
 
> I'm not sure if this is the best way to do this: One idea would be to move
> the definition of KVM_MEMORY_ATTRIBUTE_PRIVATE to
> arch/*/include/asm/kvm_host.h, which is where kvm_arch_supported_attributes()
> lives as well. This would allow different architectures to specify their own
> attributes (i.e., instead we'd have a KVM_MEMORY_ATTRIBUTE_SHARED for pKVM).
> This wouldn't help in terms of preventing userspace from clearing attributes
> (i.e., setting a 0 attribute) though.
> 
> The other thing, which we need for pKVM anyway, is to make
> kvm_vm_set_mem_attributes() global, so that it can be called from outside of
> kvm_main.c (already have a local patch for this that declares it in
> kvm_host.h),

That's no problem, but I am definitely opposed to KVM modifying attributes that
are owned by userspace.

> and not gate this function by KVM_GENERIC_MEMORY_ATTRIBUTES.

As above, I am opposed to pKVM having a completely different ABI for managing
PRIVATE vs. SHARED.  I have no objection to pKVM using unclaimed flags in the
attributes to store extra metadata, but if KVM_SET_MEMORY_ATTRIBUTES doesn't work
for pKVM, then we've failed miserably and should revist the uAPI.

