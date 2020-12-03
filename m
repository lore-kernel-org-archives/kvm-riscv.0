From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:18:39 +0800
Subject: [PATCH RFC 3/3] RISC-V: KVM: Implement guest time scaling
In-Reply-To: <20201203121839.308-1-jiangyifei@huawei.com>
References: <20201203121839.308-1-jiangyifei@huawei.com>
Message-ID: <20201203121839.308-4-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When time frequency needs to scale, RDTIME/RDTIMEH instruction in guest
doesn't work correctly. Because it still uses the host's time frequency.

To read correct time, the RDTIME/RDTIMEH instruction executed by guest
should trap to HS-mode. The TM bit of HCOUNTEREN CSR could control whether
these instructions are trapped to HS-mode. Therefore, we can implement guest
time scaling by setting TM bit in kvm_riscv_vcpu_timer_restore() and emulating
RDTIME/RDTIMEH instruction in system_opcode_insn().

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 arch/riscv/include/asm/csr.h            |  3 +++
 arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
 arch/riscv/kvm/vcpu_exit.c              | 35 +++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_timer.c             | 10 +++++++
 4 files changed, 49 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index bc825693e0e3..a4d8ca76cf1d 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -241,6 +241,9 @@
 #define IE_TIE		(_AC(0x1, UL) << RV_IRQ_TIMER)
 #define IE_EIE		(_AC(0x1, UL) << RV_IRQ_EXT)
 
+/* The counteren flag */
+#define CE_TM		1
+
 #ifndef __ASSEMBLY__
 
 #define csr_swap(csr, val)					\
diff --git a/arch/riscv/include/asm/kvm_vcpu_timer.h b/arch/riscv/include/asm/kvm_vcpu_timer.h
index 41b5503de9e4..61384eb57334 100644
--- a/arch/riscv/include/asm/kvm_vcpu_timer.h
+++ b/arch/riscv/include/asm/kvm_vcpu_timer.h
@@ -41,6 +41,7 @@ int kvm_riscv_vcpu_timer_deinit(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_timer_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu);
 int kvm_riscv_guest_timer_init(struct kvm *kvm);
+u64 kvm_riscv_read_guest_time(struct kvm_vcpu *vcpu);
 
 static inline bool kvm_riscv_need_scale(struct kvm_guest_timer *gt)
 {
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index f054406792a6..4beb9d25049a 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -18,6 +18,10 @@
 
 #define INSN_MASK_WFI		0xffffff00
 #define INSN_MATCH_WFI		0x10500000
+#define INSN_MASK_RDTIME	0xfff03000
+#define INSN_MATCH_RDTIME	0xc0102000
+#define INSN_MASK_RDTIMEH	0xfff03000
+#define INSN_MATCH_RDTIMEH	0xc8102000
 
 #define INSN_MATCH_LB		0x3
 #define INSN_MASK_LB		0x707f
@@ -138,6 +142,34 @@ static int truly_illegal_insn(struct kvm_vcpu *vcpu,
 	return 1;
 }
 
+static int system_opcode_insn_rdtime(struct kvm_vcpu *vcpu,
+				     struct kvm_run *run,
+				     ulong insn)
+{
+#ifdef CONFIG_64BIT
+	if ((insn & INSN_MASK_RDTIME) == INSN_MATCH_RDTIME) {
+		u64 guest_time = kvm_riscv_read_guest_time(vcpu);
+		SET_RD(insn, &vcpu->arch.guest_context, guest_time);
+		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+		return 1;
+	}
+#else
+	if ((insn & INSN_MASK_RDTIME) == INSN_MATCH_RDTIME) {
+		u64 guest_time = kvm_riscv_read_guest_time(vcpu);
+		SET_RD(insn, &vcpu->arch.guest_context, (u32)guest_time);
+		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+		return 1;
+	}
+	if ((insn & INSN_MASK_RDTIMEH) == INSN_MATCH_RDTIMEH) {
+		u64 guest_time = kvm_riscv_read_guest_time(vcpu);
+		SET_RD(insn, &vcpu->arch.guest_context, (u32)(guest_time >> 32));
+		vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+		return 1;
+	}
+#endif
+	return 0;
+}
+
 static int system_opcode_insn(struct kvm_vcpu *vcpu,
 			      struct kvm_run *run,
 			      ulong insn)
@@ -154,6 +186,9 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu,
 		return 1;
 	}
 
+	if (system_opcode_insn_rdtime(vcpu, run, insn))
+		return 1;
+
 	return truly_illegal_insn(vcpu, run, insn);
 }
 
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 2d203660a7e9..2040dbe57ee6 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -49,6 +49,11 @@ static u64 kvm_riscv_current_cycles(struct kvm_guest_timer *gt)
 	return kvm_riscv_scale_time(gt, host_time) + gt->time_delta;
 }
 
+u64 kvm_riscv_read_guest_time(struct kvm_vcpu *vcpu)
+{
+	return kvm_riscv_current_cycles(&vcpu->kvm->arch.timer);
+}
+
 static u64 kvm_riscv_delta_cycles2ns(u64 cycles,
 				     struct kvm_guest_timer *gt,
 				     struct kvm_vcpu_timer *t)
@@ -241,6 +246,11 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 	csr_write(CSR_HTIMEDELTA, (u32)(gt->time_delta));
 	csr_write(CSR_HTIMEDELTAH, (u32)(gt->time_delta >> 32));
 #endif
+
+	if (kvm_riscv_need_scale(gt))
+		csr_clear(CSR_HCOUNTEREN, 1UL << CE_TM);
+	else
+		csr_set(CSR_HCOUNTEREN, 1UL << CE_TM);
 }
 
 int kvm_riscv_guest_timer_init(struct kvm *kvm)
-- 
2.19.1


