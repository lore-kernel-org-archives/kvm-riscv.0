From: Sean Christopherson <seanjc@google.com>
Date: Fri, 17 Jun 2022 15:01:52 +0000
Subject: [PATCH v6 10/22] KVM: x86/mmu: Pass memory caches to allocate
 SPs separately
In-Reply-To: <20220516232138.1783324-11-dmatlack@google.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-11-dmatlack@google.com>
Message-ID: <YqyXYJsoZGgp7l62@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 16, 2022, David Matlack wrote:
> Refactor kvm_mmu_alloc_shadow_page() to receive the caches from which it
> will allocate the various pieces of memory for shadow pages as a
> parameter, rather than deriving them from the vcpu pointer. This will be
> useful in a future commit where shadow pages are allocated during VM
> ioctls for eager page splitting, and thus will use a different set of
> caches.
> 
> Preemptively pull the caches out all the way to
> kvm_mmu_get_shadow_page() since eager page splitting will not be calling

Uber nit, "eager hugepage splitting" to provide a mental cue/reminder for why
those pages are direct.

> kvm_mmu_alloc_shadow_page() directly.
> 
> No functional change intended.
> 
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

