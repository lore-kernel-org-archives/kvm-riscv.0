From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Jan 2022 09:06:46 +1000
Subject: [PATCH v4 05/12] target/riscv: Implement kvm_arch_put_registers
In-Reply-To: <20220110013831.1594-6-jiangyifei@huawei.com>
References: <20220110013831.1594-1-jiangyifei@huawei.com>
 <20220110013831.1594-6-jiangyifei@huawei.com>
Message-ID: <CAKmqyKPsSidxir_1fncugsmLK33aSbHk63MP0JnS3OJLvy65EA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 10, 2022 at 11:57 AM Yifei Jiang via <qemu-devel@nongnu.org> wrote:
>
> Put GPR CSR and FP registers to kvm by KVM_SET_ONE_REG ioctl
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> ---
>  target/riscv/kvm.c | 104 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 103 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
> index 6d4df0ef6d..e695b91dc7 100644
> --- a/target/riscv/kvm.c
> +++ b/target/riscv/kvm.c
> @@ -73,6 +73,14 @@ static uint64_t kvm_riscv_reg_id(CPURISCVState *env, uint64_t type, uint64_t idx
>          } \
>      } while(0)
>
> +#define KVM_RISCV_SET_CSR(cs, env, csr, reg) \
> +    do { \
> +        int ret = kvm_set_one_reg(cs, RISCV_CSR_REG(env, csr), &reg); \
> +        if (ret) { \
> +            return ret; \
> +        } \
> +    } while(0)

This fails checkpatch. I know there is lots of QEMU code like this,
but it probably should be `while (0)` to keep checkpatch happy.

Please run checkpatch on all the patches.

Alistair

