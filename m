From: Anup Patel <apatel@ventanamicro.com>
Date: Fri,  9 Aug 2024 19:04:31 +0530
Subject: [kvmtool PATCH v2 3/3] riscv: Set SBI_SUCCESS on successful DBCN call
In-Reply-To: <20240809133431.2465029-1-apatel@ventanamicro.com>
References: <20240809133431.2465029-1-apatel@ventanamicro.com>
Message-ID: <20240809133431.2465029-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

Ensure we explicitly set SBI_SUCCESS on a successful SBI calls
since KVM will not initialize it to zero for us. Only DBCN was
neglecting to do so.

Fixes: 4ddaa4249e0c ("riscv: Handle SBI DBCN calls from Guest/VM")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/kvm-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index ae87848..0c171da 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -162,6 +162,7 @@ static bool kvm_cpu_riscv_sbi(struct kvm_cpu *vcpu)
 		switch (vcpu->kvm_run->riscv_sbi.function_id) {
 		case SBI_EXT_DBCN_CONSOLE_WRITE:
 		case SBI_EXT_DBCN_CONSOLE_READ:
+			vcpu->kvm_run->riscv_sbi.ret[0] = SBI_SUCCESS;
 			addr = vcpu->kvm_run->riscv_sbi.args[1];
 #if __riscv_xlen == 32
 			addr |= (u64)vcpu->kvm_run->riscv_sbi.args[2] << 32;
-- 
2.34.1


