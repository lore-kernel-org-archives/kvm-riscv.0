From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Tue,  5 Dec 2023 14:45:07 -0300
Subject: [PATCH v3 1/3] RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
In-Reply-To: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
References: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
Message-ID: <20231205174509.2238870-2-dbarboza@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

'vlenb', added to riscv_v_ext_state by commit c35f3aa34509 ("RISC-V:
vector: export VLENB csr in __sc_riscv_v_state"), isn't being
initialized in guest_context. If we export 'vlenb' as a KVM CSR,
something we want to do in the next patch, it'll always return 0.

Set 'vlenb' to riscv_v_size/32.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_vector.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index b339a2682f25..530e49c588d6 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -76,6 +76,7 @@ int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu,
 	cntx->vector.datap = kmalloc(riscv_v_vsize, GFP_KERNEL);
 	if (!cntx->vector.datap)
 		return -ENOMEM;
+	cntx->vector.vlenb = riscv_v_vsize / 32;
 
 	vcpu->arch.host_context.vector.datap = kzalloc(riscv_v_vsize, GFP_KERNEL);
 	if (!vcpu->arch.host_context.vector.datap)
-- 
2.41.0


