From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 27 Oct 2022 15:02:43 +0200
Subject: [PATCH 5/9] RISC-V: KVM: Provide UAPI for Zicboz block size
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
Message-ID: <20221027130247.31634-6-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We're about to allow guests to use the Zicboz extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 8985ff234c01..4bbf55cb2b70 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -49,6 +49,7 @@ struct kvm_sregs {
 struct kvm_riscv_config {
 	unsigned long isa;
 	unsigned long zicbom_block_size;
+	unsigned long zicboz_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 71ebbc4821f0..18a739070b51 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -270,6 +270,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		reg_val = riscv_cbom_block_size;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+			return -EINVAL;
+		reg_val = riscv_cboz_block_size;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -329,6 +334,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		return -EOPNOTSUPP;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		return -EOPNOTSUPP;
 	default:
 		return -EINVAL;
 	}
-- 
2.37.3


