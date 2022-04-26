From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 26 Apr 2022 12:27:57 -0700
Subject: [PATCH v3 4/6] KVM: arm64/mmu: count KVM page table pages in
 pagetable stats
In-Reply-To: <YmegoB/fBkfwaE5z@google.com>
References: <20220426053904.3684293-1-yosryahmed@google.com>
 <20220426053904.3684293-5-yosryahmed@google.com> <YmegoB/fBkfwaE5z@google.com>
Message-ID: <CAJD7tkY-WZKcyer=TbWF0dVfOhvZO7hqPN=AYCDZe1f+2HA-QQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Oliver,
Thanks so much for taking the time to take a look at this!

On Tue, Apr 26, 2022 at 12:35 AM Oliver Upton <oupton@google.com> wrote:
>
> Hi Yosry,
>
> On Tue, Apr 26, 2022 at 05:39:02AM +0000, Yosry Ahmed wrote:
> > Count the pages used by KVM in arm64 for page tables in pagetable stats.
> >
> > Account pages allocated for PTEs in pgtable init functions and
> > kvm_set_table_pte().
> >
> > Since most page table pages are freed using put_page(), add a helper
> > function put_pte_page() that checks if this is the last ref for a pte
> > page before putting it, and unaccounts stats accordingly.
> >
> > Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> > ---
> >  arch/arm64/kernel/image-vars.h |  3 ++
> >  arch/arm64/kvm/hyp/pgtable.c   | 50 +++++++++++++++++++++-------------
> >  2 files changed, 34 insertions(+), 19 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > index 241c86b67d01..25bf058714f6 100644
> > --- a/arch/arm64/kernel/image-vars.h
> > +++ b/arch/arm64/kernel/image-vars.h
> > @@ -143,6 +143,9 @@ KVM_NVHE_ALIAS(__hyp_rodata_end);
> >  /* pKVM static key */
> >  KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
> >
> > +/* Called by kvm_account_pgtable_pages() to update pagetable stats */
> > +KVM_NVHE_ALIAS(__mod_lruvec_page_state);
> > +
> >  #endif /* CONFIG_KVM */
> >
> >  #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 2cb3867eb7c2..53e13c3313e9 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> > @@ -152,6 +152,7 @@ static void kvm_set_table_pte(kvm_pte_t *ptep, kvm_pte_t *childp,
> >
> >       WARN_ON(kvm_pte_valid(old));
> >       smp_store_release(ptep, pte);
> > +     kvm_account_pgtable_pages((void *)childp, +1);
>
> What page tables do we want to account? KVM on ARM manages several page
> tables.
>
> For regular KVM, the host kernel manages allocations for the hyp stage 1
> tables in addition to the stage 2 tables used for a particular VM. The
> former is system overhead whereas the latter could be attributed to a
> guest VM.

Honestly I would love to get your input on this. The main motivation
here is to give users insights on the kernel memory usage on their
system (or in a cgroup). We currently have NR_PAGETABLE stats for
normal kernel page tables (allocated using
__pte_alloc_one()/pte_free()), this shows up in /proc/meminfo,
/path/to/cgroup/memory.stat, and node stats. The idea is to add
NR_SECONDARY_PAGETABLE that should include the memory used for kvm
pagetables, which should be a separate category (no overlap). What
gets included or not depends on the semantics of KVM and what exactly
falls under the category of secondary pagetables from the user's pov.

Currently it looks like s2 page table allocations get accounted to
kmem of memory control groups (GFP_KERNEL_ACCOUNT), while hyp page
table allocations do not (GFP_KERNEL). So we could either follow this
and only account s2 page table allocations in the stats, or make hyp
allocations use GFP_KERNEL_ACCOUNT as well and add them to the stats.
Let me know what you think.

>
> I imagine protected KVM is out of scope, since it actually manages its
> own allocations outside of the host kernel.
>
> Given this, I would recommend adding the accounting hooks to mmu.c as
> that is where we alloc/free table pages and it is in the host address
> space. kvm_s2_mm_ops and kvm_hyp_mm_ops point to all the relevant
> functions, though the latter is only relevant if we want to count system
> page tables too.

Yeah moving the accounting hooks to mmu.c is much cleaner, I will do
this in the next version. The only reason I did not do this is that I
found other kvm_pgtable_mm_ops structs (such as pkvm_pgtable_mm_ops),
but it looks like these may be irrelevant here.

>
> --
> Thanks,
> Oliver

