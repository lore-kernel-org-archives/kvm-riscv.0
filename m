From: Anup Patel <anup@brainfault.org>
Date: Mon, 29 Aug 2022 14:14:29 +0530
Subject: [PATCH 4/4] riscv: KVM: Apply insn-def to hlv encodings
In-Reply-To: <20220819140250.3892995-5-ajones@ventanamicro.com>
References: <20220819140250.3892995-1-ajones@ventanamicro.com> <20220819140250.3892995-5-ajones@ventanamicro.com>
Message-ID: <CAAhSdy1W4fxNtyF5pqi3Riv3bXv3v+6t7cdf8z_3YGGB7xBEEQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 19, 2022 at 7:32 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Introduce hlv instruction encodings and apply them to KVM's use.
> We're careful not to introduce hlv.d to 32-bit builds. Indeed,
> we ensure the build fails if someone tries to use it.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/insn-def.h | 14 ++++++++++++++
>  arch/riscv/kvm/vcpu_exit.c        | 29 +++++------------------------
>  2 files changed, 19 insertions(+), 24 deletions(-)
>
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index cd1c0d365f47..c66d5745c5b4 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -87,4 +87,18 @@
>  #define HFENCE_GVMA(gaddr, vmid)       \
>         INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(49), RD(0), gaddr, vmid)
>
> +#define HLVX_HU(dest, addr)    \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(50), dest, addr, RS2(3))
> +
> +#define HLV_W(dest, addr)      \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(52), dest, addr, RS2(0))
> +
> +#ifdef CONFIG_64BIT
> +#define HLV_D(dest, addr)      \
> +       INSN_R(OPCODE_SYSTEM, FUNC3(4), FUNC7(54), dest, addr, RS2(0))
> +#else
> +#define HLV_D(dest, addr)      \
> +       __ASM_STR(.error "hlv.d requires 64-bit support")
> +#endif
> +
>  #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index d5c36386878a..9cb075e72799 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -8,6 +8,7 @@
>
>  #include <linux/kvm_host.h>
>  #include <asm/csr.h>
> +#include <asm/insn-def.h>
>
>  static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                              struct kvm_cpu_trap *trap)
> @@ -82,22 +83,12 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
>                         ".option push\n"
>                         ".option norvc\n"
>                         "add %[ttmp], %[taddr], 0\n"
> -                       /*
> -                        * HLVX.HU %[val], (%[addr])
> -                        * HLVX.HU t0, (t2)
> -                        * 0110010 00011 00111 100 00101 1110011
> -                        */
> -                       ".word 0x6433c2f3\n"
> +                       HLVX_HU("%[val]", "%[addr]")
>                         "andi %[tmp], %[val], 3\n"
>                         "addi %[tmp], %[tmp], -3\n"
>                         "bne %[tmp], zero, 2f\n"
>                         "addi %[addr], %[addr], 2\n"
> -                       /*
> -                        * HLVX.HU %[tmp], (%[addr])
> -                        * HLVX.HU t1, (t2)
> -                        * 0110010 00011 00111 100 00110 1110011
> -                        */
> -                       ".word 0x6433c373\n"
> +                       HLVX_HU("%[tmp]", "%[addr]")
>                         "sll %[tmp], %[tmp], 16\n"
>                         "add %[val], %[val], %[tmp]\n"
>                         "2:\n"
> @@ -121,19 +112,9 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
>                         ".option norvc\n"
>                         "add %[ttmp], %[taddr], 0\n"
>  #ifdef CONFIG_64BIT
> -                       /*
> -                        * HLV.D %[val], (%[addr])
> -                        * HLV.D t0, (t2)
> -                        * 0110110 00000 00111 100 00101 1110011
> -                        */
> -                       ".word 0x6c03c2f3\n"
> +                       HLV_D("%[val]", "%[addr]")
>  #else
> -                       /*
> -                        * HLV.W %[val], (%[addr])
> -                        * HLV.W t0, (t2)
> -                        * 0110100 00000 00111 100 00101 1110011
> -                        */
> -                       ".word 0x6803c2f3\n"
> +                       HLV_W("%[val]", "%[addr]")
>  #endif
>                         ".option pop"
>                 : [val] "=&r" (val),
> --
> 2.37.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

