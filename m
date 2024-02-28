From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:27 +0100
Subject: [kvm-unit-tests PATCH 11/13] riscv: Enable EFI boot
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-26-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mimicking Arm's setup_efi() and duplicating some code from riscv's
setup(), add the EFI setup code needed to boot unit tests from EFI-
capable bootloaders. The selftest unit test can now be run with

  qemu-system-riscv64 \
    -nodefaults -nographic -serial mon:stdio \
    -accel tcg -cpu max \
    -machine virt,pflash0=pflash0 \
    -blockdev node-name=pflash0,driver=file,read-only=on,filename=RISCV_VIRT_CODE.fd \
    -smp 16 \
    -kernel riscv/selftest.efi \
    -initrd test-env \
    -append 'selftest.efi foo bar baz' \
    -machine acpi=off

where test-env has the environment variables
  $ cat test-env
  FOO=foo
  BAR=bar
  BAZ=baz

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/setup.h |  2 +-
 lib/riscv/setup.c     | 63 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/lib/riscv/asm/setup.h b/lib/riscv/asm/setup.h
index dfc8875fbb3b..7f81a705ca4f 100644
--- a/lib/riscv/asm/setup.h
+++ b/lib/riscv/asm/setup.h
@@ -14,7 +14,7 @@ void setup(const void *fdt, phys_addr_t freemem_start);
 
 #ifdef CONFIG_EFI
 #include <efi.h>
-static inline efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo) { return 0; }
+efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo);
 #endif
 
 #endif /* _ASMRISCV_SETUP_H_ */
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index f721d81192ac..7c681ea3a13c 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -213,3 +213,66 @@ void setup(const void *fdt, phys_addr_t freemem_start)
 
 	banner();
 }
+
+#ifdef CONFIG_EFI
+#include <efi.h>
+
+extern unsigned long exception_vectors;
+extern unsigned long boot_hartid;
+
+static efi_status_t efi_mem_init(efi_bootinfo_t *efi_bootinfo)
+{
+	struct mem_region *freemem_mr = NULL, *code, *data;
+	void *freemem;
+
+	memregions_init(riscv_mem_regions, NR_MEM_REGIONS);
+
+	memregions_efi_init(&efi_bootinfo->mem_map, &freemem_mr);
+	if (!freemem_mr)
+		return EFI_OUT_OF_RESOURCES;
+
+	memregions_split((unsigned long)&_etext, &code, &data);
+	assert(code && (code->flags & MR_F_CODE));
+	if (data)
+		data->flags &= ~MR_F_CODE;
+
+	for (struct mem_region *m = mem_regions; m->end; ++m)
+		assert(m == code || !(m->flags & MR_F_CODE));
+
+	freemem = (void *)PAGE_ALIGN(freemem_mr->start);
+
+	if (efi_bootinfo->fdt_valid)
+		freemem_push_fdt(&freemem, efi_bootinfo->fdt);
+
+	mmu_disable();
+	mem_allocator_init((unsigned long)freemem, freemem_mr->end);
+
+	return EFI_SUCCESS;
+}
+
+efi_status_t setup_efi(efi_bootinfo_t *efi_bootinfo)
+{
+	efi_status_t status;
+
+	csr_write(CSR_STVEC, (unsigned long)&exception_vectors);
+	csr_write(CSR_SSCRATCH, boot_hartid);
+
+	status = efi_mem_init(efi_bootinfo);
+	if (status != EFI_SUCCESS) {
+		printf("Failed to initialize memory\n");
+		return status;
+	}
+
+	cpu_init();
+	thread_info_init();
+	io_init();
+	initrd_setup();
+
+	if (!(auxinfo.flags & AUXINFO_MMU_OFF))
+		setup_vm();
+
+	banner();
+
+	return EFI_SUCCESS;
+}
+#endif /* CONFIG_EFI */
-- 
2.43.0


