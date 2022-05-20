From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 May 2022 13:55:54 +0200
Subject: [GIT PULL] KVM/riscv changes for 5.19
In-Reply-To: <CAAhSdy1DUJa=5YxbV_u0B=NLaTJrW03PbLxegJ2oCWDeWqy=zw@mail.gmail.com>
References: <CAAhSdy1DUJa=5YxbV_u0B=NLaTJrW03PbLxegJ2oCWDeWqy=zw@mail.gmail.com>
Message-ID: <d3ceed31-9dd5-ed7b-92e8-fc3a5fd406fa@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/20/22 06:48, Anup Patel wrote:
> Hi Paolo,
> 
> We have following KVM RISC-V changes for 5.19:
> 1) Added Sv57x4 support for G-stage page table
> 2) Added range based local HFENCE functions
> 3) Added remote HFENCE functions based on VCPU requests
> 4) Added ISA extension registers in ONE_REG interface
> 5) Updated KVM RISC-V maintainers entry to cover selftests support
> 
> I don't expect any other KVM RISC-V changes for 5.19.
> 
> Please pull.
> 
> Regards,
> Anup
> 
> The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:
> 
>    Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/kvm-riscv/linux.git tags/kvm-riscv-5.19-1
> 
> for you to fetch changes up to fed9b26b2501ea0ce41ae3a788bcc498440589c6:
> 
>    MAINTAINERS: Update KVM RISC-V entry to cover selftests support
> (2022-05-20 09:09:23 +0530)
> 
> ----------------------------------------------------------------
> KVM/riscv changes for 5.19
> 
> - Added Sv57x4 support for G-stage page table
> - Added range based local HFENCE functions
> - Added remote HFENCE functions based on VCPU requests
> - Added ISA extension registers in ONE_REG interface
> - Updated KVM RISC-V maintainers entry to cover selftests support
> 
> ----------------------------------------------------------------
> Anup Patel (9):
>        KVM: selftests: riscv: Improve unexpected guest trap handling
>        RISC-V: KVM: Use G-stage name for hypervisor page table
>        RISC-V: KVM: Add Sv57x4 mode support for G-stage
>        RISC-V: KVM: Treat SBI HFENCE calls as NOPs
>        RISC-V: KVM: Introduce range based local HFENCE functions
>        RISC-V: KVM: Reduce KVM_MAX_VCPUS value
>        RISC-V: KVM: Add remote HFENCE functions based on VCPU requests
>        RISC-V: KVM: Cleanup stale TLB entries when host CPU changes
>        MAINTAINERS: Update KVM RISC-V entry to cover selftests support
> 
> Atish Patra (1):
>        RISC-V: KVM: Introduce ISA extension register
> 
> Jiapeng Chong (1):
>        KVM: selftests: riscv: Remove unneeded semicolon
> 
>   MAINTAINERS                                        |   2 +
>   arch/riscv/include/asm/csr.h                       |   1 +
>   arch/riscv/include/asm/kvm_host.h                  | 124 +++++-
>   arch/riscv/include/uapi/asm/kvm.h                  |  20 +
>   arch/riscv/kvm/main.c                              |  11 +-
>   arch/riscv/kvm/mmu.c                               | 264 ++++++------
>   arch/riscv/kvm/tlb.S                               |  74 ----
>   arch/riscv/kvm/tlb.c                               | 461 +++++++++++++++++++++
>   arch/riscv/kvm/vcpu.c                              | 144 ++++++-
>   arch/riscv/kvm/vcpu_exit.c                         |   6 +-
>   arch/riscv/kvm/vcpu_sbi_replace.c                  |  40 +-
>   arch/riscv/kvm/vcpu_sbi_v01.c                      |  35 +-
>   arch/riscv/kvm/vm.c                                |   8 +-
>   arch/riscv/kvm/vmid.c                              |  30 +-
>   .../selftests/kvm/include/riscv/processor.h        |   8 +-
>   tools/testing/selftests/kvm/lib/riscv/processor.c  |  11 +-
>   tools/testing/selftests/kvm/lib/riscv/ucall.c      |  31 +-
>   17 files changed, 965 insertions(+), 305 deletions(-)
>   delete mode 100644 arch/riscv/kvm/tlb.S
>   create mode 100644 arch/riscv/kvm/tlb.c
> 

Pulled, thanks.

Paolo


