From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 3 Apr 2023 13:31:18 +0200
Subject: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
In-Reply-To: <20230403093310.2271142-7-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
Message-ID: <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 03, 2023 at 03:03:08PM +0530, Anup Patel wrote:
> We implement ONE_REG interface for AIA CSRs as a separate subtype
> under the CSR ONE_REG interface.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 8 ++++++++
>  arch/riscv/kvm/vcpu.c             | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 182023dc9a51..cbc3e74fa670 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -79,6 +79,10 @@ struct kvm_riscv_csr {
>  	unsigned long scounteren;
>  };
>  
> +/* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> +struct kvm_riscv_aia_csr {
> +};
> +
>  /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
>  struct kvm_riscv_timer {
>  	__u64 frequency;
> @@ -107,6 +111,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>  	KVM_RISCV_ISA_EXT_ZICBOM,
>  	KVM_RISCV_ISA_EXT_ZBB,

Looks like this patch is also based on "[PATCH] RISC-V: KVM: Allow Zbb
extension for Guest/VM"

Thanks,
drew

