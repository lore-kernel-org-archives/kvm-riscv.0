From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  2 Sep 2022 22:31:31 +0530
Subject: [PATCH 3/3] RISC-V: KVM: Allow Guest use Svinval extension
In-Reply-To: <20220902170131.32334-1-apatel@ventanamicro.com>
References: <20220902170131.32334-1-apatel@ventanamicro.com>
Message-ID: <20220902170131.32334-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should advertise Svinval ISA extension to KVM user-space whenever
host supports it. This will allow KVM user-space (i.e. QEMU or KVMTOOL)
to pass on this information to Guest via ISA string.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7351417afd62..b6770ee08872 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -98,6 +98,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_M,
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
+	KVM_RISCV_ISA_EXT_SVINVAL,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..901bb5c0cb50 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -53,6 +53,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_m,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_SVINVAL,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -87,6 +88,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_I:
 	case KVM_RISCV_ISA_EXT_M:
 	case KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_RISCV_ISA_EXT_SVINVAL:
 		return false;
 	default:
 		break;
-- 
2.34.1


