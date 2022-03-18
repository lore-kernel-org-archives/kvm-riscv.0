From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Mar 2022 08:55:56 +0530
Subject: [RFC PATCH v2 4/7] RISC-V: KVM: Remove 's' & 'u' as valid ISA
 extension
In-Reply-To: <20220304201020.810380-5-atishp@rivosinc.com>
References: <20220304201020.810380-1-atishp@rivosinc.com>
 <20220304201020.810380-5-atishp@rivosinc.com>
Message-ID: <CAAhSdy3bPuhqcZWpZpDP_DGiMEc97aMEjspum4K9k0D=24fYsg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 5, 2022 at 1:40 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> There are no ISA extension defined as 's' & 'u' in RISC-V specifications.
> The misa register defines 's' & 'u' bit as Supervisor/User privilege mode
> enabled. But it should not appear in the ISA extension in the device tree.
>
> Remove those from the allowed ISA extension for kvm.
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Both PATCH4 and PATCH5, fix the "isa" config register of one_reg interface.

Can you send PATCH4 (i.e. this patch) and PATCH5 separately with the
"Fixes:" tag so that we can have these patches as RC fixes ?

Regards,
Anup


> ---
>  arch/riscv/kvm/vcpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 624166004e36..3ae545e7b398 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -43,9 +43,7 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
>                                  riscv_isa_extension_mask(d) | \
>                                  riscv_isa_extension_mask(f) | \
>                                  riscv_isa_extension_mask(i) | \
> -                                riscv_isa_extension_mask(m) | \
> -                                riscv_isa_extension_mask(s) | \
> -                                riscv_isa_extension_mask(u))
> +                                riscv_isa_extension_mask(m))
>
>  static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
>  {
> --
> 2.30.2
>

