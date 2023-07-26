From: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Jul 2023 07:24:59 -0700
Subject: [RFC PATCH v11 00/29] KVM: guest_memfd() and per-page attributes
In-Reply-To: <2f98a32c-bd3d-4890-b757-4d2f67a3b1a7@amd.com>
References: <20230718234512.1690985-1-seanjc@google.com> <110f1aa0-7fcd-1287-701a-89c2203f0ac2@amd.com>
 <ZL6uMk/8UeuGj8CP@google.com> <2f98a32c-bd3d-4890-b757-4d2f67a3b1a7@amd.com>
Message-ID: <ZMEsuyqHhp1DAVdR@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 26, 2023, Nikunj A. Dadhania wrote:
> Hi Sean,
> 
> On 7/24/2023 10:30 PM, Sean Christopherson wrote:
> >>   Starting an SNP guest with 40G memory with memory interleave between
> >>   Node2 and Node3
> >>
> >>   $ numactl -i 2,3 ./bootg_snp.sh
> >>
> >>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
> >>  242179 root      20   0   40.4g  99580  51676 S  78.0   0.0   0:56.58 qemu-system-x86
> >>
> >>   -> Incorrect process resident memory and shared memory is reported
> > 
> > I don't know that I would call these "incorrect".  Shared memory definitely is
> > correct, because by definition guest_memfd isn't shared.  RSS is less clear cut;
> > gmem memory is resident in RAM, but if we show gmem in RSS then we'll end up with
> > scenarios where RSS > VIRT, which will be quite confusing for unaware users (I'm
> > assuming the 40g of VIRT here comes from QEMU mapping the shared half of gmem
> > memslots).
> 
> I am not sure why will RSS exceed the VIRT, it should be at max 40G (assuming all the
> memory is private)

And also assuming that (a) userspace mmap()'d the shared side of things 1:1 with
private memory and (b) that the shared mappings have not been populated.   Those
assumptions will mostly probably hold true for QEMU, but kernel correctness
shouldn't depend on assumptions about one specific userspace application.

> >>   /proc/<qemu pid>/smaps
> >>   7f528be00000-7f5c8be00000 rw-p 00000000 00:01 26629                      /memfd:memory-backend-memfd-shared (deleted)
> >>   7f5c90200000-7f5c90220000 rw-s 00000000 00:01 44033                      /memfd:rom-backend-memfd-shared (deleted)
> >>   7f5c90400000-7f5c90420000 rw-s 00000000 00:01 44032                      /memfd:rom-backend-memfd-shared (deleted)
> >>   7f5c90800000-7f5c90b7c000 rw-s 00000000 00:01 1025                       /memfd:rom-backend-memfd-shared (deleted)
> > 
> > This is all expected, and IMO correct.  There are no userspace mappings, and so
> > not accounting anything is working as intended.
> Doesn't sound that correct, if 10 SNP guests are running each using 10GB, how
> would we know who is using 100GB of memory?

It's correct with respect to what the interfaces show, which is how much memory
is *mapped* into userspace.

As I said (or at least tried to say) in my first reply, I am not against exposing
memory usage to userspace via stats, only that it's not obvious to me that the
existing VMA-based stats are the most appropriate way to surface this information.

