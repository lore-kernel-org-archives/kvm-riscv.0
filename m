From: Ackerley Tng <ackerleytng@google.com>
Date: Mon, 07 Aug 2023 23:25:02 +0000
Subject: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
In-Reply-To: <20230718234512.1690985-29-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:45:11 -0700)
Message-ID: <diqzleem306p.fsf@ackerleytng-ctop.c.googlers.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sean Christopherson <seanjc@google.com> writes:

> Add a selftest to verify the basic functionality of guest_memfd():
>
> <snip>

Here's one more test:

From 72dc6836f01bdd613d64d4c6a4f2af8f2b777ba2 Mon Sep 17 00:00:00 2001
From: Ackerley Tng <ackerleytng@google.com>
Date: Tue, 1 Aug 2023 18:02:50 +0000
Subject: [PATCH] KVM: selftests: Add tests - invalid inputs for
 KVM_CREATE_GUEST_MEMFD

Test that invalid inputs for KVM_CREATE_GUEST_MEMFD, such as
non-page-aligned page size and invalid flags, are rejected by the
KVM_CREATE_GUEST_MEMFD with EINVAL

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/guest_memfd_test.c  | 17 +++++++++++++++++
 .../selftests/kvm/include/kvm_util_base.h       | 11 +++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index eb93c608a7e0..ad20f11b2d2c 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -90,6 +90,21 @@ static void test_fallocate(int fd, size_t page_size, size_t total_size)
 	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
 }
 
+static void test_create_guest_memfd_invalid(struct kvm_vm *vm, size_t page_size)
+{
+	int fd;
+
+	/* Non-page-aligned page_size */
+	fd = __vm_create_guest_memfd(vm, 1, 0);
+	ASSERT_EQ(fd, -1);
+	ASSERT_EQ(errno, EINVAL);
+
+	/* Invalid flags */
+	fd = __vm_create_guest_memfd(vm, page_size, 99);
+	ASSERT_EQ(fd, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
 
 int main(int argc, char *argv[])
 {
@@ -103,6 +118,8 @@ int main(int argc, char *argv[])
 
 	vm = vm_create_barebones();
 
+	test_create_guest_memfd_invalid(vm, page_size);
+
 	fd = vm_create_guest_memfd(vm, total_size, 0);
 
 	test_file_read_write(fd);
diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 39b38c75b99c..8bdfadd72349 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -474,7 +474,8 @@ static inline uint64_t vm_get_stat(struct kvm_vm *vm, const char *stat_name)
 }
 
 void vm_create_irqchip(struct kvm_vm *vm);
-static inline int vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
+
+static inline int __vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
 					uint64_t flags)
 {
 	struct kvm_create_guest_memfd gmem = {
@@ -482,7 +483,13 @@ static inline int vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
 		.flags = flags,
 	};
 
-	int fd = __vm_ioctl(vm, KVM_CREATE_GUEST_MEMFD, &gmem);
+	return __vm_ioctl(vm, KVM_CREATE_GUEST_MEMFD, &gmem);
+}
+
+static inline int vm_create_guest_memfd(struct kvm_vm *vm, uint64_t size,
+					uint64_t flags)
+{
+	int fd = __vm_create_guest_memfd(vm, size, flags);
 
 	TEST_ASSERT(fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_GUEST_MEMFD, fd));
 	return fd;
-- 
2.41.0.640.ga95def55d0-goog


