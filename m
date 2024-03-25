From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Mar 2024 14:17:44 +0530
Subject: [PATCH][next] RISC-V: KVM: Remove second semicolon
In-Reply-To: <20240315092914.2431214-1-colin.i.king@gmail.com>
References: <20240315092914.2431214-1-colin.i.king@gmail.com>
Message-ID: <CAAhSdy2b1nUO5u0cM2uMcow931UX0Q=o_OY_YLQ5+oK499PX+w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 15, 2024 at 2:59?PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a statement with two semicolons. Remove the second one, it
> is redundant.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Queued this patch for Linux-6.9 fixes.

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_onereg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f4a6124d25c9..994adc26db4b 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -986,7 +986,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
>
>  static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
>  {
> -       return copy_isa_ext_reg_indices(vcpu, NULL);;
> +       return copy_isa_ext_reg_indices(vcpu, NULL);
>  }
>
>  static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
> --
> 2.39.2
>

