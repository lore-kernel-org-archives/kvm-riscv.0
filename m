From: Oliver Upton <oliver.upton@linux.dev>
Date: Tue, 24 Jan 2023 17:17:12 +0000
Subject: [PATCH 2/7] KVM: arm64: Use kvm_arch_flush_remote_tlbs()
In-Reply-To: <20230119173559.2517103-3-dmatlack@google.com>
References: <20230119173559.2517103-1-dmatlack@google.com>
 <20230119173559.2517103-3-dmatlack@google.com>
Message-ID: <Y9ASmOvJutgGLVnT@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

On Thu, Jan 19, 2023 at 09:35:54AM -0800, David Matlack wrote:
> Use kvm_arch_flush_remote_tlbs() instead of
> CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL. The two mechanisms solve the same
> problem, allowing architecture-specific code to provide a non-IPI
> implementation of remote TLB flushing.
> 
> Dropping CONFIG_HAVE_KVM_ARCH_TLB_FLUSH_ALL allows KVM to standardize
> all architectures on kvm_arch_flush_remote_tlbs() instead of maintaining
> two mechanisms.
> 
> Opt to standardize on kvm_arch_flush_remote_tlbs() since it avoids
> duplicating the generic TLB stats across architectures that implement
> their own remote TLB flush.
> 
> This adds an extra function call to the ARM64 kvm_flush_remote_tlbs()
> path, but (I assume) that is a small cost in comparison to flushing
> remote TLBs.

A fair assumption indeed. The real pile up occurs on the DSB subsequent
to the TLBI.

> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 3 +++
>  arch/arm64/kvm/Kconfig            | 1 -
>  arch/arm64/kvm/mmu.c              | 6 +++---
>  virt/kvm/kvm_main.c               | 2 --
>  4 files changed, 6 insertions(+), 6 deletions(-)

I think you're missing the diff that actually drops the Kconfig opton
from virt/kvm/Kconfig.

--
Thanks,
Oliver

