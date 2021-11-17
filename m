From: Marc Zyngier <maz@kernel.org>
Date: Wed, 17 Nov 2021 18:11:13 +0000
Subject: [PATCH v3 07/12] KVM: arm64: Use Makefile.kvm for common files
In-Reply-To: <20211117174003.297096-8-dwmw2@infradead.org>
References: <20211117174003.297096-1-dwmw2@infradead.org>
 <20211117174003.297096-8-dwmw2@infradead.org>
Message-ID: <87sfvu7iv2.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 17 Nov 2021 17:39:58 +0000,
David Woodhouse <dwmw2@infradead.org> wrote:
> 
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>  arch/arm64/kvm/Makefile | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 989bb5dad2c8..04a53f71a6b6 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -5,14 +5,12 @@
>  
>  ccflags-y += -I $(srctree)/$(src)
>  
> -KVM=../../../virt/kvm
> +include $(srctree)/virt/kvm/Makefile.kvm
>  
>  obj-$(CONFIG_KVM) += kvm.o
>  obj-$(CONFIG_KVM) += hyp/
>  
> -kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
> -	 $(KVM)/vfio.o $(KVM)/irqchip.o $(KVM)/binary_stats.o \
> -	 arm.o mmu.o mmio.o psci.o perf.o hypercalls.o pvtime.o \
> +kvm-y += arm.o mmu.o mmio.o psci.o perf.o hypercalls.o pvtime.o \
>  	 inject_fault.o va_layout.o handle_exit.o \
>  	 guest.o debug.o reset.o sys_regs.o \
>  	 vgic-sys-reg-v3.o fpsimd.o pmu.o \

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

