From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 17 Mar 2022 09:25:21 +0530
Subject: [PATCH] RISC-V: KVM: Don't clear hgatp CSR in kvm_arch_vcpu_put()
Message-ID: <20220317035521.272486-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We might have RISC-V systems (such as QEMU) where VMID is not part
of the TLB entry tag so these systems will have to flush all TLB
enteries upon any change in hgatp.VMID.

Currently, we zero-out hgatp CSR in kvm_arch_vcpu_put() and we
re-program hgatp CSR in kvm_arch_vcpu_load(). For above described
systems, this will flush all TLB enteries whenever VCPU exits to
user-space hence reducing performance.

This patch fixes above described performance issue by not clearing
hgatp CSR in kvm_arch_vcpu_put().

Fixes: 34bde9d8b9e6 ("RISC-V: KVM: Implement VCPU world-switch")
Cc: stable at vger.kernel.org
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 624166004e36..6785aef4cbd4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -653,8 +653,6 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 				     vcpu->arch.isa);
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
-	csr_write(CSR_HGATP, 0);
-
 	csr->vsstatus = csr_read(CSR_VSSTATUS);
 	csr->vsie = csr_read(CSR_VSIE);
 	csr->vstvec = csr_read(CSR_VSTVEC);
-- 
2.25.1


