From: Raghavendra Rao Ananta <rananta@google.com>
Date: Sat, 15 Jul 2023 00:54:02 +0000
Subject: [PATCH v6 08/11] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
In-Reply-To: <20230715005405.3689586-1-rananta@google.com>
References: <20230715005405.3689586-1-rananta@google.com>
Message-ID: <20230715005405.3689586-9-rananta@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement kvm_arch_flush_remote_tlbs_range() for arm64
to invalidate the given range in the TLB.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 arch/arm64/kvm/mmu.c              | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 7281222f24ef..52d3ed918893 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1114,6 +1114,9 @@ struct kvm *kvm_arch_alloc_vm(void);
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
 int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
+
 static inline bool kvm_vm_is_protected(struct kvm *kvm)
 {
 	return false;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0ac721fa27f1..387f2215fde7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -172,6 +172,13 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 	return 0;
 }
 
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
+{
+	kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
+				start_gfn << PAGE_SHIFT, pages << PAGE_SHIFT);
+	return 0;
+}
+
 static bool kvm_is_device_pfn(unsigned long pfn)
 {
 	return !pfn_is_map_memory(pfn);
-- 
2.41.0.455.g037347b96a-goog


