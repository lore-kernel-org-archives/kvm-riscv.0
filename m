From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:31:51 +0000
Subject: [PATCH v4 02/12] KVM: nVMX: Make an event request when pending an MTF
 nested VM-Exit
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Set KVM_REQ_EVENT when MTF becomes pending to ensure that KVM will run
through inject_pending_event() and thus vmx_check_nested_events() prior
to re-entering the guest.

MTF currently works by virtue of KVM's hack that calls
kvm_check_nested_events() from kvm_vcpu_running(), but that hack will
be removed in the near future.  Until that call is removed, the patch
introduces no real functional change.

Fixes: 5ef8acbdd687 ("KVM: nVMX: Emulate MTF when performing instruction emulation")
Cc: stable at vger.kernel.org
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 3 +++
 arch/x86/kvm/vmx/vmx.c    | 6 ++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 85318d803f4f..3a080051a4ec 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -6632,6 +6632,9 @@ static int vmx_set_nested_state(struct kvm_vcpu *vcpu,
 	if (ret)
 		goto error_guest_mode;
 
+	if (vmx->nested.mtf_pending)
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+
 	return 0;
 
 error_guest_mode:
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 94c314dc2393..9dba04b6b019 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1665,10 +1665,12 @@ static void vmx_update_emulated_instruction(struct kvm_vcpu *vcpu)
 	    (!vcpu->arch.exception.pending ||
 	     vcpu->arch.exception.vector == DB_VECTOR) &&
 	    (!vcpu->arch.exception_vmexit.pending ||
-	     vcpu->arch.exception_vmexit.vector == DB_VECTOR))
+	     vcpu->arch.exception_vmexit.vector == DB_VECTOR)) {
 		vmx->nested.mtf_pending = true;
-	else
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
+	} else {
 		vmx->nested.mtf_pending = false;
+	}
 }
 
 static int vmx_skip_emulated_instruction(struct kvm_vcpu *vcpu)
-- 
2.37.3.968.ga6b4b080e4-goog


