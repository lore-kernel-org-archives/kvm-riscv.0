From: Anup Patel <anup.patel@wdc.com>
Date: Tue, 21 Dec 2021 18:26:17 +0530
Subject: [PATCH] KVM: selftests: Fix compile error for non-x86
 vm_compute_max_gfn()
Message-ID: <20211221125617.932371-1-anup.patel@wdc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The inline version of vm_compute_max_gfn() in kvm_util.h directly
access members of "struct kvm_vm" which causes compile errors for
non-x86 architectures because lib/elf.c includes "kvm_util.h" before
"kvm_util_internal.h".

This patch fixes above described compile error by converting inline
version of vm_compute_max_gfn() into a macro.

Fixes: c8cc43c1eae2 ("selftests: KVM: avoid failures due to reserved
HyperTransport region")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index da2b702da71a..2279e340ca58 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -74,10 +74,8 @@ enum vm_guest_mode {
 #if defined(__x86_64__)
 unsigned long vm_compute_max_gfn(struct kvm_vm *vm);
 #else
-static inline unsigned long vm_compute_max_gfn(struct kvm_vm *vm)
-{
-	return ((1ULL << vm->pa_bits) >> vm->page_shift) - 1;
-}
+#define vm_compute_max_gfn(vm) \
+	((unsigned long)(((1ULL << (vm)->pa_bits) >> (vm)->page_shift) - 1))
 #endif
 
 #define MIN_PAGE_SIZE		(1U << MIN_PAGE_SHIFT)
-- 
2.25.1


