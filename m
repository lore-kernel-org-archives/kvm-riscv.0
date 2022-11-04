From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 4 Nov 2022 18:03:21 +0100
Subject: [PATCH] RISC-V KVM: Add exit logic to main.c
In-Reply-To: <20221104154618.9953-1-13212017962@163.com>
References: <20221104154618.9953-1-13212017962@163.com>
Message-ID: <20221104170321.roif5wddbypjw2tc@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Nov 04, 2022 at 11:46:18PM +0800, XiakaiPan wrote:
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
> +{
> +       kvm_exit();
> +}
> +module_exit(riscv_kvm_exit);
> +
>  static int riscv_kvm_init(void)
>  {
>  	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> -- 
> 2.25.1
>

LGTM, assuming we don't need the riscv kvm module to be permanent for some
reason. If we do, then I guess we need a comment here by module_init()
stating that. I did test loading and unloading multiple times and running
VMs in between, no fireballs appeared.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Andrew Jones <ajones@ventanamicro.com>

