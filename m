From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Nov 2021 19:57:59 +0530
Subject: [PATCH] RISC-V: KVM:Remove unneeded semicolon
In-Reply-To: <20211103064458.26916-1-zhang.mingyu@zte.com.cn>
References: <20211103064458.26916-1-zhang.mingyu@zte.com.cn>
Message-ID: <CAAhSdy3LvzR4H_rYvacER87n7fakU9EzE17vA3D+ASczR24=5g@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 3, 2021 at 12:15 PM <cgel.zte@gmail.com> wrote:
>
> From: Zhang Mingyu <zhang.mingyu@zte.com.cn>
>
> Eliminate the following coccinelle check warning:
> arch/riscv/kvm/vcpu.c:167:2-3
> arch/riscv/kvm/vcpu.c:204:2-3
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Zhang Mingyu <zhang.mingyu@zte.com.cn>

Thanks but this is already fixed by following patch:
https://www.spinics.net/lists/kvm/msg257614.html

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e92ba3e5db8c..e3d3aed46184 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -164,7 +164,7 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>                 break;
>         default:
>                 return -EINVAL;
> -       };
> +       }
>
>         if (copy_to_user(uaddr, &reg_val, KVM_REG_SIZE(reg->id)))
>                 return -EFAULT;
> @@ -201,7 +201,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>                 break;
>         default:
>                 return -EINVAL;
> -       };
> +       }
>
>         return 0;
>  }
> --
> 2.25.1
>

