From: Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 18 Nov 2021 10:50:44 +1100
Subject: [PATCH v3 06/12] KVM: powerpc: Use Makefile.kvm for common files
In-Reply-To: <20211117174003.297096-7-dwmw2@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-7-dwmw2@infradead.org>
Message-ID: <871r3emje3.fsf@mpe.ellerman.id.au>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Woodhouse <dwmw2@infradead.org> writes:
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> It's all fairly baroque but in the end, I don't think there's any reason
> for $(KVM)/irqchip.o to have been handled differently, as they all end
> up in $(kvm-y) in the end anyway, regardless of whether they get there
> via $(common-objs-y) and the CPU-specific object lists.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/powerpc/kvm/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 583c14ef596e..245f59118413 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -4,11 +4,8 @@
>  #
>  
>  ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
> -KVM := ../../../virt/kvm
>  
> -common-objs-y = $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> -common-objs-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
> -common-objs-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
> +include $(srctree)/virt/kvm/Makefile.kvm
>  
>  common-objs-y += powerpc.o emulate_loadstore.o
>  obj-$(CONFIG_KVM_EXIT_TIMING) += timing.o
> @@ -125,7 +122,6 @@ kvm-book3s_32-objs := \
>  kvm-objs-$(CONFIG_KVM_BOOK3S_32) := $(kvm-book3s_32-objs)
>  
>  kvm-objs-$(CONFIG_KVM_MPIC) += mpic.o
> -kvm-objs-$(CONFIG_HAVE_KVM_IRQ_ROUTING) += $(KVM)/irqchip.o
>  
>  kvm-objs := $(kvm-objs-m) $(kvm-objs-y)

Looks OK to me. The extra objects built in Makefile.kvm are all behind
CONFIG symbols we don't enable.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

