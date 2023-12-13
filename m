From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 12:27:24 +0530
Subject: [PATCH] KVM: riscv: selftests: Fix get-reg-list print_reg defaults
In-Reply-To: <20231207134012.20428-2-ajones@ventanamicro.com>
References: <20231207134012.20428-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy3v3RXmfu__wNvEWuOX63_Apdo4kkNWEQqyAxgnC3gpDg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 7, 2023 at 7:10?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> print_reg() will print everything it knows when it encounters
> a register ID it's unfamiliar with in the default cases of its
> decoding switches. Fix several issues with these (until now,
> never tested) paths; missing newlines in printfs, missing
> complement operator in mask, and missing return in order to
> avoid continuing to decode.
>
> Fixes: 62d0c458f828 ("KVM: riscv: selftests: get-reg-list print_reg should never fail")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Queued as fixes for Linux-6.7

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 6bedaea95395..25de4b8bc347 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -458,8 +458,9 @@ void print_reg(const char *prefix, __u64 id)
>                 reg_size = "KVM_REG_SIZE_U128";
>                 break;
>         default:
> -               printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,",
> -                      (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & REG_MASK);
> +               printf("\tKVM_REG_RISCV | (%lld << KVM_REG_SIZE_SHIFT) | 0x%llx /* UNKNOWN */,\n",
> +                      (id & KVM_REG_SIZE_MASK) >> KVM_REG_SIZE_SHIFT, id & ~REG_MASK);
> +               return;
>         }
>
>         switch (id & KVM_REG_RISCV_TYPE_MASK) {
> @@ -496,8 +497,9 @@ void print_reg(const char *prefix, __u64 id)
>                                 reg_size, sbi_ext_id_to_str(prefix, id));
>                 break;
>         default:
> -               printf("\tKVM_REG_RISCV | %s | 0x%llx /* UNKNOWN */,",
> -                               reg_size, id & REG_MASK);
> +               printf("\tKVM_REG_RISCV | %s | 0x%llx /* UNKNOWN */,\n",
> +                               reg_size, id & ~REG_MASK);
> +               return;
>         }
>  }
>
> --
> 2.43.0
>

