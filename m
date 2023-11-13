From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 Nov 2023 13:21:28 +0100
Subject: [PATCH v14 00/34] KVM: guest_memfd() and per-page attributes
In-Reply-To: <20231105163040.14904-1-pbonzini@redhat.com>
References: <20231105163040.14904-1-pbonzini@redhat.com>
Message-ID: <d3071794-7c02-4ca1-850d-1d5242de4f98@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/5/23 17:30, Paolo Bonzini wrote:
> The "development cycle" for this version is going to be very short;
> ideally, next week I will merge it as is in kvm/next, taking this through
> the KVM tree for 6.8 immediately after the end of the merge window.
> The series is still based on 6.6 (plus KVM changes for 6.7) so it
> will require a small fixup for changes to get_file_rcu() introduced in
> 6.7 by commit 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU").
> The fixup will be done as part of the merge commit, and most of the text
> above will become the commit message for the merge.

The changes from review are small enough and entirely in tests, so
I went ahead and pushed it to kvm/next, together with "selftests: kvm/s390x: use vm_create_barebones()" which also fixed testcase failures (similar to the aarch64/page_fault_test.c hunk below).

The guestmemfd branch on kvm.git was force-pushed, and can be used for further
development if you don't want to run 6.7-rc1 for whatever reason.

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 38882263278d..926241e23aeb 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1359,7 +1359,6 @@ yet and must be cleared on entry.
  	__u64 guest_phys_addr;
  	__u64 memory_size; /* bytes */
  	__u64 userspace_addr; /* start of the userspace allocated memory */
-	__u64 pad[16];
    };
  
    /* for kvm_userspace_memory_region::flags */
diff --git a/tools/testing/selftests/kvm/aarch64/page_fault_test.c b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
index eb4217b7c768..08a5ca5bed56 100644
--- a/tools/testing/selftests/kvm/aarch64/page_fault_test.c
+++ b/tools/testing/selftests/kvm/aarch64/page_fault_test.c
@@ -705,7 +705,7 @@ static void run_test(enum vm_guest_mode mode, void *arg)
  
  	print_test_banner(mode, p);
  
-	vm = ____vm_create(mode);
+	vm = ____vm_create(VM_SHAPE(mode));
  	setup_memslots(vm, p);
  	kvm_vm_elf_load(vm, program_invocation_name);
  	setup_ucall(vm);
diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index ea0ae7e25330..fd389663c49b 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -6,14 +6,6 @@
   */
  
  #define _GNU_SOURCE
-#include "test_util.h"
-#include "kvm_util_base.h"
-#include <linux/bitmap.h>
-#include <linux/falloc.h>
-#include <sys/mman.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-
  #include <stdlib.h>
  #include <string.h>
  #include <unistd.h>
@@ -21,6 +13,15 @@
  #include <stdio.h>
  #include <fcntl.h>
  
+#include <linux/bitmap.h>
+#include <linux/falloc.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+
+#include "test_util.h"
+#include "kvm_util_base.h"
+
  static void test_file_read_write(int fd)
  {
  	char buf[64];
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index e4d2cd9218b2..1b58f943562f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -819,6 +819,7 @@ static inline struct kvm_vm *vm_create_barebones(void)
  	return ____vm_create(VM_SHAPE_DEFAULT);
  }
  
+#ifdef __x86_64__
  static inline struct kvm_vm *vm_create_barebones_protected_vm(void)
  {
  	const struct vm_shape shape = {
@@ -828,6 +829,7 @@ static inline struct kvm_vm *vm_create_barebones_protected_vm(void)
  
  	return ____vm_create(shape);
  }
+#endif
  
  static inline struct kvm_vm *vm_create(uint32_t nr_runnable_vcpus)
  {
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index d05d95cc3693..9b29cbf49476 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1214,7 +1214,7 @@ void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t base, uint64_t size,
  		TEST_ASSERT(region && region->region.flags & KVM_MEM_GUEST_MEMFD,
  			    "Private memory region not found for GPA 0x%lx", gpa);
  
-		offset = (gpa - region->region.guest_phys_addr);
+		offset = gpa - region->region.guest_phys_addr;
  		fd_offset = region->region.guest_memfd_offset + offset;
  		len = min_t(uint64_t, end - gpa, region->region.memory_size - offset);
  
diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 343e807043e1..1efee1cfcff0 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -433,6 +433,7 @@ static void test_add_max_memory_regions(void)
  }
  
  
+#ifdef __x86_64__
  static void test_invalid_guest_memfd(struct kvm_vm *vm, int memfd,
  				     size_t offset, const char *msg)
  {
@@ -523,14 +524,13 @@ static void test_add_overlapping_private_memory_regions(void)
  	close(memfd);
  	kvm_vm_free(vm);
  }
+#endif
  
  int main(int argc, char *argv[])
  {
  #ifdef __x86_64__
  	int i, loops;
-#endif
  
-#ifdef __x86_64__
  	/*
  	 * FIXME: the zero-memslot test fails on aarch64 and s390x because
  	 * KVM_RUN fails with ENOEXEC or EFAULT.
@@ -542,6 +542,7 @@ int main(int argc, char *argv[])
  
  	test_add_max_memory_regions();
  
+#ifdef __x86_64__
  	if (kvm_has_cap(KVM_CAP_GUEST_MEMFD) &&
  	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
  		test_add_private_memory_region();
@@ -550,7 +551,6 @@ int main(int argc, char *argv[])
  		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
  	}
  
-#ifdef __x86_64__
  	if (argc > 1)
  		loops = atoi_positive("Number of iterations", argv[1]);
  	else
diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
index 2f02f6128482..13e72fcec8dd 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_kvm_exits_test.c
@@ -1,6 +1,6 @@
  // SPDX-License-Identifier: GPL-2.0-only
  /*
- * Copyright (C) 2022, Google LLC.
+ * Copyright (C) 2023, Google LLC.
   */
  #include <linux/kvm.h>
  #include <pthread.h>

Paolo


