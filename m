From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:29 -0700
Subject: [RFC 01/48] mm/vmalloc: Introduce arch hooks to notify ioremap/unmap changes
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-2-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

In virtualization, the guest may need notify the host about the ioremap
regions. This is a common usecase in confidential computing where the
host only provides MMIO emulation for the regions specified by the guest.

Add a pair if arch specific callbacks to track the ioremapped regions.

This patch is based on pkvm patches. A generic arch config can be added
similar to pkvm if this is going to be the final solution. The device
authorization/filtering approach is very different from this and we
may prefer that one as it provides more flexibility in terms of which
devices are allowed for the confidential guests.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 mm/vmalloc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index bef6cf2..023630e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -304,6 +304,14 @@ static int vmap_range_noflush(unsigned long addr, unsigned long end,
 	return err;
 }
 
+__weak void ioremap_phys_range_hook(phys_addr_t phys_addr, size_t size, pgprot_t prot)
+{
+}
+
+__weak void iounmap_phys_range_hook(phys_addr_t phys_addr, size_t size)
+{
+}
+
 int ioremap_page_range(unsigned long addr, unsigned long end,
 		phys_addr_t phys_addr, pgprot_t prot)
 {
@@ -315,6 +323,10 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
 	if (!err)
 		kmsan_ioremap_page_range(addr, end, phys_addr, prot,
 					 ioremap_max_page_shift);
+
+	if (!err)
+		ioremap_phys_range_hook(phys_addr, end - addr, prot);
+
 	return err;
 }
 
@@ -2772,6 +2784,10 @@ void vunmap(const void *addr)
 				addr);
 		return;
 	}
+
+	if (vm->flags & VM_IOREMAP)
+		iounmap_phys_range_hook(vm->phys_addr, get_vm_area_size(vm));
+
 	kfree(vm);
 }
 EXPORT_SYMBOL(vunmap);
-- 
2.25.1


