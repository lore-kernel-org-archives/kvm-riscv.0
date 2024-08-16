From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Aug 2024 00:08:07 -0700
Subject: [PATCH 0/2] Fixes for KVM PMU trap/emulation
Message-ID: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series contains two small fixes to improve the KVM PMU trap/emulation
code. The issue can be observed if SBI PMU is disabled or forced the kvm
to use hpmcounter31.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (2):
      RISC-V: KVM: Allow legacy PMU access from guest
      RISC-V: KVM: Fix to allow hpmcounter31 from the guest

 arch/riscv/include/asm/kvm_vcpu_pmu.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240729-kvm_pmu_fixes-26754d2a077d
--
Regards,
Atish patra


