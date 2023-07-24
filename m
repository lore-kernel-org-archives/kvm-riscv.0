From: Sean Christopherson <seanjc@google.com>
Date: Mon, 24 Jul 2023 10:00:34 -0700
Subject: [RFC PATCH v11 00/29] KVM: guest_memfd() and per-page attributes
In-Reply-To: <110f1aa0-7fcd-1287-701a-89c2203f0ac2@amd.com>
References: <20230718234512.1690985-1-seanjc@google.com> <110f1aa0-7fcd-1287-701a-89c2203f0ac2@amd.com>
Message-ID: <ZL6uMk/8UeuGj8CP@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 24, 2023, Nikunj A. Dadhania wrote:
> On 7/19/2023 5:14 AM, Sean Christopherson wrote:
> > This is the next iteration of implementing fd-based (instead of vma-based)
> > memory for KVM guests.  If you want the full background of why we are doing
> > this, please go read the v10 cover letter[1].
> > 
> > The biggest change from v10 is to implement the backing storage in KVM
> > itself, and expose it via a KVM ioctl() instead of a "generic" sycall.
> > See link[2] for details on why we pivoted to a KVM-specific approach.
> > 
> > Key word is "biggest".  Relative to v10, there are many big changes.
> > Highlights below (I can't remember everything that got changed at
> > this point).
> > 
> > Tagged RFC as there are a lot of empty changelogs, and a lot of missing
> > documentation.  And ideally, we'll have even more tests before merging.
> > There are also several gaps/opens (to be discussed in tomorrow's PUCK).
> 
> As per our discussion on the PUCK call, here are the memory/NUMA accounting 
> related observations that I had while working on SNP guest secure page migration:
> 
> * gmem allocations are currently treated as file page allocations
>   accounted to the kernel and not to the QEMU process.

We need to level set on terminology: these are all *stats*, not accounting.  That
distinction matters because we have wiggle room on stats, e.g. we can probably get
away with just about any definition of how guest_memfd memory impacts stats, so
long as the information that is surfaced to userspace is useful and expected.

But we absolutely need to get accounting correct, specifically the allocations
need to be correctly accounted in memcg.  And unless I'm missing something,
nothing in here shows anything related to memcg.

>   Starting an SNP guest with 40G memory with memory interleave between
>   Node2 and Node3
> 
>   $ numactl -i 2,3 ./bootg_snp.sh
> 
>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
>  242179 root      20   0   40.4g  99580  51676 S  78.0   0.0   0:56.58 qemu-system-x86
> 
>   -> Incorrect process resident memory and shared memory is reported

I don't know that I would call these "incorrect".  Shared memory definitely is
correct, because by definition guest_memfd isn't shared.  RSS is less clear cut;
gmem memory is resident in RAM, but if we show gmem in RSS then we'll end up with
scenarios where RSS > VIRT, which will be quite confusing for unaware users (I'm
assuming the 40g of VIRT here comes from QEMU mapping the shared half of gmem
memslots).

>   Accounting of the memory happens in the host page fault handler path,
>   but for private guest pages we will never hit that.
> 
> * NUMA allocation does use the process mempolicy for appropriate node 
>   allocation (Node2 and Node3), but they again do not get attributed to 
>   the QEMU process
> 
>   Every 1.0s: sudo numastat  -m -p qemu-system-x86 | egrep -i "qemu|PID|Node|Filepage"   gomati: Mon Jul 24 11:51:34 2023
> 
>   Per-node process memory usage (in MBs)
>   PID                               Node 0          Node 1          Node 2          Node 3           Total
>   242179 (qemu-system-x86)           21.14            1.61           39.44           39.38          101.57
>   Per-node system memory usage (in MBs):
>                             Node 0          Node 1          Node 2          Node 3           Total
>   FilePages                2475.63         2395.83        23999.46        23373.22        52244.14
> 
> 
> * Most of the memory accounting relies on the VMAs and as private-fd of 
>   gmem doesn't have a VMA(and that was the design goal), user-space fails 
>   to attribute the memory appropriately to the process.
>
>   /proc/<qemu pid>/numa_maps
>   7f528be00000 interleave:2-3 file=/memfd:memory-backend-memfd-shared\040(deleted) anon=1070 dirty=1070 mapped=1987 mapmax=256 active=1956 N2=582 N3=1405 kernelpagesize_kB=4
>   7f5c90200000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted)
>   7f5c90400000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted) dirty=32 active=0 N2=32 kernelpagesize_kB=4
>   7f5c90800000 interleave:2-3 file=/memfd:rom-backend-memfd-shared\040(deleted) dirty=892 active=0 N2=512 N3=380 kernelpagesize_kB=4
> 
>   /proc/<qemu pid>/smaps
>   7f528be00000-7f5c8be00000 rw-p 00000000 00:01 26629                      /memfd:memory-backend-memfd-shared (deleted)
>   7f5c90200000-7f5c90220000 rw-s 00000000 00:01 44033                      /memfd:rom-backend-memfd-shared (deleted)
>   7f5c90400000-7f5c90420000 rw-s 00000000 00:01 44032                      /memfd:rom-backend-memfd-shared (deleted)
>   7f5c90800000-7f5c90b7c000 rw-s 00000000 00:01 1025                       /memfd:rom-backend-memfd-shared (deleted)

This is all expected, and IMO correct.  There are no userspace mappings, and so
not accounting anything is working as intended.

> * QEMU based NUMA bindings will not work. Memory backend uses mbind() 
>   to set the policy for a particular virtual memory range but gmem 
>   private-FD does not have a virtual memory range visible in the host.

Yes, adding a generic fbind() is the way to solve silve.

