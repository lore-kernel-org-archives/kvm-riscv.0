From: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Sep 2022 00:31:55 +0000
Subject: [PATCH v4 06/12] KVM: SVM: Make an event request if INIT or SIPI is
 pending when GIF is set
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
References: <20220921003201.1441511-1-seanjc@google.com>
Message-ID: <20220921003201.1441511-7-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Set KVM_REQ_EVENT if INIT or SIPI is pending when the guest enables GIF.
INIT in particular is blocked when GIF=0 and needs to be processed when
GIF is toggled to '1'.  This bug has been masked by (a) KVM calling
->check_nested_events() in the core run loop and (b) hypervisors toggling
GIF from 0=>1 only when entering guest mode (L1 entering L2).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index dd599afc85f5..58f0077d9357 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2339,7 +2339,8 @@ void svm_set_gif(struct vcpu_svm *svm, bool value)
 		enable_gif(svm);
 		if (svm->vcpu.arch.smi_pending ||
 		    svm->vcpu.arch.nmi_pending ||
-		    kvm_cpu_has_injectable_intr(&svm->vcpu))
+		    kvm_cpu_has_injectable_intr(&svm->vcpu) ||
+		    kvm_apic_has_pending_init_or_sipi(&svm->vcpu))
 			kvm_make_request(KVM_REQ_EVENT, &svm->vcpu);
 	} else {
 		disable_gif(svm);
-- 
2.37.3.968.ga6b4b080e4-goog


