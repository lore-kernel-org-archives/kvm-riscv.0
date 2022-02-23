From: Oliver Upton <oupton@google.com>
Date: Wed, 23 Feb 2022 04:18:27 +0000
Subject: [PATCH v3 02/19] KVM: arm64: Create a helper to check if IPA is valid
In-Reply-To: <20220223041844.3984439-1-oupton@google.com>
References: <20220223041844.3984439-1-oupton@google.com>
Message-ID: <20220223041844.3984439-3-oupton@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Create a helper that tests if a given IPA fits within the guest's
address space.

Signed-off-by: Oliver Upton <oupton@google.com>
---
 arch/arm64/include/asm/kvm_mmu.h      | 9 +++++++++
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 81839e9a8a24..78e8be7ea627 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -111,6 +111,7 @@ alternative_cb_end
 #else
 
 #include <linux/pgtable.h>
+#include <linux/kvm_host.h>
 #include <asm/pgalloc.h>
 #include <asm/cache.h>
 #include <asm/cacheflush.h>
@@ -147,6 +148,14 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
 #define kvm_phys_size(kvm)		(_AC(1, ULL) << kvm_phys_shift(kvm))
 #define kvm_phys_mask(kvm)		(kvm_phys_size(kvm) - _AC(1, ULL))
 
+/*
+ * Returns true if the provided IPA exists within the VM's IPA space.
+ */
+static inline bool kvm_ipa_valid(struct kvm *kvm, phys_addr_t guest_ipa)
+{
+	return !(guest_ipa & ~kvm_phys_mask(kvm));
+}
+
 #include <asm/kvm_pgtable.h>
 #include <asm/stage2_pgtable.h>
 
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index c6d52a1fd9c8..e3853a75cb00 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -27,7 +27,7 @@ int vgic_check_iorange(struct kvm *kvm, phys_addr_t ioaddr,
 	if (addr + size < addr)
 		return -EINVAL;
 
-	if (addr & ~kvm_phys_mask(kvm) || addr + size > kvm_phys_size(kvm))
+	if (!kvm_ipa_valid(kvm, addr) || addr + size > kvm_phys_size(kvm))
 		return -E2BIG;
 
 	return 0;
-- 
2.35.1.473.g83b2b277ed-goog


