From: David Matlack <dmatlack@google.com>
Date: Thu, 19 Jan 2023 09:14:34 -0800
Subject: [RFC PATCH 00/37] KVM: Refactor the KVM/x86 TDP MMU into common
 code
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
References: <20221208193857.4090582-1-dmatlack@google.com>
Message-ID: <Y8l6egh2wWN7BUlZ@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 08, 2022 at 11:38:20AM -0800, David Matlack wrote:
> 
> Hello,
> 
> This series refactors the KVM/x86 "TDP MMU" into common code. This is
> the first step toward sharing TDP (aka Stage-2) page table management
> code across architectures that support KVM.

Thank you everyone for the feedback on this RFC. I have a couple of
updates to share and a question at the end.

First, Alexandre Ghiti from Rivos is going to work on the RISC-V port.
I'd like to target RISC-V first, since it has significantly lower risk
and complexity than e.g. ARM (which has pKVM, stage-1 walkers, and
[soon] nested virtualization to deal with).

Before I send a v2 I am working on sending several related patches.
These are patches that should have enough justification to be merged
regardless of the fate of the Common MMU. By sending them out
separately, I figure they will be easier to review, allow me to make
incremental progress, and ultimately simplify the v2 of this series.

What I've sent so far:

 - https://lore.kernel.org/kvm/20230117222707.3949974-1-dmatlack at google.com/
 - https://lore.kernel.org/kvm/20230118175300.790835-1-dmatlack at google.com/

What's coming soon:

 - A series to add a common API for range-based TLB flushing (patches
   29-33 from this series, plus another cleanup). This cleanup stands on
   its own, plus Raghavendra from Google has need of this for his ARM
   series to add range-based TLBI support [1]

 - A patch to move sp->tdp_mmu_page into sp->role.tdp_mmu. This was
   suggested by Paolo as an alternative to patch 4, and saves a byte
   from struct kvm_mmu_page.

There will probably be more related cleanups I will send but this is
everything I'm tracking so far. If anyone wants to see a complete v2
sooner, let me know.

Paolo and Sean, what are your thoughts on merging the Common MMU
refactor without RISC-V support? e.g. Should Alexandre and I work on
developing a functional prototype first, or are you open to merging the
refactor and then building RISC-V support on top of that? My preference
is the latter so that there is a more stable base on which to build the
RISC-V support, we can make incremental progress, and keep everyone
upstream more involved in the development.

Thanks.

[2] https://lore.kernel.org/kvm/20230109215347.3119271-4-rananta at google.com/

