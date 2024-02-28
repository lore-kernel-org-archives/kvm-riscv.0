From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:26 +0100
Subject: [kvm-unit-tests PATCH 10/13] riscv: Refactor setup code
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-25-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

To prepare for EFI setup, move code that will be shared into
functions. This is the same type of code and the exact same function
names which were created when refactoring Arm's EFI setup, so riscv
setup is still following Arm's setup patterns.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/setup.c | 109 +++++++++++++++++++++++++++++-----------------
 1 file changed, 68 insertions(+), 41 deletions(-)

diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index 40ff26a24cfc..f721d81192ac 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -31,6 +31,8 @@
 #define MAX_DT_MEM_REGIONS	16
 #define NR_MEM_REGIONS		(MAX_DT_MEM_REGIONS + 16)
 
+extern unsigned long _etext;
+
 char *initrd;
 u32 initrd_size;
 
@@ -81,25 +83,12 @@ static void cpu_init(void)
 	cpu0_calls_idle = true;
 }
 
-extern unsigned long _etext;
-
-static void mem_init(phys_addr_t freemem_start)
+static void mem_allocator_init(phys_addr_t freemem_start, phys_addr_t freemem_end)
 {
-	struct mem_region *freemem, *code, *data;
-	phys_addr_t freemem_end, base, top;
-
-	memregions_init(riscv_mem_regions, NR_MEM_REGIONS);
-	memregions_add_dt_regions(MAX_DT_MEM_REGIONS);
+	phys_addr_t base, top;
 
-	/* Split the region with the code into two regions; code and data */
-	memregions_split((unsigned long)&_etext, &code, &data);
-	assert(code);
-	code->flags |= MR_F_CODE;
-
-	freemem = memregions_find(freemem_start);
-	assert(freemem && !(freemem->flags & (MR_F_IO | MR_F_CODE)));
-
-	freemem_end = freemem->end & PAGE_MASK;
+	freemem_start = PAGE_ALIGN(freemem_start);
+	freemem_end &= PAGE_MASK;
 
 	/*
 	 * The assert below is mostly checking that the free memory doesn't
@@ -129,6 +118,64 @@ static void mem_init(phys_addr_t freemem_start)
 	page_alloc_ops_enable();
 }
 
+static void mem_init(phys_addr_t freemem_start)
+{
+	struct mem_region *freemem, *code, *data;
+
+	memregions_init(riscv_mem_regions, NR_MEM_REGIONS);
+	memregions_add_dt_regions(MAX_DT_MEM_REGIONS);
+
+	/* Split the region with the code into two regions; code and data */
+	memregions_split((unsigned long)&_etext, &code, &data);
+	assert(code);
+	code->flags |= MR_F_CODE;
+
+	freemem = memregions_find(freemem_start);
+	assert(freemem && !(freemem->flags & (MR_F_IO | MR_F_CODE)));
+
+	mem_allocator_init(freemem_start, freemem->end);
+}
+
+static void freemem_push_fdt(void **freemem, const void *fdt)
+{
+	u32 fdt_size;
+	int ret;
+
+	fdt_size = fdt_totalsize(fdt);
+	ret = fdt_move(fdt, *freemem, fdt_size);
+	assert(ret == 0);
+	ret = dt_init(*freemem);
+	assert(ret == 0);
+	*freemem += fdt_size;
+}
+
+static void freemem_push_dt_initrd(void **freemem)
+{
+	const char *tmp;
+	int ret;
+
+	ret = dt_get_initrd(&tmp, &initrd_size);
+	assert(ret == 0 || ret == -FDT_ERR_NOTFOUND);
+	if (ret == 0) {
+		initrd = *freemem;
+		memmove(initrd, tmp, initrd_size);
+		*freemem += initrd_size;
+	}
+}
+
+static void initrd_setup(void)
+{
+	char *env;
+
+	if (!initrd)
+		return;
+
+	/* environ is currently the only file in the initrd */
+	env = malloc(initrd_size);
+	memcpy(env, initrd, initrd_size);
+	setup_env(env, initrd_size);
+}
+
 static void banner(void)
 {
 	puts("\n");
@@ -141,29 +188,14 @@ static void banner(void)
 void setup(const void *fdt, phys_addr_t freemem_start)
 {
 	void *freemem;
-	const char *bootargs, *tmp;
-	u32 fdt_size;
+	const char *bootargs;
 	int ret;
 
 	assert(sizeof(long) == 8 || freemem_start < VA_BASE);
 	freemem = __va(freemem_start);
 
-	/* Move the FDT to the base of free memory */
-	fdt_size = fdt_totalsize(fdt);
-	ret = fdt_move(fdt, freemem, fdt_size);
-	assert(ret == 0);
-	ret = dt_init(freemem);
-	assert(ret == 0);
-	freemem += fdt_size;
-
-	/* Move the initrd to the top of the FDT */
-	ret = dt_get_initrd(&tmp, &initrd_size);
-	assert(ret == 0 || ret == -FDT_ERR_NOTFOUND);
-	if (ret == 0) {
-		initrd = freemem;
-		memmove(initrd, tmp, initrd_size);
-		freemem += initrd_size;
-	}
+	freemem_push_fdt(&freemem, fdt);
+	freemem_push_dt_initrd(&freemem);
 
 	mem_init(PAGE_ALIGN(__pa(freemem)));
 	cpu_init();
@@ -174,12 +206,7 @@ void setup(const void *fdt, phys_addr_t freemem_start)
 	assert(ret == 0 || ret == -FDT_ERR_NOTFOUND);
 	setup_args_progname(bootargs);
 
-	if (initrd) {
-		/* environ is currently the only file in the initrd */
-		char *env = malloc(initrd_size);
-		memcpy(env, initrd, initrd_size);
-		setup_env(env, initrd_size);
-	}
+	initrd_setup();
 
 	if (!(auxinfo.flags & AUXINFO_MMU_OFF))
 		setup_vm();
-- 
2.43.0


