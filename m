From: Michael Roth <michael.roth@amd.com>
Date: Fri, 21 Apr 2023 10:35:14 -0500
Subject: [RFC 00/48] RISC-V CoVE support
In-Reply-To: <ZEFopfs5Ij/AIkee@google.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
 <ZEFopfs5Ij/AIkee@google.com>
Message-ID: <20230421153514.tpqzvdu7zt7pe7hs@amd.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 20, 2023 at 09:30:29AM -0700, Sean Christopherson wrote:
> Please, go look at restrictedmem[2] and work on building CoVE support on top of
> that.  If the current proposal doesn't fit CoVE's needs, then we need to know _before_
> all of that code gets merged.

I agree it's preferable to know beforehand to avoid potential
maintainability quagmires bringing additional architectures onboard, and
that it probably makes sense here to get that early input. But as a
general statement, it's not necessarily a *requirement*.

I worry that if we commit to such a policy that by the time restrictedmem
gets close to merge, yet another architecture/use-case will come along that
delays things further for architectures that already have hardware in the
field.

Not saying that's the case here, but just in general I think it's worth
keeping the option open on iterating on a partial solution vs. trying to
address everything on the first shot, depending on how the timing works
out.

Thanks,

Mike

> 
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
> 

