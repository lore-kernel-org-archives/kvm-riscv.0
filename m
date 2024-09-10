From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:21:54 +0000
Subject: [PATCH 02/15] KVM: x86/mmu: Abort page walk if permission checks fail
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-3-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Abort the page walk, if permission checks fail on any page table level, by
moving the check to within the page walker loop. Currently, the page
walker only checks for access flags after successfully walking the entire
paging structure. This change is needed later to enable setting accessed
bits in each page table that was successfully visited, during a page walk
that ultimately failed.

As a result, error codes returned by the page walker may observe a change
in behaviour, specifically, the error code will be built as soon as an
access violation is found, meaning that for example, if an access
violation is detected on page level 4, the page walker will abort the walk
without looking at level 3 and below. However, since the error code
returned is built from the passed access requirements, regardless of the
actual cause of the failure, it will only be different if there is an
access violation in one level and a PKRU violation in a lower one.

Previously the error code would include this PKRU violation, whereas now
it does not, which is still in line with the behaviour specified in
Intel's SDM. The exact procedure to test for violations is currently not
specified in the SDM, but aborting the page walk early seems to be a
reasonable implementation detail. As KVM does not read the PK bit
anywhere, this only results in a different page-fault error codes for
guests.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index ae7d39ff2d07..d9c3c78b3c14 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -422,6 +422,12 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 			goto error;
 		}
 
+		/* Convert to ACC_*_MASK flags for struct guest_walker.  */
+		walker->pte_access = FNAME(gpte_access)(pte_access ^ walk_nx_mask);
+		errcode = permission_fault(vcpu, mmu, walker->pte_access, pte_pkey, access);
+		if (unlikely(errcode))
+			goto error;
+
 		walker->ptes[walker->level - 1] = pte;
 
 		/* Convert to ACC_*_MASK flags for struct guest_walker.  */
@@ -431,12 +437,6 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 	pte_pkey = FNAME(gpte_pkeys)(vcpu, pte);
 	accessed_dirty = have_ad ? pte_access & PT_GUEST_ACCESSED_MASK : 0;
 
-	/* Convert to ACC_*_MASK flags for struct guest_walker.  */
-	walker->pte_access = FNAME(gpte_access)(pte_access ^ walk_nx_mask);
-	errcode = permission_fault(vcpu, mmu, walker->pte_access, pte_pkey, access);
-	if (unlikely(errcode))
-		goto error;
-
 	gfn = gpte_to_gfn_lvl(pte, walker->level);
 	gfn += (addr & PT_LVL_OFFSET_MASK(walker->level)) >> PAGE_SHIFT;
 
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


