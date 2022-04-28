From: Oliver Upton <oupton@google.com>
Date: Thu, 28 Apr 2022 17:45:47 +0000
Subject: [PATCH v3 4/6] KVM: arm64/mmu: count KVM page table pages in
 pagetable stats
In-Reply-To: <CAJD7tkY-WZKcyer=TbWF0dVfOhvZO7hqPN=AYCDZe1f+2HA-QQ@mail.gmail.com>
References: <20220426053904.3684293-1-yosryahmed@google.com>
 <20220426053904.3684293-5-yosryahmed@google.com>
 <YmegoB/fBkfwaE5z@google.com>
 <CAJD7tkY-WZKcyer=TbWF0dVfOhvZO7hqPN=AYCDZe1f+2HA-QQ@mail.gmail.com>
Message-ID: <YmrSywSU1ezREvT6@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 26, 2022 at 12:27:57PM -0700, Yosry Ahmed wrote:
> > What page tables do we want to account? KVM on ARM manages several page
> > tables.
> >
> > For regular KVM, the host kernel manages allocations for the hyp stage 1
> > tables in addition to the stage 2 tables used for a particular VM. The
> > former is system overhead whereas the latter could be attributed to a
> > guest VM.
> 
> Honestly I would love to get your input on this. The main motivation
> here is to give users insights on the kernel memory usage on their
> system (or in a cgroup). We currently have NR_PAGETABLE stats for
> normal kernel page tables (allocated using
> __pte_alloc_one()/pte_free()), this shows up in /proc/meminfo,
> /path/to/cgroup/memory.stat, and node stats. The idea is to add
> NR_SECONDARY_PAGETABLE that should include the memory used for kvm
> pagetables, which should be a separate category (no overlap). What
> gets included or not depends on the semantics of KVM and what exactly
> falls under the category of secondary pagetables from the user's pov.
> 
> Currently it looks like s2 page table allocations get accounted to
> kmem of memory control groups (GFP_KERNEL_ACCOUNT), while hyp page
> table allocations do not (GFP_KERNEL). So we could either follow this
> and only account s2 page table allocations in the stats, or make hyp
> allocations use GFP_KERNEL_ACCOUNT as well and add them to the stats.
> Let me know what you think.

I think it is reasonable to just focus on stage 2 table allocations and
ignore all else. As Marc pointed out it isn't workable in other
contexts anyway (pKVM), and keeps the patch tidy too.

GFP_KERNEL_ACCOUNT for hyp allocations wouldn't make sense, as it is
done at init to build out the system page tables for EL2.

--
Thanks,
Oliver

