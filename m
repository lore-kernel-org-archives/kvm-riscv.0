From: Sean Christopherson <seanjc@google.com>
Date: Thu, 14 Mar 2024 16:26:26 -0700
Subject: [PATCH 07/18] KVM: selftests: Explicitly clobber the IDT in the
 "delete memslot" testcase
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
References: <20240314232637.2538648-1-seanjc@google.com>
Message-ID: <20240314232637.2538648-8-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Explicitly clobber the guest IDT in the "delete memslot" test, which
expects the deleted memslot to result in either a KVM emulation error, or
a triple fault shutdown.  A future change to the core selftests library
will configuring the guest IDT and exception handlers by default, i.e.
will install a guest #PF handler and put the guest into an infinite #NPF
loop (the guest hits a !PRESENT SPTE when trying to vector a #PF, and KVM
reinjects the #PF without fixing the #NPF, because there is no memslot).

Note, it's not clear whether or not KVM's behavior is reasonable in this
case, e.g. arguably KVM should try (and fail) to emulate in response to
the #NPF.  But barring a goofy/broken userspace, this scenario will likely
never happen in practice.  Punt the KVM investigation to the future.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 06b43ed23580..9b814ea16eb4 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -221,8 +221,20 @@ static void test_move_memory_region(void)
 
 static void guest_code_delete_memory_region(void)
 {
+	struct desc_ptr idt;
 	uint64_t val;
 
+	/*
+	 * Clobber the IDT so that a #PF due to the memory region being deleted
+	 * escalates to triple-fault shutdown.  Because the memory region is
+	 * deleted, there will be no valid mappings.  As a result, KVM will
+	 * repeatedly intercepts the state-2 page fault that occurs when trying
+	 * to vector the guest's #PF.  I.e. trying to actually handle the #PF
+	 * in the guest will never succeed, and so isn't an option.
+	 */
+	memset(&idt, 0, sizeof(idt));
+	__asm__ __volatile__("lidt %0" :: "m"(idt));
+
 	GUEST_SYNC(0);
 
 	/* Spin until the memory region is deleted. */
-- 
2.44.0.291.gc1ea87d7ee-goog


