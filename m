From: Anup Patel <anup@brainfault.org>
Date: Sun, 27 Nov 2022 11:41:17 +0530
Subject: [PATCH] RISC-V KVM: Add exit logic to main.c
In-Reply-To: <20221104154618.9953-1-13212017962@163.com>
References: <20221104154618.9953-1-13212017962@163.com>
Message-ID: <CAAhSdy279u+6iPX__5ekg5Gy2UVXd4YyTLy1Hq9wy7sGnsLLCA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 4, 2022 at 9:16 PM XiakaiPan <13212017962@163.com> wrote:
>
> Several lines of code are inserted to remove KVM module normally using rmmod command just like others.
>
> Signed-off-by: XiakaiPan <13212017962@163.com>
> ---
>  arch/riscv/kvm/main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 1549205fe..81f1a761d 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -122,6 +122,12 @@ void kvm_arch_exit(void)
>  {
>  }
>
> +static void riscv_kvm_exit(void)

Add __exit attribute to riscv_kvm_exit()

> +{
> +       kvm_exit();

Use tab instead of space for indentation.

> +}
> +module_exit(riscv_kvm_exit);
> +
>  static int riscv_kvm_init(void)
>  {
>         return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> --
> 2.25.1
>

I have taken care of the above comments at the
time of applying this patch.

Queued this patch for Linux-6.2

Thanks,
Anup

