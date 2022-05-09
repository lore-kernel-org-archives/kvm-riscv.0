From: Sean Christopherson <seanjc@google.com>
Date: Mon, 9 May 2022 16:22:22 +0000
Subject: [PATCH v4 16/20] KVM: x86/mmu: Extend
 make_huge_page_split_spte() for the shadow MMU
In-Reply-To: <20220422210546.458943-17-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-17-dmatlack@google.com>
Message-ID: <Ynk/vnHQsXnZkMGT@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> Currently make_huge_page_split_spte() assumes execute permissions can be
> granted to any 4K SPTE when splitting huge pages. This is true for the
> TDP MMU but is not necessarily true for the shadow MMU, since KVM may be
> shadowing a non-executable huge page.
> 
> To fix this, pass in the child shadow page where the huge page will be
> split and derive the execution permission from the shadow page's role.
> This is correct because huge pages are always split with direct shadow
> page and thus the shadow page role contains the correct access
> permissions.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
>  arch/x86/kvm/mmu/spte.c    | 13 +++++++------
>  arch/x86/kvm/mmu/spte.h    |  2 +-
>  arch/x86/kvm/mmu/tdp_mmu.c |  2 +-
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
> index 4739b53c9734..9db98fbeee61 100644
> --- a/arch/x86/kvm/mmu/spte.c
> +++ b/arch/x86/kvm/mmu/spte.c
> @@ -215,10 +215,11 @@ static u64 make_spte_executable(u64 spte)
>   * This is used during huge page splitting to build the SPTEs that make up the
>   * new page table.
>   */
> -u64 make_huge_page_split_spte(u64 huge_spte, int huge_level, int index)
> +u64 make_huge_page_split_spte(u64 huge_spte, struct kvm_mmu_page *sp, int index)

Rather than pass in @sp, what about passing in @role?  Then the need for
exec_allowed and child_level goes away (for whatever reason I reacted to the
"allowed" part of exec_allowed).

E.g.

---
 arch/x86/kvm/mmu/spte.c    | 11 +++++------
 arch/x86/kvm/mmu/spte.h    |  3 ++-
 arch/x86/kvm/mmu/tdp_mmu.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/spte.c b/arch/x86/kvm/mmu/spte.c
index 9db98fbeee61..1b766e381727 100644
--- a/arch/x86/kvm/mmu/spte.c
+++ b/arch/x86/kvm/mmu/spte.c
@@ -215,10 +215,9 @@ static u64 make_spte_executable(u64 spte)
  * This is used during huge page splitting to build the SPTEs that make up the
  * new page table.
  */
-u64 make_huge_page_split_spte(u64 huge_spte, struct kvm_mmu_page *sp, int index)
+u64 make_huge_page_split_spte(u64 huge_spte, union kvm_mmu_page_role role,
+			      int index)
 {
-	bool exec_allowed = sp->role.access & ACC_EXEC_MASK;
-	int child_level = sp->role.level;
 	u64 child_spte;

 	if (WARN_ON_ONCE(!is_shadow_present_pte(huge_spte)))
@@ -234,9 +233,9 @@ u64 make_huge_page_split_spte(u64 huge_spte, struct kvm_mmu_page *sp, int index)
 	 * split. So we just have to OR in the offset to the page at the next
 	 * lower level for the given index.
 	 */
-	child_spte |= (index * KVM_PAGES_PER_HPAGE(child_level)) << PAGE_SHIFT;
+	child_spte |= (index * KVM_PAGES_PER_HPAGE(role.level)) << PAGE_SHIFT;

-	if (child_level == PG_LEVEL_4K) {
+	if (role.level == PG_LEVEL_4K) {
 		child_spte &= ~PT_PAGE_SIZE_MASK;

 		/*
@@ -244,7 +243,7 @@ u64 make_huge_page_split_spte(u64 huge_spte, struct kvm_mmu_page *sp, int index)
 		 * the page executable as the NX hugepage mitigation no longer
 		 * applies.
 		 */
-		if (exec_allowed && is_nx_huge_page_enabled())
+		if ((role.access & ACC_EXEC_MASK) && is_nx_huge_page_enabled())
 			child_spte = make_spte_executable(child_spte);
 	}

diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index 921ea77f1b5e..80d36d0d9def 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -415,7 +415,8 @@ bool make_spte(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	       unsigned int pte_access, gfn_t gfn, kvm_pfn_t pfn,
 	       u64 old_spte, bool prefetch, bool can_unsync,
 	       bool host_writable, u64 *new_spte);
-u64 make_huge_page_split_spte(u64 huge_spte, struct kvm_mmu_page *sp, int index);
+u64 make_huge_page_split_spte(u64 huge_spte, union kvm_mmu_page_role role,
+			      int index);
 u64 make_nonleaf_spte(u64 *child_pt, bool ad_disabled);
 u64 make_mmio_spte(struct kvm_vcpu *vcpu, u64 gfn, unsigned int access);
 u64 mark_spte_for_access_track(u64 spte);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 110a34ca41c2..c4c4bad69f38 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1469,7 +1469,7 @@ static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
 	 * not been linked in yet and thus is not reachable from any other CPU.
 	 */
 	for (i = 0; i < PT64_ENT_PER_PAGE; i++)
-		sp->spt[i] = make_huge_page_split_spte(huge_spte, sp, i);
+		sp->spt[i] = make_huge_page_split_spte(huge_spte, sp->role, i);

 	/*
 	 * Replace the huge spte with a pointer to the populated lower level

base-commit: 721828e2397ab854b536de3ea10a9bc7962091a9
--

