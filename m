From: Anup Patel <apatel@ventanamicro.com>
Date: Thu,  7 Jul 2022 20:22:44 +0530
Subject: [PATCH 1/5] KVM: Add gfp_custom flag in struct kvm_mmu_memory_cache
In-Reply-To: <20220707145248.458771-1-apatel@ventanamicro.com>
References: <20220707145248.458771-1-apatel@ventanamicro.com>
Message-ID: <20220707145248.458771-2-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The kvm_mmu_topup_memory_cache() always uses GFP_KERNEL_ACCOUNT for
memory allocation which prevents it's use in atomic context. To address
this limitation of kvm_mmu_topup_memory_cache(), we add gfp_custom flag
in struct kvm_mmu_memory_cache. When the gfp_custom flag is set to some
GFP_xyz flags, the kvm_mmu_topup_memory_cache() will use that instead of
GFP_KERNEL_ACCOUNT.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/kvm_types.h | 1 +
 virt/kvm/kvm_main.c       | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index ac1ebb37a0ff..1dcfba68076a 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -87,6 +87,7 @@ struct gfn_to_pfn_cache {
 struct kvm_mmu_memory_cache {
 	int nobjs;
 	gfp_t gfp_zero;
+	gfp_t gfp_custom;
 	struct kmem_cache *kmem_cache;
 	void *objects[KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE];
 };
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a49df8988cd6..e3a6f7647474 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -386,7 +386,9 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
 	if (mc->nobjs >= min)
 		return 0;
 	while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
-		obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
+		obj = mmu_memory_cache_alloc_obj(mc, (mc->gfp_custom) ?
+						 mc->gfp_custom :
+						 GFP_KERNEL_ACCOUNT);
 		if (!obj)
 			return mc->nobjs >= min ? 0 : -ENOMEM;
 		mc->objects[mc->nobjs++] = obj;
-- 
2.34.1


