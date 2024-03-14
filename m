From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:23 -0700
Subject: [PATCH 04/18] KVM: selftests: Fix off-by-one initialization of GDT limit
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-5-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ackerley Tng <ackerleytng@google.com>

Fix an off-by-one bug in the initialization of the GDT limit, which as
defined in the SDM is inclusive, not exclusive.

Note, vcpu_init_descriptor_tables() gets the limit correct, it's only
vcpu_setup() that is broken, i.e. only tests that _don't_ invoke
vcpu_init_descriptor_tables() can have problems.  And the fact that KVM
effectively initializes the GDT twice will be cleaned up in the near
future.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
[sean: rewrite changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index 45f965c052a1..eaeba907bb53 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -522,7 +522,7 @@ static void kvm_setup_gdt(struct kvm_vm *vm, struct kvm_dtable *dt)
 		vm->arch.gdt = __vm_vaddr_alloc_page(vm, MEM_REGION_DATA);
 
 	dt->base = vm->arch.gdt;
-	dt->limit = getpagesize();
+	dt->limit = getpagesize() - 1;
 }
 
 static void kvm_setup_tss_64bit(struct kvm_vm *vm, struct kvm_segment *segp,
-- 
2.44.0.291.gc1ea87d7ee-goog


