From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:23:53 +0530
Subject: [PATCH 11/15] KVM: riscv: selftests: Add Zihintntl extension to get-reg-list test
In-Reply-To: <20231128145357.413321-1-apatel@ventanamicro.com>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
Message-ID: <20231128145357.413321-12-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM RISC-V allows Zihintntl extension for Guest/VM so let us
add this extension to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 4af0f9a750e8..e1d43cc9da16 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -57,6 +57,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTNTL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKND:
@@ -397,6 +398,7 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
 		KVM_ISA_EXT_ARR(ZICOND),
 		KVM_ISA_EXT_ARR(ZICSR),
 		KVM_ISA_EXT_ARR(ZIFENCEI),
+		KVM_ISA_EXT_ARR(ZIHINTNTL),
 		KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 		KVM_ISA_EXT_ARR(ZIHPM),
 		KVM_ISA_EXT_ARR(ZKND),
@@ -798,6 +800,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
 KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zifencei, ZIFENCEI);
+KVM_ISA_EXT_SIMPLE_CONFIG(zihintntl, ZIHINTNTL);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihintpause, ZIHINTPAUSE);
 KVM_ISA_EXT_SIMPLE_CONFIG(zihpm, ZIHPM);
 KVM_ISA_EXT_SIMPLE_CONFIG(zknd, ZKND);
@@ -843,6 +846,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zicond,
 	&config_zicsr,
 	&config_zifencei,
+	&config_zihintntl,
 	&config_zihintpause,
 	&config_zihpm,
 	&config_zknd,
-- 
2.34.1


