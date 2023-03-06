From: David Matlack <dmatlack@google.com>
Date: Mon,  6 Mar 2023 11:01:56 -0800
Subject: [PATCH v2 4/4] KVM: x86: Drop union for pages_{4k,2m,1g} stats
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
References: <20230306190156.434452-1-dmatlack@google.com>
Message-ID: <20230306190156.434452-5-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop the union for the pages_{4k,2m,1g} stats. The union is no longer
necessary now that KVM supports choosing a custom name for stats.

Eliminating the union also would allow future commits to more easily
move pages[] into common code, e.g. if KVM ever gains support for a
common page table code.

An alternative would be to drop pages[] and have kvm_update_page_stats()
update pages_{4k,2m,1g} directly. But that's not a good direction to go
in since other architectures use other page sizes.

No functional change intended.

Link: https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack at google.com/
Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/include/asm/kvm_host.h | 9 +--------
 arch/x86/kvm/x86.c              | 6 +++---
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 808c292ad3f4..a59e41355ef4 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1473,14 +1473,7 @@ struct kvm_vm_stat {
 	u64 mmu_recycled;
 	u64 mmu_cache_miss;
 	u64 mmu_unsync;
-	union {
-		struct {
-			atomic64_t pages_4k;
-			atomic64_t pages_2m;
-			atomic64_t pages_1g;
-		};
-		atomic64_t pages[KVM_NR_PAGE_SIZES];
-	};
+	atomic64_t pages[KVM_NR_PAGE_SIZES];
 	u64 nx_lpage_splits;
 	u64 max_mmu_page_hash_collisions;
 	u64 max_mmu_rmap_size;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 072f5ba83170..101ad6b7e7b6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -240,9 +240,9 @@ const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_STAT(VM, CUMULATIVE, NONE, mmu_recycled),
 	KVM_STAT(VM, CUMULATIVE, NONE, mmu_cache_miss),
 	KVM_STAT(VM, INSTANT, NONE, mmu_unsync),
-	KVM_STAT(VM, INSTANT, NONE, pages_4k),
-	KVM_STAT(VM, INSTANT, NONE, pages_2m),
-	KVM_STAT(VM, INSTANT, NONE, pages_1g),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_4K - 1], "pages_4k"),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_2M - 1], "pages_2m"),
+	__KVM_STAT(VM, INSTANT, NONE, pages[PG_LEVEL_1G - 1], "pages_1g"),
 	KVM_STAT(VM, INSTANT, NONE, nx_lpage_splits),
 	KVM_STAT(VM, PEAK, NONE, max_mmu_rmap_size),
 	KVM_STAT(VM, PEAK, NONE, max_mmu_page_hash_collisions)
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


