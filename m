From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 3 Jul 2023 10:18:35 +0200
Subject: [PATCH v5 10/13] KVM: selftests: Only do get/set tests on
 present blessed list
In-Reply-To: <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
References: <cover.1688010022.git.haibo1.xu@intel.com>
 <f44c3aa46971d524319c6340f9ce1b00c0182fd2.1688010022.git.haibo1.xu@intel.com>
Message-ID: <20230702-49c5545eb1ae2d0cf11c7b95@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jul 01, 2023 at 09:42:58PM +0800, Haibo Xu wrote:
> Only do the get/set tests on present and blessed registers
> since we don't know the capabilities of any new ones.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/get-reg-list.c | 29 ++++++++++++++--------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
> index c61090806007..74fb6f6fdd09 100644
> --- a/tools/testing/selftests/kvm/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/get-reg-list.c
> @@ -49,6 +49,10 @@ extern int vcpu_configs_n;
>  	for_each_reg_filtered(i)						\
>  		if (!find_reg(blessed_reg, blessed_n, reg_list->reg[i]))
>  
> +#define for_each_present_blessed_reg(i)			\
> +	for ((i) = 0; (i) < blessed_n; ++(i))		\
> +		if (find_reg(reg_list->reg, reg_list->n, blessed_reg[i]))

I just realized this is backwards. We need 'i' to index reg_list->reg in
the body of the loop. That means we need to write this as

#define for_each_present_blessed_reg(i)                                         \
        for_each_reg(i)                                                         \
                if (find_reg(blessed_reg, blessed_n, reg_list->reg[i]))

(Which, in hindsight, makes sense since we're replacing a for_each_reg()
loop.)

Thanks,
drew

