From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Apr 2021 08:32:09 +1000
Subject: [PATCH RFC v5 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
In-Reply-To: <20210412065246.1853-4-jiangyifei@huawei.com>
References: <20210412065246.1853-1-jiangyifei@huawei.com>
 <20210412065246.1853-4-jiangyifei@huawei.com>
Message-ID: <CAKmqyKN-eiDw3Ufo1QyLg5ELP-JY+aq3Bi1cPJVf8gQtsu+qkw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 12, 2021 at 4:53 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Get isa info from kvm while kvm init.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  target/riscv/kvm.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 687dd4b621..0d924be33f 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -38,6 +38,18 @@
>  #include "qemu/log.h"
>  #include "hw/loader.h"
>
> +static __u64 kvm_riscv_reg_id(CPURISCVState *env, __u64 type, __u64 idx)
> +{
> +    __u64 id = KVM_REG_RISCV | type | idx;

Can you use uint64_t instead of __u64?

Once that is fixed:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +
> +    if (riscv_cpu_is_32bit(env)) {
> +        id |= KVM_REG_SIZE_U32;
> +    } else {
> +        id |= KVM_REG_SIZE_U64;
> +    }
> +    return id;
> +}
> +
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
>  };
> @@ -79,7 +91,20 @@ void kvm_arch_init_irq_routing(KVMState *s)
>
>  int kvm_arch_init_vcpu(CPUState *cs)
>  {
> -    return 0;
> +    int ret = 0;
> +    target_ulong isa;
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    __u64 id;
> +
> +    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
> +    ret = kvm_get_one_reg(cs, id, &isa);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->misa = isa | RVXLEN;
> +
> +    return ret;
>  }
>
>  int kvm_arch_msi_data_to_gsi(uint32_t data)
> --
> 2.19.1
>
>

