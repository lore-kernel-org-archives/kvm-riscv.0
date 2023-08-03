From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Thu,  3 Aug 2023 11:00:20 -0300
Subject: [PATCH v3 08/10] RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
Message-ID: <20230803140022.399333-9-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

riscv_vcpu_set_isa_ext_single() will prevent any write of isa_ext regs
if the vcpu already started spinning.

But if there's no extension state (enabled/disabled) made by the
userspace, there's no need to -EBUSY out - we can treat the operation as
a no-op.

zicbom/zicboz_block_size, ISA config reg and mvendorid/march/mimpid
already works in a more permissive manner w.r.t userspace writes being a
no-op, so let's do the same with isa_ext writes.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 818900f30859..fcfe2049effd 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -482,6 +482,9 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
 		return -ENOENT;
 
+	if (reg_val == test_bit(host_isa_ext, vcpu->arch.isa))
+		return 0;
+
 	if (!vcpu->arch.ran_atleast_once) {
 		/*
 		 * All multi-letter extension and a few single letter
-- 
2.41.0


