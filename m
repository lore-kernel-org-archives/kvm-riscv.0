From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 21 Apr 2023 00:43:49 +0530
Subject: [RFC 00/48] RISC-V CoVE support
In-Reply-To: <ZEFopfs5Ij/AIkee@google.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com> <ZEFopfs5Ij/AIkee@google.com>
Message-ID: <CAHBxVyE+SkQ-jpbupmJU4fpuiXY_GufnANDBUuO5bMHDsudeYg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 20, 2023 at 10:00?PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Apr 19, 2023, Atish Patra wrote:
> > 2. Lazy gstage page allocation vs upfront allocation with page pool.
> > Currently, all gstage mappings happen at runtime during the fault. This is expensive
> > as we need to convert that page to confidential memory as well. A page pool framework
> > may be a better choice which can hold all the confidential pages which can be
> > pre-allocated upfront. A generic page pool infrastructure may benefit other CC solutions ?
>
> I'm sorry, what?  Do y'all really not pay any attention to what is happening
> outside of the RISC-V world?
>
> We, where "we" is KVM x86 and ARM, with folks contributing from 5+ companines,
> have been working on this problem for going on three *years*.  And that's just
> from the first public posting[1], there have been discussions about how to approach
> this for even longer.  There have been multiple related presentations at KVM Forum,
> something like 4 or 5 just at KVM Forum 2022 alone.
>

Yes. We are following the restrictedmem effort and was reviewing the
v10 this week.
I did mention about that in the 1st item in the TODO list. We are
planning to use the restrictedmen
feature once it is closer to upstream (which seems to be the case
looking at v10).
Another reason is that this initial series is based on kvmtool only.
We are working on qemu-kvm
right now but have some RISC-V specific dependencies(interrupt
controller stuff) which are not there yet.
As the restrictedmem patches are already available in qemu-kvm too,
our plan was to support CoVE
in qemu-kvm first and work on restrictedmem after that.

This item was just based on this RFC implementation which uses a lazy
gstage page allocation.
The idea was to check if there is any interest at all in this
approach. I should have mentioned about
restrictedmem plan in this section as well. Sorry for the confusion.

Thanks for your suggestion. It seems we should just directly move to
restrictedmem asap.

> Patch 1 says "This patch is based on pkvm patches", so clearly you are at least
> aware that there is other work going on in this space.
>

Yes. We have been following pkvm, tdx & CCA patches. The MMIO section
has more details
on TDX/pkvm related aspects.

