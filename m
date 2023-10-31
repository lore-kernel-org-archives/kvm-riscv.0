From: Sean Christopherson <seanjc@google.com>
Date: Mon, 30 Oct 2023 17:18:19 -0700
Subject: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <afa0d4ec-4b37-4a67-b546-016148ef4efe@redhat.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <211d093f-4023-4a39-a23f-6d8543512675@redhat.com> <ZUARTvhpChFSGF9s@google.com>
 <afa0d4ec-4b37-4a67-b546-016148ef4efe@redhat.com>
Message-ID: <ZUBHy3rrJN8kbFCH@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 31, 2023, Paolo Bonzini wrote:
> On 10/30/23 21:25, Sean Christopherson wrote:
> > > Probably worth adding a check on valid flags here.
> > 
> > Definitely needed.  There's a very real bug here.  But rather than duplicate flags
> > checking or plumb @ioctl all the way to __kvm_set_memory_region(), now that we
> > have the fancy guard(mutex) and there are no internal calls to kvm_set_memory_region(),
> > what if we:
> > 
> >    1. Acquire/release slots_lock in __kvm_set_memory_region()
> >    2. Call kvm_set_memory_region() from x86 code for the internal memslots
> >    3. Disallow *any* flags for internal memslots
> >    4. Open code check_memory_region_flags in kvm_vm_ioctl_set_memory_region()
> 
> I dislike this step, there is a clear point where all paths meet
> (ioctl/internal, locked/unlocked) and that's __kvm_set_memory_region().
> I think that's the place where flags should be checked.  (I don't mind
> the restriction on internal memslots; it's just that to me it's not a
> particularly natural way to structure the checks).

Yeah, I just don't like the discrepancy it causes where some flags are explicitly
checked and allowed, allowed and then later disallowed.

> On the other hand, the place where to protect from out-of-bounds
> accesses, is the place where you stop caring about struct
> kvm_userspace_memory_region vs kvm_userspace_memory_region2 (and
> your code gets it right, by dropping "ioctl" as soon as possible).
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 87f45aa91ced..fe5a2af14fff 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1635,6 +1635,14 @@ bool __weak kvm_arch_dirty_log_supported(struct kvm *kvm)
>  	return true;
>  }
> +/*
> + * Flags that do not access any of the extra space of struct
> + * kvm_userspace_memory_region2.  KVM_SET_USER_MEMORY_REGION_FLAGS
> + * only allows these.
> + */
> +#define KVM_SET_USER_MEMORY_REGION_FLAGS \

Can we name this KVM_SET_USER_MEMORY_REGION_LEGACY_FLAGS, or something equally
horrific?  As is, this sounds way too much like a generic "allowed flags for any
memory region".

Or maybe invert the macro?  I.e. something to make it more obvious that it's
effectively a versioning check, not a generic "what's supported?" check.

#define KVM_SET_USER_MEMORY_FLAGS_V2_ONLY \
	(~(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY))


> +	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
> +
>  static int check_memory_region_flags(struct kvm *kvm,
>  				     const struct kvm_userspace_memory_region2 *mem)
>  {
> @@ -5149,10 +5149,16 @@ static long kvm_vm_ioctl(struct file *filp,
>  		struct kvm_userspace_memory_region2 mem;
>  		unsigned long size;
> -		if (ioctl == KVM_SET_USER_MEMORY_REGION)
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION) {
> +			/*
> +			 * Fields beyond struct kvm_userspace_memory_region shouldn't be
> +			 * accessed, but avoid leaking kernel memory in case of a bug.
> +			 */
> +			memset(&mem, 0, sizeof(mem));
>  			size = sizeof(struct kvm_userspace_memory_region);
> -		else
> +		} else {
>  			size = sizeof(struct kvm_userspace_memory_region2);
> +		}
>  		/* Ensure the common parts of the two structs are identical. */
>  		SANITY_CHECK_MEM_REGION_FIELD(slot);
> @@ -5165,6 +5167,11 @@ static long kvm_vm_ioctl(struct file *filp,
>  		if (copy_from_user(&mem, argp, size))
>  			goto out;
> +		r = -EINVAL;
> +		if (ioctl == KVM_SET_USER_MEMORY_REGION &&
> +		    (mem->flags & ~KVM_SET_USER_MEMORY_REGION_FLAGS))
> +			goto out;
> +
>  		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
>  		break;
>  	}
> 
> 
> That's a kind of patch that you can't really get wrong (though I have
> the brown paper bag ready).
> 
> Maintainance-wise it's fine, since flags are being added at a pace of
> roughly one every five years,

Heh, true.

> and anyway it's also future proof: I placed the #define near
> check_memory_region_flags so that in five years we remember to keep it up to
> date.  But worst case, the new flags will only be allowed by
> KVM_SET_USER_MEMORY_REGION2 unnecessarily; there are no security issues
> waiting to bite us.
>
> In sum, this is exactly the only kind of fix that should be in the v13->v14
> delta.

Boiling the ocean can be fun too ;-)

