From: Anup Patel <anup@brainfault.org>
Date: Sun, 26 Jul 2020 18:28:57 +0530
Subject: [RFC 2/2] RISC-V: KVM: read\write kernel mmio device support
In-Reply-To: <20200724085441.1514-3-jiangyifei@huawei.com>
References: <20200724085441.1514-1-jiangyifei@huawei.com>
 <20200724085441.1514-3-jiangyifei@huawei.com>
Message-ID: <CAAhSdy18+3ub9Lw+2v0WEujYkFJ2yU0x=GqZ+PQGe2DrWCR8Bg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change subject to:
RISC-V: KVM: kernel mmio read/write support

Also add 1-2 sentences of commit description.

On Fri, Jul 24, 2020 at 2:25 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> ---
>  arch/riscv/kvm/vcpu_exit.c | 38 ++++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index e97ba96cb0ae..448f11179fa8 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -191,6 +191,8 @@ static int virtual_inst_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  static int emulate_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                         unsigned long fault_addr, unsigned long htinst)
>  {
> +       int ret;
> +       u8 data_buf[8];
>         unsigned long insn;
>         int shift = 0, len = 0;
>         struct kvm_cpu_trap utrap = { 0 };
> @@ -272,19 +274,32 @@ static int emulate_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>         vcpu->arch.mmio_decode.len = len;
>         vcpu->arch.mmio_decode.return_handled = 0;
>
> -       /* Exit to userspace for MMIO emulation */
> -       vcpu->stat.mmio_exit_user++;
> -       run->exit_reason = KVM_EXIT_MMIO;
> +       ret = kvm_io_bus_read(vcpu, KVM_MMIO_BUS, fault_addr, len,
> +                                                 data_buf);
> +
>         run->mmio.is_write = false;
>         run->mmio.phys_addr = fault_addr;
>         run->mmio.len = len;
>
> +       if (!ret) {
> +               /* We handled the access successfully in the kernel. */
> +               memcpy(run->mmio.data, data_buf, len);
> +               vcpu->stat.mmio_exit_kernel++;
> +               kvm_riscv_vcpu_mmio_return(vcpu, run);
> +               return 1;
> +       }
> +
> +       /* Exit to userspace for MMIO emulation */
> +       vcpu->stat.mmio_exit_user++;
> +       run->exit_reason = KVM_EXIT_MMIO;
> +
>         return 0;
>  }
>
>  static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                          unsigned long fault_addr, unsigned long htinst)
>  {
> +       int ret;
>         u8 data8;
>         u16 data16;
>         u32 data32;
> @@ -378,13 +393,24 @@ static int emulate_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>                 return -ENOTSUPP;
>         };
>
> -       /* Exit to userspace for MMIO emulation */
> -       vcpu->stat.mmio_exit_user++;
> -       run->exit_reason = KVM_EXIT_MMIO;
> +       ret = kvm_io_bus_write(vcpu, KVM_MMIO_BUS, fault_addr, len,
> +                                                  run->mmio.data);
> +
>         run->mmio.is_write = true;
>         run->mmio.phys_addr = fault_addr;
>         run->mmio.len = len;
>
> +       if (!ret) {
> +               /* We handled the access successfully in the kernel. */
> +               vcpu->stat.mmio_exit_kernel++;
> +               kvm_riscv_vcpu_mmio_return(vcpu, run);
> +               return 1;
> +       }
> +
> +       /* Exit to userspace for MMIO emulation */
> +       vcpu->stat.mmio_exit_user++;
> +       run->exit_reason = KVM_EXIT_MMIO;
> +
>         return 0;
>  }
>
> --
> 2.19.1
>
>

Regards,
Anup

