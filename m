From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:22:04 +0000
Subject: [PATCH 12/15] KVM: Introduce KVM_TRANSLATE2
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-13-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a new ioctl that extends the functionality of KVM_TRANSLATE. It
allows the caller to specify an access mode that must be upheld throughout
the entire page walk. Additionally, it provides control over whether the
accessed/dirty bits in the page table should be set at all, and whether
they should be set if the walk fails. Lastly, if the page walk fails, it
returns the exact error code which caused the failure.

KVM_TRANSLATE lacks information about executability of the translated page
and doesn't provide control over the accessed/dirty page table bits at
all. Because it lacks any sort of input flags, it cannot simply be
expanded without breaking backwards compatibility. Additionally, in the
x86 implementation the 'writable' and 'usermode' are currently hardcoded
to 1 and 0 respectively, which is behaviour that might be relied upon.

The ioctl will be implemented for x86 in following commits.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 include/linux/kvm_host.h |  4 ++++
 include/uapi/linux/kvm.h | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b23c6d48392f..c78017fd2907 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -84,6 +84,10 @@
 #define KVM_MAX_NR_ADDRESS_SPACES	1
 #endif
 
+#define KVM_TRANSLATE_FLAGS_ALL                \
+	(KVM_TRANSLATE_FLAGS_SET_ACCESSED |     \
+	KVM_TRANSLATE_FLAGS_SET_DIRTY |         \
+	KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED)
 /*
  * For the normal pfn, the highest 12 bits should be zero,
  * so we can mask bit 62 ~ bit 52  to indicate the error pfn,
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 637efc055145..602323e734cc 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -512,6 +512,37 @@ struct kvm_translation {
 	__u8  pad[5];
 };
 
+/* for KVM_TRANSLATE2 */
+struct kvm_translation2 {
+	/* in */
+	__u64 linear_address;
+#define KVM_TRANSLATE_FLAGS_SET_ACCESSED	(1 << 0)
+#define KVM_TRANSLATE_FLAGS_SET_DIRTY	(1 << 1)
+#define KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED	(1 << 2)
+	__u16 flags;
+#define KVM_TRANSLATE_ACCESS_WRITE	(1 << 0)
+#define KVM_TRANSLATE_ACCESS_USER	(1 << 1)
+#define KVM_TRANSLATE_ACCESS_EXEC	(1 << 2)
+#define KVM_TRANSLATE_ACCESS_ALL      \
+	(KVM_TRANSLATE_ACCESS_WRITE | \
+	KVM_TRANSLATE_ACCESS_USER |   \
+	KVM_TRANSLATE_ACCESS_EXEC)
+	__u16 access;
+	__u8  padding[4];
+
+	/* out */
+	__u64 physical_address;
+	__u8  valid;
+#define KVM_TRANSLATE_FAULT_NOT_PRESENT	1
+#define KVM_TRANSLATE_FAULT_PRIVILEGE_VIOLATION	2
+#define KVM_TRANSLATE_FAULT_RESERVED_BITS	3
+#define KVM_TRANSLATE_FAULT_INVALID_GVA	4
+#define KVM_TRANSLATE_FAULT_INVALID_GPA	5
+	__u16 error_code;
+	__u8  set_bits_succeeded;
+	__u8  padding2[4];
+};
+
 /* for KVM_INTERRUPT */
 struct kvm_interrupt {
 	/* in */
@@ -933,6 +964,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_PRE_FAULT_MEMORY 236
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
+#define KVM_CAP_TRANSLATE2 239
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1269,6 +1301,7 @@ struct kvm_vfio_spapr_tce {
 #define KVM_SET_SREGS             _IOW(KVMIO,  0x84, struct kvm_sregs)
 #define KVM_TRANSLATE             _IOWR(KVMIO, 0x85, struct kvm_translation)
 #define KVM_INTERRUPT             _IOW(KVMIO,  0x86, struct kvm_interrupt)
+#define KVM_TRANSLATE2            _IOWR(KVMIO, 0x87, struct kvm_translation2)
 #define KVM_GET_MSRS              _IOWR(KVMIO, 0x88, struct kvm_msrs)
 #define KVM_SET_MSRS              _IOW(KVMIO,  0x89, struct kvm_msrs)
 #define KVM_SET_CPUID             _IOW(KVMIO,  0x8a, struct kvm_cpuid)
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


