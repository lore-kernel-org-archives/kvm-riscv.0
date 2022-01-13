From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jan 2022 10:11:41 +0530
Subject: [PATCH v5 13/13] target/riscv: enable riscv kvm accel
In-Reply-To: <20220112081329.1835-14-jiangyifei@huawei.com>
References: <20220112081329.1835-1-jiangyifei@huawei.com>
 <20220112081329.1835-14-jiangyifei@huawei.com>
Message-ID: <CAAhSdy2oOiiJ=ogzP4+StyvJpqaa-zjPGqKA2hy2T3JcCO7jCA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 12, 2022 at 1:44 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add riscv kvm support in meson.build file.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  meson.build | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index c1b1db1e28..06a5476254 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -90,6 +90,8 @@ elif cpu in ['ppc', 'ppc64']
>    kvm_targets = ['ppc-softmmu', 'ppc64-softmmu']
>  elif cpu in ['mips', 'mips64']
>    kvm_targets = ['mips-softmmu', 'mipsel-softmmu', 'mips64-softmmu', 'mips64el-softmmu']
> +elif cpu in ['riscv']
> +  kvm_targets = ['riscv32-softmmu', 'riscv64-softmmu']
>  else
>    kvm_targets = []
>  endif
> --
> 2.19.1
>
>
> --
> kvm-riscv mailing list
> kvm-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

