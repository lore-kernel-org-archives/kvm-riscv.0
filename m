From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 29 Jul 2022 16:14:31 +0200
Subject: [GIT PULL] KVM/riscv changes for 5.20
In-Reply-To: <CAAhSdy2iH-WpitweQ_nCYm6p0S5S_fmQ3x37FdAe7tEmu_np0A@mail.gmail.com>
References: <CAAhSdy2iH-WpitweQ_nCYm6p0S5S_fmQ3x37FdAe7tEmu_np0A@mail.gmail.com>
Message-ID: <59b295a4-9a09-12a6-cf72-d5f0d4b20d7f@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 7/29/22 14:31, Anup Patel wrote:
> Hi Paolo,
> 
> We have following KVM RISC-V changes for 5.20:
> 1) Track ISA extensions used by Guest using bitmap
> 2) Added system instruction emulation framework
> 3) Added CSR emulation framework
> 4) Added gfp_custom flag in struct kvm_mmu_memory_cache
> 5) Added G-stage ioremap() and iounmap() functions
> 6) Added support for Svpbmt inside Guest
> 
> Please pull.
> 
> Regards,
> Anup
> 
> The following changes since commit e0dccc3b76fb35bb257b4118367a883073d7390e:
> 
>    Linux 5.19-rc8 (2022-07-24 13:26:27 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.20-1
> 
> for you to fetch changes up to 6bb2e00ea304ffc0446f345c46fe22713ce43cbf:
> 
>    RISC-V: KVM: Add support for Svpbmt inside Guest/VM (2022-07-29
> 17:15:18 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv changes for 5.20
> 
> - Track ISA extensions used by Guest using bitmap
> - Added system instruction emulation framework
> - Added CSR emulation framework
> - Added gfp_custom flag in struct kvm_mmu_memory_cache
> - Added G-stage ioremap() and iounmap() functions
> - Added support for Svpbmt inside Guest
> 
> ----------------------------------------------------------------
> Anup Patel (7):
>        RISC-V: KVM: Factor-out instruction emulation into separate sources
>        RISC-V: KVM: Add extensible system instruction emulation framework
>        RISC-V: KVM: Add extensible CSR emulation framework
>        KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
>        RISC-V: KVM: Add G-stage ioremap() and iounmap() functions
>        RISC-V: KVM: Use PAGE_KERNEL_IO in kvm_riscv_gstage_ioremap()
>        RISC-V: KVM: Add support for Svpbmt inside Guest/VM
> 
> Atish Patra (1):
>        RISC-V: KVM: Improve ISA extension by using a bitmap
> 
> Nikolay Borisov (2):
>        RISC-V: KVM: Make kvm_riscv_guest_timer_init a void function
>        RISC-V: KVM: move preempt_disable() call in kvm_arch_vcpu_ioctl_run
> 
> Zhang Jiaming (1):
>        RISC-V: KVM: Fix variable spelling mistake
> 
>   arch/riscv/include/asm/csr.h            |  16 +
>   arch/riscv/include/asm/kvm_host.h       |  24 +-
>   arch/riscv/include/asm/kvm_vcpu_fp.h    |   8 +-
>   arch/riscv/include/asm/kvm_vcpu_insn.h  |  48 ++
>   arch/riscv/include/asm/kvm_vcpu_timer.h |   2 +-
>   arch/riscv/include/uapi/asm/kvm.h       |   1 +
>   arch/riscv/kvm/Makefile                 |   1 +
>   arch/riscv/kvm/mmu.c                    |  28 +-
>   arch/riscv/kvm/vcpu.c                   | 203 ++++++---
>   arch/riscv/kvm/vcpu_exit.c              | 496 +--------------------
>   arch/riscv/kvm/vcpu_fp.c                |  27 +-
>   arch/riscv/kvm/vcpu_insn.c              | 752 ++++++++++++++++++++++++++++++++
>   arch/riscv/kvm/vcpu_timer.c             |   4 +-
>   arch/riscv/kvm/vm.c                     |   4 +-
>   include/linux/kvm_types.h               |   1 +
>   include/uapi/linux/kvm.h                |   8 +
>   virt/kvm/kvm_main.c                     |   4 +-
>   17 files changed, 1028 insertions(+), 599 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_vcpu_insn.h
>   create mode 100644 arch/riscv/kvm/vcpu_insn.c
> 

Pulled, thanks.  Because it's Friday and the pull brought in all the new 
x86 RETbleed stuff, it may be a couple days before I finish retesting 
and do push it out to kvm.git.

Paolo


