From: Xu, Haibo1 <haibo1.xu@intel.com>
Date: Fri, 18 Aug 2023 01:29:25 +0000
Subject: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
In-Reply-To: <20230817162344.17076-5-ajones@ventanamicro.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
 <20230817162344.17076-5-ajones@ventanamicro.com>
Message-ID: <BY5PR11MB390964AB15E7BB3C64EE3DA7B01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> -----Original Message-----
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Friday, August 18, 2023 12:24 AM
> To: kvm-riscv at lists.infradead.org; linux-riscv at lists.infradead.org
> Cc: anup at brainfault.org; atishp at atishpatra.org; Xu, Haibo1
> <haibo1.xu@intel.com>; paul.walmsley at sifive.com; palmer at dabbelt.com;
> aou at eecs.berkeley.edu
> Subject: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
> 
> With the introduction of the get-reg-list test for riscv, another directory has
> been added that should be tracked by riscv kvm maintainers.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f966f05fb0d..8fc9e6e7f207 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11463,6 +11463,7 @@ F:	arch/riscv/include/asm/kvm*
>  F:	arch/riscv/include/uapi/asm/kvm*
>  F:	arch/riscv/kvm/
>  F:	tools/testing/selftests/kvm/*/riscv/
> +F:	tools/testing/selftests/kvm/riscv/
> 
LGTM!

Thanks,
Haibo
>  KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
>  M:	Christian Borntraeger <borntraeger@linux.ibm.com>
> --
> 2.41.0


