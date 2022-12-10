From: David Matlack <dmatlack@google.com>
Date: Fri, 9 Dec 2022 17:07:18 -0800
Subject: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common code
In-Reply-To: <Y5OHVzBSHPmAq2FO@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com> <Y5OHVzBSHPmAq2FO@google.com>
Message-ID: <CALzav=c328M1jgApAEEnz5B6h_pr5w07VpcMx0kSg0MtJjAf2w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 9, 2022 at 11:07 AM Oliver Upton <oliver.upton@linux.dev> wrote:
>
> On Thu, Dec 08, 2022 at 11:38:20AM -0800, David Matlack wrote:
>
> >    Also do we want to keep "TDP" or switch
> >    to something more familiar across architectures (e.g. ARM and RISC-V
> >    both use "Stage-2")?
>
> As it relates to guest memory management I don't see much of an issue
> with it, TBH. It is sufficiently arch-generic and gets the point across.
>
> Beyond that I think it really depends on the scope of the common code.
>
> To replace the arm64 table walkers we will need to use it for stage-1
> tables.

Speaking of, have ARM folks ever discussed deduplicating the KVM/ARM
stage-1 code with the Linux stage-1 table code (<linux/pgtable.h>),
which is already architecture-neutral? It seems backwards for us to
build out an architecture-neutral stage-1 walker in KVM when one
already exists.

For example, arch/arm64/kvm/mmu.c:get_user_mapping_size() looks like
it could be reimplemented using <linux/pgtable.h>, rather than using
KVM code. In fact that's what we do for walking stage-1 page tables in
KVM/x86. Take a look at
arch/x86/kvm/mmu/mmu.c:host_pfn_mapping_level(). I bet we could move
that somewhere in mm/ so that it could be shared across KVM/x86 and
KVM/ARM.

> I'm only hand-waving at the cover letter and need to do more
> reading, but is it possible to accomplish some division:
>
>  - A set of generic table walkers that implement common operations, like
>    map and unmap. Names and types at this layer wouldn't be
>    virt-specific.
>
>  - Memory management for KVM guests that uses the table walker library,
>    which we can probably still call the TDP MMU.
>
> Certainly this doesn't need to be addressed in the first series, as the x86
> surgery is enough on its own. Nonetheless, it is probably worthwhile to
> get the conversation started about how this code can actually be used by
> the other arches.

Yup, we'll need some sort of split like that in order to integrate
with KVM/ARM, since the hyp can't access struct kvm, work_queues, etc.
in tdp_mmu.c. I don't think we'll need that split for KVM/RISC-V
though. So for the sake of incremental progress I'm not planning on
doing any of that refactoring preemptively. Plus it should be possible
to keep the TDP MMU API constant when the internal implementation
eventually gets split up. i.e. I don't forsee it creating a bunch of
churn down the road.

