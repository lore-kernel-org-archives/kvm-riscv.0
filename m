From: Raghavendra Rao Ananta <rananta@google.com>
Date: Fri, 11 Aug 2023 04:51:15 +0000
Subject: [PATCH v9 02/14] KVM: Declare kvm_arch_flush_remote_tlbs() globally
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
References: <20230811045127.3308641-1-rananta@google.com>
Message-ID: <20230811045127.3308641-3-rananta@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There's no reason for the architectures to declare
kvm_arch_flush_remote_tlbs() in their own headers. Hence to
avoid this duplication, make the declaration global, leaving
the architectures to define only __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
as needed.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/mips/include/asm/kvm_host.h | 1 -
 include/linux/kvm_host.h         | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 9b0ad8f3bf327..54a85f1d4f2c8 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -897,6 +897,5 @@ static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
-int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 
 #endif /* __MIPS_KVM_HOST_H__ */
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e3f968b38ae97..ade5d4500c2ce 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1484,6 +1484,8 @@ static inline int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 {
 	return -ENOTSUPP;
 }
+#else
+int kvm_arch_flush_remote_tlbs(struct kvm *kvm);
 #endif
 
 #ifdef __KVM_HAVE_ARCH_NONCOHERENT_DMA
-- 
2.41.0.640.ga95def55d0-goog


