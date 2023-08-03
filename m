From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Thu,  3 Aug 2023 13:32:57 -0300
Subject: [PATCH v4 05/10] RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
Message-ID: <20230803163302.445167-6-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

vcpu_set_reg_config() and vcpu_set_reg_isa_ext() is throwing an
EOPNOTSUPP error when !vcpu->arch.ran_atleast_once. In similar cases
we're throwing an EBUSY error, like in mvendorid/marchid/mimpid
set_reg().

EOPNOTSUPP has a conotation of finality. EBUSY is more adequate in this
case since its a condition/error related to the vcpu lifecycle.

Change these EOPNOTSUPP instances to EBUSY.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e06256dd8d24..971a2eb83180 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -212,7 +212,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			vcpu->arch.isa[0] = reg_val;
 			kvm_riscv_vcpu_fp_reset(vcpu);
 		} else {
-			return -EOPNOTSUPP;
+			return -EBUSY;
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
@@ -484,7 +484,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		kvm_riscv_vcpu_fp_reset(vcpu);
 	} else {
-		return -EOPNOTSUPP;
+		return -EBUSY;
 	}
 
 	return 0;
-- 
2.41.0


