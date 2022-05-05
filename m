From: Sean Christopherson <seanjc@google.com>
Date: Thu, 5 May 2022 22:15:01 +0000
Subject: [PATCH v4 06/20] KVM: x86/mmu: Rename shadow MMU functions that
 deal with shadow pages
In-Reply-To: <20220422210546.458943-7-dmatlack@google.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-7-dmatlack@google.com>
Message-ID: <YnRMZZi6vskW9p60@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 22, 2022, David Matlack wrote:
> Rename 2 functions:
> 
>   kvm_mmu_get_page() -> kvm_mmu_get_shadow_page()
>   kvm_mmu_free_page() -> kvm_mmu_free_shadow_page()
> 
> This change makes it clear that these functions deal with shadow pages
> rather than struct pages. It also aligns these functions with the naming
> scheme for kvm_mmu_find_shadow_page() and kvm_mmu_alloc_shadow_page().
> 
> Prefer "shadow_page" over the shorter "sp" since these are core
> functions and the line lengths aren't terrible.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

