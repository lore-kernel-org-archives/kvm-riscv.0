From: Sean Christopherson <seanjc@google.com>
Date: Fri,  8 Oct 2021 19:12:18 -0700
Subject: [PATCH v2 25/43] KVM: VMX: Save/restore IRQs (instead of CLI/STI)
 during PI pre/post block
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
Message-ID: <20211009021236.4122790-26-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Save/restore IRQs when disabling IRQs in posted interrupt pre/post block
in preparation for moving the code into vcpu_put/load(), and thus may be
called with IRQs already disabled.

No functional changed intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 239e0e72a0dd..414ea6972b5c 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -140,6 +140,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 {
 	struct pi_desc old, new;
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
+	unsigned long flags;
 
 	if (!kvm_arch_has_assigned_device(vcpu->kvm) ||
 	    !irq_remapping_cap(IRQ_POSTING_CAP) ||
@@ -147,8 +148,7 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	    vmx_interrupt_blocked(vcpu))
 		return 0;
 
-	WARN_ON(irqs_disabled());
-	local_irq_disable();
+	local_irq_save(flags);
 
 	vcpu->pre_pcpu = vcpu->cpu;
 	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
@@ -171,19 +171,20 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	if (pi_test_on(pi_desc))
 		__pi_post_block(vcpu);
 
-	local_irq_enable();
+	local_irq_restore(flags);
 	return (vcpu->pre_pcpu == -1);
 }
 
 void pi_post_block(struct kvm_vcpu *vcpu)
 {
+	unsigned long flags;
+
 	if (vcpu->pre_pcpu == -1)
 		return;
 
-	WARN_ON(irqs_disabled());
-	local_irq_disable();
+	local_irq_save(flags);
 	__pi_post_block(vcpu);
-	local_irq_enable();
+	local_irq_restore(flags);
 }
 
 /*
-- 
2.33.0.882.g93a45727a2-goog


