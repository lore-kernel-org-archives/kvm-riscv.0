From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  5 Apr 2024 07:58:15 -0400
Subject: [PATCH 4/4] mm: replace set_pte_at_notify() with just set_pte_at()
In-Reply-To: <20240405115815.3226315-1-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
Message-ID: <20240405115815.3226315-5-pbonzini@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the demise of the .change_pte() MMU notifier callback, there is no
notification happening in set_pte_at_notify().  It is a synonym of
set_pte_at() and can be replaced with it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/mmu_notifier.h | 2 --
 kernel/events/uprobes.c      | 5 ++---
 mm/ksm.c                     | 4 ++--
 mm/memory.c                  | 7 +------
 mm/migrate_device.c          | 8 ++------
 5 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 8c72bf651606..d39ebb10caeb 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -657,6 +657,4 @@ static inline void mmu_notifier_synchronize(void)
 
 #endif /* CONFIG_MMU_NOTIFIER */
 
-#define set_pte_at_notify set_pte_at
-
 #endif /* _LINUX_MMU_NOTIFIER_H */
diff --git a/kernel/events/uprobes.c b/kernel/events/uprobes.c
index e4834d23e1d1..f4523b95c945 100644
--- a/kernel/events/uprobes.c
+++ b/kernel/events/uprobes.c
@@ -18,7 +18,6 @@
 #include <linux/sched/coredump.h>
 #include <linux/export.h>
 #include <linux/rmap.h>		/* anon_vma_prepare */
-#include <linux/mmu_notifier.h>	/* set_pte_at_notify */
 #include <linux/swap.h>		/* folio_free_swap */
 #include <linux/ptrace.h>	/* user_enable_single_step */
 #include <linux/kdebug.h>	/* notifier mechanism */
@@ -195,8 +194,8 @@ static int __replace_page(struct vm_area_struct *vma, unsigned long addr,
 	flush_cache_page(vma, addr, pte_pfn(ptep_get(pvmw.pte)));
 	ptep_clear_flush(vma, addr, pvmw.pte);
 	if (new_page)
-		set_pte_at_notify(mm, addr, pvmw.pte,
-				  mk_pte(new_page, vma->vm_page_prot));
+		set_pte_at(mm, addr, pvmw.pte,
+			   mk_pte(new_page, vma->vm_page_prot));
 
 	folio_remove_rmap_pte(old_folio, old_page, vma);
 	if (!folio_mapped(old_folio))
diff --git a/mm/ksm.c b/mm/ksm.c
index 8c001819cf10..108a4d167824 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1345,7 +1345,7 @@ static int write_protect_page(struct vm_area_struct *vma, struct page *page,
 		if (pte_write(entry))
 			entry = pte_wrprotect(entry);
 
-		set_pte_at_notify(mm, pvmw.address, pvmw.pte, entry);
+		set_pte_at(mm, pvmw.address, pvmw.pte, entry);
 	}
 	*orig_pte = entry;
 	err = 0;
@@ -1447,7 +1447,7 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
 	 * See Documentation/mm/mmu_notifier.rst
 	 */
 	ptep_clear_flush(vma, addr, ptep);
-	set_pte_at_notify(mm, addr, ptep, newpte);
+	set_pte_at(mm, addr, ptep, newpte);
 
 	folio = page_folio(page);
 	folio_remove_rmap_pte(folio, page, vma);
diff --git a/mm/memory.c b/mm/memory.c
index f2bc6dd15eb8..9a6f4d8aa379 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3327,13 +3327,8 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		ptep_clear_flush(vma, vmf->address, vmf->pte);
 		folio_add_new_anon_rmap(new_folio, vma, vmf->address);
 		folio_add_lru_vma(new_folio, vma);
-		/*
-		 * We call the notify macro here because, when using secondary
-		 * mmu page tables (such as kvm shadow page tables), we want the
-		 * new page to be mapped directly into the secondary page table.
-		 */
 		BUG_ON(unshare && pte_write(entry));
-		set_pte_at_notify(mm, vmf->address, vmf->pte, entry);
+		set_pte_at(mm, vmf->address, vmf->pte, entry);
 		update_mmu_cache_range(vmf, vma, vmf->address, vmf->pte, 1);
 		if (old_folio) {
 			/*
diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index b6c27c76e1a0..66206734b1b9 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -664,13 +664,9 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	if (flush) {
 		flush_cache_page(vma, addr, pte_pfn(orig_pte));
 		ptep_clear_flush(vma, addr, ptep);
-		set_pte_at_notify(mm, addr, ptep, entry);
-		update_mmu_cache(vma, addr, ptep);
-	} else {
-		/* No need to invalidate - it was non-present before */
-		set_pte_at(mm, addr, ptep, entry);
-		update_mmu_cache(vma, addr, ptep);
 	}
+	set_pte_at(mm, addr, ptep, entry);
+	update_mmu_cache(vma, addr, ptep);
 
 	pte_unmap_unlock(ptep, ptl);
 	*src = MIGRATE_PFN_MIGRATE;
-- 
2.43.0


