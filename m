From: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Nov 2022 23:18:48 +0000
Subject: [PATCH 21/44] KVM: MIPS: Register die notifier prior to kvm_init()
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
Message-ID: <20221102231911.3107438-22-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Call kvm_init() only after _all_ setup is complete, as kvm_init() exposes
/dev/kvm to userspace and thus allows userspace to create VMs (and call
other ioctls).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 75681281e2df..ae7a24342fdf 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1640,16 +1640,17 @@ static int __init kvm_mips_init(void)
 	if (ret)
 		return ret;
 
-	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-
-	if (ret)
-		return ret;
 
 	if (boot_cpu_type() == CPU_LOONGSON64)
 		kvm_priority_to_irq = kvm_loongson3_priority_to_irq;
 
 	register_die_notifier(&kvm_mips_csr_die_notifier);
 
+	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (ret) {
+		unregister_die_notifier(&kvm_mips_csr_die_notifier);
+		return ret;
+	}
 	return 0;
 }
 
-- 
2.38.1.431.g37b22c650d-goog


