From: Heiko Stuebner <heiko@sntech.de>
Date: Fri,  8 Apr 2022 11:24:15 +0200
Subject: [PATCH] RISC-V: KVM: include missing hwcap.h into vcpu_fp
Message-ID: <20220408092415.1603661-1-heiko@sntech.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

vcpu_fp uses the riscv_isa_extension mechanism which gets
defined in hwcap.h but doesn't include that head file.

While it seems to work in most cases, in certain conditions
this can lead to build failures like

../arch/riscv/kvm/vcpu_fp.c: In function ?kvm_riscv_vcpu_fp_reset?:
../arch/riscv/kvm/vcpu_fp.c:22:13: error: implicit declaration of function ?riscv_isa_extension_available? [-Werror=implicit-function-declaration]
   22 |         if (riscv_isa_extension_available(&isa, f) ||
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/kvm/vcpu_fp.c:22:49: error: ?f? undeclared (first use in this function)
   22 |         if (riscv_isa_extension_available(&isa, f) ||

Fix this by simply including the necessary header.

Fixes: 0a86512dc113 ("RISC-V: KVM: Factor-out FP virtualization into separate sources")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kvm/vcpu_fp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 4449a976e5a6..d4308c512007 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -11,6 +11,7 @@
 #include <linux/err.h>
 #include <linux/kvm_host.h>
 #include <linux/uaccess.h>
+#include <asm/hwcap.h>
 
 #ifdef CONFIG_FPU
 void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
-- 
2.35.1


