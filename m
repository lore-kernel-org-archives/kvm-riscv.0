From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:21:58 +0000
Subject: [PATCH 06/15] KVM: x86/mmu: Implement PWALK_SET_ACCESSED in page walker
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-7-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement PWALK_SET_ACCESSED in the page walker. This flag allows
controling whether the page walker will set the accessed bits after a
successful page walk in all page table levels. If the page walk is aborted
for any reason, none of the access bits are set.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index c278b83b023f..eed6e2c653ba 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -317,6 +317,7 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 	const int write_fault = access & PFERR_WRITE_MASK;
 	const int user_fault  = access & PFERR_USER_MASK;
 	const int fetch_fault = access & PFERR_FETCH_MASK;
+	const int set_accessed = flags & PWALK_SET_ACCESSED;
 	u16 errcode = 0;
 	gpa_t real_gpa;
 	gfn_t gfn;
@@ -468,7 +469,7 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 		accessed_dirty &= pte >>
 			(PT_GUEST_DIRTY_SHIFT - PT_GUEST_ACCESSED_SHIFT);
 
-	if (unlikely(!accessed_dirty)) {
+	if (unlikely(set_accessed && !accessed_dirty)) {
 		ret = FNAME(update_accessed_dirty_bits)(vcpu, mmu, walker, addr,
 							write_fault);
 		if (unlikely(ret < 0))
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


