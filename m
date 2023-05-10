From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 10 May 2023 14:07:48 +0530
Subject: [PATCH kvmtool 8/8] riscv: Fix guest RAM alloc size computation for RV32
In-Reply-To: <20230510083748.1056704-1-apatel@ventanamicro.com>
References: <20230510083748.1056704-1-apatel@ventanamicro.com>
Message-ID: <20230510083748.1056704-9-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, we ensure that guest RAM alloc size is at least 2M for
THP which works well for RV64 but breaks hugepage support for RV32.
To fix this, we use 4M as hugepage size for RV32.

Fixes: 867159a7963b ("riscv: Implement Guest/VM arch functions")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/kvm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index 4d6f5cb..8daad94 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -61,16 +61,25 @@ void kvm__arch_set_cmdline(char *cmdline, bool video)
 {
 }
 
+#if __riscv_xlen == 64
+#define HUGEPAGE_SIZE	SZ_2M
+#else
+#define HUGEPAGE_SIZE	SZ_4M
+#endif
+
 void kvm__arch_init(struct kvm *kvm)
 {
 	/*
 	 * Allocate guest memory. We must align our buffer to 64K to
 	 * correlate with the maximum guest page size for virtio-mmio.
-	 * If using THP, then our minimal alignment becomes 2M.
-	 * 2M trumps 64K, so let's go with that.
+	 * If using THP, then our minimal alignment becomes hugepage
+	 * size. The hugepage size is always greater than 64K, so
+	 * let's go with that.
 	 */
 	kvm->ram_size = min(kvm->cfg.ram_size, (u64)RISCV_MAX_MEMORY(kvm));
-	kvm->arch.ram_alloc_size = kvm->ram_size + SZ_2M;
+	kvm->arch.ram_alloc_size = kvm->ram_size;
+	if (!kvm->cfg.hugetlbfs_path)
+		kvm->arch.ram_alloc_size += HUGEPAGE_SIZE;
 	kvm->arch.ram_alloc_start = mmap_anon_or_hugetlbfs(kvm,
 						kvm->cfg.hugetlbfs_path,
 						kvm->arch.ram_alloc_size);
-- 
2.34.1


