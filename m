From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Aug 2024 00:08:08 -0700
Subject: [PATCH 1/2] RISC-V: KVM: Allow legacy PMU access from guest
In-Reply-To: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
References: <20240816-kvm_pmu_fixes-v1-0-cdfce386dd93@rivosinc.com>
Message-ID: <20240816-kvm_pmu_fixes-v1-1-cdfce386dd93@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, KVM traps & emulates PMU counter access only if SBI PMU
is available as the guest can only configure/read PMU counters via
SBI only. However, if SBI PMU is not enabled in the host, the
guest will fallback to the legacy PMU which will try to access
cycle/instret and result in an illegal instruction trap which
is not desired.

KVM can allow dummy emulation of cycle/instret only for the guest
if SBI PMU is not enabled in the host. The dummy emulation will
still return zero as we don't to expose the host counter values
from a guest using legacy PMU.

Fixes: a9ac6c37521f ("RISC-V: KVM: Implement trap & emulate for hpmcounters")

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_pmu.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_pmu.h b/arch/riscv/include/asm/kvm_vcpu_pmu.h
index fa0f535bbbf0..c309daa2d75a 100644
--- a/arch/riscv/include/asm/kvm_vcpu_pmu.h
+++ b/arch/riscv/include/asm/kvm_vcpu_pmu.h
@@ -10,6 +10,7 @@
 #define __KVM_VCPU_RISCV_PMU_H
 
 #include <linux/perf/riscv_pmu.h>
+#include <asm/kvm_vcpu_insn.h>
 #include <asm/sbi.h>
 
 #ifdef CONFIG_RISCV_PMU_SBI
@@ -104,8 +105,20 @@ void kvm_riscv_vcpu_pmu_reset(struct kvm_vcpu *vcpu);
 struct kvm_pmu {
 };
 
+static inline int kvm_riscv_vcpu_pmu_read_legacy(struct kvm_vcpu *vcpu, unsigned int csr_num,
+						 unsigned long *val, unsigned long new_val,
+						 unsigned long wr_mask)
+{
+	if (csr_num == CSR_CYCLE || csr_num == CSR_INSTRET) {
+		*val = 0;
+		return KVM_INSN_CONTINUE_NEXT_SEPC;
+	} else {
+		return KVM_INSN_ILLEGAL_TRAP;
+	}
+}
+
 #define KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS \
-{.base = 0,	.count = 0,	.func = NULL },
+{.base = CSR_CYCLE,	.count = 3,	.func = kvm_riscv_vcpu_pmu_read_legacy },
 
 static inline void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu) {}
 static inline int kvm_riscv_vcpu_pmu_incr_fw(struct kvm_vcpu *vcpu, unsigned long fid)

-- 
2.34.1


