From: Sean Christopherson <seanjc@google.com>
Date: Fri,  2 Feb 2024 16:09:11 -0800
Subject: [PATCH v8 05/10] KVM: selftests: Add support for protected vm_vaddr_* allocations
In-Reply-To: <20240203000917.376631-1-seanjc@google.com>
References: <20240203000917.376631-1-seanjc@google.com>
Message-ID: <20240203000917.376631-6-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Michael Roth <michael.roth@amd.com>

Test programs may wish to allocate shared vaddrs for things like
sharing memory with the guest. Since protected vms will have their
memory encrypted by default an interface is needed to explicitly
request shared pages.

Implement this by splitting the common code out from vm_vaddr_alloc()
and introducing a new vm_vaddr_alloc_shared().

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Cc: Ackerly Tng <ackerleytng@google.com>
cc: Andrew Jones <andrew.jones@linux.dev>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Michael Roth <michael.roth@amd.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Peter Gonda <pgonda@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  3 +++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 26 +++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index a82149305349..cb3159af6db3 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -590,6 +590,9 @@ vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_mi
 vm_vaddr_t vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min);
 vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
 			    enum kvm_mem_region_type type);
+vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
+				 vm_vaddr_t vaddr_min,
+				 enum kvm_mem_region_type type);
 vm_vaddr_t vm_vaddr_alloc_pages(struct kvm_vm *vm, int nr_pages);
 vm_vaddr_t __vm_vaddr_alloc_page(struct kvm_vm *vm,
 				 enum kvm_mem_region_type type);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index ea677aa019ef..e7f4f84f2e68 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1431,15 +1431,17 @@ vm_vaddr_t vm_vaddr_unused_gap(struct kvm_vm *vm, size_t sz,
 	return pgidx_start * vm->page_size;
 }
 
-vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
-			    enum kvm_mem_region_type type)
+static vm_vaddr_t ____vm_vaddr_alloc(struct kvm_vm *vm, size_t sz,
+				     vm_vaddr_t vaddr_min,
+				     enum kvm_mem_region_type type,
+				     bool protected)
 {
 	uint64_t pages = (sz >> vm->page_shift) + ((sz % vm->page_size) != 0);
 
 	virt_pgd_alloc(vm);
-	vm_paddr_t paddr = vm_phy_pages_alloc(vm, pages,
-					      KVM_UTIL_MIN_PFN * vm->page_size,
-					      vm->memslots[type]);
+	vm_paddr_t paddr = __vm_phy_pages_alloc(vm, pages,
+						KVM_UTIL_MIN_PFN * vm->page_size,
+						vm->memslots[type], protected);
 
 	/*
 	 * Find an unused range of virtual page addresses of at least
@@ -1459,6 +1461,20 @@ vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
 	return vaddr_start;
 }
 
+vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
+			    enum kvm_mem_region_type type)
+{
+	return ____vm_vaddr_alloc(vm, sz, vaddr_min, type,
+				  vm_arch_has_protected_memory(vm));
+}
+
+vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
+				 vm_vaddr_t vaddr_min,
+				 enum kvm_mem_region_type type)
+{
+	return ____vm_vaddr_alloc(vm, sz, vaddr_min, type, false);
+}
+
 /*
  * VM Virtual Address Allocate
  *
-- 
2.43.0.594.gd9cf4e227d-goog


