From: zhouquan@iscas.ac.cn <zhouquan@iscas.ac.cn>
Date: Thu, 28 Nov 2024 11:22:07 +0800
Subject: [PATCH 3/4] RISC-V: KVM: Allow Ziccrse extension for Guest/VM
In-Reply-To: <cover.1732762121.git.zhouquan@iscas.ac.cn>
References: <cover.1732762121.git.zhouquan@iscas.ac.cn>
Message-ID: <77198ab759eb01ca490f4c2199910e778b57d372.1732762121.git.zhouquan@iscas.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Quan Zhou <zhouquan@iscas.ac.cn>

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Ziccrse extension for Guest/VM.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 340618131249..f7afb4267148 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -179,6 +179,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SSNPM,
 	KVM_RISCV_ISA_EXT_SVVPTC,
 	KVM_RISCV_ISA_EXT_ZABHA,
+	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 9a30a98f30bc..ed8e17da1536 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -64,6 +64,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZFHMIN),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
+	KVM_ISA_EXT_ARR(ZICCRSE),
 	KVM_ISA_EXT_ARR(ZICNTR),
 	KVM_ISA_EXT_ARR(ZICOND),
 	KVM_ISA_EXT_ARR(ZICSR),
@@ -157,6 +158,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
+	case KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_RISCV_ISA_EXT_ZICSR:
-- 
2.34.1


