From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 1 Nov 2022 11:37:11 +0100
Subject: [PATCH 0/9] RISC-V: Apply Zicboz to clear_page and memset
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
Message-ID: <20221101103711.poswtnd5cehzwf2s@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 27, 2022 at 03:02:38PM +0200, Andrew Jones wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page
> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is less than half the old count (see
> patch4's commit message for more details). Another candidate for the
> extension is memset(), but, since memset() isn't just used for zeroing
> memory and it accepts arbitrarily aligned addresses and arbitrary sizes,
> it's not as obvious if adding support for Zicboz will be an overall win.
> In order to make a determination, I've done some analysis and wrote my
> conclusions in the bullets below.
> 
> * When compiling the kernel without CONFIG_RISCV_ISA_ZICBOZ, memset()
>   doesn't change, so that's fine.
> 
> * The overhead added to memset() when the Zicboz extension isn't present,
>   but CONFIG_RISCV_ISA_ZICBOZ is selected, is 3 jumps to known targets,
>   which I believe is fine.
> 
> * The overhead added to a memset() invocation which is not zeroing memory
>   is 7 instructions, where 3 are branches. This seems fine and,
>   furthermore, memset() is almost always invoked to zero memory (99% [2]).
> 
> * When memset() is invoked to zero memory, the proposed Zicboz extended
>   memset() always has a lower dynamic instruction count than the current
>   memset() as long as the input address is Zicboz block aligned and the
>   length is >= the block size.
> 
> * When memset() is invoked to zero memory, the proposed Zicboz extended
>   memset() is always worse for unaligned or too small inputs than the
>   current memset(), but it's only at most a few dozen instructions worse.
>   I think this is probably fine, especially considering the large majority
>   of zeroing invocations are 64 bytes or larger and are aligned to a
>   power-of-2 boundary, 64-byte or larger (77% [2]).

FYI, I spotted a bug in the bpf script used for this result, so I fixed it
and reran it. The new result is 67%, which is no longer a large majority,
but still a solid majority.

> 
> [1] I ported the functions under test to userspace and linked them with
>     a test program. Then, I ran them under gdb with a script[3] which
>     counted instructions by single stepping.
> 
> [2] I wrote bpftrace scripts[4] to count memset() invocations to see the
>     frequency of it being used to zero memory and have block size aligned
>     input addresses with block size or larger lengths. The workload was
>     just random desktop stuff including streaming video and compiling.
>     While I did run this on my x86 notebook, I still expect the data to
>     be representative on RISC-V. Note, x86 has clear_page() so the
>     memset() data regarding alignment and size weren't over inflated by
>     page zeroing invocations. Grepping also shows the large majority of
>     memset() calls are to zero memory (93%).
> 
> [3] https://gist.github.com/jones-drew/487791c956ceca8c18adc2847eec9c60
> [4] https://gist.github.com/jones-drew/1e860692cf6fc0fb2a82a04c9ce720fe
> 
> These patches are based on the following pending series
> 
> 1. "[PATCH v2 0/3] RISC-V: Ensure Zicbom has a valid block size"
>    20221024091309.406906-1-ajones at ventanamicro.com
> 
> 2. "[PATCH 0/8] riscv: improve boot time isa extensions handling"
>    20221006070818.3616-1-jszhang at kernel.org
>    Also including the additional patch proposed here
>    20221013162038.ehseju2neic2xu5z at kamzik
> 
> The patches are also available here
> https://github.com/jones-drew/linux/commits/riscv/zicboz
> 
> To test over QEMU this branch may be used to enable Zicboz
> https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicboz
> 
> To test running a KVM guest with Zicboz this kvmtool branch may be used
> https://github.com/jones-drew/kvmtool/commits/riscv/zicboz
> 
> Thanks,
> drew
> 
> Andrew Jones (9):
>   RISC-V: Factor out body of riscv_init_cbom_blocksize loop
>   RISC-V: Add Zicboz detection and block size parsing
>   RISC-V: insn-def: Define cbo.zero
>   RISC-V: Use Zicboz in clear_page when available
>   RISC-V: KVM: Provide UAPI for Zicboz block size
>   RISC-V: KVM: Expose Zicboz to the guest
>   RISC-V: lib: Improve memset assembler formatting
>   RISC-V: lib: Use named labels in memset
>   RISC-V: Use Zicboz in memset when available
> 
>  arch/riscv/Kconfig                  |  13 ++
>  arch/riscv/include/asm/cacheflush.h |   3 +-
>  arch/riscv/include/asm/hwcap.h      |   1 +
>  arch/riscv/include/asm/insn-def.h   |  50 ++++++
>  arch/riscv/include/asm/page.h       |   6 +-
>  arch/riscv/include/uapi/asm/kvm.h   |   2 +
>  arch/riscv/kernel/cpu.c             |   1 +
>  arch/riscv/kernel/cpufeature.c      |  10 ++
>  arch/riscv/kernel/setup.c           |   2 +-
>  arch/riscv/kvm/vcpu.c               |  11 ++
>  arch/riscv/lib/Makefile             |   1 +
>  arch/riscv/lib/clear_page.S         |  28 ++++
>  arch/riscv/lib/memset.S             | 241 +++++++++++++++++++---------
>  arch/riscv/mm/cacheflush.c          |  64 +++++---
>  14 files changed, 325 insertions(+), 108 deletions(-)
>  create mode 100644 arch/riscv/lib/clear_page.S
> 
> -- 
> 2.37.3
> 

