From: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Nov 2022 23:09:06 +0000
Subject: [PATCH v2 22/50] KVM: MIPS: Setup VZ emulation? directly from kvm_mips_init()
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
References: <20221130230934.1014142-1-seanjc@google.com>
Message-ID: <20221130230934.1014142-23-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Invoke kvm_mips_emulation_init() directly from kvm_mips_init() instead
of bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is
a glorified nop as invoking kvm_arch_init() is the very first action
performed by kvm_init().

Emptying kvm_arch_init() will allow dropping the hook entirely once all
architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Philippe Mathieu-Daud? <philmd@linaro.org>
---
 arch/mips/kvm/mips.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index f0a6c245d1ff..75681281e2df 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1012,7 +1012,7 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 
 int kvm_arch_init(void *opaque)
 {
-	return kvm_mips_emulation_init();
+	return 0;
 }
 
 void kvm_arch_exit(void)
@@ -1636,6 +1636,10 @@ static int __init kvm_mips_init(void)
 	if (ret)
 		return ret;
 
+	ret = kvm_mips_emulation_init();
+	if (ret)
+		return ret;
+
 	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 
 	if (ret)
-- 
2.38.1.584.g0f3c55d4c2-goog


