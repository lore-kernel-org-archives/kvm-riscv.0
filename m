From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 15:44:56 +0200
Subject: [kvm-unit-tests PATCH v2 4/7] riscv: Track memory above 3G
In-Reply-To: <20240812134451.112498-9-andrew.jones@linux.dev>
References: <20240812134451.112498-9-andrew.jones@linux.dev>
Message-ID: <20240812134451.112498-13-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We chop the main memory region (which gets identity mapped) off at
the 3G boundary because the virtual memory allocator claims the 3G-4G
address range. Unit tests may want to be able to access the higher
memory, though, so keep track of it by putting it in its own memory
region. Since the test framework isn't using that memory region, flag
it as unused so unit tests will be confident that they can use the
memory for whatever they like.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/memregions.h  |  1 +
 lib/riscv/setup.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/lib/memregions.h b/lib/memregions.h
index 1600530ad7bf..04027f61b84c 100644
--- a/lib/memregions.h
+++ b/lib/memregions.h
@@ -10,6 +10,7 @@
 #define MR_F_CODE			BIT(1)
 #define MR_F_RESERVED			BIT(2)
 #define MR_F_PERSISTENT			BIT(3)
+#define MR_F_UNUSED			BIT(4)
 #define MR_F_UNKNOWN			BIT(31)
 
 struct mem_region {
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index 2c7792a5b0bd..35829309c13d 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -85,8 +85,9 @@ static void cpu_init(void)
 	cpu0_calls_idle = true;
 }
 
-static void mem_allocator_init(phys_addr_t freemem_start, phys_addr_t freemem_end)
+static void mem_allocator_init(struct mem_region *freemem, phys_addr_t freemem_start)
 {
+	phys_addr_t freemem_end = freemem->end;
 	phys_addr_t base, top;
 
 	freemem_start = PAGE_ALIGN(freemem_start);
@@ -100,8 +101,14 @@ static void mem_allocator_init(phys_addr_t freemem_start, phys_addr_t freemem_en
 	 *
 	 * TODO: Allow the VA range to shrink and move.
 	 */
-	if (freemem_end > VA_BASE)
+	if (freemem_end > VA_BASE) {
+		struct mem_region *curr, *rest;
 		freemem_end = VA_BASE;
+		memregions_split(VA_BASE, &curr, &rest);
+		assert(curr == freemem);
+		if (rest)
+			rest->flags = MR_F_UNUSED;
+	}
 	assert(freemem_end - freemem_start >= SZ_1M * 16);
 
 	init_alloc_vpage(__va(VA_TOP));
@@ -135,7 +142,7 @@ static void mem_init(phys_addr_t freemem_start)
 	freemem = memregions_find(freemem_start);
 	assert(freemem && !(freemem->flags & (MR_F_IO | MR_F_CODE)));
 
-	mem_allocator_init(freemem_start, freemem->end);
+	mem_allocator_init(freemem, freemem_start);
 }
 
 static void freemem_push_fdt(void **freemem, const void *fdt)
@@ -248,7 +255,7 @@ static efi_status_t efi_mem_init(efi_bootinfo_t *efi_bootinfo)
 		freemem_push_fdt(&freemem, efi_bootinfo->fdt);
 
 	mmu_disable();
-	mem_allocator_init((unsigned long)freemem, freemem_mr->end);
+	mem_allocator_init(freemem_mr, (unsigned long)freemem);
 
 	return EFI_SUCCESS;
 }
-- 
2.45.2


