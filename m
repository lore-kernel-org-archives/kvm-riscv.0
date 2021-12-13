From: Anup Patel <anup@brainfault.org>
Date: Mon, 13 Dec 2021 10:35:59 +0530
Subject: [PATCH v2 10/12] target/riscv: Add kvm_riscv_get/put_regs_timer
In-Reply-To: <20211210100732.1080-11-jiangyifei@huawei.com>
References: <20211210100732.1080-1-jiangyifei@huawei.com>
 <20211210100732.1080-11-jiangyifei@huawei.com>
Message-ID: <CAAhSdy11yd+f6OZZxjX9mWxkVH4AC7Kz5Vp+RPUz6cCam9GvNQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 10, 2021 at 3:37 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add kvm_riscv_get/put_regs_timer to synchronize virtual time context
> from KVM.
>
> To set register of RISCV_TIMER_REG(state) will occur a error from KVM
> on kvm_timer_state == 0. It's better to adapt in KVM, but it doesn't matter
> that adaping in QEMU.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  target/riscv/cpu.h |  7 +++++
>  target/riscv/kvm.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 79 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e7dba35acb..c892a2c8b7 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -259,6 +259,13 @@ struct CPURISCVState {
>
>      hwaddr kernel_addr;
>      hwaddr fdt_addr;
> +
> +    /* kvm timer */
> +    bool kvm_timer_dirty;
> +    uint64_t kvm_timer_time;
> +    uint64_t kvm_timer_compare;
> +    uint64_t kvm_timer_state;
> +    uint64_t kvm_timer_frequency;
>  };
>
>  OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 171a32adf9..802c076b22 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -64,6 +64,9 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>  #define RISCV_CSR_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_CSR, \
>                   KVM_REG_RISCV_CSR_REG(name))
>
> +#define RISCV_TIMER_REG(env, name)  kvm_riscv_reg_id(env, KVM_REG_RISCV_TIMER, \
> +                 KVM_REG_RISCV_TIMER_REG(name))
> +
>  #define RISCV_FP_F_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_F, idx)
>
>  #define RISCV_FP_D_REG(env, idx)  kvm_riscv_reg_id(env, KVM_REG_RISCV_FP_D, idx)
> @@ -235,6 +238,75 @@ static int kvm_riscv_put_regs_fp(CPUState *cs)
>      return ret;
>  }
>
> +static void kvm_riscv_get_regs_timer(CPUState *cs)
> +{
> +    int ret;
> +    uint64_t reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (env->kvm_timer_dirty) {
> +        return;
> +    }
> +
> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, time), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +    env->kvm_timer_time = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, compare), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +    env->kvm_timer_compare = reg;
> +
> +    ret = kvm_get_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +    env->kvm_timer_state = reg;

Please read the timer frequency here.

> +
> +    env->kvm_timer_dirty = true;
> +}
> +
> +static void kvm_riscv_put_regs_timer(CPUState *cs)
> +{
> +    int ret;
> +    uint64_t reg;
> +    CPURISCVState *env = &RISCV_CPU(cs)->env;
> +
> +    if (!env->kvm_timer_dirty) {
> +        return;
> +    }

Over here, we should get the timer frequency and abort() with an
error message if it does not match env->kvm_timer_frequency

For now, migration will not work between Hosts with different
timer frequency.

Regards,
Anup

> +
> +    reg = env->kvm_timer_time;
> +    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, time), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +
> +    reg = env->kvm_timer_compare;
> +    ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, compare), &reg);
> +    if (ret) {
> +        abort();
> +    }
> +
> +    /*
> +     * To set register of RISCV_TIMER_REG(state) will occur a error from KVM
> +     * on env->kvm_timer_state == 0, It's better to adapt in KVM, but it
> +     * doesn't matter that adaping in QEMU now.
> +     * TODO If KVM changes, adapt here.
> +     */
> +    if (env->kvm_timer_state) {
> +        reg = env->kvm_timer_state;
> +        ret = kvm_set_one_reg(cs, RISCV_TIMER_REG(env, state), &reg);
> +        if (ret) {
> +            abort();
> +        }
> +    }
> +
> +    env->kvm_timer_dirty = false;
> +}
>
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_LAST_INFO
> --
> 2.19.1
>

