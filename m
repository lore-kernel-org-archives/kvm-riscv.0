From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:08:55 +0000
Subject: [PATCH v2 11/50] KVM: VMX: Don't bother disabling eVMCS static key on
 module exit
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-12-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't disable the eVMCS static key on module exit, kvm_intel.ko owns the
key so there can't possibly be users after the kvm_intel.ko is unloaded,
at least not without much bigger issues.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index d85d175dca70..c0de7160700b 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8490,10 +8490,6 @@ static void vmx_exit(void)
 
 	kvm_exit();
 
-#if IS_ENABLED(CONFIG_HYPERV)
-	if (static_branch_unlikely(&enable_evmcs))
-		static_branch_disable(&enable_evmcs);
-#endif
 	vmx_cleanup_l1d_flush();
 
 	allow_smaller_maxphyaddr = false;
-- 
2.38.1.584.g0f3c55d4c2-goog


