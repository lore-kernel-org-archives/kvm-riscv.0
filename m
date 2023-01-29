From: Anup Patel <anup@brainfault.org>
Date: Sun, 29 Jan 2023 18:07:12 +0530
Subject: [PATCH v3 10/14] RISC-V: KVM: Disable all hpmcounter access for
 VS/VU mode
In-Reply-To: <20230127182558.2416400-11-atishp@rivosinc.com>
References: <20230127182558.2416400-1-atishp@rivosinc.com> <20230127182558.2416400-11-atishp@rivosinc.com>
Message-ID: <CAAhSdy0HG_0DZVLDF3Rvbofx-4P_2z7Tp+hGJ7VwgTH-u6uLGA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 11:56 PM Atish Patra <atishp@rivosinc.com> wrote:
>
> Any guest must not get access to any hpmcounter including cycle/instret
> without any checks. We achieve that by disabling all the bits except TM
> bit in hcounteren.
>
> However, instret and cycle access for guest user space can be enabled
> upon explicit request (via ONE REG) or on first trap from VU mode
> to maintain ABI requirement in the future. This patch doesn't support
> that as ONE REG interface is not settled yet.
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kvm/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 58c5489..c5d400f 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
>         hideleg |= (1UL << IRQ_VS_EXT);
>         csr_write(CSR_HIDELEG, hideleg);
>
> -       csr_write(CSR_HCOUNTEREN, -1UL);
> +       /* VS should access only the time counter directly. Everything else should trap */
> +       csr_write(CSR_HCOUNTEREN, 0x02);
>
>         csr_write(CSR_HVIP, 0);
>
> --
> 2.25.1
>

