From: Colin Ian King <colin.i.king@gmail.com>
Date: Fri, 15 Mar 2024 09:29:14 +0000
Subject: [PATCH][next] RISC-V: KVM: Remove second semicolon
Message-ID: <20240315092914.2431214-1-colin.i.king@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a statement with two semicolons. Remove the second one, it
is redundant.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f4a6124d25c9..994adc26db4b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -986,7 +986,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
 
 static inline unsigned long num_isa_ext_regs(const struct kvm_vcpu *vcpu)
 {
-	return copy_isa_ext_reg_indices(vcpu, NULL);;
+	return copy_isa_ext_reg_indices(vcpu, NULL);
 }
 
 static int copy_sbi_ext_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
-- 
2.39.2


