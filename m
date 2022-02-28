From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 28 Feb 2022 01:42:31 -0800
Subject: [RFC PATCH 4/6] RISC-V: Restrict the isa field in config register to
 base extensions
In-Reply-To: <20220228094234.3773153-1-atishp@rivosinc.com>
References: <20220228094234.3773153-1-atishp@rivosinc.com>
Message-ID: <20220228094234.3773153-5-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The isa field in config register is meant only for single letter base ISA
extensions. Multi-letter extensions can not be encoded here as it will
exceed the size of ULONG easily in future.

Only allow single letter extensions (0-25) to be encoded in that field.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f808ad1ce500..aa9f5a5c57d8 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -47,6 +47,7 @@ struct kvm_sregs {
 
 /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_config {
+	/* This is a bitmap of all the single letter base ISA extensions */
 	unsigned long isa;
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 624166004e36..7a07dba504f8 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -182,13 +182,14 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CONFIG);
 	unsigned long reg_val;
+	unsigned long isa_mask = GENMASK(25, 0);
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
 
 	switch (reg_num) {
 	case KVM_REG_RISCV_CONFIG_REG(isa):
-		reg_val = vcpu->arch.isa;
+		reg_val = vcpu->arch.isa & isa_mask;
 		break;
 	default:
 		return -EINVAL;
@@ -209,6 +210,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CONFIG);
 	unsigned long reg_val;
+	unsigned long isa_mask = GENMASK(25, 0);
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
@@ -219,7 +221,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 	switch (reg_num) {
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		if (!vcpu->arch.ran_atleast_once) {
-			vcpu->arch.isa = reg_val;
+			vcpu->arch.isa = reg_val & isa_mask;
 			vcpu->arch.isa &= riscv_isa_extension_base(NULL);
 			vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
 			kvm_riscv_vcpu_fp_reset(vcpu);
-- 
2.30.2


