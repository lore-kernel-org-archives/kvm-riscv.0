From: Conor Dooley <conor@kernel.org>
Date: Fri, 27 Jan 2023 20:43:55 +0000
Subject: [PATCH -next v13 16/19] riscv: Add V extension to KVM ISA
In-Reply-To: <20230125142056.18356-17-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-17-andy.chiu@sifive.com>
Message-ID: <Y9Q3i2z8uh1Bttzw@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 25, 2023 at 02:20:53PM +0000, Andy Chiu wrote:
> riscv: Add V extension to KVM ISA

I figure this should probably be "riscv: kvm:" or some variant with
more capital letters.

> From: Vincent Chen <vincent.chen@sifive.com>
> 
> Add V extension to KVM isa extension list to enable supporting of V
> extension on VCPUs.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 92af6f3f057c..e7c9183ad4af 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -100,6 +100,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_H,
>  	KVM_RISCV_ISA_EXT_I,
>  	KVM_RISCV_ISA_EXT_M,
> +	KVM_RISCV_ISA_EXT_V,
>  	KVM_RISCV_ISA_EXT_SVPBMT,
>  	KVM_RISCV_ISA_EXT_SSTC,
>  	KVM_RISCV_ISA_EXT_SVINVAL,

Ehh, this UAPI so, AFAIU, you cannot add this in the middle of the enum
and new entries must go at the bottom. Quoting Drew: "we can't touch enum
KVM_RISCV_ISA_EXT_ID as that's UAPI. All new extensions must be added at
the bottom. We originally also had to keep kvm_isa_ext_arr[] in that
order, but commit 1b5cbb8733f9 ("RISC-V: KVM: Make ISA ext mappings
explicit") allows us to list its elements in any order."


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

This one here is fine however.

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230127/56e78d89/attachment-0001.sig>
