From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:21:53 +0000
Subject: [PATCH 01/15] KVM: Add API documentation for KVM_TRANSLATE2
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-2-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add API documentation for the new KVM_TRANSLATE2 ioctl.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 Documentation/virt/kvm/api.rst | 131 +++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index a4b7dc4a9dda..632dc591badf 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -6442,6 +6442,137 @@ the capability to be present.
 
 `flags` must currently be zero.
 
+4.144 KVM_TRANSLATE2
+--------------------
+
+:Capability: KVM_CAP_TRANSLATE2
+:Architectures: x86
+:Type: vcpu ioctl
+:Parameters: struct kvm_translation2 (in/out)
+:Returns: 0 on success, <0 on error
+
+KVM_TRANSLATE2 translates a guest virtual address into a guest physical one
+while probing for requested access permissions and allowing for control over
+whether accessed and dirty bits are set in each of the page map levels
+structure. If the page walk fails, it provides detailed information explaining
+the reason for the failure.
+
+::
+
+  /* for KVM_TRANSLATE2 */
+  struct kvm_translation2 {
+      /* in */
+      __u64 linear_address;
+  #define KVM_TRANSLATE_FLAGS_SET_ACCESSED	(1 << 0)
+  #define KVM_TRANSLATE_FLAGS_SET_DIRTY	(1 << 1)
+  #define KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED	(1 << 2)
+      __u16 flags;
+  #define KVM_TRANSLATE_ACCESS_WRITE	(1 << 0)
+  #define KVM_TRANSLATE_ACCESS_USER	(1 << 1)
+  #define KVM_TRANSLATE_ACCESS_EXEC	(1 << 2)
+  #define KVM_TRANSLATE_ACCESS_ALL      \
+      (KVM_TRANSLATE_ACCESS_WRITE | \
+      KVM_TRANSLATE_ACCESS_USER |   \
+      KVM_TRANSLATE_ACCESS_EXEC)
+      __u16 access;
+      __u8  padding[4];
+
+      /* out */
+      __u64 physical_address;
+      __u8  valid;
+  #define KVM_TRANSLATE_FAULT_NOT_PRESENT	1
+  #define KVM_TRANSLATE_FAULT_PRIVILEGE_VIOLATION	2
+  #define KVM_TRANSLATE_FAULT_RESERVED_BITS	3
+  #define KVM_TRANSLATE_FAULT_INVALID_GVA	4
+  #define KVM_TRANSLATE_FAULT_INVALID_GPA	5
+      __u16 error_code;
+      __u8  set_bits_succeeded;
+      __u8  padding2[4];
+  };
+
+If the page walk succeeds, `physical_address` will contain the result of the
+page walk, `valid` will be set to 1 and `error_code` will not contain any
+meaningful value.
+
+If the page walk fails, `valid` will be set to 0 and `error_code` will contain
+the reason of the walk failure. `physical_address` may contain the physical
+address of the page table where the page walk was aborted, depending on the
+returned error code:
+
+.. csv-table::
+  :header: "`error_code`", "`physical_address`"
+
+  "KVM_TRANSLATE_FAULT_NOT_PRESENT", "Physical address of the page table entry without the present bit"
+  "KVM_TRANSLATE_FAULT_PRIVILEGE_VIOLATION", "Physical address of the page table entry where access checks failed"
+  "KVM_TRANSLATE_FAULT_RESERVED_BITS", "Physical address of the page table entry with reserved bits set"
+  "KVM_TRANSLATE_FAULT_INVALID_GPA", "Physical address that wasn't backed by host memory"
+  "KVM_TRANSLATE_FAULT_INVALID_GVA", "empty",
+
+The `flags` field can take each of these flags:
+
+KVM_TRANSLATE_FLAGS_SET_ACCESSED
+  Sets the accessed bit on each page table level on a successful page walk.
+
+KVM_TRANSLATE_FLAGS_SET_DIRTY
+  Sets the dirty bit on each page table level on a successful page walk.
+
+KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED
+  Forces setting the accessed bit on every page table level that was walked
+  successfully on failed page walks.
+
+.. warning::
+
+     Setting these flags and then using the translated address may lead to a
+     race, if another vCPU remotely flushes the local vCPUs TLB while the
+     address is still in use. This can be mitigated by stalling such TLB flushes
+     until the memory operation is finished.
+
+The `access` field can take each of these flags:
+
+KVM_TRANSLATE_ACCESS_WRITE
+  The page walker will check for write access on every page table.
+
+KVM_TRANSLATE_ACCESS_USER
+  The page walker will check for user mode access on every page table.
+
+KVM_TRANSLATE_ACCESS_EXEC
+  The page walker will check for executable/fetch access on every page table.
+
+If none of these flags are set, read access and kernel mode permissions are
+implied.
+
+The `error_code` field can take one of these values:
+
+KVM_TRANSLATE_FAULT_NOT_PRESENT
+  The virtual address is not mapped to any physical address.
+
+KVM_TRANSLATE_FAULT_PRIVILEGE_VIOLATION
+  One of the access checks failed during the page walk.
+
+KVM_TRANSLATE_FAULT_RESERVED_BITS
+  Reserved bits were set in a page table.
+
+KVM_TRANSLATE_FAULT_INVALID_GPA
+  One of the guest page table entries' addresses along the page walk was not
+  backed by a host memory.
+
+KVM_TRANSLATE_FAULT_INVALID_GVA
+  The GVA provided is not valid in the current vCPU state. For example, if on
+  32-bit systems, the virtual address provided was larger than 32-bits, or on
+  64-bit x86 systems, the virtual address was non-canonical.
+
+Regardless of the success of the page walk, `set_bits_succeeded` will contain a
+boolean value indicating whether the accessed/dirty bits were set. It may be
+false, if the bits were not set, because the page walk failed and
+KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED was not passed, or if there was an error
+setting the bits, for example, the host memory backing the page table entry was
+marked read-only.
+
+KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED and KVM_TRANSLATE_FLAGS_SET_DIRTY must
+never be passed without KVM_TRANSLATE_FLAGS_SET_ACCESSED.
+KVM_TRANSLATE_FLAGS_SET_DIRTY must never be passed without
+KVM_TRANSLATE_ACCESS_WRITE. Doing either will cause the ioctl to fail with exit
+code -EINVAL.
 
 5. The kvm_run structure
 ========================
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


