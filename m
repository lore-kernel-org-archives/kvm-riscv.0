From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:31:54 +0000
Subject: [PATCH v4 05/12] KVM: x86: lapic does not have to process INIT if it
 is blocked
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-6-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Paolo Bonzini <pbonzini@redhat.com>

Do not return true from kvm_vcpu_has_events() if the vCPU isn' going to
immediately process a pending INIT/SIPI.  INIT/SIPI shouldn't be treated
as wake events if they are blocked.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
[sean: rebase onto refactored INIT/SIPI helpers, massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 16a24dd28f26..dcc675d4e44b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12765,7 +12765,8 @@ static inline bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu)
 	if (!list_empty_careful(&vcpu->async_pf.done))
 		return true;
 
-	if (kvm_apic_has_pending_init_or_sipi(vcpu))
+	if (kvm_apic_has_pending_init_or_sipi(vcpu) &&
+	    kvm_apic_init_sipi_allowed(vcpu))
 		return true;
 
 	if (vcpu->arch.pv.pv_unhalted)
-- 
2.37.3.968.ga6b4b080e4-goog


