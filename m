From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 6 Jan 2022 08:10:26 +1000
Subject: [PATCH v3 12/12] target/riscv: Support virtual time context
 synchronization
In-Reply-To: <20211220130919.413-13-jiangyifei@huawei.com>
References: <20211220130919.413-1-jiangyifei@huawei.com>
 <20211220130919.413-13-jiangyifei@huawei.com>
Message-ID: <CAKmqyKNq9WJbx2CWL8qPatg7Gc3BckU=v94p+HgKiJ1W5-YPNg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 21, 2021 at 2:44 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Add virtual time context description to vmstate_kvmtimer. After cpu being
> loaded, virtual time context is updated to KVM.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/machine.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index ad8248ebfd..95eb82792a 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -164,6 +164,35 @@ static const VMStateDescription vmstate_pointermasking = {
>      }
>  };
>
> +static bool kvmtimer_needed(void *opaque)
> +{
> +    return kvm_enabled();
> +}
> +
> +static int cpu_post_load(void *opaque, int version_id)
> +{
> +    RISCVCPU *cpu = opaque;
> +    CPURISCVState *env = &cpu->env;
> +
> +    env->kvm_timer_dirty = true;
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_kvmtimer = {
> +    .name = "cpu/kvmtimer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = kvmtimer_needed,
> +    .post_load = cpu_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> +        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
> +
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  const VMStateDescription vmstate_riscv_cpu = {
>      .name = "cpu",
>      .version_id = 3,
> @@ -218,6 +247,7 @@ const VMStateDescription vmstate_riscv_cpu = {
>          &vmstate_hyper,
>          &vmstate_vector,
>          &vmstate_pointermasking,
> +        &vmstate_kvmtimer,
>          NULL
>      }
>  };
> --
> 2.19.1
>
>

