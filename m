From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Mar 2022 15:33:18 -0700
Subject: [PATCH v2 10/26] KVM: x86/mmu: Use common code to free
 kvm_mmu_page structs
In-Reply-To: <YjBo9iuSBm1hbqXz@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-11-dmatlack@google.com>
 <YjBo9iuSBm1hbqXz@xz-m1.local>
Message-ID: <CALzav=fPeXcKbrdguPKBt13awjPt3+3AB_2hBWo_M9U9sKinWw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 15, 2022 at 3:23 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:12AM +0000, David Matlack wrote:
> >  static void tdp_mmu_free_sp(struct kvm_mmu_page *sp)
> >  {
> > -     free_page((unsigned long)sp->spt);
> > -     kmem_cache_free(mmu_page_header_cache, sp);
> > +     kvm_mmu_free_shadow_page(sp);
> >  }
>
> Perhaps tdp_mmu_free_sp() can be dropped altogether with this?

It certainly can but I prefer to keep it for 2 reasons:
 - Smaller diff.
 - It mirrors tdp_mmu_alloc_sp(), which I prefer to keep as well but
I'll explain that in the next patch.

>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> --
> Peter Xu
>

