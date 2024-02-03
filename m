From: Sean Christopherson <seanjc@google.com>
Date: Fri,  2 Feb 2024 16:09:14 -0800
Subject: [PATCH v8 08/10] KVM: selftests: Add library for creating and
 interacting with SEV guests
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
References: <20240203000917.376631-1-seanjc@google.com>
Message-ID: <20240203000917.376631-9-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Peter Gonda <pgonda@google.com>

Add a library/APIs for creating and interfacing with SEV guests, all of
which need some amount of common functionality, e.g. an open file handle
for the SEV driver (/dev/sev), ioctl() wrappers to pass said file handle
to KVM, tracking of the C-bit, etc.

Add an x86-specific hook to initialize address properties, a.k.a. the
location of the C-bit.  An arch specific hook is rather gross, but x86
already has a dedicated #ifdef-protected kvm_get_cpu_address_width() hook,
i.e. the ugliest code already exists.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Originally-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../kvm/include/x86_64/kvm_util_arch.h        |   2 +
 .../selftests/kvm/include/x86_64/processor.h  |   8 ++
 .../selftests/kvm/include/x86_64/sev.h        | 110 +++++++++++++++
 tools/testing/selftests/kvm/lib/kvm_util.c    |   1 +
 .../selftests/kvm/lib/x86_64/processor.c      |  17 +++
 tools/testing/selftests/kvm/lib/x86_64/sev.c  | 128 ++++++++++++++++++
 7 files changed, 267 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/sev.h
 create mode 100644 tools/testing/selftests/kvm/lib/x86_64/sev.c

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index ce58098d80fd..169b6ee8f733 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -38,6 +38,7 @@ LIBKVM_x86_64 += lib/x86_64/hyperv.c
 LIBKVM_x86_64 += lib/x86_64/memstress.c
 LIBKVM_x86_64 += lib/x86_64/pmu.c
 LIBKVM_x86_64 += lib/x86_64/processor.c
+LIBKVM_x86_64 += lib/x86_64/sev.c
 LIBKVM_x86_64 += lib/x86_64/svm.c
 LIBKVM_x86_64 += lib/x86_64/ucall.c
 LIBKVM_x86_64 += lib/x86_64/vmx.c
diff --git a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
index 17bb38236d97..205ed788aeb8 100644
--- a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
@@ -8,6 +8,8 @@
 struct kvm_vm_arch {
 	uint64_t c_bit;
 	uint64_t s_bit;
+	int sev_fd;
+	bool is_pt_protected;
 };
 
 static inline bool __vm_arch_has_protected_memory(struct kvm_vm_arch *arch)
diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 0f4792083d01..3bd03b088dda 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -23,6 +23,12 @@
 extern bool host_cpu_is_intel;
 extern bool host_cpu_is_amd;
 
+enum vm_guest_x86_subtype {
+	VM_SUBTYPE_NONE = 0,
+	VM_SUBTYPE_SEV,
+	VM_SUBTYPE_SEV_ES,
+};
+
 /* Forced emulation prefix, used to invoke the emulator unconditionally. */
 #define KVM_FEP "ud2; .byte 'k', 'v', 'm';"
 
@@ -276,6 +282,7 @@ struct kvm_x86_cpu_property {
 #define X86_PROPERTY_MAX_EXT_LEAF		KVM_X86_CPU_PROPERTY(0x80000000, 0, EAX, 0, 31)
 #define X86_PROPERTY_MAX_PHY_ADDR		KVM_X86_CPU_PROPERTY(0x80000008, 0, EAX, 0, 7)
 #define X86_PROPERTY_MAX_VIRT_ADDR		KVM_X86_CPU_PROPERTY(0x80000008, 0, EAX, 8, 15)
+#define X86_PROPERTY_SEV_C_BIT			KVM_X86_CPU_PROPERTY(0x8000001F, 0, EBX, 0, 5)
 #define X86_PROPERTY_PHYS_ADDR_REDUCTION	KVM_X86_CPU_PROPERTY(0x8000001F, 0, EBX, 6, 11)
 
 #define X86_PROPERTY_MAX_CENTAUR_LEAF		KVM_X86_CPU_PROPERTY(0xC0000000, 0, EAX, 0, 31)
@@ -1093,6 +1100,7 @@ do {											\
 } while (0)
 
 void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits);
