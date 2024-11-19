From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Nov 2024 12:29:48 -0800
Subject: [PATCH 0/8] Add SBI v3.0 PMU enhancements
Message-ID: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SBI v3.0 specification[1] added two new improvements to the PMU chaper.

1. Added an additional get_event_info function to query event availablity
in bulk instead of individual SBI calls for each event. This helps in
improving the boot time.

2. Raw event width allowed by the platform is widened to have 56 bits
with RAW event v2 as per new clarification in the priv ISA[2].

Apart from implementing these new features, this series adds a fix
in firmware event mapping and updates the kvm SBI implementation to
SBI v3.0.

The opensbi patches can be found at [3]. This series can be found at [4].

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/vv3.0-rc2/riscv-sbi.pdf
[2] https://github.com/riscv/riscv-isa-manual/issues/1578
[3] https://github.com/atishp04/opensbi/tree/b4/pmu_event_info
[4] https://github.com/atishp04/linux/tree/b4/pmu_event_info

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (8):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Fix Platform firmware event data
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  12 +++
 arch/riscv/kvm/vcpu_pmu.c             |  71 +++++++++++++
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 drivers/perf/riscv_pmu_sbi.c          | 184 +++++++++++++++++++++++++---------
 include/linux/perf/riscv_pmu.h        |   2 +
 7 files changed, 228 insertions(+), 49 deletions(-)
---
base-commit: acb481ddd977ab669128bab61024d05e7dc1654f
change-id: 20241018-pmu_event_info-986e21ce6bd3
--
Regards,
Atish patra


