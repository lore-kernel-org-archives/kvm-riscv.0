From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 17 Apr 2023 12:33:48 +0200
Subject: [RFC PATCH 00/14] RISC-V: Add steal-time support
Message-ID: <20230417103402.798596-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

One frequently touted benefit of virtualization is the ability to
consolidate machines, increasing resource utilization.  It may even be
desirable to overcommit, at the risk of one or more VCPUs having to wait.
Hypervisors which have interfaces for guests to retrieve the amount of
time each VCPU had to wait give observers within the guests ways to
account for less progress than would otherwise be expected. The SBI STA
extension proposal[1] provides a standard interface for guest VCPUs to
retrieve the amount of time "stolen".

This series has three parts:
 1) Patches 01-04 - Add paravirt support to RISC-V and implement
                    steal-time accounting support using the SBI STA
                    extension.
 2) Patches 05-10 - Implement SBI STA in KVM so KVM guests, such as
                    Linux guests which enable the paravirt steal-time
                    support, can be enlightened about stolen time.
 3) Patches 11-12 - Add support to the KVM selftests steal_time test
                    for RISC-V.

Note, while we can review and revise this series now, we'll keep the
RFC tag and refrain from merging it until the proposed SBI extension
has been ratified.

[1] https://lists.riscv.org/g/tech-prs/message/401

This patches are also available here
https://github.com/jones-drew/linux/commits/kvm/steal-time-rfc-v1

Thanks,
drew

Andrew Jones (14):
  RISC-V: paravirt: Add skeleton for pv-time support
  RISC-V: Add SBI STA extension definitions
  RISC-V: paravirt: Implement steal-time support
  RISC-V: paravirt: Add kconfigs
  RISC-V: KVM: Add SBI STA extension skeleton
  RISC-V: KVM: Add steal-update vcpu request
  RISC-V: KVM: Add SBI STA info to vcpu_arch
  RISC-V: KVM: Implement SBI STA extension
  RISC-V: KVM: Add support for SBI extension registers
  RISC-V: KVM: Add support for SBI STA registers
  KVM: selftests: riscv: Move sbi_ecall to processor.c
  KVM: selftests: riscv: Add guest_sbi_probe_extension
  KVM: selftests: riscv: Add RISCV_SBI_EXT_REG
  KVM: selftests: riscv: Add steal_time test support

 .../admin-guide/kernel-parameters.txt         |   6 +-
 arch/riscv/Kconfig                            |  19 ++
 arch/riscv/include/asm/kvm_host.h             |   9 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |   5 +
 arch/riscv/include/asm/paravirt.h             |  29 +++
 arch/riscv/include/asm/paravirt_api_clock.h   |   1 +
 arch/riscv/include/asm/sbi.h                  |  15 ++
 arch/riscv/include/uapi/asm/kvm.h             |  14 ++
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/paravirt.c                  | 127 +++++++++++
 arch/riscv/kernel/time.c                      |   3 +
 arch/riscv/kvm/Kconfig                        |   1 +
 arch/riscv/kvm/Makefile                       |   1 +
 arch/riscv/kvm/vcpu.c                         |  74 +++++++
 arch/riscv/kvm/vcpu_sbi.c                     |   4 +
 arch/riscv/kvm/vcpu_sbi_sta.c                 | 199 ++++++++++++++++++
 tools/testing/selftests/kvm/Makefile          |   3 +-
 .../selftests/kvm/include/riscv/processor.h   |  40 +++-
 .../selftests/kvm/lib/riscv/processor.c       |  45 ++++
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  26 ---
 tools/testing/selftests/kvm/steal_time.c      | 100 +++++++++
 21 files changed, 685 insertions(+), 37 deletions(-)
 create mode 100644 arch/riscv/include/asm/paravirt.h
 create mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 create mode 100644 arch/riscv/kernel/paravirt.c
 create mode 100644 arch/riscv/kvm/vcpu_sbi_sta.c

-- 
2.39.2


