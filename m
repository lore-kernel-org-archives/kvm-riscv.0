From: Sean Christopherson <seanjc@google.com>
Date: Thu, 20 Jul 2023 08:14:47 -0700
Subject: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
In-Reply-To: <83eb5c50-7287-7845-ffc3-a7c58e638ea5@intel.com>
References: <20230718234512.1690985-1-seanjc@google.com> <20230718234512.1690985-13-seanjc@google.com>
 <83eb5c50-7287-7845-ffc3-a7c58e638ea5@intel.com>
Message-ID: <ZLlLx7wkE6iPTIcI@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 20, 2023, Xiaoyao Li wrote:
> On 7/19/2023 7:44 AM, Sean Christopherson wrote:
> > @@ -5134,6 +5167,16 @@ static long kvm_vm_ioctl(struct file *filp,
> >   	case KVM_GET_STATS_FD:
> >   		r = kvm_vm_ioctl_get_stats_fd(kvm);
> >   		break;
> > +	case KVM_CREATE_GUEST_MEMFD: {
> > +		struct kvm_create_guest_memfd guest_memfd;
> > +
> > +		r = -EFAULT;
> > +		if (copy_from_user(&guest_memfd, argp, sizeof(guest_memfd)))
> > +			goto out;
> > +
> > +		r = kvm_gmem_create(kvm, &guest_memfd);
> > +		break;
> > +	}
> 
> Does it need a new CAP to indicate the support of guest_memfd?

Yeah, I meant to add that to the TODO list and forgot (obviously).

> This is patch series introduces 3 new CAPs and it seems any one of them can
> serve as the indicator of guest_memfd.
> 
> +#define KVM_CAP_USER_MEMORY2 230
> +#define KVM_CAP_MEMORY_ATTRIBUTES 231
> +#define KVM_CAP_VM_TYPES 232

The number of new caps being added is the main why I didn't just add another one.
On the other hand, we have room for a few billion caps, so one more isn't a big
deal.  So yeah, KVM_CAP_GUEST_MEMFD is probably the way to go.

