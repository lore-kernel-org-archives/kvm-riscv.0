From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 22 Apr 2023 01:38:54 +0200
Subject: [GIT PULL] KVM/riscv changes for 6.4
In-Reply-To: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
References: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
Message-ID: <CABgObfbPB2NYwDLHnQSW0gtw0AX96KbeNOQsszw0NqytObyfaQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

while you did fix the bug that caused the mailing list date to
disappear, I noticed that these patches have been _applied_ (not just
rebased) earlier today, just a few hours before sending the pull
request.

The pull request was sent around midnight, Indian time, while the
patches were applied around 5-6pm. I  recognized that this is not a
rebase because the commit dates are grouped according to the topicsL

17:38:40 +0530 KVM: RISC-V: Retry fault if vma_lookup() results become invalid
17:38:42 +0530 RISC-V: KVM: Alphabetize selects
17:38:44 +0530 RISC-V: KVM: Add ONE_REG interface to enable/disable
SBI extensions
17:38:46 +0530 RISC-V: KVM: Allow Zbb extension for Guest/VM

17:45:39 +0530 RISC-V: Add AIA related CSR defines
17:45:42 +0530 RISC-V: Detect AIA CSRs from ISA string
17:45:44 +0530 RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
17:45:48 +0530 RISC-V: KVM: Initial skeletal support for AIA
17:45:51 +0530 RISC-V: KVM: Implement subtype for CSR ONE_REG interface
17:45:54 +0530 RISC-V: KVM: Add ONE_REG interface for AIA CSRs
17:45:58 +0530 RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask

18:10:27 2023 +0530 RISC-V: KVM: Virtualize per-HART AIA CSRs

What this means, is that there is no way that these patches have been
tested by anyone except you. Please try to push to the kvm-riscv/next
branch as soon as patches are ready, since that makes it easier to
spot conflicts between architectures.

In fact, since RISC-V is still pretty small, feel free to send me pull
requests even early in the development period, as soon as some patches
are ready.

Paolo

On Fri, Apr 21, 2023 at 7:34?PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Paolo,
>
> We have the following KVM RISC-V changes for 6.4:
> 1) ONE_REG interface to enable/disable SBI extensions
> 2) Zbb extension for Guest/VM
> 3) AIA CSR virtualization
> 4) Few minor cleanups and fixes
>
> Please pull.
>
> Please note that the Zicboz series has been taken by
> Palmer through the RISC-V tree which results in few
> minor conflicts in the following files:
> arch/riscv/include/asm/hwcap.h
> arch/riscv/include/uapi/asm/kvm.h
> arch/riscv/kernel/cpu.c
> arch/riscv/kernel/cpufeature.c
> arch/riscv/kvm/vcpu.c
>
> I am not sure if a shared tag can make things easy
> for you or Palmer.
>
> Regards,
> Anup
>
> The following changes since commit 6a8f57ae2eb07ab39a6f0ccad60c760743051026:
>
>   Linux 6.3-rc7 (2023-04-16 15:23:53 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/kvm-riscv/linux.git tags/kvm-riscv-6.4-1
>
> for you to fetch changes up to 2f4d58f7635aec014428e73ef6120c4d0377c430:
>
>   RISC-V: KVM: Virtualize per-HART AIA CSRs (2023-04-21 18:10:27 +0530)
>
> ----------------------------------------------------------------
> KVM/riscv changes for 6.4
>
> - ONE_REG interface to enable/disable SBI extensions
> - Zbb extension for Guest/VM
> - AIA CSR virtualization
>
> ----------------------------------------------------------------
> Andrew Jones (1):
>       RISC-V: KVM: Alphabetize selects
>
> Anup Patel (10):
>       RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions
>       RISC-V: KVM: Allow Zbb extension for Guest/VM
>       RISC-V: Add AIA related CSR defines
>       RISC-V: Detect AIA CSRs from ISA string
>       RISC-V: KVM: Drop the _MASK suffix from hgatp.VMID mask defines
>       RISC-V: KVM: Initial skeletal support for AIA
>       RISC-V: KVM: Implement subtype for CSR ONE_REG interface
>       RISC-V: KVM: Add ONE_REG interface for AIA CSRs
>       RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask
>       RISC-V: KVM: Virtualize per-HART AIA CSRs
>
> David Matlack (1):
>       KVM: RISC-V: Retry fault if vma_lookup() results become invalid
>
>  arch/riscv/include/asm/csr.h          | 107 +++++++++-
>  arch/riscv/include/asm/hwcap.h        |   8 +
>  arch/riscv/include/asm/kvm_aia.h      | 127 +++++++++++
>  arch/riscv/include/asm/kvm_host.h     |  14 +-
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
>  arch/riscv/include/uapi/asm/kvm.h     |  51 ++++-
>  arch/riscv/kernel/cpu.c               |   2 +
>  arch/riscv/kernel/cpufeature.c        |   2 +
>  arch/riscv/kvm/Kconfig                |  10 +-
>  arch/riscv/kvm/Makefile               |   1 +
>  arch/riscv/kvm/aia.c                  | 388 ++++++++++++++++++++++++++++++++++
>  arch/riscv/kvm/main.c                 |  22 +-
>  arch/riscv/kvm/mmu.c                  |  28 ++-
>  arch/riscv/kvm/vcpu.c                 | 194 +++++++++++++----
>  arch/riscv/kvm/vcpu_insn.c            |   1 +
>  arch/riscv/kvm/vcpu_sbi.c             | 247 ++++++++++++++++++++--
>  arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
>  arch/riscv/kvm/vm.c                   |   4 +
>  arch/riscv/kvm/vmid.c                 |   4 +-
>  19 files changed, 1129 insertions(+), 91 deletions(-)
>  create mode 100644 arch/riscv/include/asm/kvm_aia.h
>  create mode 100644 arch/riscv/kvm/aia.c
>


