From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Jan 2022 09:47:05 +0530
Subject: [PATCH -next] RISC-V: KVM: remove unneeded semicolon
In-Reply-To: <20220111010454.126241-1-yang.lee@linux.alibaba.com>
References: <20220111010454.126241-1-yang.lee@linux.alibaba.com>
Message-ID: <CAAhSdy1xnb=D70rHkewRka6_-bT0+7JAMTYc3fM1MRjs+s1uRQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 11, 2022 at 6:35 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the following coccicheck warning:
> ./arch/riscv/kvm/vcpu_sbi_v01.c:117:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Thanks, I have queued this patch for 5.18

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_v01.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> index 4c7e13ec9ccc..9acc8fa21d1f 100644
> --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> @@ -114,7 +114,7 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         default:
>                 ret = -EINVAL;
>                 break;
> -       };
> +       }
>
>         return ret;
>  }
> --
> 2.20.1.7.g153144c
>

