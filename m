From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 15:12:04 +0000
Subject: [PATCH v6 04/22] KVM: x86/mmu: Derive shadow MMU page role from
 parent
In-Reply-To: <20220516232138.1783324-5-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-5-dmatlack@google.com>
Message-ID: <YqyZxEfxXLsHGoZ/@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> +static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
> +						 u64 *sptep, gfn_t gfn,
> +						 bool direct, u32 access)

Please use "unsigned int" for @access, here and everywhere else, so that KVM is
consistent in how it refers to access.  @access can actually squeeze into a u8,
but it's referenced as a "unsigned int" because sp->role.access is an unsigned int.
For me at least, when I see "u<size" I always assume there is a specific reason
for using an exact size, e.g. variables/fields that track hardware state.  Whereas
"int" and "unsigned int" give the hint that the variable is KVM metadata.

@@ -2201,7 +2201,8 @@ static struct kvm_mmu_page *kvm_mmu_get_shadow_page(struct kvm_vcpu *vcpu,
        return __kvm_mmu_get_shadow_page(vcpu->kvm, vcpu, &caches, gfn, role);
 }

-static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 access)
+static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct,
+                                                 unsigned int access)
 {
        struct kvm_mmu_page *parent_sp = sptep_to_sp(sptep);
        union kvm_mmu_page_role role;
@@ -2242,7 +2243,7 @@ static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 a

 static struct kvm_mmu_page *kvm_mmu_get_child_sp(struct kvm_vcpu *vcpu,
                                                 u64 *sptep, gfn_t gfn,
-                                                bool direct, u32 access)
+                                                bool direct, unsigned int access)
 {
        union kvm_mmu_page_role role;

> +{
> +	union kvm_mmu_page_role role;
> +
> +	role = kvm_mmu_child_role(sptep, direct, access);
> +	return kvm_mmu_get_page(vcpu, gfn, role);
> +}
> +

