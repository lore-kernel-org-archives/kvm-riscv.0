From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Mar 2022 15:35:37 -0700
Subject: [PATCH v2 11/26] KVM: x86/mmu: Use common code to allocate
 kvm_mmu_page structs from vCPU caches
In-Reply-To: <YjBqAL+bPmcQpTgM@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-12-dmatlack@google.com>
 <YjBqAL+bPmcQpTgM@xz-m1.local>
Message-ID: <CALzav=ehyvZiM-JH6gcZo_yw9R-T5mR18UQF_GecM-qZCQs=Uw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 15, 2022 at 3:27 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:13AM +0000, David Matlack wrote:
> >  static struct kvm_mmu_page *tdp_mmu_alloc_sp(struct kvm_vcpu *vcpu)
> >  {
> > -     struct kvm_mmu_page *sp;
> > -
> > -     sp = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_page_header_cache);
> > -     sp->spt = kvm_mmu_memory_cache_alloc(&vcpu->arch.mmu_shadow_page_cache);
> > -     set_page_private(virt_to_page(sp->spt), (unsigned long)sp);
> > -
> > -     return sp;
> > +     return kvm_mmu_alloc_shadow_page(vcpu, true);
> >  }
>
> Similarly I had a feeling we could drop tdp_mmu_alloc_sp() too.. anyway:

Certainly, but I think it simplifies the TDP MMU code to keep it. It abstracts
away the implementation detail that a TDP MMU shadow page is allocated
the same way as a shadow MMU shadow page with direct=true.


>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>

