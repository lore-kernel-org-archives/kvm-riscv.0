From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Jul 2023 09:24:12 +0530
Subject: [PATCH 0/7] KVM RISC-V ONE_REG ISA extension improvements
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy048rUYUj2j+rutCc73=aE0dKgCrt75ohz9tO476+n6Gg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 9:41?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> This series improves the ISA extension ONE_REG interface in following ways:
> 1) Move ONE_REG related code to dedicated source file
> 2) Allow multiple ISA extensions to be enabled/disabled in one ioctl
> 3) Add more ISA extensions to the ONE_REG interface
>
> The series has following dependencies:
> 1) PATCH6 depends on
> https://lore.kernel.org/linux-riscv/20230712084134.1648008-1-sameo at rivosinc.com/
> 2) PATCH7 depends on
> https://lore.kernel.org/linux-riscv/20230711153743.1970625-1-heiko at sntech.de/
>
> The PATCH1 to PATCH5 of this series don't depend on any patches.
>
> These patches can also be found in the riscv_kvm_onereg_imp_v1 branch at:
> https://github.com/avpatel/linux.git
>
> Anup Patel (7):
>   RISC-V: KVM: Factor-out ONE_REG related code to its own source file
>   RISC-V: KVM: Extend ONE_REG to enable/disable multiple ISA extensions
>   RISC-V: KVM: Allow Zba and Zbs extensions for Guest/VM
>   RISC-V: KVM: Allow Zicntr, Zicsr, Zifencei, and Zihpm for Guest/VM
>   RISC-V: KVM: Sort ISA extensions alphabetically in ONE_REG interface
>   RISC-V: KVM: Allow Zbc, Zbk* and Zk* extensions for Guest/VM
>   RISC-V: KVM: Allow Zvb* and Zvk* extensions for Guest/VM

I have queued PATCH1 to PATCH5 for Linux-6.6 so that other in-flight
patches can be rebased on the riscv_kvm_queue.

The PATCH6 and PATCH7 will have to wait until required dependencies
are merged in arch/riscv.

Thanks,
Anup


>
>  arch/riscv/include/asm/kvm_host.h |   6 +
>  arch/riscv/include/uapi/asm/kvm.h |  35 ++
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/vcpu.c             | 529 +----------------------
>  arch/riscv/kvm/vcpu_onereg.c      | 695 ++++++++++++++++++++++++++++++
>  5 files changed, 738 insertions(+), 528 deletions(-)
>  create mode 100644 arch/riscv/kvm/vcpu_onereg.c
>
> --
> 2.34.1
>

