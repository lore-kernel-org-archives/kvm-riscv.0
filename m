From: Sean Christopherson <seanjc@google.com>
Date: Fri,  8 Oct 2021 19:12:17 -0700
Subject: [PATCH v2 24/43] KVM: VMX: Drop pointless PI.NDST update when blocking
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
Message-ID: <20211009021236.4122790-25-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't update Posted Interrupt's NDST, a.k.a. the target pCPU, in the
pre-block path, as NDST is guaranteed to be up-to-date.  The comment
about the vCPU being preempted during the update is simply wrong, as the
update path runs with IRQs disabled (from before snapshotting vcpu->cpu,
until after the update completes).

The vCPU can get preempted _before_ the update starts, but not during.
And if the vCPU is preempted before, vmx_vcpu_pi_load() is responsible
for updating NDST when the vCPU is scheduled back in.  In that case, the
check against the wakeup vector in vmx_vcpu_pi_load() cannot be true as
that would require the notification vector to have been set to the wakeup
vector _before_ blocking.

Opportunistically switch to using vcpu->cpu for the list/lock lookups,
which presumably used pre_pcpu only for some phantom preemption logic.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 1688f8dc535a..239e0e72a0dd 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -130,7 +130,6 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
  * - Store the vCPU to the wakeup list, so when interrupts happen
  *   we can find the right vCPU to wake up.
  * - Change the Posted-interrupt descriptor as below:
- *      'NDST' <-- vcpu->pre_pcpu
  *      'NV' <-- POSTED_INTR_WAKEUP_VECTOR
  * - If 'ON' is set during this process, which means@least one
  *   interrupt is posted for this vCPU, we cannot block it, in
@@ -139,7 +138,6 @@ static void __pi_post_block(struct kvm_vcpu *vcpu)
  */
 int pi_pre_block(struct kvm_vcpu *vcpu)
 {
-	unsigned int dest;
 	struct pi_desc old, new;
 	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
 
@@ -153,10 +151,10 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	local_irq_disable();
 
 	vcpu->pre_pcpu = vcpu->cpu;
-	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
+	spin_lock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
 	list_add_tail(&vcpu->blocked_vcpu_list,
-		      &per_cpu(blocked_vcpu_on_cpu, vcpu->pre_pcpu));
-	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->pre_pcpu));
+		      &per_cpu(blocked_vcpu_on_cpu, vcpu->cpu));
+	spin_unlock(&per_cpu(blocked_vcpu_on_cpu_lock, vcpu->cpu));
 
 	WARN(pi_desc->sn == 1,
 	     "Posted Interrupt Suppress Notification set before blocking");
@@ -164,21 +162,6 @@ int pi_pre_block(struct kvm_vcpu *vcpu)
 	do {
 		old.control = new.control = pi_desc->control;
 
-		/*
-		 * Since vCPU can be preempted during this process,
-		 * vcpu->cpu could be different with pre_pcpu, we
-		 * need to set pre_pcpu as the destination of wakeup
-		 * notification event, then we can find the right vCPU
-		 * to wakeup in wakeup handler if interrupts happen
-		 * when the vCPU is in blocked state.
-		 */
-		dest = cpu_physical_id(vcpu->pre_pcpu);
-
-		if (x2apic_mode)
-			new.ndst = dest;
-		else
-			new.ndst = (dest << 8) & 0xFF00;
-
 		/* set 'NV' to 'wakeup vector' */
 		new.nv = POSTED_INTR_WAKEUP_VECTOR;
 	} while (cmpxchg64(&pi_desc->control, old.control,
-- 
2.33.0.882.g93a45727a2-goog


