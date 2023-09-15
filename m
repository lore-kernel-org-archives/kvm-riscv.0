From: Xiaoyao Li <xiaoyao.li@intel.com>
Date: Fri, 15 Sep 2023 14:47:13 +0800
Subject: [RFC PATCH v12 01/33] KVM: Tweak kvm_hva_range and hva_handler_t
 to allow reusing for gfn ranges
In-Reply-To: <20230914015531.1419405-2-seanjc@google.com>
References: <20230914015531.1419405-1-seanjc@google.com>
 <20230914015531.1419405-2-seanjc@google.com>
Message-ID: <d4166c97-6ab3-89a2-eb12-f492f7521f69@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 9/14/2023 9:54 AM, Sean Christopherson wrote:
> Rework and rename "struct kvm_hva_range" into "kvm_mmu_notifier_range" so
> that the structure can be used to handle notifications that operate on gfn
> context, i.e. that aren't tied to a host virtual address.
> 
> Practically speaking, this is a nop for 64-bit kernels as the only
> meaningful change is to store start+end as u64s instead of unsigned longs.
> 
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   virt/kvm/kvm_main.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 486800a7024b..0524933856d4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -541,18 +541,22 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
>   	return container_of(mn, struct kvm, mmu_notifier);
>   }
>   
> -typedef bool (*hva_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
> +typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);

Is it worth mentioning the rename of it as well in changelog?

Anyway,

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

