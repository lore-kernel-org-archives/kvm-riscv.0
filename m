From: Gavin Shan <gshan@redhat.com>
Date: Wed, 5 Jul 2023 09:54:36 +1000
Subject: [RESEND PATCH v5 03/11] KVM: Allow range-based TLB invalidation
 from common code
In-Reply-To: <20230621175002.2832640-4-rananta@google.com>
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-4-rananta@google.com>
Message-ID: <a0e4b07c-dea8-e45e-7bc8-588f8cbcb537@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 6/22/23 03:49, Raghavendra Rao Ananta wrote:
> From: David Matlack <dmatlack@google.com>
> 
> Make kvm_flush_remote_tlbs_range() visible in common code and create a
> default implementation that just invalidates the whole TLB.
> 
> This paves the way for several future features/cleanups:
> 
>   - Introduction of range-based TLBI on ARM.
>   - Eliminating kvm_arch_flush_remote_tlbs_memslot()
>   - Moving the KVM/x86 TDP MMU to common code.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>   arch/x86/include/asm/kvm_host.h |  3 +++
>   arch/x86/kvm/mmu/mmu.c          |  9 ++++-----
>   arch/x86/kvm/mmu/mmu_internal.h |  3 ---
>   include/linux/kvm_host.h        |  9 +++++++++
>   virt/kvm/kvm_main.c             | 13 +++++++++++++
>   5 files changed, 29 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


