From: Sean Christopherson <seanjc@google.com>
Date: Fri,  8 Oct 2021 19:12:36 -0700
Subject: [PATCH v2 43/43] KVM: VMX: Don't do full kick when handling posted
 interrupt wakeup
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
Message-ID: <20211009021236.4122790-44-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When waking vCPUs in the posted interrupt wakeup handling, do exactly
that and no more.  There is no need to kick the vCPU as the wakeup
handler just need to get the vCPU task running, and if it's in the guest
then it's definitely running.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index f1bcf8c32b6d..06eb9c950760 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -192,7 +192,7 @@ void pi_wakeup_handler(void)
 			    pi_wakeup_list) {
 
 		if (pi_test_on(&vmx->pi_desc))
-			kvm_vcpu_kick(&vmx->vcpu);
+			kvm_vcpu_wake_up(&vmx->vcpu);
 	}
 	spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, cpu));
 }
-- 
2.33.0.882.g93a45727a2-goog


