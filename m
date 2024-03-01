From: Anup Patel <anup@brainfault.org>
Date: Fri, 1 Mar 2024 22:10:25 +0530
Subject: [PATCH 0/5] KVM RISC-V report few more ISA extensions through ONE_REG
In-Reply-To: <20240214123757.305347-1-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy3ObzJHgF0QL9QqKVm37F83HzdF28A5107fm0dLFxoOLQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 14, 2024 at 6:08?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series extends the KVM RISC-V ONE_REG interface to report few more
> ISA extensions namely: Ztso and Zacas. These extensions are already
> supported by the HWPROBE interface in Linux-6.8 kernel.
>
> To test these patches, use KVMTOOL from the riscv_more_exts_round2_v1
> branch at: https://github.com/avpatel/kvmtool.git
>
> These patches can also be found in the riscv_kvm_more_exts_round2_v1
> branch at: https://github.com/avpatel/linux.git
>
> Anup Patel (5):
>   RISC-V: KVM: Forward SEED CSR access to user space
>   RISC-V: KVM: Allow Ztso extension for Guest/VM
>   KVM: riscv: selftests: Add Ztso extension to get-reg-list test
>   RISC-V: KVM: Allow Zacas extension for Guest/VM
>   KVM: riscv: selftests: Add Zacas extension to get-reg-list test

Queued this series for Linux-6.9

Thanks,
Anup

>
>  arch/riscv/include/uapi/asm/kvm.h                |  2 ++
>  arch/riscv/kvm/vcpu_insn.c                       | 13 +++++++++++++
>  arch/riscv/kvm/vcpu_onereg.c                     |  4 ++++
>  tools/testing/selftests/kvm/riscv/get-reg-list.c |  8 ++++++++
>  4 files changed, 27 insertions(+)
>
> --
> 2.34.1
>

