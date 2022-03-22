From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Mar 2022 15:30:14 -0700
Subject: [PATCH v2 08/26] KVM: x86/mmu: Link spt to sp during allocation
In-Reply-To: <YjBkm8mYKNc5sdpU@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-9-dmatlack@google.com>
 <YjBkm8mYKNc5sdpU@xz-m1.local>
Message-ID: <CALzav=d82wAqcLQdGOfS7r95SSG3g=yKcY1hRc3fziZfNSHpzg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 15, 2022 at 3:04 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:10AM +0000, David Matlack wrote:
> > Link the shadow page table to the sp (via set_page_private()) during
> > allocation rather than initialization. This is a more logical place to
> > do it because allocation time is also where we do the reverse link
> > (setting sp->spt).
> >
> > This creates one extra call to set_page_private(), but having multiple
> > calls to set_page_private() is unavoidable anyway. We either do
> > set_page_private() during allocation, which requires 1 per allocation
> > function, or we do it during initialization, which requires 1 per
> > initialization function.
> >
> > No functional change intended.
> >
> > Suggested-by: Ben Gardon <bgardon@google.com>
> > Signed-off-by: David Matlack <dmatlack@google.com>
>
> Ah I should have read one more patch before commenting in previous one..
>
> Personally I (a little bit) like the other way around, since if with this
> in mind ideally we should also keep the use_mmu_page accounting in
> allocation helper:
>
>   kvm_mod_used_mmu_pages(vcpu->kvm, 1);

The TDP MMU doesn't call kvm_mod_used_mmu_pages() when it allocates
SPs. So that would prevent sharing kvm_mmu_alloc_shadow_page() with
the TDP MMU in patch 11.

Ben pointed out that we link the the page to sp->spt during
allocation, so it makes sense to do the reverse link at the same time.
Also, the set_page_private() call is common between the TDP MMU and
shadow MMU, so it makes sense to do it in the SP allocation code since
the allocation functions are shared between the two MMUs.





>
> But then we dup yet another line to all elsewheres as long as sp allocated.
>
> IOW, in my opinion the helpers should service 1st on code deduplications
> rather than else.  No strong opinion though..



>
> Thanks,
>
> --
> Peter Xu
>

