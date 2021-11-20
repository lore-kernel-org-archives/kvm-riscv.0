From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 20 Nov 2021 10:28:00 +0000
Subject: [PATCH v4 01/11] KVM: Introduce CONFIG_HAVE_KVM_DIRTY_RING
In-Reply-To: <20211120102810.8858-1-dwmw2@infradead.org>
References: <20211120102810.8858-1-dwmw2@infradead.org>
Message-ID: <20211120102810.8858-2-dwmw2@infradead.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Woodhouse <dwmw@amazon.co.uk>

I'd like to make the build include dirty_ring.c based on whether the
arch wants it or not. That's a whole lot simpler if there's a config
symbol instead of doing it implicitly on KVM_DIRTY_LOG_PAGE_OFFSET
being set to something non-zero.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/Kconfig           | 1 +
 include/linux/kvm_dirty_ring.h | 8 ++++----
 virt/kvm/Kconfig               | 3 +++
 virt/kvm/kvm_main.c            | 4 ++--
 4 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 619186138176..d7fa0a42ac25 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -27,6 +27,7 @@ config KVM
 	select MMU_NOTIFIER
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQFD
+	select HAVE_KVM_DIRTY_RING
 	select IRQ_BYPASS_MANAGER
 	select HAVE_KVM_IRQ_BYPASS
 	select HAVE_KVM_IRQ_ROUTING
diff --git a/include/linux/kvm_dirty_ring.h b/include/linux/kvm_dirty_ring.h
index fb0fa18878e2..906f899813dc 100644
--- a/include/linux/kvm_dirty_ring.h
+++ b/include/linux/kvm_dirty_ring.h
@@ -27,9 +27,9 @@ struct kvm_dirty_ring {
 	int index;
 };
 
-#if (KVM_DIRTY_LOG_PAGE_OFFSET == 0)
+#ifndef CONFIG_HAVE_KVM_DIRTY_RING
 /*
- * If KVM_DIRTY_LOG_PAGE_OFFSET not defined, kvm_dirty_ring.o should
+ * If CONFIG_HAVE_HVM_DIRTY_RING not defined, kvm_dirty_ring.o should
  * not be included as well, so define these nop functions for the arch.
  */
 static inline u32 kvm_dirty_ring_get_rsvd_entries(void)
@@ -69,7 +69,7 @@ static inline bool kvm_dirty_ring_soft_full(struct kvm_dirty_ring *ring)
 	return true;
 }
 
-#else /* KVM_DIRTY_LOG_PAGE_OFFSET == 0 */
+#else /* CONFIG_HAVE_KVM_DIRTY_RING */
 
 u32 kvm_dirty_ring_get_rsvd_entries(void);
 int kvm_dirty_ring_alloc(struct kvm_dirty_ring *ring, int index, u32 size);
@@ -92,6 +92,6 @@ struct page *kvm_dirty_ring_get_page(struct kvm_dirty_ring *ring, u32 offset);
 void kvm_dirty_ring_free(struct kvm_dirty_ring *ring);
 bool kvm_dirty_ring_soft_full(struct kvm_dirty_ring *ring);
 
-#endif /* KVM_DIRTY_LOG_PAGE_OFFSET == 0 */
+#endif /* CONFIG_HAVE_KVM_DIRTY_RING */
 
 #endif	/* KVM_DIRTY_RING_H */
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 62b39149b8c8..97cf5413ac25 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -13,6 +13,9 @@ config HAVE_KVM_IRQFD
 config HAVE_KVM_IRQ_ROUTING
        bool
 
+config HAVE_KVM_DIRTY_RING
+       bool
+
 config HAVE_KVM_EVENTFD
        bool
        select EVENTFD
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 72c6453bcef4..8eb8c962838d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3432,7 +3432,7 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_on_spin);
 
 static bool kvm_page_in_dirty_ring(struct kvm *kvm, unsigned long pgoff)
 {
-#if KVM_DIRTY_LOG_PAGE_OFFSET > 0
+#ifdef CONFIG_HAVE_KVM_DIRTY_RING
 	return (pgoff >= KVM_DIRTY_LOG_PAGE_OFFSET) &&
 	    (pgoff < KVM_DIRTY_LOG_PAGE_OFFSET +
 	     kvm->dirty_ring_size / PAGE_SIZE);
@@ -4135,7 +4135,7 @@ static long kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_NR_MEMSLOTS:
 		return KVM_USER_MEM_SLOTS;
 	case KVM_CAP_DIRTY_LOG_RING:
-#if KVM_DIRTY_LOG_PAGE_OFFSET > 0
+#ifdef CONFIG_HAVE_KVM_DIRTY_RING
 		return KVM_DIRTY_RING_MAX_ENTRIES * sizeof(struct kvm_dirty_gfn);
 #else
 		return 0;
-- 
2.31.1


