From: Richard Henderson <richard.henderson@linaro.org>
Date: Mon, 13 Dec 2021 07:21:48 -0800
Subject: [PATCH v2 12/12] target/riscv: Support virtual time context
 synchronization
In-Reply-To: <20211210100732.1080-13-jiangyifei@huawei.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-13-jiangyifei@huawei.com>
Message-ID: <10d2d911-e975-64b3-8ab6-e950c5064b9e@linaro.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12/10/21 2:07 AM, Yifei Jiang via wrote:
> +static bool kvmtimer_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}
> +
> +
> +static const VMStateDescription vmstate_kvmtimer = {
> +    .name = "cpu/kvmtimer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvmtimer_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static int cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    if (kvm_enabled()) {
> +        env->kvm_timer_dirty = true;
> +    }
> +    return 0;
> +}

This post-load belongs on the vmstate_kvmtimer struct, so that you need not re-check 
kvm_enabled().

>   const VMStateDescription vmstate_riscv_cpu = {
>       .name = "cpu",
> -    .version_id = 3,
> -    .minimum_version_id = 3,
> +    .version_id = 4,
> +    .minimum_version_id = 4,
> +    .post_load = cpu_post_load,

No need for version change.


r~

