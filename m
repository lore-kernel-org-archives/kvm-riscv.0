From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:11 -0700
Subject: [RFC 43/48] RISC-V: Add base memory encryption functions.
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-44-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Devices like virtio use shared memory buffers to transfer
data. These buffers are part of the guest memory region.
For CoVE guest this is not possible as host can not access
guest memory.

This is solved by VIRTIO_F_ACCESS_PLATFORM feature and SWIOTLB
bounce buffers. Guest only allow devices with VIRTIO_F_ACCESS_PLATFORM
feature which leads to guest using DMA API and from there moving
to SWIOTLB bounce buffer due to SWIOTLB_FORCE flag set for TEE VM.

set_memory_encrypted and set_memory_decrypted sit in this allocation
path. Based on if a buffer is being decrypted we mark it shared and
if it's being encrypted we mark it unshared using hypercalls.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kconfig                   |  7 ++++
 arch/riscv/include/asm/mem_encrypt.h | 26 +++++++++++++
 arch/riscv/mm/Makefile               |  2 +
 arch/riscv/mm/init.c                 | 17 ++++++++-
 arch/riscv/mm/mem_encrypt.c          | 57 ++++++++++++++++++++++++++++
 5 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/mem_encrypt.h
 create mode 100644 arch/riscv/mm/mem_encrypt.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 49c3006..414cee1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -163,6 +163,11 @@ config ARCH_MMAP_RND_BITS_MAX
 config ARCH_MMAP_RND_COMPAT_BITS_MAX
 	default 17
 
+config RISCV_MEM_ENCRYPT
+	select ARCH_HAS_MEM_ENCRYPT
+	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
+	def_bool n
+
 # set if we run in machine mode, cleared if we run in supervisor mode
 config RISCV_M_MODE
 	bool
@@ -515,6 +520,8 @@ config RISCV_COVE_HOST
 config RISCV_COVE_GUEST
 	bool "Guest Support for Confidential VM Extension(CoVE)"
 	default n
+	select SWIOTLB
+	select RISCV_MEM_ENCRYPT
 	help
 	  Enables support for running TVMs on platforms supporting CoVE.
 
diff --git a/arch/riscv/include/asm/mem_encrypt.h b/arch/riscv/include/asm/mem_encrypt.h
new file mode 100644
index 0000000..0dc3fe8
--- /dev/null
+++ b/arch/riscv/include/asm/mem_encrypt.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RISCV Memory Encryption Support.
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#ifndef __RISCV_MEM_ENCRYPT_H__
+#define __RISCV_MEM_ENCRYPT_H__
+
+#include <linux/init.h>
+
+struct device;
+
+bool force_dma_unencrypted(struct device *dev);
+
+/* Architecture __weak replacement functions */
+void __init mem_encrypt_init(void);
+
+int set_memory_encrypted(unsigned long addr, int numpages);
+int set_memory_decrypted(unsigned long addr, int numpages);
+
+#endif /* __RISCV_MEM_ENCRYPT_H__ */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 2ac177c..1fd9b60 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -33,3 +33,5 @@ endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
 obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
+
+obj-$(CONFIG_RISCV_MEM_ENCRYPT)	+= mem_encrypt.o
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 478d676..b5edd8e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -21,6 +21,7 @@
 #include <linux/crash_dump.h>
 #include <linux/hugetlb.h>
 
+#include <asm/cove.h>
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
@@ -156,11 +157,25 @@ static void print_vm_layout(void) { }
 
 void __init mem_init(void)
 {
+	unsigned int flags = SWIOTLB_VERBOSE;
+	bool swiotlb_en;
+
+	if (is_cove_guest()) {
+		/* Since the guest memory is inaccessible to the host, devices
+		 * always need to use the SWIOTLB buffer for DMA even if
+		 * dma_capable() says otherwise.
+		 */
+		flags |= SWIOTLB_FORCE;
+		swiotlb_en = true;
+	} else {
+		swiotlb_en = !!(max_pfn > PFN_DOWN(dma32_phys_limit));
+	}
+
 #ifdef CONFIG_FLATMEM
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
 
-	swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOSE);
+	swiotlb_init(swiotlb_en, flags);
 	memblock_free_all();
 
 	print_vm_layout();
diff --git a/arch/riscv/mm/mem_encrypt.c b/arch/riscv/mm/mem_encrypt.c
new file mode 100644
index 0000000..8207a5c
--- /dev/null
+++ b/arch/riscv/mm/mem_encrypt.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/dma-direct.h>
+#include <linux/swiotlb.h>
+#include <linux/cc_platform.h>
+#include <linux/mem_encrypt.h>
+#include <asm/covg_sbi.h>
+
+/* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
+bool force_dma_unencrypted(struct device *dev)
+{
+	/*
+	 * For authorized devices in trusted guest, all DMA must be to/from
+	 * unencrypted addresses.
+	 */
+	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+}
+
+int set_memory_encrypted(unsigned long addr, int numpages)
+{
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return 0;
+
+	if (!PAGE_ALIGNED(addr))
+		return -EINVAL;
+
+	return sbi_covg_unshare_memory(__pa(addr), numpages * PAGE_SIZE);
+}
+EXPORT_SYMBOL_GPL(set_memory_encrypted);
+
+int set_memory_decrypted(unsigned long addr, int numpages)
+{
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return 0;
+
+	if (!PAGE_ALIGNED(addr))
+		return -EINVAL;
+
+	return sbi_covg_share_memory(__pa(addr), numpages * PAGE_SIZE);
+}
+EXPORT_SYMBOL_GPL(set_memory_decrypted);
+
+/* Architecture __weak replacement functions */
+void __init mem_encrypt_init(void)
+{
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return;
+
+	/* Call into SWIOTLB to update the SWIOTLB DMA buffers */
+	swiotlb_update_mem_attributes();
+}
-- 
2.25.1


