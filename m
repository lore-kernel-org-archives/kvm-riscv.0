From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun,  5 Nov 2023 17:30:37 +0100
Subject: [PATCH 34/34] KVM: selftests: Add a memory region subtest to validate invalid flags
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
Message-ID: <20231105163040.14904-35-pbonzini@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Sean Christopherson <seanjc@google.com>

Add a subtest to set_memory_region_test to verify that KVM rejects invalid
flags and combinations with -EINVAL.  KVM might or might not fail with
EINVAL anyways, but we can at least try.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Message-Id: <20231031002049.3915752-1-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .../selftests/kvm/set_memory_region_test.c    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 1891774eb6d4..343e807043e1 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -326,6 +326,53 @@ static void test_zero_memory_regions(void)
 }
 #endif /* __x86_64__ */
 
+static void test_invalid_memory_region_flags(void)
+{
+	uint32_t supported_flags = KVM_MEM_LOG_DIRTY_PAGES;
+	const uint32_t v2_only_flags = KVM_MEM_GUEST_MEMFD;
+	struct kvm_vm *vm;
+	int r, i;
+
+#ifdef __x86_64__
+	supported_flags |= KVM_MEM_READONLY;
+
+	if (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))
+		vm = vm_create_barebones_protected_vm();
+	else
+#endif
+		vm = vm_create_barebones();
+
+	if (kvm_check_cap(KVM_CAP_MEMORY_ATTRIBUTES) & KVM_MEMORY_ATTRIBUTE_PRIVATE)
+		supported_flags |= KVM_MEM_GUEST_MEMFD;
+
+	for (i = 0; i < 32; i++) {
+		if ((supported_flags & BIT(i)) && !(v2_only_flags & BIT(i)))
+			continue;
+
+		r = __vm_set_user_memory_region(vm, MEM_REGION_SLOT, BIT(i),
+						MEM_REGION_GPA, MEM_REGION_SIZE, NULL);
+
+		TEST_ASSERT(r && errno == EINVAL,
+			    "KVM_SET_USER_MEMORY_REGION should have failed on v2 only flag 0x%lx", BIT(i));
+
+		if (supported_flags & BIT(i))
+			continue;
+
+		r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT, BIT(i),
+						 MEM_REGION_GPA, MEM_REGION_SIZE, NULL, 0, 0);
+		TEST_ASSERT(r && errno == EINVAL,
+			    "KVM_SET_USER_MEMORY_REGION2 should have failed on unsupported flag 0x%lx", BIT(i));
+	}
+
+	if (supported_flags & KVM_MEM_GUEST_MEMFD) {
+		r = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT,
+						 KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_GUEST_MEMFD,
+						 MEM_REGION_GPA, MEM_REGION_SIZE, NULL, 0, 0);
+		TEST_ASSERT(r && errno == EINVAL,
+			    "KVM_SET_USER_MEMORY_REGION2 should have failed, dirty logging private memory is unsupported");
+	}
+}
+
 /*
  * Test it can be added memory slots up to KVM_CAP_NR_MEMSLOTS, then any
  * tentative to add further slots should fail.
@@ -491,6 +538,8 @@ int main(int argc, char *argv[])
 	test_zero_memory_regions();
 #endif
 
+	test_invalid_memory_region_flags();
+
 	test_add_max_memory_regions();
 
 	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD) &&
-- 
2.39.1



