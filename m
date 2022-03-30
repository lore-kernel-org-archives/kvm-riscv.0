From: Peter Xu <peterx@redhat.com>
Date: Wed, 30 Mar 2022 10:28:10 -0400
Subject: [PATCH v2 05/26] KVM: x86/mmu: Rename shadow MMU functions that
 deal with shadow pages
In-Reply-To: <CALzav=c0ccztDULiVMwR4K20iYc0WH53ApeOCorhjKwaMNL5Sg@mail.gmail.com>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-6-dmatlack@google.com>
 <YjBTtz6wo/zQEHCv@xz-m1.local>
 <CALzav=c0ccztDULiVMwR4K20iYc0WH53ApeOCorhjKwaMNL5Sg@mail.gmail.com>
Message-ID: <YkRo+rJwYJoOmXmW@xz-m1.local>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 22, 2022 at 02:35:25PM -0700, David Matlack wrote:
> On Tue, Mar 15, 2022 at 1:52 AM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Fri, Mar 11, 2022 at 12:25:07AM +0000, David Matlack wrote:
> > > Rename 3 functions:
> > >
> > >   kvm_mmu_get_page()   -> kvm_mmu_get_shadow_page()
> > >   kvm_mmu_alloc_page() -> kvm_mmu_alloc_shadow_page()
> > >   kvm_mmu_free_page()  -> kvm_mmu_free_shadow_page()
> > >
> > > This change makes it clear that these functions deal with shadow pages
> > > rather than struct pages. Prefer "shadow_page" over the shorter "sp"
> > > since these are core routines.
> > >
> > > Signed-off-by: David Matlack <dmatlack@google.com>
> >
> > Acked-by: Peter Xu <peterx@redhat.com>
> 
> What's the reason to use Acked-by for this patch but Reviewed-by for others?

A weak version of r-b?  I normally don't do the rename when necessary (and
I'm pretty poor at naming..), in this case I don't have a strong opinion.
I should have left nothing then it's less confusing. :)

-- 
Peter Xu


