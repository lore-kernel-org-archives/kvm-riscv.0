From: David Matlack <dmatlack@google.com>
Date: Tue, 22 Mar 2022 16:08:08 -0700
Subject: [PATCH v2 17/26] KVM: x86/mmu: Pass access information to
 make_huge_page_split_spte()
In-Reply-To: <YjGjWcmn+7sZPjNX@xz-m1.local>
References: <20220311002528.2230172-1-dmatlack@google.com>
 <20220311002528.2230172-18-dmatlack@google.com>
 <YjGjWcmn+7sZPjNX@xz-m1.local>
Message-ID: <CALzav=d1j-SUFEauqrQaJ5gE89ybSdW3OWnmdsaA6iADVnQfjA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 16, 2022 at 1:44 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Fri, Mar 11, 2022 at 12:25:19AM +0000, David Matlack wrote:
> > diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
> > index 85b7bc333302..541b145b2df2 100644
> > --- a/arch/x86/kvm/mmu/tdp_mmu.c
> > +++ b/arch/x86/kvm/mmu/tdp_mmu.c
> > @@ -1430,7 +1430,7 @@ static int tdp_mmu_split_huge_page(struct kvm *kvm, struct tdp_iter *iter,
> >        * not been linked in yet and thus is not reachable from any other CPU.
> >        */
> >       for (i = 0; i < PT64_ENT_PER_PAGE; i++)
> > -             sp->spt[i] = make_huge_page_split_spte(huge_spte, level, i);
> > +             sp->spt[i] = make_huge_page_split_spte(huge_spte, level, i, ACC_ALL);
>
> Pure question: is it possible that huge_spte is RO while we passed in
> ACC_ALL here (which has the write bit set)?

Yes that is possible, but only if KVM the page is RO due to host-side
policies (e.g. RO memslot or RO VMA). "access" here is the
guest-allowed access permissions, similar to the pte_access parameter
to mmu_set_spte(). e.g. notice how the TDP MMU passes ACC_ALL to
make_spte().

> Would it be better if we make it a "bool exec" to be clearer?

But all that being said, the ACC_ALL stuff is confusing for exactly
the reason you pointed out so it doesn't make sense to duplicate it
further. I agree it would make more sense to pass in bool exec.

>
> --
> Peter Xu
>

