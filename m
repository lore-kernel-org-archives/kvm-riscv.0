From: Sean Christopherson <seanjc@google.com>
Date: Mon, 30 Oct 2023 15:12:10 -0700
Subject: [PATCH v13 08/35] KVM: Introduce KVM_SET_USER_MEMORY_REGION2
In-Reply-To: <ZUARTvhpChFSGF9s@google.com>
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-9-seanjc@google.com>
 <211d093f-4023-4a39-a23f-6d8543512675@redhat.com> <ZUARTvhpChFSGF9s@google.com>
Message-ID: <ZUAqOn_zjvM4hukK@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 30, 2023, Sean Christopherson wrote:
> On Mon, Oct 30, 2023, Paolo Bonzini wrote:
> > On 10/27/23 20:21, Sean Christopherson wrote:
> > > 
> > > +		if (ioctl == KVM_SET_USER_MEMORY_REGION)
> > > +			size = sizeof(struct kvm_userspace_memory_region);
> > 
> > This also needs a memset(&mem, 0, sizeof(mem)), otherwise the out-of-bounds
> > access of the commit message becomes a kernel stack read.
> 
> Ouch.  There's some irony.  Might be worth doing memset(&mem, -1, sizeof(mem))
> though as '0' is a valid file descriptor and a valid file offset.
> 
> > Probably worth adding a check on valid flags here.
> 
> Definitely needed.  There's a very real bug here.  But rather than duplicate flags
> checking or plumb @ioctl all the way to __kvm_set_memory_region(), now that we
> have the fancy guard(mutex) and there are no internal calls to kvm_set_memory_region(),
> what if we:
> 
>   1. Acquire/release slots_lock in __kvm_set_memory_region()

Gah, this won't work with x86's usage, which acquire slots_lock quite far away
from __kvm_set_memory_region() in several places.  The rest of the idea still
works, kvm_vm_ioctl_set_memory_region() will just need to take slots_lock manually.

>   2. Call kvm_set_memory_region() from x86 code for the internal memslots
>   3. Disallow *any* flags for internal memslots
>   4. Open code check_memory_region_flags in kvm_vm_ioctl_set_memory_region()
>   5. Pass @ioctl to kvm_vm_ioctl_set_memory_region() and allow KVM_MEM_PRIVATE
>      only for KVM_SET_USER_MEMORY_REGION2

