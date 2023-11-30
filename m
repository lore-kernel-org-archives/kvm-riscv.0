From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 30 Nov 2023 19:35:39 +0100
Subject: [PATCH 1/6] RISC-V: KVM: Don't add SBI multi regs in get-reg-list
In-Reply-To: <20231130183537.55203-8-ajones@ventanamicro.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
Message-ID: <20231130183537.55203-9-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The multi regs are derived from the single registers. Only list the
single registers in get-reg-list. This also makes the SBI extension
register listing consistent with the ISA extension register listing.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 36 ++----------------------------------
 1 file changed, 2 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index ba18587ae8c7..0ec265a107b5 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -987,20 +987,12 @@ static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
 
 static inline unsigned long num_sbi_ext_regs(void)
 {
-	/*
-	 * number of KVM_REG_RISCV_SBI_SINGLE +
-	 * 2 x (number of KVM_REG_RISCV_SBI_MULTI)
-	 */
-	return KVM_RISCV_SBI_EXT_MAX + 2*(KVM_REG_RISCV_SBI_MULTI_REG_LAST+1);
+	return KVM_RISCV_SBI_EXT_MAX;
 }
 
 static int copy_sbi_ext_reg_indices(u64 __user *uindices)
 {
-	int n;
-
-	/* copy KVM_REG_RISCV_SBI_SINGLE */
-	n = KVM_RISCV_SBI_EXT_MAX;
-	for (int i = 0; i < n; i++) {
+	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
 		u64 size = IS_ENABLED(CONFIG_32BIT) ?
 			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
 		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
@@ -1013,30 +1005,6 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
 		}
 	}
 
-	/* copy KVM_REG_RISCV_SBI_MULTI */
-	n = KVM_REG_RISCV_SBI_MULTI_REG_LAST + 1;
-	for (int i = 0; i < n; i++) {
-		u64 size = IS_ENABLED(CONFIG_32BIT) ?
-			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
-		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
-			  KVM_REG_RISCV_SBI_MULTI_EN | i;
-
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
-		}
-
-		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
-			  KVM_REG_RISCV_SBI_MULTI_DIS | i;
-
-		if (uindices) {
-			if (put_user(reg, uindices))
-				return -EFAULT;
-			uindices++;
-		}
-	}
-
 	return num_sbi_ext_regs();
 }
 
-- 
2.43.0


