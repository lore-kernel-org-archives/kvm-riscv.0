From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 10 Oct 2022 11:40:29 +0200
Subject: [PATCH] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Message-ID: <20221010094029.1579672-1-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix undefined reference of riscv_cbom_block_size when compiling KVM
without RISCV_ISA_ZICBOM. Note, RISCV_ISA_ZICBOM is a sufficient
guard as it selects RISCV_DMA_NONCOHERENT, which is needed to compile
dma-noncoherent.c (which is the file where riscv_cbom_block_size and
its initializer live).

Fixes: afd5dde9a186 ("RISC-V: KVM: Provide UAPI for Zicbom block size")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a032c4f0d600..e4453caba728 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -265,11 +265,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
+#ifdef CONFIG_RISCV_ISA_ZICBOM
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
 			return -EINVAL;
 		reg_val = riscv_cbom_block_size;
 		break;
+#endif
 	default:
 		return -EINVAL;
 	}
-- 
2.37.3