+void kvm_init_vm_address_properties(struct kvm_vm *vm);
 bool vm_is_unrestricted_guest(struct kvm_vm *vm);
 
 struct ex_regs {
diff --git a/tools/testing/selftests/kvm/include/x86_64/sev.h b/tools/testing/selftests/kvm/include/x86_64/sev.h
new file mode 100644
index 000000000000..262b16f574e9
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86_64/sev.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Helpers used for SEV guests
+ *
+ */
+#ifndef SELFTEST_KVM_SEV_H
+#define SELFTEST_KVM_SEV_H
+
+#include <stdint.h>
+#include <stdbool.h>
+
+#include "linux/psp-sev.h"
+
+#include "kvm_util.h"
+#include "svm_util.h"
+#include "processor.h"
+
+#define SEV_FW_REQ_VER_MAJOR 0
+#define SEV_FW_REQ_VER_MINOR 17
+
+enum sev_guest_state {
+	SEV_GUEST_STATE_UNINITIALIZED = 0,
+	SEV_GUEST_STATE_LAUNCH_UPDATE,
+	SEV_GUEST_STATE_LAUNCH_SECRET,
+	SEV_GUEST_STATE_RUNNING,
+};
+
+#define SEV_POLICY_NO_DBG	(1UL << 0)
+#define SEV_POLICY_ES		(1UL << 2)
+
+bool is_kvm_sev_supported(void);
+
+void sev_vm_launch(struct kvm_vm *vm, uint32_t policy);
+void sev_vm_launch_measure(struct kvm_vm *vm, uint8_t *measurement);
+void sev_vm_launch_finish(struct kvm_vm *vm);
+
+struct kvm_vm *vm_sev_create_with_one_vcpu(uint32_t policy, void *guest_code,
+					   struct kvm_vcpu **cpu);
+
+kvm_static_assert(SEV_RET_SUCCESS == 0);
+
+/*
+ * The KVM_MEMORY_ENCRYPT_OP uAPI is utter garbage and takes an "unsigned long"
+ * instead of a proper struct.  The size of the parameter is embedded in the
+ * ioctl number, i.e. is ABI and thus immutable.  Hack around the mess by
+ * creating an overlay to pass in an "unsigned long" without a cast (casting
+ * will make the compiler unhappy due to dereferencing an aliased pointer).
+ */
+#define __vm_sev_ioctl(vm, cmd, arg)					\
+({									\
+	int r;								\
+									\
+	union {								\
+		struct kvm_sev_cmd c;					\
+		unsigned long raw;					\
+	} sev_cmd = { .c = {						\
+		.id = (cmd),						\
+		.data = (uint64_t)(arg),				\
+		.sev_fd = (vm)->arch.sev_fd,				\
+	} };								\
+									\
+	r = __vm_ioctl(vm, KVM_MEMORY_ENCRYPT_OP, &sev_cmd.raw);	\
+	r ?: sev_cmd.c.error;						\
+})
+
+#define vm_sev_ioctl(vm, cmd, arg)					\
+({									\
+	int ret = __vm_sev_ioctl(vm, cmd, arg);				\
+									\
+	__TEST_ASSERT_VM_VCPU_IOCTL(!ret, #cmd,	ret, vm);		\
+})
+
+static inline void sev_vm_init(struct kvm_vm *vm)
+{
+	vm->arch.sev_fd = open_sev_dev_path_or_exit();
+
+	vm_sev_ioctl(vm, KVM_SEV_INIT, NULL);
+}
+
+
+static inline void sev_es_vm_init(struct kvm_vm *vm)
+{
+	vm->arch.sev_fd = open_sev_dev_path_or_exit();
+
+	vm_sev_ioctl(vm, KVM_SEV_ES_INIT, NULL);
+}
+
+static inline void sev_register_encrypted_memory(struct kvm_vm *vm,
+						 struct userspace_mem_region *region)
+{
+	struct kvm_enc_region range = {
+		.addr = region->region.userspace_addr,
+		.size = region->region.memory_size,
+	};
+
+	vm_ioctl(vm, KVM_MEMORY_ENCRYPT_REG_REGION, &range);
+}
+
+static inline void sev_launch_update_data(struct kvm_vm *vm, vm_paddr_t gpa,
+					  uint64_t size)
+{
+	struct kvm_sev_launch_update_data update_data = {
+		.uaddr = (unsigned long)addr_gpa2hva(vm, gpa),
+		.len = size,
+	};
+
+	vm_sev_ioctl(vm, KVM_SEV_LAUNCH_UPDATE_DATA, &update_data);
+}
+
+#endif /* SELFTEST_KVM_SEV_H */
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 19511137d1ae..b2262b5fad9e 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -317,6 +317,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 	case VM_MODE_PXXV48_4K:
 #ifdef __x86_64__
 		kvm_get_cpu_address_width(&vm->pa_bits, &vm->va_bits);
+		kvm_init_vm_address_properties(vm);
 		/*
 		 * Ignore KVM support for 5-level paging (vm->va_bits == 57),
 		 * it doesn't take effect unless a CR4.LA57 is set, which it
diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 6c1d2c0ec584..aa92220bf5da 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -9,6 +9,7 @@
 #include "test_util.h"
 #include "kvm_util.h"
 #include "processor.h"
+#include "sev.h"
 
 #ifndef NUM_INTERRUPTS
 #define NUM_INTERRUPTS 256
@@ -278,6 +279,9 @@ uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm, uint64_t vaddr,
 {
 	uint64_t *pml4e, *pdpe, *pde;
 
+	TEST_ASSERT(!vm->arch.is_pt_protected,
+		    "Walking page tables of protected guests is impossible");
+
 	TEST_ASSERT(*level >= PG_LEVEL_NONE && *level < PG_LEVEL_NUM,
 		    "Invalid PG_LEVEL_* '%d'", *level);
 
@@ -573,6 +577,11 @@ void kvm_arch_vm_post_create(struct kvm_vm *vm)
 	vm_create_irqchip(vm);
 	sync_global_to_guest(vm, host_cpu_is_intel);
 	sync_global_to_guest(vm, host_cpu_is_amd);
+
+	if (vm->subtype == VM_SUBTYPE_SEV)
+		sev_vm_init(vm);
+	else if (vm->subtype == VM_SUBTYPE_SEV_ES)
+		sev_es_vm_init(vm);
 }
 
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, uint32_t vcpu_id,
@@ -1063,6 +1072,14 @@ void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 	}
 }
 
+void kvm_init_vm_address_properties(struct kvm_vm *vm)
+{
+	if (vm->subtype == VM_SUBTYPE_SEV) {
+		vm->arch.c_bit = BIT_ULL(this_cpu_property(X86_PROPERTY_SEV_C_BIT));
+		vm->gpa_tag_mask = vm->arch.c_bit;
+	}
+}
+
 static void set_idt_entry(struct kvm_vm *vm, int vector, unsigned long addr,
 			  int dpl, unsigned short selector)
 {
diff --git a/tools/testing/selftests/kvm/lib/x86_64/sev.c b/tools/testing/selftests/kvm/lib/x86_64/sev.c
new file mode 100644
index 000000000000..f37b1a7247ad
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86_64/sev.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define _GNU_SOURCE /* for program_invocation_short_name */
+#include <stdint.h>
+#include <stdbool.h>
+
+#include "sev.h"
+
+bool is_kvm_sev_supported(void)
+{
+	int sev_fd = open_sev_dev_path_or_exit();
+	struct sev_user_data_status sev_status;
+
+	struct sev_issue_cmd arg = {
+		.cmd = SEV_PLATFORM_STATUS,
+		.data = (unsigned long)&sev_status,
+	};
+
+	kvm_ioctl(sev_fd, SEV_ISSUE_CMD, &arg);
+	close(sev_fd);
+
+	return sev_status.api_major > SEV_FW_REQ_VER_MAJOR ||
+	       (sev_status.api_major == SEV_FW_REQ_VER_MAJOR &&
+		sev_status.api_minor >= SEV_FW_REQ_VER_MINOR);
+}
+
+/*
+ * sparsebit_next_clear() can return 0 if [x, 2**64-1] are all set, and the
+ * -1 would then cause an underflow back to 2**64 - 1. This is expected and
+ * correct.
+ *
+ * If the last range in the sparsebit is [x, y] and we try to iterate,
+ * sparsebit_next_set() will return 0, and sparsebit_next_clear() will try
+ * and find the first range, but that's correct because the condition
+ * expression would cause us to quit the loop.
+ */
+static void encrypt_region(struct kvm_vm *vm, struct userspace_mem_region *region)
+{
+	const struct sparsebit *protected_phy_pages = region->protected_phy_pages;
+	const vm_paddr_t gpa_base = region->region.guest_phys_addr;
+	const sparsebit_idx_t lowest_page_in_region = gpa_base >> vm->page_shift;
+	sparsebit_idx_t i, j;
+
+	if (!sparsebit_any_set(protected_phy_pages))
+		return;
+
+	sev_register_encrypted_memory(vm, region);
+
+	sparsebit_for_each_set_range(protected_phy_pages, i, j) {
+		const uint64_t size = (j - i + 1) * vm->page_size;
+		const uint64_t offset = (i - lowest_page_in_region) * vm->page_size;
+
+		sev_launch_update_data(vm, gpa_base + offset, size);
+	}
+}
+
+void sev_vm_launch(struct kvm_vm *vm, uint32_t policy)
+{
+	struct kvm_sev_launch_start launch_start = {
+		.policy = policy,
+	};
+	struct userspace_mem_region *region;
+	struct kvm_sev_guest_status status;
+	int ctr;
+
+	vm_sev_ioctl(vm, KVM_SEV_LAUNCH_START, &launch_start);
+	vm_sev_ioctl(vm, KVM_SEV_GUEST_STATUS, &status);
+
+	TEST_ASSERT_EQ(status.policy, policy);
+	TEST_ASSERT_EQ(status.state, SEV_GUEST_STATE_LAUNCH_UPDATE);
+
+	hash_for_each(vm->regions.slot_hash, ctr, region, slot_node)
+		encrypt_region(vm, region);
+
+	vm->arch.is_pt_protected = true;
+}
+
+void sev_vm_launch_measure(struct kvm_vm *vm, uint8_t *measurement)
+{
+	struct kvm_sev_launch_measure launch_measure;
+	struct kvm_sev_guest_status guest_status;
+
+	launch_measure.len = 256;
+	launch_measure.uaddr = (__u64)measurement;
+	vm_sev_ioctl(vm, KVM_SEV_LAUNCH_MEASURE, &launch_measure);
+
+	vm_sev_ioctl(vm, KVM_SEV_GUEST_STATUS, &guest_status);
+	TEST_ASSERT_EQ(guest_status.state, SEV_GUEST_STATE_LAUNCH_SECRET);
+}
+
+void sev_vm_launch_finish(struct kvm_vm *vm)
+{
+	struct kvm_sev_guest_status status;
+
+	vm_sev_ioctl(vm, KVM_SEV_GUEST_STATUS, &status);
+	TEST_ASSERT(status.state == SEV_GUEST_STATE_LAUNCH_UPDATE ||
+		    status.state == SEV_GUEST_STATE_LAUNCH_SECRET,
+		    "Unexpected guest state: %d", status.state);
+
+	vm_sev_ioctl(vm, KVM_SEV_LAUNCH_FINISH, NULL);
+
+	vm_sev_ioctl(vm, KVM_SEV_GUEST_STATUS, &status);
+	TEST_ASSERT_EQ(status.state, SEV_GUEST_STATE_RUNNING);
+}
+
+struct kvm_vm *vm_sev_create_with_one_vcpu(uint32_t policy, void *guest_code,
+					   struct kvm_vcpu **cpu)
+{
+	struct vm_shape shape = {
+		.type = VM_TYPE_DEFAULT,
+		.mode = VM_MODE_DEFAULT,
+		.subtype = VM_SUBTYPE_SEV,
+	};
+	struct kvm_vm *vm;
+	struct kvm_vcpu *cpus[1];
+	uint8_t measurement[512];
+
+	vm = __vm_create_with_vcpus(shape, 1, 0, guest_code, cpus);
+	*cpu = cpus[0];
+
+	sev_vm_launch(vm, policy);
+
+	/* TODO: Validate the measurement is as expected. */
+	sev_vm_launch_measure(vm, measurement);
+
+	sev_vm_launch_finish(vm);
+
+	return vm;
+}
-- 
2.43.0.594.gd9cf4e227d-goog


