From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Thu,  3 Aug 2023 11:00:18 -0300
Subject: [PATCH v3 06/10] RISC-V: KVM: avoid EBUSY when writing same ISA val
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
Message-ID: <20230803140022.399333-7-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

kvm_riscv_vcpu_set_reg_config() will return -EBUSY if the ISA config reg
is being written after the VCPU ran at least once.

The same restriction isn't placed in kvm_riscv_vcpu_get_reg_config(), so
there's a chance that we'll -EBUSY out on an ISA config reg write even
if the userspace intended no changes to it.

We'll allow the same form of 'lazy writing' that registers such as
zicbom/zicboz_block_size supports: avoid erroring out if userspace made
no changes to the ISA config reg.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 0cf25c18b582..e752e2dca8ed 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -190,6 +190,13 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		if (fls(reg_val) >= RISCV_ISA_EXT_BASE)
 			return -EINVAL;
 
+		/*
+		 * Return early (i.e. do nothing) if reg_val is the same
+		 * value retrievable via kvm_riscv_vcpu_get_reg_config().
+		 */
+		if (reg_val == (vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK))
+			break;
+
 		if (!vcpu->arch.ran_atleast_once) {
 			/* Ignore the enable/disable request for certain extensions */
 			for (i = 0; i < RISCV_ISA_EXT_BASE; i++) {
-- 
2.41.0


