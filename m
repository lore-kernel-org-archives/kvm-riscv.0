From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  1 Feb 2022 13:52:22 +0530
Subject: [PATCH 1/6] RISC-V: KVM: Upgrade SBI spec version to v0.3
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
Message-ID: <20220201082227.361967-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We upgrade SBI spec version implemented by KVM RISC-V to v0.3 so
that Guest kernel can probe and use SBI extensions added by the
SBI v0.3 specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 76e4e17a3e00..04cd81f2ab5b 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -12,7 +12,7 @@
 #define KVM_SBI_IMPID 3
 
 #define KVM_SBI_VERSION_MAJOR 0
-#define KVM_SBI_VERSION_MINOR 2
+#define KVM_SBI_VERSION_MINOR 3
 
 struct kvm_vcpu_sbi_extension {
 	unsigned long extid_start;
-- 
2.25.1


