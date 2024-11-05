From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Nov 2024 11:58:51 +0530
Subject: [PATCH] riscv: kvm: Fix out-of-bounds array access
In-Reply-To: <20241104191503.74725-1-bjorn@kernel.org>
References: <20241104191503.74725-1-bjorn@kernel.org>
Message-ID: <CAAhSdy1Z93TyYrFCYw+qOHh05q0FaEPRJ=ZHf4UztUEKXuphYg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Nov 5, 2024 at 12:45?AM Bj?rn T?pel <bjorn@kernel.org> wrote:
>
> From: Bj?rn T?pel <bjorn@rivosinc.com>
>
> In kvm_riscv_vcpu_sbi_init() the entry->ext_idx can contain an
> out-of-bound index. This is used as a special marker for the base
> extensions, that cannot be disabled. However, when traversing the
> extensions, that special marker is not checked prior indexing the
> array.
>
> Add an out-of-bounds check to the function.
>
> Fixes: 56d8a385b605 ("RISC-V: KVM: Allow some SBI extensions to be disabled by default")
> Signed-off-by: Bj?rn T?pel <bjorn@rivosinc.com>
> ---
> Don't know if it matters, but I hit this when trying kvmtool.

Looks like this went unnoticed. Thanks for catching.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-6.13.

Thanks,
Anup

>
>
> Bj?rn
> ---
> arch/riscv/kvm/vcpu_sbi.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 7de128be8db9..6e704ed86a83 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -486,19 +486,22 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
>         struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
>         const struct kvm_riscv_sbi_extension_entry *entry;
>         const struct kvm_vcpu_sbi_extension *ext;
> -       int i;
> +       int idx, i;
>
>         for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
>                 entry = &sbi_ext[i];
>                 ext = entry->ext_ptr;
> +               idx = entry->ext_idx;
> +
> +               if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
> +                       continue;
>
>                 if (ext->probe && !ext->probe(vcpu)) {
> -                       scontext->ext_status[entry->ext_idx] =
> -                               KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
> +                       scontext->ext_status[idx] = KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
>                         continue;
>                 }
>
> -               scontext->ext_status[entry->ext_idx] = ext->default_disabled ?
> +               scontext->ext_status[idx] = ext->default_disabled ?
>                                         KVM_RISCV_SBI_EXT_STATUS_DISABLED :
>                                         KVM_RISCV_SBI_EXT_STATUS_ENABLED;
>         }
>
> base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
> --
> 2.43.0
>

