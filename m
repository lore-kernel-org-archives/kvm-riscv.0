From: David Matlack <dmatlack@google.com>
Date: Fri, 13 May 2022 18:26:51 +0000
Subject: [PATCH v4 03/20] KVM: x86/mmu: Derive shadow MMU page role from
 parent
In-Reply-To: <CALzav=e0VnYar=jUr+C=uhVf9O6NDXaHx2rW-+yUocdHVk39Mg@mail.gmail.com>
References: <20220422210546.458943-1-dmatlack@google.com>
 <20220422210546.458943-4-dmatlack@google.com>
 <75fbbcb6-d9bb-3d30-0bf4-fbf925517d09@gmail.com>
 <CALzav=dmseUw6khErkiSV7T5K88QvaRvWvBpvrb6VNOQTE3bQQ@mail.gmail.com>
 <CAJhGHyDQn=atFmn5o2TREW9cSY5Tv1F1vsSekzor6uYQxDgcfQ@mail.gmail.com>
 <CALzav=e0VnYar=jUr+C=uhVf9O6NDXaHx2rW-+yUocdHVk39Mg@mail.gmail.com>
Message-ID: <Yn6i6yUkIKyzXb+j@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 12, 2022 at 09:10:59AM -0700, David Matlack wrote:
> On Mon, May 9, 2022 at 7:58 PM Lai Jiangshan <jiangshanlai@gmail.com> wrote:
> > On Tue, May 10, 2022 at 5:04 AM David Matlack <dmatlack@google.com> wrote:
> > > On Sat, May 7, 2022 at 1:28 AM Lai Jiangshan <jiangshanlai@gmail.com> wrote:
> > > > On 2022/4/23 05:05, David Matlack wrote:
> > > > > +     /*
> > > > > +      * If the guest has 4-byte PTEs then that means it's using 32-bit,
> > > > > +      * 2-level, non-PAE paging. KVM shadows such guests using 4 PAE page
> > > > > +      * directories, each mapping 1/4 of the guest's linear address space
> > > > > +      * (1GiB). The shadow pages for those 4 page directories are
> > > > > +      * pre-allocated and assigned a separate quadrant in their role.
> > > >
> > > >
> > > > It is not going to be true in patchset:
> > > > [PATCH V2 0/7] KVM: X86/MMU: Use one-off special shadow page for special roots
> > > >
> > > > https://lore.kernel.org/lkml/20220503150735.32723-1-jiangshanlai at gmail.com/
> > > >
> > > > The shadow pages for those 4 page directories are also allocated on demand.
> > >
> > > Ack. I can even just drop this sentence in v5, it's just background information.
> >
> > No, if one-off special shadow pages are used.
> >
> > kvm_mmu_child_role() should be:
> >
> > +       if (role.has_4_byte_gpte) {
> > +               if (role.level == PG_LEVEL_4K)
> > +                       role.quadrant = (sptep - parent_sp->spt) % 2;
> > +               if (role.level == PG_LEVEL_2M)
> > +                       role.quadrant = (sptep - parent_sp->spt) % 4;
> > +       }
> >
> >
> > And if one-off special shadow pages are merged first.  You don't
> > need any calculation in mmu_alloc_root(), you can just directly use
> >     sp = kvm_mmu_get_page(vcpu, gfn, vcpu->arch.mmu->root_role);
> > because vcpu->arch.mmu->root_role is always the real role of the root
> > sp no matter if it is a normall root sp or an one-off special sp.
> >
> > I hope you will pardon me for my touting my patchset and asking
> > people to review them in your threads.
> 
> I see what you mean now. If your series is queued I will rebase on top
> with the appropriate changes. But for now I will continue to code
> against kvm/queue.

Here is what I'm going with for v5:

        /*
         * If the guest has 4-byte PTEs then that means it's using 32-bit,
         * 2-level, non-PAE paging. KVM shadows such guests with PAE paging
         * (i.e. 8-byte PTEs). The difference in PTE size means that
         * KVM must shadow each guest page table with multiple shadow page
         * tables, which requires extra bookkeeping in the role.
         *
         * Specifically, to shadow the guest's page directory (which covers a
         * 4GiB address space), KVM uses 4 PAE page directories, each mapping
         * 1GiB of the address space. @role.quadrant encodes which quarter of
         * the address space each maps.
         *
         * To shadow the guest's page tables (which each map a 4MiB region),
         * KVM uses 2 PAE page tables, each mapping a 2MiB region. For these,
         * @role.quadrant encodes which half of the region they map.
         *
         * Note, the 4 PAE page directories are pre-allocated and the quadrant
         * assigned in mmu_alloc_root(). So only page tables need to be handled
         * here.
         */
        if (role.has_4_byte_gpte) {
                WARN_ON_ONCE(role.level != PG_LEVEL_4K);
                role.quadrant = (sptep - parent_sp->spt) % 2;
        }

Then to make it work with your series we can just apply this diff:

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f7c4f08e8a69..0e0e2da2f37d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2131,14 +2131,10 @@ static union kvm_mmu_page_role kvm_mmu_child_role(u64 *sptep, bool direct, u32 a
         * To shadow the guest's page tables (which each map a 4MiB region),
         * KVM uses 2 PAE page tables, each mapping a 2MiB region. For these,
         * @role.quadrant encodes which half of the region they map.
-        *
-        * Note, the 4 PAE page directories are pre-allocated and the quadrant
-        * assigned in mmu_alloc_root(). So only page tables need to be handled
-        * here.
         */
        if (role.has_4_byte_gpte) {
-               WARN_ON_ONCE(role.level != PG_LEVEL_4K);
-               role.quadrant = (sptep - parent_sp->spt) % 2;
+               WARN_ON_ONCE(role.level > PG_LEVEL_2M);
+               role.quadrant = (sptep - parent_sp->spt) % (1 << role.level);
        }

        return role;

If your series is queued first, I can resend a v6 with this change or Paolo can
apply it. If mine is queued first then you can include this as part of your
series.

