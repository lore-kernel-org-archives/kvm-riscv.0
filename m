From: Chao Du <duchao@eswincomputing.com>
Date: Tue,  2 Apr 2024 06:26:27 +0000
Subject: [PATCH v4 2/3] RISC-V: KVM: Handle breakpoint exits for VCPU
In-Reply-To: <20240402062628.5425-1-duchao@eswincomputing.com>
References: <20240402062628.5425-1-duchao@eswincomputing.com>
Message-ID: <20240402062628.5425-3-duchao@eswincomputing.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Exit to userspace for breakpoint traps. Set the exit_reason as
KVM_EXIT_DEBUG before exit.

Signed-off-by: Chao Du <duchao@eswincomputing.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/vcpu_exit.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 2415722c01b8..5761f95abb60 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -204,6 +204,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
 			ret = kvm_riscv_vcpu_sbi_ecall(vcpu, run);
 		break;
+	case EXC_BREAKPOINT:
+		run->exit_reason = KVM_EXIT_DEBUG;
+		ret = 0;
+		break;
 	default:
 		break;
 	}
--
2.17.1


