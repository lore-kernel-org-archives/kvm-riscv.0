From: Anup Patel <anup@brainfault.org>
Date: Tue, 23 Nov 2021 14:42:21 +0530
Subject: [PATCH v5 05/12] KVM: RISC-V: Use Makefile.kvm for common files
In-Reply-To: <20211121125451.9489-6-dwmw2@infradead.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
 <20211121125451.9489-6-dwmw2@infradead.org>
Message-ID: <CAAhSdy307DqNuQEFCu2ze2jXJ7taDE6y6SwY9nHGA8yNPfggiQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 21, 2021 at 6:25 PM David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Looks good to me.

For KVM RISC-V,
Acked-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>

Thanks,
Anup

> ---
>  arch/riscv/kvm/Makefile | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
> index 30cdd1df0098..300590225348 100644
> --- a/arch/riscv/kvm/Makefile
> +++ b/arch/riscv/kvm/Makefile
> @@ -5,14 +5,10 @@
>
>  ccflags-y += -I $(srctree)/$(src)
>
> -KVM := ../../../virt/kvm
> +include $(srctree)/virt/kvm/Makefile.kvm
>
>  obj-$(CONFIG_KVM) += kvm.o
>
> -kvm-y += $(KVM)/kvm_main.o
> -kvm-y += $(KVM)/coalesced_mmio.o
> -kvm-y += $(KVM)/binary_stats.o
> -kvm-y += $(KVM)/eventfd.o
>  kvm-y += main.o
>  kvm-y += vm.o
>  kvm-y += vmid.o
> --
> 2.31.1
>

