From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:31:57 +0000
Subject: [PATCH v4 08/12] KVM: nVMX: Make event request on VMXOFF iff
 INIT/SIPI is pending
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-9-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Explicitly check for a pending INIT/SIPI event when emulating VMXOFF
instead of blindly making an event request.  There's obviously no need
to evaluate events if none are pending.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 5922531f6c52..8f67a9c4a287 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5193,8 +5193,8 @@ static int handle_vmxoff(struct kvm_vcpu *vcpu)
 
 	free_nested(vcpu);
 
-	/* Process a latched INIT during time CPU was in VMX operation */
-	kvm_make_request(KVM_REQ_EVENT, vcpu);
+	if (kvm_apic_has_pending_init_or_sipi(vcpu))
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
 
 	return nested_vmx_succeed(vcpu);
 }
-- 
2.37.3.968.ga6b4b080e4-goog


