From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:22:00 +0000
Subject: [PATCH 08/15] KVM: x86/mmu: Implement PWALK_FORCE_SET_ACCESSED in page walker
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-9-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement PWALK_FORCE_SET_ACCESSED in the page walker. This flag forces
the page walker to set the accessed flag in all successfully visited page
table levels, regardless of the outcome of the page walk.

For example, if the page walk fails on level 2, the accessed bit will
still be set on levels 3 and up.

If the nested translations of GPAs fail, the bits will still be set.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/mmu/paging_tmpl.h  | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 3acf0b069693..cd2c391d6a24 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -287,6 +287,7 @@ enum x86_intercept_stage;
 
 #define PWALK_SET_ACCESSED	BIT(0)
 #define PWALK_SET_DIRTY	BIT(1)
+#define PWALK_FORCE_SET_ACCESSED	BIT(2)
 #define PWALK_SET_ALL	(PWALK_SET_ACCESSED | PWALK_SET_DIRTY)
 
 /* apic attention bits */
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index b6897f7fbf52..2cc40fd17f53 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -319,6 +319,7 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 	const int fetch_fault = access & PFERR_FETCH_MASK;
 	const int set_accessed = flags & PWALK_SET_ACCESSED;
 	const int set_dirty = flags & PWALK_SET_DIRTY;
+	const int force_set = flags & PWALK_FORCE_SET_ACCESSED;
 	u16 errcode = 0;
 	gpa_t real_gpa;
 	gfn_t gfn;
@@ -395,7 +396,7 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 		 * fields.
 		 */
 		if (unlikely(real_gpa == INVALID_GPA))
-			return 0;
+			goto late_exit;
 
 		slot = kvm_vcpu_gfn_to_memslot(vcpu, gpa_to_gfn(real_gpa));
 		if (!kvm_is_visible_memslot(slot)) {
@@ -455,7 +456,7 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 	real_gpa = kvm_translate_gpa(vcpu, mmu, gfn_to_gpa(gfn), access,
 								 flags, &walker->fault);
 	if (real_gpa == INVALID_GPA)
-		return 0;
+		goto late_exit;
 
 	walker->gfn = real_gpa >> PAGE_SHIFT;
 
@@ -528,6 +529,18 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 	walker->fault.async_page_fault = false;
 
 	trace_kvm_mmu_walker_error(walker->fault.error_code);
+
+late_exit:
+	if (force_set) {
+		/*
+		 * Don't set the accessed bit for the page table that caused the
+		 * walk to fail.
+		 */
+		++walker->level;
+		FNAME(update_accessed_dirty_bits)(vcpu, mmu, walker, addr,
+		 false);
+		--walker->level;
+	}
 	return 0;
 }
 
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


