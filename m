From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 3 Oct 2022 21:34:12 +0200
Subject: [GIT PULL] KVM/riscv changes for 6.1
In-Reply-To: <CAAhSdy134Ve1mbeK+TNRx-pWpQ=nVzNLptDcUyPaDU4v18Qyaw@mail.gmail.com>
References: <CAAhSdy134Ve1mbeK+TNRx-pWpQ=nVzNLptDcUyPaDU4v18Qyaw@mail.gmail.com>
Message-ID: <CABgObfZ08HQMqPVGRa8_viSzWKWizQGU3K_9u20FBUToEjQR5A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pulled, thanks!

On Sun, Oct 2, 2022 at 7:46 AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.1:
> 1) Improved instruction encoding infrastructure for
>     instructions not yet supported by binutils
> 2) Svinval support for both KVM Host and KVM Guest
> 3) Zihintpause support for KVM Guest
> 4) Zicbom support for KVM Guest
> 5) Record number of signal exits as a VCPU stat
> 6) Use generic guest entry infrastructure
>
> Please pull.
>
> Regards,
> Anup
>
> The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:
>
>   Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.1-1
>
> for you to fetch changes up to b60ca69715fcc39a5f4bdd56ca2ea691b7358455:
>
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK (2022-10-02 10:19:31 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.1
>
> - Improved instruction encoding infrastructure for
>   instructions not yet supported by binutils
> - Svinval support for both KVM Host and KVM Guest
> - Zihintpause support for KVM Guest
> - Zicbom support for KVM Guest
> - Record number of signal exits as a VCPU stat
> - Use generic guest entry infrastructure
>
> ----------------------------------------------------------------
> Andrew Jones (7):
>       riscv: Add X register names to gpr-nums
>       riscv: Introduce support for defining instructions
>       riscv: KVM: Apply insn-def to hfence encodings
>       riscv: KVM: Apply insn-def to hlv encodings
>       RISC-V: KVM: Make ISA ext mappings explicit
>       RISC-V: KVM: Provide UAPI for Zicbom block size
>       RISC-V: KVM: Expose Zicbom to the guest
>
> Anup Patel (3):
>       RISC-V: KVM: Change the SBI specification version to v1.0
>       RISC-V: KVM: Use Svinval for local TLB maintenance when available
>       RISC-V: KVM: Allow Guest use Svinval extension
>
> Jisheng Zhang (3):
>       RISC-V: KVM: Record number of signal exits as a vCPU stat
>       RISC-V: KVM: Use generic guest entry infrastructure
>       riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>
> Mayuresh Chitale (2):
>       RISC-V: Probe Svinval extension form ISA string
>       RISC-V: KVM: Allow Guest use Zihintpause extension
>
> Xiu Jianfeng (1):
>       RISC-V: KVM: add __init annotation to riscv_kvm_init()
>
>  arch/riscv/Kconfig                    |   4 +
>  arch/riscv/include/asm/gpr-num.h      |   8 ++
>  arch/riscv/include/asm/hwcap.h        |   4 +
>  arch/riscv/include/asm/insn-def.h     | 137 ++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/kvm_host.h     |   1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |   4 +-
>  arch/riscv/include/uapi/asm/kvm.h     |   4 +
>  arch/riscv/kernel/cpu.c               |   1 +
>  arch/riscv/kernel/cpufeature.c        |   1 +
>  arch/riscv/kvm/Kconfig                |   1 +
>  arch/riscv/kvm/main.c                 |   2 +-
>  arch/riscv/kvm/tlb.c                  | 155 +++++++++++-----------------------
>  arch/riscv/kvm/vcpu.c                 |  60 ++++++++-----
>  arch/riscv/kvm/vcpu_exit.c            |  39 ++-------
>  arch/riscv/mm/dma-noncoherent.c       |   2 +
>  15 files changed, 260 insertions(+), 163 deletions(-)
>  create mode 100644 arch/riscv/include/asm/insn-def.h
>

On Sun, Oct 2, 2022 at 7:46 AM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.1:
> 1) Improved instruction encoding infrastructure for
>     instructions not yet supported by binutils
> 2) Svinval support for both KVM Host and KVM Guest
> 3) Zihintpause support for KVM Guest
> 4) Zicbom support for KVM Guest
> 5) Record number of signal exits as a VCPU stat
> 6) Use generic guest entry infrastructure
>
> Please pull.
>
> Regards,
> Anup
>
> The following changes since commit f76349cf41451c5c42a99f18a9163377e4b364ff:
>
>   Linux 6.0-rc7 (2022-09-25 14:01:02 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.1-1
>
> for you to fetch changes up to b60ca69715fcc39a5f4bdd56ca2ea691b7358455:
>
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK (2022-10-02 10:19:31 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.1
>
> - Improved instruction encoding infrastructure for
>   instructions not yet supported by binutils
> - Svinval support for both KVM Host and KVM Guest
> - Zihintpause support for KVM Guest
> - Zicbom support for KVM Guest
> - Record number of signal exits as a VCPU stat
> - Use generic guest entry infrastructure
>
> ----------------------------------------------------------------
> Andrew Jones (7):
>       riscv: Add X register names to gpr-nums
>       riscv: Introduce support for defining instructions
>       riscv: KVM: Apply insn-def to hfence encodings
>       riscv: KVM: Apply insn-def to hlv encodings
>       RISC-V: KVM: Make ISA ext mappings explicit
>       RISC-V: KVM: Provide UAPI for Zicbom block size
>       RISC-V: KVM: Expose Zicbom to the guest
>
> Anup Patel (3):
>       RISC-V: KVM: Change the SBI specification version to v1.0
>       RISC-V: KVM: Use Svinval for local TLB maintenance when available
>       RISC-V: KVM: Allow Guest use Svinval extension
>
> Jisheng Zhang (3):
>       RISC-V: KVM: Record number of signal exits as a vCPU stat
>       RISC-V: KVM: Use generic guest entry infrastructure
>       riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
>
> Mayuresh Chitale (2):
>       RISC-V: Probe Svinval extension form ISA string
>       RISC-V: KVM: Allow Guest use Zihintpause extension
>
> Xiu Jianfeng (1):
>       RISC-V: KVM: add __init annotation to riscv_kvm_init()
>
>  arch/riscv/Kconfig                    |   4 +
>  arch/riscv/include/asm/gpr-num.h      |   8 ++
>  arch/riscv/include/asm/hwcap.h        |   4 +
>  arch/riscv/include/asm/insn-def.h     | 137 ++++++++++++++++++++++++++++++
>  arch/riscv/include/asm/kvm_host.h     |   1 +
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |   4 +-
>  arch/riscv/include/uapi/asm/kvm.h     |   4 +
>  arch/riscv/kernel/cpu.c               |   1 +
>  arch/riscv/kernel/cpufeature.c        |   1 +
>  arch/riscv/kvm/Kconfig                |   1 +
>  arch/riscv/kvm/main.c                 |   2 +-
>  arch/riscv/kvm/tlb.c                  | 155 +++++++++++-----------------------
>  arch/riscv/kvm/vcpu.c                 |  60 ++++++++-----
>  arch/riscv/kvm/vcpu_exit.c            |  39 ++-------
>  arch/riscv/mm/dma-noncoherent.c       |   2 +
>  15 files changed, 260 insertions(+), 163 deletions(-)
>  create mode 100644 arch/riscv/include/asm/insn-def.h
>


