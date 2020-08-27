From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 27 Aug 2020 16:22:50 +0800
Subject: [PATCH RFC 1/2] riscv/kvm: Fix use VSIP_VALID_MASK mask HIP register
In-Reply-To: <20200827082251.1591-1-jiangyifei@huawei.com>
References: <20200827082251.1591-1-jiangyifei@huawei.com>
Message-ID: <20200827082251.1591-2-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The correct sip/sie 0x222 could mask wrong 0x000 by VSIP_VALID_MASK,
This patch fix it.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 arch/riscv/kvm/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index adb0815951aa..2976666e921f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -419,8 +419,8 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip) ||
 	    reg_num == KVM_REG_RISCV_CSR_REG(sie)) {
-		reg_val = reg_val << VSIP_TO_HVIP_SHIFT;
 		reg_val = reg_val & VSIP_VALID_MASK;
+		reg_val = reg_val << VSIP_TO_HVIP_SHIFT;
 	}
 
 	((unsigned long *)csr)[reg_num] = reg_val;
-- 
2.19.1



