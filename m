From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Nov 2022 21:44:16 +0530
Subject: [PATCH 1/9] RISC-V: KVM: Fix reg_val check in kvm_riscv_vcpu_set_reg_config()
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
Message-ID: <20221128161424.608889-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The reg_val check in kvm_riscv_vcpu_set_reg_config() should only
be done for isa config register.

Fixes: 9bfd900beeec ("RISC-V: KVM: Improve ISA extension by using a bitmap")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 17d5b3f8c2ee..982a3f5e7130 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -296,12 +296,15 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 	if (copy_from_user(&reg_val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
-	/* This ONE REG interface is only defined for single letter extensions */
-	if (fls(reg_val) >= RISCV_ISA_EXT_BASE)
-		return -EINVAL;
-
 	switch (reg_num) {
 	case KVM_REG_RISCV_CONFIG_REG(isa):
+		/*
+		 * This ONE REG interface is only defined for
+		 * single letter extensions.
+		 */
+		if (fls(reg_val) >= RISCV_ISA_EXT_BASE)
+			return -EINVAL;
+
 		if (!vcpu->arch.ran_atleast_once) {
 			/* Ignore the enable/disable request for certain extensions */
 			for (i = 0; i < RISCV_ISA_EXT_BASE; i++) {
-- 
2.34.1


