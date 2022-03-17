From: Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Date: Thu, 17 Mar 2022 13:24:41 +0000
Subject: [PATCH v4 2/6] Partially revert "KVM: Pass kvm_init()'s opaque
 param to additional arch funcs"
In-Reply-To: <20220216031528.92558-3-chao.gao@intel.com>
References: <20220216031528.92558-1-chao.gao@intel.com>
 <20220216031528.92558-3-chao.gao@intel.com>
Message-ID: <0d9d605e-4f92-3947-f99d-91faf9dbc2d7@arm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 16/02/2022 03:15, Chao Gao wrote:
> This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
> param to additional arch funcs") remove opaque from
> kvm_arch_check_processor_compat because no one uses this opaque now.
> Address conflicts for ARM (due to file movement) and manually handle RISC-V
> which comes after the commit.
> 
> And changes about kvm_arch_hardware_setup() in original commit are still
> needed so they are not reverted.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> Reviewed-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/arm64/kvm/arm.c       |  2 +-
>   arch/mips/kvm/mips.c       |  2 +-
>   arch/powerpc/kvm/powerpc.c |  2 +-
>   arch/riscv/kvm/main.c      |  2 +-
>   arch/s390/kvm/kvm-s390.c   |  2 +-
>   arch/x86/kvm/x86.c         |  2 +-
>   include/linux/kvm_host.h   |  2 +-
>   virt/kvm/kvm_main.c        | 16 +++-------------
>   8 files changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index ecc5958e27fe..0165cf3aac3a 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -73,7 +73,7 @@ int kvm_arch_hardware_setup(void *opaque)
>   	return 0;
>   }
>   
> -int kvm_arch_check_processor_compat(void *opaque)
> +int kvm_arch_check_processor_compat(void)
>   {
>   	return 0;
>   }

For arm64 :

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

