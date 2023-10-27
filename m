From: Sean Christopherson <seanjc@google.com>
Date: Fri, 27 Oct 2023 11:22:15 -0700
Subject: [PATCH v13 33/35] KVM: selftests: Expand set_memory_region_test to
 validate guest_memfd()
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
Message-ID: <20231027182217.3615211-34-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Chao Peng <chao.p.peng@linux.intel.com>

Expand set_memory_region_test to exercise various positive and negative
testcases for private memory.

 - Non-guest_memfd() file descriptor for private memory
 - guest_memfd() from different VM
 - Overlapping bindings
 - Unaligned bindings

Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
[sean: trim the testcases to remove duplicate coverage]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  10 ++
 .../selftests/kvm/set_memory_region_test.c    | 100 ++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 8ec122f5fcc8..e4d2cd9218b2 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -819,6 +819,16 @@ static inline struct kvm_vm *vm_create_barebones(void)
 	return ____vm_create(VM_SHAPE_DEFAULT);
 }
 
+static inline struct kvm_vm *vm_create_barebones_protected_vm(void)
+{
+	const struct vm_shape shape = {
+		.mode = VM_MODE_DEFAULT,
+		.type = KVM_X86_SW_PROTECTED_VM,
+	};
+
+	return ____vm_create(shape);
+}
+
 static inline struct kvm_vm *vm_create(uint32_t nr_runnable_vcpus)
 {
 	return __vm_create(VM_SHAPE_DEFAULT, nr_runnable_vcpus, 0);
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index b32960189f5f..ca83e3307a98 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -385,6 +385,98 @@ static void test_add_max_memory_regions(void)
 	kvm_vm_free(vm);
 }
 
+
+static void test_invalid_guest_memfd(struct kvm_vm *vm, int memfd,
+				     size_t offset, const char *msg)
+{
+	int r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+					     MEM_REGION_GPA, MEM_REGION_SIZE,
+					     0, memfd, offset);
+	TEST_ASSERT(r == -1 && errno == EINVAL, "%s", msg);
+}
+
+static void test_add_private_memory_region(void)
+{
+	struct kvm_vm *vm, *vm2;
+	int memfd, i;
+
+	pr_info("Testing ADD of KVM_MEM_PRIVATE memory regions\n");
+
+	vm = vm_create_barebones_protected_vm();
+
+	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
+	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
+
+	memfd = kvm_memfd_alloc(MEM_REGION_SIZE, false);
+	test_invalid_guest_memfd(vm, memfd, 0, "Regular memfd() should fail");
+	close(memfd);
+
+	vm2 = vm_create_barebones_protected_vm();
+	memfd = vm_create_guest_memfd(vm2, MEM_REGION_SIZE, 0);
+	test_invalid_guest_memfd(vm, memfd, 0, "Other VM's guest_memfd() should fail");
+
+	vm_set_user_memory_region2(vm2, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+	close(memfd);
+	kvm_vm_free(vm2);
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
+	for (i = 1; i < PAGE_SIZE; i++)
+		test_invalid_guest_memfd(vm, memfd, i, "Unaligned offset should fail");
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+	close(memfd);
+
+	kvm_vm_free(vm);
+}
+
+static void test_add_overlapping_private_memory_regions(void)
+{
+	struct kvm_vm *vm;
+	int memfd;
+	int r;
+
+	pr_info("Testing ADD of overlapping KVM_MEM_PRIVATE memory regions\n");
+
+	vm = vm_create_barebones_protected_vm();
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE * 4, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA, MEM_REGION_SIZE * 2, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT + 1, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA * 2, MEM_REGION_SIZE * 2,
+				   0, memfd, MEM_REGION_SIZE * 2);
+
+	/*
+	 * Delete the first memslot, and then attempt to recreate it except
+	 * with a "bad" offset that results in overlap in the guest_memfd().
+	 */
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+				   MEM_REGION_GPA, 0, NULL, -1, 0);
+
+	/* Overlap the front half of the other slot. */
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+					 MEM_REGION_GPA * 2 - MEM_REGION_SIZE,
+					 MEM_REGION_SIZE * 2,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
+		    "Overlapping guest_memfd() bindings should fail with EEXIST");
+
+	/* And now the back half of the other slot. */
+	r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_PRIVATE,
+					 MEM_REGION_GPA * 2 + MEM_REGION_SIZE,
+					 MEM_REGION_SIZE * 2,
+					 0, memfd, 0);
+	TEST_ASSERT(r == -1 && errno == EEXIST, "%s",
+		    "Overlapping guest_memfd() bindings should fail with EEXIST");
+
+	close(memfd);
+	kvm_vm_free(vm);
+}
+
 int main(int argc, char *argv[])
 {
 #ifdef __x86_64__
@@ -401,6 +493,14 @@ int main(int argc, char *argv[])
 
 	test_add_max_memory_regions();
 
+	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD) &&
+	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
+		test_add_private_memory_region();
+		test_add_overlapping_private_memory_regions();
+	} else {
+		pr_info("Skipping tests for KVM_MEM_PRIVATE memory regions\n");
+	}
+
 #ifdef __x86_64__
 	if (argc > 1)
 		loops = atoi_positive("Number of iterations", argv[1]);
-- 
2.42.0.820.g83a721a137-goog


