From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jun 2022 18:04:12 +0530
Subject: [PATCH v7 21/23] KVM: Allow for different capacities in
 kvm_mmu_memory_cache structs
In-Reply-To: <20220622192710.2547152-22-pbonzini@redhat.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com> <20220622192710.2547152-22-pbonzini@redhat.com>
Message-ID: <CAAhSdy0iVQH__-nD6-ioGSDbAaCaeMxbBp2+-06=wJjDOcxPOQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 23, 2022 at 12:57 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: David Matlack <dmatlack@google.com>
>
> Allow the capacity of the kvm_mmu_memory_cache struct to be chosen at
> declaration time rather than being fixed for all declarations. This will
> be used in a follow-up commit to declare an cache in x86 with a capacity
> of 512+ objects without having to increase the capacity of all caches in
> KVM.
>
> This change requires each cache now specify its capacity at runtime,
> since the cache struct itself no longer has a fixed capacity known at
> compile time. To protect against someone accidentally defining a
> kvm_mmu_memory_cache struct directly (without the extra storage), this
> commit includes a WARN_ON() in kvm_mmu_topup_memory_cache().
>
> In order to support different capacities, this commit changes the
> objects pointer array to be dynamically allocated the first time the
> cache is topped-up.
>
> While here, opportunistically clean up the stack-allocated
> kvm_mmu_memory_cache structs in riscv and arm64 to use designated
> initializers.
>
> No functional change intended.
>
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: David Matlack <dmatlack@google.com>
> Message-Id: <20220516232138.1783324-22-dmatlack@google.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

For KVM RISC-V
Reviewed-by: Anup Patel <anup@brainfault.org>
Tested-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/arm64/kvm/mmu.c      |  2 +-
>  arch/riscv/kvm/mmu.c      |  5 +----
>  include/linux/kvm_host.h  |  1 +
>  include/linux/kvm_types.h |  6 +++++-
>  virt/kvm/kvm_main.c       | 33 ++++++++++++++++++++++++++++++---
>  5 files changed, 38 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index f5651a05b6a8..87f1cd0df36e 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -786,7 +786,7 @@ int kvm_phys_addr_ioremap(struct kvm *kvm, phys_addr_t guest_ipa,
>  {
>         phys_addr_t addr;
>         int ret = 0;
> -       struct kvm_mmu_memory_cache cache = { 0, __GFP_ZERO, NULL, };
> +       struct kvm_mmu_memory_cache cache = { .gfp_zero = __GFP_ZERO };
>         struct kvm_pgtable *pgt = kvm->arch.mmu.pgt;
>         enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_DEVICE |
>                                      KVM_PGTABLE_PROT_R |
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1c00695ebee7..081f8d2b9cf3 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -350,10 +350,7 @@ static int gstage_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>         int ret = 0;
>         unsigned long pfn;
>         phys_addr_t addr, end;
> -       struct kvm_mmu_memory_cache pcache;
> -
> -       memset(&pcache, 0, sizeof(pcache));
> -       pcache.gfp_zero = __GFP_ZERO;
> +       struct kvm_mmu_memory_cache pcache = { .gfp_zero = __GFP_ZERO };
>
>         end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
>         pfn = __phys_to_pfn(hpa);
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index a2bbdf3ab086..3554e48406e4 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1356,6 +1356,7 @@ void kvm_flush_remote_tlbs(struct kvm *kvm);
>
>  #ifdef KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE
>  int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min);
> +int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min);
>  int kvm_mmu_memory_cache_nr_free_objects(struct kvm_mmu_memory_cache *mc);
>  void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc);
>  void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
> diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
> index f328a01db4fe..4d933518060f 100644
> --- a/include/linux/kvm_types.h
> +++ b/include/linux/kvm_types.h
> @@ -85,12 +85,16 @@ struct gfn_to_pfn_cache {
>   * MMU flows is problematic, as is triggering reclaim, I/O, etc... while
>   * holding MMU locks.  Note, these caches act more like prefetch buffers than
>   * classical caches, i.e. objects are not returned to the cache on being freed.
> + *
> + * The @capacity field and @objects array are lazily initialized when the cache
> + * is topped up (__kvm_mmu_topup_memory_cache()).
>   */
>  struct kvm_mmu_memory_cache {
>         int nobjs;
>         gfp_t gfp_zero;
>         struct kmem_cache *kmem_cache;
> -       void *objects[KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE];
> +       int capacity;
> +       void **objects;
>  };
>  #endif
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 5b8ae83e09d7..45188d11812c 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -396,14 +396,31 @@ static inline void *mmu_memory_cache_alloc_obj(struct kvm_mmu_memory_cache *mc,
>                 return (void *)__get_free_page(gfp_flags);
>  }
>
> -int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> +int __kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int capacity, int min)
>  {
> +       gfp_t gfp = GFP_KERNEL_ACCOUNT;
>         void *obj;
>
>         if (mc->nobjs >= min)
>                 return 0;
> -       while (mc->nobjs < ARRAY_SIZE(mc->objects)) {
> -               obj = mmu_memory_cache_alloc_obj(mc, GFP_KERNEL_ACCOUNT);
> +
> +       if (unlikely(!mc->objects)) {
> +               if (WARN_ON_ONCE(!capacity))
> +                       return -EIO;
> +
> +               mc->objects = kvmalloc_array(sizeof(void *), capacity, gfp);
> +               if (!mc->objects)
> +                       return -ENOMEM;
> +
> +               mc->capacity = capacity;
> +       }
> +
> +       /* It is illegal to request a different capacity across topups. */
> +       if (WARN_ON_ONCE(mc->capacity != capacity))
> +               return -EIO;
> +
> +       while (mc->nobjs < mc->capacity) {
> +               obj = mmu_memory_cache_alloc_obj(mc, gfp);
>                 if (!obj)
>                         return mc->nobjs >= min ? 0 : -ENOMEM;
>                 mc->objects[mc->nobjs++] = obj;
> @@ -411,6 +428,11 @@ int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
>         return 0;
>  }
>
> +int kvm_mmu_topup_memory_cache(struct kvm_mmu_memory_cache *mc, int min)
> +{
> +       return __kvm_mmu_topup_memory_cache(mc, KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, min);
> +}
> +
>  int kvm_mmu_memory_cache_nr_free_objects(struct kvm_mmu_memory_cache *mc)
>  {
>         return mc->nobjs;
> @@ -424,6 +446,11 @@ void kvm_mmu_free_memory_cache(struct kvm_mmu_memory_cache *mc)
>                 else
>                         free_page((unsigned long)mc->objects[--mc->nobjs]);
>         }
> +
> +       kvfree(mc->objects);
> +
> +       mc->objects = NULL;
> +       mc->capacity = 0;
>  }
>
>  void *kvm_mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc)
> --
> 2.31.1
>
>

