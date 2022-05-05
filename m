From: Sean Christopherson <seanjc@google.com>
Date: Thu, 5 May 2022 21:58:52 +0000
Subject: [PATCH v4 04/20] KVM: x86/mmu: Decompose kvm_mmu_get_page() into
 separate functions
In-Reply-To: <20220422210546.458943-5-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-5-dmatlack@google.com>
Message-ID: <YnRInPVAd7BEBpk6@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> Decompose kvm_mmu_get_page() into separate helper functions to increase
> readability and prepare for allocating shadow pages without a vcpu
> pointer.
> 
> Specifically, pull the guts of kvm_mmu_get_page() into 2 helper
> functions:
> 
> kvm_mmu_find_shadow_page() -
>   Walks the page hash checking for any existing mmu pages that match the
>   given gfn and role.
> 
> kvm_mmu_alloc_shadow_page()
>   Allocates and initializes an entirely new kvm_mmu_page. This currently
>   requries a vcpu pointer for allocation and looking up the memslot but
>   that will be removed in a future commit.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Nice!

Reviewed-by: Sean Christopherson <seanjc@google.com>

