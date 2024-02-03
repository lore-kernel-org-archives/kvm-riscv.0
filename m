From: Sean Christopherson <seanjc@google.com>
Date: Fri,  2 Feb 2024 16:09:07 -0800
Subject: [PATCH v8 01/10] KVM: selftests: Extend VM creation's @shape to allow
 control of VM subtype
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
References: <20240203000917.376631-1-seanjc@google.com>
Message-ID: <20240203000917.376631-2-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Carve out space in the @shape passed to the various VM creation helpers to
allow using the shape to control the subtype of VM, e.g. to identify x86's
SEV VMs (which are "regular" VMs as far as KVM is concerned).

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>
Cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util_base.h | 9 +++++++--
 tools/testing/selftests/kvm/lib/kvm_util.c          | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index 070f250036fc..d9dc31af2f96 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -90,6 +90,7 @@ enum kvm_mem_region_type {
 struct kvm_vm {
 	int mode;
 	unsigned long type;
+	uint8_t subtype;
 	int kvm_fd;
 	int fd;
 	unsigned int pgtable_levels;
@@ -191,10 +192,14 @@ enum vm_guest_mode {
 };
 
 struct vm_shape {
-	enum vm_guest_mode mode;
-	unsigned int type;
+	uint32_t type;
+	uint8_t  mode;
+	uint8_t  subtype;
+	uint16_t padding;
 };
 
+kvm_static_assert(sizeof(struct vm_shape) == sizeof(uint64_t));
+
 #define VM_TYPE_DEFAULT			0
 
 #define VM_SHAPE(__mode)			\
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 4994afbdab40..a53caf81eb87 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -276,6 +276,7 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
 
 	vm->mode = shape.mode;
 	vm->type = shape.type;
+	vm->subtype = shape.subtype;
 
 	vm->pa_bits = vm_guest_mode_params[vm->mode].pa_bits;
 	vm->va_bits = vm_guest_mode_params[vm->mode].va_bits;
-- 
2.43.0.594.gd9cf4e227d-goog


