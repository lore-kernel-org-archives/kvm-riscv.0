From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Wed, 17 Nov 2021 08:29:45 +0100
Subject: [PATCH 3/7] KVM: s390: Use Makefile.kvm for common files
In-Reply-To: <20211116115051.119956-3-dwmw2@infradead.org>
References: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
 <20211116115051.119956-1-dwmw2@infradead.org>
 <20211116115051.119956-3-dwmw2@infradead.org>
Message-ID: <2fcab5d3-fee1-a211-aaf5-a2569b5a7ed8@de.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



Am 16.11.21 um 12:50 schrieb David Woodhouse:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Looks good.
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>   arch/s390/kvm/Makefile | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
> index b3aaadc60ead..e4f50453cf7f 100644
> --- a/arch/s390/kvm/Makefile
> +++ b/arch/s390/kvm/Makefile
> @@ -3,13 +3,11 @@
>   #
>   # Copyright IBM Corp. 2008
>   
> -KVM := ../../../virt/kvm
> -common-objs = $(KVM)/kvm_main.o $(KVM)/eventfd.o  $(KVM)/async_pf.o \
> -	      $(KVM)/irqchip.o $(KVM)/vfio.o $(KVM)/binary_stats.o
> +include $(srctree)/virt/kvm/Makefile.kvm
>   
>   ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
>   
> -kvm-objs := $(common-objs) kvm-s390.o intercept.o interrupt.o priv.o sigp.o
> +kvm-objs := kvm-s390.o intercept.o interrupt.o priv.o sigp.o
>   kvm-objs += diag.o gaccess.o guestdbg.o vsie.o pv.o
>   
>   obj-$(CONFIG_KVM) += kvm.o
> 

