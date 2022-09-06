From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue,  6 Sep 2022 10:35:54 +0200
Subject: [PATCH 2/3] RISC-V: KVM: Provide UAPI for Zicbom block size
In-Reply-To: <20220906083555.931806-1-ajones@ventanamicro.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
Message-ID: <20220906083555.931806-3-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We're about to allow guests to use the Zicbom extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 6 ++++++
 arch/riscv/mm/cacheflush.c        | 1 +
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 7351417afd62..b9a4cf36be4b 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -48,6 +48,7 @@ struct kvm_sregs {
 /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_config {
 	unsigned long isa;
+	unsigned long zicbom_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d0f08d5b4282..3f36e79876e7 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -18,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/cacheflush.h>
 #include <asm/hwcap.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
@@ -254,6 +255,9 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
+		reg_val = riscv_cbom_block_size;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -311,6 +315,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			return -EOPNOTSUPP;
 		}
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
+		return -EOPNOTSUPP;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 8595baf8e403..c555ac7ae69c 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -90,6 +90,7 @@ void flush_icache_pte(pte_t pte)
 #endif /* CONFIG_MMU */
 
 unsigned int riscv_cbom_block_size;
+EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 
 #ifdef CONFIG_RISCV_ISA_ZICBOM
 void riscv_init_cbom_blocksize(void)
-- 
2.37.2


