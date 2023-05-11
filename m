From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 11 May 2023 18:40:05 +0200
Subject: [PATCH 1/2] riscv: kvm: Add KVM_GET_REG_LIST API support
In-Reply-To: <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
References: <cover.1683791148.git.haibo1.xu@intel.com>
 <921fc2e1a91887170e277acb1b52df57480a5736.1683791148.git.haibo1.xu@intel.com>
Message-ID: <20230511-d0a207eebb30fc88de875e4f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 11, 2023 at 05:22:48PM +0800, Haibo Xu wrote:
> KVM_GET_REG_LIST API will return all registers that are available to
> KVM_GET/SET_ONE_REG APIs. It's very useful to identify some platform
> regression issue during VM migration.
> 
> Since this API was already supported on arm64, it'd be straightforward
> to enable it on riscv with similar code structure.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  Documentation/virt/kvm/api.rst |   2 +-
>  arch/riscv/kvm/vcpu.c          | 346 +++++++++++++++++++++++++++++++++
>  2 files changed, 347 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index add067793b90..280e89abd004 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -3499,7 +3499,7 @@ VCPU matching underlying host.
>  ---------------------
>  
>  :Capability: basic
> -:Architectures: arm64, mips
> +:Architectures: arm64, mips, riscv
>  :Type: vcpu ioctl
>  :Parameters: struct kvm_reg_list (in/out)
>  :Returns: 0 on success; -1 on error
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 8bd9f2a8a0b9..fb8834e4fa15 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -657,6 +657,334 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
>  	return 0;
>  }
>  
> +static inline unsigned long num_config_regs(void)
> +{
> +	return sizeof(struct kvm_riscv_config) / sizeof(unsigned long);

We can't assume all config registers are present. For example,
zicbom and zicboz block size registers are only present when their
respective extensions are available.

Thanks,
drew

