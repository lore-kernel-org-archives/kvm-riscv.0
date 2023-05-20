From: wchen <waylingii@gmail.com>
Date: Sat, 20 May 2023 23:01:16 +0800
Subject: [PATCH] RISC-V: KVM: Redirect AMO load/store misaligned traps to guest
Message-ID: <20230520150116.7451-1-waylingII@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The M-mode redirects an unhandled misaligned trap back
to S-mode when not delegating it to VS-mode(hedeleg).
However, KVM running in HS-mode terminates the VS-mode
software when back from M-mode.
The KVM should redirect the trap back to VS-mode, and
let VS-mode trap handler decide the next step.
Here is a way to handle misaligned traps in KVM,
not only directing them to VS-mode or terminate it.

Signed-off-by: wchen <waylingII@gmail.com>
---
 arch/riscv/include/asm/csr.h | 2 ++
 arch/riscv/kvm/vcpu_exit.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index b6acb7ed1..917814a0f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -82,7 +82,9 @@
 #define EXC_INST_ACCESS		1
 #define EXC_INST_ILLEGAL	2
 #define EXC_BREAKPOINT		3
+#define EXC_LOAD_MISALIGNED	4
 #define EXC_LOAD_ACCESS		5
+#define EXC_STORE_MISALIGNED	6
 #define EXC_STORE_ACCESS	7
 #define EXC_SYSCALL		8
 #define EXC_HYPERVISOR_SYSCALL	9
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 4ea101a73..2415722c0 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -183,6 +183,8 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	run->exit_reason = KVM_EXIT_UNKNOWN;
 	switch (trap->scause) {
 	case EXC_INST_ILLEGAL:
+	case EXC_LOAD_MISALIGNED:
+	case EXC_STORE_MISALIGNED:
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
 			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
 			ret = 1;
-- 
2.34.1


