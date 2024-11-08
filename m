From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 8 Nov 2024 18:15:19 +0100
Subject: [GIT PULL] KVM/riscv changes for 6.13
In-Reply-To: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
References: <CAAhSdy1iTNc5QG34ceebMzA137-pNGzTva33VQ83j-yMoaw8Fg@mail.gmail.com>
Message-ID: <626d3780-73bd-496b-9503-e09bfb293bb0@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/8/24 12:37, Anup Patel wrote:
> Hi Paolo,
> 
> We have the following KVM RISC-V changes for 6.13:
> 1) Accelerate KVM RISC-V when running as a guest
> 2) Perf support to collect KVM guest statistics from host side
> 
> In addition, the pointer masking support (Ssnpm and
> Smnpm) for KVM guest is going through the RISC-V tree.
> 
> I also have Svade and Svadu support for host and guest
> in my queue which I will send in the second week of the
> merge window to avoid conflict with the RISC-V tree.
> 
> Please pull.

Pulled, thanks.

Paolo

> Regards,
> Anup
> 
> The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:
> 
>    Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.13-1
> 
> for you to fetch changes up to 332fa4a802b16ccb727199da685294f85f9880cb:
> 
>    riscv: kvm: Fix out-of-bounds array access (2024-11-05 13:27:32 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv changes for 6.13
> 
> - Accelerate KVM RISC-V when running as a guest
> - Perf support to collect KVM guest statistics from host side
> 
> ----------------------------------------------------------------
> Anup Patel (13):
>        RISC-V: KVM: Order the object files alphabetically
>        RISC-V: KVM: Save/restore HSTATUS in C source
>        RISC-V: KVM: Save/restore SCOUNTEREN in C source
>        RISC-V: KVM: Break down the __kvm_riscv_switch_to() into macros
>        RISC-V: KVM: Replace aia_set_hvictl() with aia_hvictl_value()
>        RISC-V: KVM: Don't setup SGEI for zero guest external interrupts
>        RISC-V: Add defines for the SBI nested acceleration extension
>        RISC-V: KVM: Add common nested acceleration support
>        RISC-V: KVM: Use nacl_csr_xyz() for accessing H-extension CSRs
>        RISC-V: KVM: Use nacl_csr_xyz() for accessing AIA CSRs
>        RISC-V: KVM: Use SBI sync SRET call when available
>        RISC-V: KVM: Save trap CSRs in kvm_riscv_vcpu_enter_exit()
>        RISC-V: KVM: Use NACL HFENCEs for KVM request based HFENCEs
> 
> Bj?rn T?pel (1):
>        riscv: kvm: Fix out-of-bounds array access
> 
> Quan Zhou (2):
>        riscv: perf: add guest vs host distinction
>        riscv: KVM: add basic support for host vs guest profiling
> 
> Yong-Xuan Wang (1):
>        RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
> 
>   arch/riscv/include/asm/kvm_host.h   |  10 ++
>   arch/riscv/include/asm/kvm_nacl.h   | 245 ++++++++++++++++++++++++++++++++++++
>   arch/riscv/include/asm/perf_event.h |   6 +
>   arch/riscv/include/asm/sbi.h        | 120 ++++++++++++++++++
>   arch/riscv/kernel/perf_callchain.c  |  38 ++++++
>   arch/riscv/kvm/Kconfig              |   1 +
>   arch/riscv/kvm/Makefile             |  27 ++--
>   arch/riscv/kvm/aia.c                | 114 +++++++++++------
>   arch/riscv/kvm/aia_aplic.c          |   3 +-
>   arch/riscv/kvm/main.c               |  63 +++++++++-
>   arch/riscv/kvm/mmu.c                |   4 +-
>   arch/riscv/kvm/nacl.c               | 152 ++++++++++++++++++++++
>   arch/riscv/kvm/tlb.c                |  57 ++++++---
>   arch/riscv/kvm/vcpu.c               | 191 +++++++++++++++++++++-------
>   arch/riscv/kvm/vcpu_sbi.c           |  11 +-
>   arch/riscv/kvm/vcpu_switch.S        | 137 ++++++++++++--------
>   arch/riscv/kvm/vcpu_timer.c         |  28 ++---
>   17 files changed, 1022 insertions(+), 185 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_nacl.h
>   create mode 100644 arch/riscv/kvm/nacl.c
> 