> At a very quick glance, this series is suffers from all of the same flaws that SNP,
> TDX, and pKVM have encountered.  E.g. assuming guest memory is backed by struct page
> memory, relying on pinning to solve all problems (hint, it doesn't), and so on and
> so forth.
>
> And to make things worse, this series is riddled with bugs.  E.g. patch 19 alone
> manages to squeeze in multiple fatal bugs in five new lines of code: deadlock due
> to not releasing mmap_lock on failure, failure to correcty handle MOVE, failure to

That's an oversight. Apologies for that. Thanks for pointing it out.

> handle DELETE at all, failure to honor (or reject) READONLY, and probably several
> others.
>
It should be rejected for READONLY as our APIs don't have any
permission flags yet.
I think we should add that to enable CoVE APIs to support as well ?

Same goes for DELETE ops as we don't have an API to delete any
confidential memory region
yet. I was not very sure about the use case for MOVE though (migration
possibly ?)

kvm_riscv_cove_vm_add_memreg should have been invoked only for CREATE
& reject others for now.
I will revise the patch accordingly and leave a TODO comment for the
future about API updates.

> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 4b0f09e..63889d9 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -499,6 +499,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>
>         mmap_read_lock(current->mm);
>
> +       if (is_cove_vm(kvm)) {
> +               ret = kvm_riscv_cove_vm_add_memreg(kvm, base_gpa, size);
> +               if (ret)
> +                       return ret;
> +       }
>         /*
>          * A memory region could potentially cover multiple VMAs, and
>          * any holes between them, so iterate over all of them to find
>
> I get that this is an RFC, but for a series of this size, operating in an area that
> is under heavy development by multiple other architectures, to have a diffstat that
> shows _zero_ changes to common KVM is simply unacceptable.
>

Thanks for the valuable feedback. This is pretty much pre-RFC as the
spec is very much
in draft state. We want to share with the larger linux community to
gather feedback sooner
than later so that we can incorporate that feedback into the spec if any.

> Please, go look at restrictedmem[2] and work on building CoVE support on top of
> that.  If the current proposal doesn't fit CoVE's needs, then we need to know _before_
> all of that code gets merged.
>

Absolutely. That has always been the plan.

> [1] https://lore.kernel.org/linux-mm/20200522125214.31348-1-kirill.shutemov at linux.intel.com
> [2] https://lkml.kernel.org/r/20221202061347.1070246-1-chao.p.peng%40linux.intel.com
>
> > arch/riscv/Kbuild                       |    2 +
> > arch/riscv/Kconfig                      |   27 +
> > arch/riscv/cove/Makefile                |    2 +
> > arch/riscv/cove/core.c                  |   40 +
> > arch/riscv/cove/cove_guest_sbi.c        |  109 +++
> > arch/riscv/include/asm/cove.h           |   27 +
> > arch/riscv/include/asm/covg_sbi.h       |   38 +
> > arch/riscv/include/asm/csr.h            |    2 +
> > arch/riscv/include/asm/kvm_cove.h       |  206 +++++
> > arch/riscv/include/asm/kvm_cove_sbi.h   |  101 +++
> > arch/riscv/include/asm/kvm_host.h       |   10 +-
> > arch/riscv/include/asm/kvm_vcpu_sbi.h   |    3 +
> > arch/riscv/include/asm/mem_encrypt.h    |   26 +
> > arch/riscv/include/asm/sbi.h            |  107 +++
> > arch/riscv/include/uapi/asm/kvm.h       |   17 +
> > arch/riscv/kernel/irq.c                 |   12 +
> > arch/riscv/kernel/setup.c               |    2 +
> > arch/riscv/kvm/Makefile                 |    1 +
> > arch/riscv/kvm/aia.c                    |  101 ++-
> > arch/riscv/kvm/aia_device.c             |   41 +-
> > arch/riscv/kvm/aia_imsic.c              |  127 ++-
> > arch/riscv/kvm/cove.c                   | 1005 +++++++++++++++++++++++
> > arch/riscv/kvm/cove_sbi.c               |  490 +++++++++++
> > arch/riscv/kvm/main.c                   |   30 +-
> > arch/riscv/kvm/mmu.c                    |   45 +-
> > arch/riscv/kvm/tlb.c                    |   11 +-
> > arch/riscv/kvm/vcpu.c                   |   69 +-
> > arch/riscv/kvm/vcpu_exit.c              |   34 +-
> > arch/riscv/kvm/vcpu_insn.c              |  115 ++-
> > arch/riscv/kvm/vcpu_sbi.c               |   16 +
> > arch/riscv/kvm/vcpu_sbi_covg.c          |  232 ++++++
> > arch/riscv/kvm/vcpu_timer.c             |   26 +-
> > arch/riscv/kvm/vm.c                     |   34 +-
> > arch/riscv/kvm/vmid.c                   |   17 +-
> > arch/riscv/mm/Makefile                  |    3 +
> > arch/riscv/mm/init.c                    |   17 +-
> > arch/riscv/mm/ioremap.c                 |   45 +
> > arch/riscv/mm/mem_encrypt.c             |   61 ++
> > drivers/tty/hvc/hvc_riscv_sbi.c         |    5 +
> > drivers/tty/serial/earlycon-riscv-sbi.c |   51 +-
> > include/uapi/linux/kvm.h                |    8 +
> > mm/vmalloc.c                            |   16 +
> > 42 files changed, 3222 insertions(+), 109 deletions(-)
> > create mode 100644 arch/riscv/cove/Makefile
> > create mode 100644 arch/riscv/cove/core.c
> > create mode 100644 arch/riscv/cove/cove_guest_sbi.c
> > create mode 100644 arch/riscv/include/asm/cove.h
> > create mode 100644 arch/riscv/include/asm/covg_sbi.h
> > create mode 100644 arch/riscv/include/asm/kvm_cove.h
> > create mode 100644 arch/riscv/include/asm/kvm_cove_sbi.h
> > create mode 100644 arch/riscv/include/asm/mem_encrypt.h
> > create mode 100644 arch/riscv/kvm/cove.c
> > create mode 100644 arch/riscv/kvm/cove_sbi.c
> > create mode 100644 arch/riscv/kvm/vcpu_sbi_covg.c
> > create mode 100644 arch/riscv/mm/ioremap.c
> > create mode 100644 arch/riscv/mm/mem_encrypt.c
> >
> > --
> > 2.25.1
> >

