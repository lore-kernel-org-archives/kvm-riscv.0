From: Marc Zyngier <maz@kernel.org>
Date: Wed, 17 Nov 2021 18:11:35 +0000
Subject: [PATCH v3 02/12] KVM: Add Makefile.kvm for common files,
 use it for x86
In-Reply-To: <20211117174003.297096-3-dwmw2@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-3-dwmw2@infradead.org>
Message-ID: <87r1be7iug.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 17 Nov 2021 17:39:53 +0000,
David Woodhouse <dwmw2@infradead.org> wrote:
> 
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Splitting kvm_main.c out into smaller and better-organized files is
> slightly non-trivial when it involves editing a bunch of per-arch
> KVM makefiles. Provide virt/kvm/Makefile.kvm for them to include.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/x86/kvm/Makefile |  7 +------
>  virt/kvm/Makefile.kvm | 13 +++++++++++++
>  2 files changed, 14 insertions(+), 6 deletions(-)
>  create mode 100644 virt/kvm/Makefile.kvm
> 
> diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
> index 75dfd27b6e8a..30f244b64523 100644
> --- a/arch/x86/kvm/Makefile
> +++ b/arch/x86/kvm/Makefile
> @@ -7,12 +7,7 @@ ifeq ($(CONFIG_FRAME_POINTER),y)
>  OBJECT_FILES_NON_STANDARD_vmenter.o := y
>  endif
>  
> -KVM := ../../../virt/kvm
> -
> -kvm-y			+= $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o \
> -				$(KVM)/eventfd.o $(KVM)/irqchip.o $(KVM)/vfio.o \
> -				$(KVM)/dirty_ring.o $(KVM)/binary_stats.o
> -kvm-$(CONFIG_KVM_ASYNC_PF)	+= $(KVM)/async_pf.o
> +include $(srctree)/virt/kvm/Makefile.kvm
>  
>  kvm-y			+= x86.o emulate.o i8259.o irq.o lapic.o \
>  			   i8254.o ioapic.o irq_comm.o cpuid.o pmu.o mtrr.o \
> diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
> new file mode 100644
> index 000000000000..ffdcad3cc97a
> --- /dev/null
> +++ b/virt/kvm/Makefile.kvm
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for Kernel-based Virtual Machine module
> +#
> +
> +KVM ?= ../../../virt/kvm
> +
> +kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> +kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
> +kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
> +kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
> +kvm-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
> +kvm-$(CONFIG_HAVE_KVM_DIRTY_RING) += $(KVM)/dirty_ring.o

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

