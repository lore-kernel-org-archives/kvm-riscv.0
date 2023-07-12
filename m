From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 12 Jul 2023 21:40:44 +0530
Subject: [PATCH 4/7] RISC-V: KVM: Allow Zicntr, Zicsr, Zifencei, and Zihpm for Guest/VM
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
Message-ID: <20230712161047.1764756-5-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Zicntr, Zicsr, Zifencei, and Zihpm
extensions for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 arch/riscv/kvm/vcpu_onereg.c      | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 68f929d88f43..9c35e1427f73 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -126,6 +126,10 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SVNAPOT,
 	KVM_RISCV_ISA_EXT_ZBA,
 	KVM_RISCV_ISA_EXT_ZBS,
+	KVM_RISCV_ISA_EXT_ZICNTR,
+	KVM_RISCV_ISA_EXT_ZICSR,
+	KVM_RISCV_ISA_EXT_ZIFENCEI,
+	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 555acebcbe02..e73f9b105a02 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -40,7 +40,11 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZBS),
+	KVM_ISA_EXT_ARR(ZICNTR),
+	KVM_ISA_EXT_ARR(ZICSR),
+	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
+	KVM_ISA_EXT_ARR(ZIHPM),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 };
@@ -82,7 +86,11 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_RISCV_ISA_EXT_ZICNTR:
+	case KVM_RISCV_ISA_EXT_ZICSR:
+	case KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
+	case KVM_RISCV_ISA_EXT_ZIHPM:
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBS:
-- 
2.34.1


