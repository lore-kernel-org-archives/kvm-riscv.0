From: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Oct 2023 11:22:14 -0700
Subject: [PATCH v13 32/35] KVM: selftests: Add KVM_SET_USER_MEMORY_REGION2 helper
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
Message-ID: <20231027182217.3615211-33-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Chao Peng <chao.p.peng@linux.intel.com>

Add helpers to invoke KVM_SET_USER_MEMORY_REGION2 directly so that tests
can validate of features that are unique to "version 2" of "set user
memory region", e.g. do negative testing on gmem_fd and gmem_offset.

Provide a raw version as well as an assert-success version to reduce
the amount of boilerplate code need for basic usage.

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  7 +++++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 29 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 157508c071f3..8ec122f5fcc8 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -522,6 +522,13 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 			       uint64_t gpa, uint64_t size, void *hva);
 int __vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 				uint64_t gpa, uint64_t size, void *hva);
+void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
+				uint64_t gpa, uint64_t size, void *hva,
+				uint32_t guest_memfd, uint64_t guest_memfd_offset);
+int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
+				 uint64_t gpa, uint64_t size, void *hva,
+				 uint32_t guest_memfd, uint64_t guest_memfd_offset);
+
 void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	enum vm_mem_backing_src_type src_type,
 	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 52b131e3aca5..1620452c1cf7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -873,6 +873,35 @@ void vm_set_user_memory_region(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
 		    errno, strerror(errno));
 }
 
+int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
+				 uint64_t gpa, uint64_t size, void *hva,
+				 uint32_t guest_memfd, uint64_t guest_memfd_offset)
+{
+	struct kvm_userspace_memory_region2 region = {
+		.slot = slot,
+		.flags = flags,
+		.guest_phys_addr = gpa,
+		.memory_size = size,
+		.userspace_addr = (uintptr_t)hva,
+		.guest_memfd = guest_memfd,
+		.guest_memfd_offset = guest_memfd_offset,
+	};
+
+	return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
+}
+
+void vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flags,
+				uint64_t gpa, uint64_t size, void *hva,
+				uint32_t guest_memfd, uint64_t guest_memfd_offset)
+{
+	int ret = __vm_set_user_memory_region2(vm, slot, flags, gpa, size, hva,
+					       guest_memfd, guest_memfd_offset);
+
+	TEST_ASSERT(!ret, "KVM_SET_USER_MEMORY_REGION2 failed, errno = %d (%s)",
+		    errno, strerror(errno));
+}
+
+
 /* FIXME: This thing needs to be ripped apart and rewritten. */
 void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
 		uint64_t guest_paddr, uint32_t slot, uint64_t npages,
-- 
2.42.0.820.g83a721a137-goog


