From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Date: Tue, 9 Nov 2021 01:39:53 +0100
Subject: [PATCH v5.5 07/30] KVM: Let/force architectures to deal with arch
 specific memslot data
In-Reply-To: <20211104002531.1176691-8-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-8-seanjc@google.com>
Message-ID: <e12ecff3-ee69-9e2c-02f9-0e54a1cb9519@oracle.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 04.11.2021 01:25, Sean Christopherson wrote:
> Pass the "old" slot to kvm_arch_prepare_memory_region() and force arch
> code to handle propagating arch specific data from "new" to "old" when
> necessary.  This is a baby step towards dynamically allocating "new" from
> the get go, and is a (very) minor performance boost on x86 due to not
> unnecessarily copying arch data.
> 
> For PPC HV, copy the rmap in the !CREATE and !DELETE paths, i.e. for MOVE
> and FLAGS_ONLY.  This is functionally a nop as the previous behavior
> would overwrite the pointer for CREATE, and eventually discard/ignore it
> for DELETE.
> 
> For x86, copy the arch data only for FLAGS_ONLY changes.  Unlike PPC HV,
> x86 needs to reallocate arch data in the MOVE case as the size of x86's
> allocations depend on the alignment of the memslot's gfn.
> 
> Opportunistically tweak kvm_arch_prepare_memory_region()'s param order to
> match the "commit" prototype.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/mmu.c               |  7 ++++---
>   arch/mips/kvm/mips.c               |  3 ++-
>   arch/powerpc/include/asm/kvm_ppc.h | 18 ++++++++++--------
>   arch/powerpc/kvm/book3s.c          | 12 ++++++------
>   arch/powerpc/kvm/book3s_hv.c       | 17 ++++++++++-------
>   arch/powerpc/kvm/book3s_pr.c       | 17 +++++++++--------
>   arch/powerpc/kvm/booke.c           |  5 +++--
>   arch/powerpc/kvm/powerpc.c         |  5 +++--
>   arch/s390/kvm/kvm-s390.c           |  3 ++-
>   arch/x86/kvm/x86.c                 | 15 +++++++++++----
>   include/linux/kvm_host.h           |  3 ++-
>   virt/kvm/kvm_main.c                |  5 +----
>   12 files changed, 63 insertions(+), 47 deletions(-)
> 

You didn't include the RISCV kvm_arch_prepare_memory_region() change here
(that's actually in patch 13 of this series) so bisection on that arch
will be broken between this patch and patch 13.

Thanks,
Maciej

