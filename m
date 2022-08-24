From: Oliver Upton <oliver.upton@linux.dev>
Date: Wed, 24 Aug 2022 10:00:21 -0500
Subject: [PATCH v4 5/6] KVM: selftests: Make arm64's MMIO ucall multi-VM
 friendly
In-Reply-To: <20220824032115.3563686-6-seanjc@google.com>
References: <20220824032115.3563686-1-seanjc@google.com>
 <20220824032115.3563686-6-seanjc@google.com>
Message-ID: <YwY9BYDUeiT87/Vs@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Sean,

On Wed, Aug 24, 2022 at 03:21:14AM +0000, Sean Christopherson wrote:
> Fix a mostly-theoretical bug where ARM's ucall MMIO setup could result in
> different VMs stomping on each other by cloberring the global pointer.
> 
> Fix the most obvious issue by saving the MMIO gpa into the VM.
> 
> A more subtle bug is that creating VMs in parallel (on multiple tasks)
> could result in a VM using the wrong address.  Synchronizing a global to
> a guest effectively snapshots the value on a per-VM basis, i.e. the
> "global" is already prepped to work with multiple VMs, but setting the
> global in the host and copying it to the guest needs to happen atomically.
> To fix that bug, add atomic_sync_global_pointer_to_guest() to sync
> "global" pointers that hold per-VM values, i.e. technically need to be
> handled in a thread-safe manner.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/kvm_util_base.h     | 16 +++++++++++++++
>  .../testing/selftests/kvm/lib/aarch64/ucall.c | 20 ++++++++++++++-----
>  2 files changed, 31 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
> index 24fde97f6121..9ec7fbe941aa 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_base.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
> @@ -16,6 +16,7 @@
>  #include <linux/kvm.h>
>  #include "linux/rbtree.h"
>  
> +#include <asm/atomic.h>
>  
>  #include <sys/ioctl.h>
>  
> @@ -81,6 +82,7 @@ struct kvm_vm {
>  	struct sparsebit *vpages_mapped;
>  	bool has_irqchip;
>  	bool pgd_created;
> +	vm_paddr_t ucall_mmio_addr;
>  	vm_paddr_t pgd;
>  	vm_vaddr_t gdt;
>  	vm_vaddr_t tss;
> @@ -714,6 +716,20 @@ kvm_userspace_memory_region_find(struct kvm_vm *vm, uint64_t start,
>  	memcpy(&(g), _p, sizeof(g));				\
>  })
>  
> +/*
> + * Sync a global pointer to the guest that has a per-VM value, in which case
> + * writes to the host copy of the "global" must be serialized (in case a test
> + * is being truly crazy and spawning multiple VMs concurrently).
> + */

Do we even care about writes to the host's copy of the global pointer?
I don't see how the host pointer is used beyond serializing writes into
a guest.

IOW, it looks as though we could skip the whole global illusion
altogether and write straight into guest memory.

--
Thanks,
Oliver

