From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:32:00 +0000
Subject: [PATCH v4 11/12] KVM: mips, x86: do not rely on KVM_REQ_UNHALT
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-12-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Paolo Bonzini <pbonzini@redhat.com>

KVM_REQ_UNHALT is a weird request that simply reports the value of
kvm_arch_vcpu_runnable() on exit from kvm_vcpu_halt().  Only
MIPS and x86 are looking at it, the others just clear it.  Check
the state of the vCPU directly so that the request is handled
as a nop on all architectures.

No functional change intended, except for corner cases where an
event arrive immediately after a signal become pending or after
another similar host-side event.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/emulate.c | 7 +++----
 arch/x86/kvm/x86.c      | 9 ++++++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index b494d8d39290..1d7c56defe93 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -955,13 +955,12 @@ enum emulation_result kvm_mips_emul_wait(struct kvm_vcpu *vcpu)
 		kvm_vcpu_halt(vcpu);
 
 		/*
-		 * We we are runnable, then definitely go off to user space to
+		 * We are runnable, then definitely go off to user space to
 		 * check if any I/O interrupts are pending.
 		 */
-		if (kvm_check_request(KVM_REQ_UNHALT, vcpu)) {
-			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		if (kvm_arch_vcpu_runnable(vcpu))
 			vcpu->run->exit_reason = KVM_EXIT_IRQ_WINDOW_OPEN;
-		}
 	}
 
 	return EMULATE_DONE;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8aeacbc2bff9..8b1ff7e91ecb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10811,7 +10811,14 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 		if (hv_timer)
 			kvm_lapic_switch_to_hv_timer(vcpu);
 
-		if (!kvm_check_request(KVM_REQ_UNHALT, vcpu))
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+
+		/*
+		 * If the vCPU is not runnable, a signal or another host event
+		 * of some kind is pending; service it without changing the
+		 * vCPU's activity state.
+		 */
+		if (!kvm_arch_vcpu_runnable(vcpu))
 			return 1;
 	}
 
-- 
2.37.3.968.ga6b4b080e4-goog


