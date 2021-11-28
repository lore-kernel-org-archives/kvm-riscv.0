From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon, 29 Nov 2021 00:07:39 +0800
Subject: [PATCH 3/5] riscv: kvm: make kvm_riscv_vcpu_fp_clean() static
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
Message-ID: <20211128160741.2122-4-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are no users outside vcpu_fp.c so make kvm_riscv_vcpu_fp_clean()
static.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kvm/vcpu_fp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 1b070152578f..4449a976e5a6 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -26,7 +26,7 @@ void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
 		cntx->sstatus |= SR_FS_OFF;
 }
 
-void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
+static void kvm_riscv_vcpu_fp_clean(struct kvm_cpu_context *cntx)
 {
 	cntx->sstatus &= ~SR_FS;
 	cntx->sstatus |= SR_FS_CLEAN;
-- 
2.34.0


