From: Yu-Wei Hsu <betterman5240@gmail.com>
Date: Mon, 29 Apr 2024 09:21:13 +0000
Subject: [PATCH] RISC-V:KVM: Add AMO load/store access fault traps to redirect to guest
Message-ID: <20240429092113.70695-1-betterman5240@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When unhandled AMO load/store access fault traps are not delegated to
VS mode (hedeleg), M mode redirects them back to S mode.
However, upon returning from M mode,the KVM executed in HS mode terminates
VS mode software.
KVM should redirect traps back to VS mode and let the VS mode trap handler
determine the next steps.
This is one approach to handling access fault traps in KVM,
not only redirecting them to VS mode or terminating it.

Signed-off-by: Yu-Wei Hsu <betterman5240@gmail.com>
---
 arch/riscv/kvm/vcpu_exit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 2415722c01b8..ef8c5e3ec8a0 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -185,6 +185,8 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	case EXC_INST_ILLEGAL:
 	case EXC_LOAD_MISALIGNED:
 	case EXC_STORE_MISALIGNED:
+	case EXC_LOAD_ACCESS:
+	case EXC_STORE_ACCESS:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
 			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
 			ret = 1;
-- 
2.25.1


