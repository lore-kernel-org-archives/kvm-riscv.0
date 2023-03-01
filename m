From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 21:38:30 +0000
Subject: [PATCH -next v14 17/19] riscv: kvm: Add V extension to KVM ISA
In-Reply-To: <20230224170118.16766-18-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-18-andy.chiu@sifive.com>
Message-ID: <32f729dd-4a0c-45b1-adf7-141f50e31b0d@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 24, 2023 at 05:01:16PM +0000, Andy Chiu wrote:
> From: Vincent Chen <vincent.chen@sifive.com>
> 
> Add V extension to KVM isa extension list to enable supporting of V
> extension on VCPUs.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 92af6f3f057c..3e3de7d486e1 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -105,6 +105,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SVINVAL,
>  	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>  	KVM_RISCV_ISA_EXT_ZICBOM,
> +	KVM_RISCV_ISA_EXT_V,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 7c08567097f0..b060d26ab783 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
>  	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
>  	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
> +	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
>  
>  	KVM_ISA_EXT_ARR(SSTC),
>  	KVM_ISA_EXT_ARR(SVINVAL),
> -- 
> 2.17.1
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/2ff58693/attachment.sig>
