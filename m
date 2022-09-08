From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 8 Sep 2022 11:07:42 -0700
Subject: [PATCH] RISC-V: KVM: Change the SBI specification version to v1.0
In-Reply-To: <20220908110404.186725-1-apatel@ventanamicro.com>
References: <20220908110404.186725-1-apatel@ventanamicro.com>
Message-ID: <CAOnJCUKHCjmaJ2TCxUVnuYetWovwJQnEWJEi3geqf1hOGSM_Nw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 8, 2022 at 4:04 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The SBI v1.0 specificaiton is functionally same as SBI v0.3
> specification except that SBI v1.0 specification went through
> the full RISC-V International ratification process.
>
> Let us change the SBI specification version to v1.0.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 26a446a34057..d4e3e600beef 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -11,8 +11,8 @@
>
>  #define KVM_SBI_IMPID 3
>
> -#define KVM_SBI_VERSION_MAJOR 0
> -#define KVM_SBI_VERSION_MINOR 3
> +#define KVM_SBI_VERSION_MAJOR 1
> +#define KVM_SBI_VERSION_MINOR 0
>
>  struct kvm_vcpu_sbi_extension {
>         unsigned long extid_start;
> --
> 2.34.1
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

