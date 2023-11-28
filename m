From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:23:54 +0530
Subject: [PATCH 12/15] RISC-V: KVM: Allow Zvfh[min] extensions for Guest/VM
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
Message-ID: <20231128145357.413321-13-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Zvfh[min] extensions for Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 0ed5b0f8a230..32c7ff23ecce 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -163,6 +163,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZFH,
 	KVM_RISCV_ISA_EXT_ZFHMIN,
 	KVM_RISCV_ISA_EXT_ZIHINTNTL,
+	KVM_RISCV_ISA_EXT_ZVFH,
+	KVM_RISCV_ISA_EXT_ZVFHMIN,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index ba0a44b6b757..6b2d81c8cfe7 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -67,6 +67,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZKT),
 	KVM_ISA_EXT_ARR(ZVBB),
 	KVM_ISA_EXT_ARR(ZVBC),
+	KVM_ISA_EXT_ARR(ZVFH),
+	KVM_ISA_EXT_ARR(ZVFHMIN),
 	KVM_ISA_EXT_ARR(ZVKB),
 	KVM_ISA_EXT_ARR(ZVKG),
 	KVM_ISA_EXT_ARR(ZVKNED),
@@ -139,6 +141,8 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZKT:
 	case KVM_RISCV_ISA_EXT_ZVBB:
 	case KVM_RISCV_ISA_EXT_ZVBC:
+	case KVM_RISCV_ISA_EXT_ZVFH:
+	case KVM_RISCV_ISA_EXT_ZVFHMIN:
 	case KVM_RISCV_ISA_EXT_ZVKB:
 	case KVM_RISCV_ISA_EXT_ZVKG:
 	case KVM_RISCV_ISA_EXT_ZVKNED:
-- 
2.34.1


