From: Sean Christopherson <seanjc@google.com>
Date: Fri,  8 Oct 2021 19:12:13 -0700
Subject: [PATCH v2 20/43] KVM: VMX: Skip Posted Interrupt updates if APICv is
 hard disabled
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
Message-ID: <20211009021236.4122790-21-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Explicitly skip posted interrupt updates if APICv is disabled in all of
KVM, or if the guest doesn't have an in-kernel APIC.  The PI descriptor
is kept up-to-date if APICv is inhibited, e.g. so that re-enabling APICv
doesn't require a bunch of updates, but neither the module param nor the
APIC type can be changed on-the-fly.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 3263056784f5..351666c41bbc 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -28,11 +28,14 @@ void vmx_vcpu_pi_load(struct kvm_vcpu *vcpu, int cpu)
 	unsigned int dest;
 
 	/*
-	 * In case of hot-plug or hot-unplug, we may have to undo
-	 * vmx_vcpu_pi_put even if there is no assigned device.  And we
-	 * always keep PI.NDST up to date for simplicity: it makes the
-	 * code easier, and CPU migration is not a fast path.
+	 * To simplify hot-plug and dynamic toggling of APICv, keep PI.NDST and
+	 * PI.SN up-to-date even if there is no assigned device or if APICv is
+	 * deactivated due to a dynamic inhibit bit, e.g. for Hyper-V's SyncIC.
 	 */
+	if (!enable_apicv || !lapic_in_kernel(vcpu))
+		return;
+
+	/* Nothing to do if PI.SN==0 and the vCPU isn't being migrated. */
 	if (!pi_test_sn(pi_desc) && vcpu->cpu == cpu)
 		return;
 
-- 
2.33.0.882.g93a45727a2-goog


