From: Sean Christopherson <seanjc@google.com>
Date: Wed, 22 Jun 2022 14:19:43 +0000
Subject: [PATCH v6 03/22] KVM: x86/mmu: Stop passing @direct to
 mmu_alloc_root()
In-Reply-To: <bb22c823-f12f-90d8-e8d6-0cddba95f60a@redhat.com>
References: <20220516232138.1783324-1-dmatlack@google.com>
 <20220516232138.1783324-4-dmatlack@google.com>
 <Yqt6rBPMxfwAPjp1@google.com>
 <bb22c823-f12f-90d8-e8d6-0cddba95f60a@redhat.com>
Message-ID: <YrMk/z4HCvX0ASPm@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 22, 2022, Paolo Bonzini wrote:
> On 6/16/22 20:47, Sean Christopherson wrote:
> > > The argument @direct is vcpu->arch.mmu->root_role.direct, so just use
> > > that.
> > It's worth calling out that, unlike non-root page tables, it's impossible to have
> > a direct root in an indirect MMU.  I.e. provide a hint as to why there's a need to
> > pass @direct in the first place.
> > 
> 
> I suppose there's *no* need to pass direct?  Also, there's the trivial (but
> less interesting) justification that kvm_mmu_load does
> 
>         if (vcpu->arch.mmu->root_role.direct)
>                 r = mmu_alloc_direct_roots(vcpu);
>         else
>                 r = mmu_alloc_shadow_roots(vcpu);
> 
> and those are the only callers of mmu_alloc_root.

Duh, you're right, grabbing root_role.direct in mmu_alloc_root() is much better.

