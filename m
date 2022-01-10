From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jan 2022 09:09:52 +1000
Subject: [PATCH v4 02/12] target/riscv: Add target/riscv/kvm.c to place
 the public kvm interface
In-Reply-To: <20220110013831.1594-3-jiangyifei@huawei.com>
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-3-jiangyifei@huawei.com>
Message-ID: <CAKmqyKOOD-iRxX8aj7V2Vtfmi6=i9jCDT=0qgUvxX1j1DOOHXg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 10, 2022 at 11:48 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Add target/riscv/kvm.c to place kvm_arch_* function needed by
> kvm/kvm-all.c. Meanwhile, add kvm support in meson.build file.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> ---
>  meson.build              |   2 +
>  target/riscv/kvm.c       | 133 +++++++++++++++++++++++++++++++++++++++
>  target/riscv/meson.build |   1 +
>  3 files changed, 136 insertions(+)
>  create mode 100644 target/riscv/kvm.c
>
> diff --git a/meson.build b/meson.build
> index 53065e96ec..7eaec31a3a 100644
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

Can you add this as a separate commit at the end of the series?

That way we have implemented KVM support before we enable it for users.

Alistair

