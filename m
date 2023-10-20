From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 12:51:31 +0530
Subject: [PATCH v3 0/9] RISC-V SBI debug console extension support
Message-ID: <20231020072140.900967-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
functions sbi_console_putchar() and sbi_console_getchar().
(Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)

This series adds support for SBI debug console (DBCN) extension in KVM RISC-V
and Linux RISC-V.

To try these patches with KVM RISC-V, use KVMTOOL from riscv_sbi_dbcn_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_sbi_dbcn_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased on Linux-6.6-rc5
 - Handled page-crossing in PATCH7 of v2 series
 - Addressed Drew's comment in PATCH3 of v2 series
 - Added new PATCH5 to make get-reg-list test aware of SBI DBCN extension

Changes since v1:
 - Remove use of #ifdef from PATCH4 and PATCH5 of the v1 series
 - Improved commit description of PATCH3 in v1 series
 - Introduced new PATCH3 in this series to allow some SBI extensions
   (such as SBI DBCN) do to disabled by default so that older KVM user space
   work fine and newer KVM user space have to explicitly opt-in for emulating
   SBI DBCN.
 - Introduced new PATCH5 in this series which adds inline version of
   sbi_console_getchar() and sbi_console_putchar() for the case where
   CONFIG_RISCV_SBI_V01 is disabled.

Anup Patel (8):
  RISC-V: Add defines for SBI debug console extension
  RISC-V: KVM: Change the SBI specification version to v2.0
  RISC-V: KVM: Allow some SBI extensions to be disabled by default
  RISC-V: KVM: Forward SBI DBCN extension to user-space
  KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
  RISC-V: Add stubs for sbi_console_putchar/getchar()
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig                  |  1 +
 arch/riscv/configs/rv32_defconfig             |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  7 +-
 arch/riscv/include/asm/sbi.h                  | 12 +++
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kvm/vcpu.c                         |  6 ++
 arch/riscv/kvm/vcpu_sbi.c                     | 61 +++++++-------
 arch/riscv/kvm/vcpu_sbi_replace.c             | 32 ++++++++
 drivers/tty/hvc/Kconfig                       |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c               | 82 +++++++++++++++++--
 drivers/tty/serial/Kconfig                    |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c       | 32 +++++++-
 .../selftests/kvm/riscv/get-reg-list.c        |  2 +
 13 files changed, 198 insertions(+), 43 deletions(-)

-- 
2.34.1


