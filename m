From: Sean Christopherson <seanjc@google.com>
Date: Thu, 23 Jun 2022 23:48:30 +0000
Subject: [PATCH v7 20/23] KVM: x86/mmu: pull call to drop_large_spte()
 into __link_shadow_page()
In-Reply-To: <20220622192710.2547152-21-pbonzini@redhat.com>
References: <20220622192710.2547152-1-pbonzini@redhat.com>
 <20220622192710.2547152-21-pbonzini@redhat.com>
Message-ID: <YrT7ztvP6Y4vgj/m@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 22, 2022, Paolo Bonzini wrote:
> Before allocating a child shadow page table, all callers check
> whether the parent already points to a huge page and, if so, they
> drop that SPTE.  This is done by drop_large_spte().

Thanks for the (), much appreciated!

> However, the act that requires dropping the large SPTE is the
> installation of the sp that is returned by kvm_mmu_get_child_sp(),
> which happens in __link_shadow_page().  Move the call there
> instead of having it in each and every caller.
> 
> To ensure that the shadow page is not linked twice if it was
> present, do _not_ opportunistically make kvm_mmu_get_child_sp()
> idempotent: instead, return an error value if the shadow page
> already existed.  This is a bit more verbose, but clearer than
> NULL.

Agreed, and I think we can take advantage of that verbosity to do a tiny bit more
cleanup by moving the unsync logic into a wrapper that returns -EAGAIN.  Working
on a mini-series...

> Now that the drop_large_spte() name is not taken anymore,
> remove the two underscores in front of __drop_large_spte().
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

