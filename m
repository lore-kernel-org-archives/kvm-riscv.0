From: Palmer Dabbelt <palmer@dabbelt.com>
Date: Tue, 14 Mar 2023 21:35:09 -0700 (PDT)
Subject: [PATCH v6 0/8] RISC-V: Apply Zicboz to clear_page
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
Message-ID: <mhng-72607fed-a923-4921-896f-7f703434083a@palmer-ri-x1c9a>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 24 Feb 2023 08:26:23 PST (-0800), ajones at ventanamicro.com wrote:
> When the Zicboz extension is available we can more rapidly zero naturally
> aligned Zicboz block sized chunks of memory. As pages are always page

I guess we're sort of in a grey area here: this is just a performance 
thing so in theory some sort of benchmark should be required, but IMO 
it's OK to just hand wave this one away -- if the "zero a cache block" 
instruction doesn't make "zero a page" go faster then something has gone 
so far off the rails it's probably better to just pretend the machine 
doesn't implement Zicboz.

This all LGTM, so unless anyone's opposed or it blows up on testing 
overnight then it'll be on for-next.

Thanks!

> aligned and are larger than any Zicboz block size will be, then
> clear_page() appears to be a good candidate for the extension. While cycle
> count and energy consumption should also be considered, we can be pretty
> certain that implementing clear_page() with the Zicboz extension is a win
> by comparing the new dynamic instruction count with its current count[1].
> Doing so we see that the new count is just over a quarter of the old count
> (see patch6's commit message for more details).
>
> For those of you who reviewed v1[2], you may be looking for the memset()
> patches. As pointed out in v1, and a couple follow-up emails, it's not
> clear that patching memset() is a win yet. When I get a chance to test
> on real hardware with a comprehensive benchmark collection then I can
> post the memset() patches separately (assuming the benchmarks show it's
> worthwhile).
>
> Based on riscv-linux/for-next plus the dependencies listed below.
>
> Dependencies:
> https://lore.kernel.org/all/20230224154601.88163-1-ajones at ventanamicro.com/
>
> The patches are also available here
> https://github.com/jones-drew/linux/commits/riscv/zicboz-v6
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
> [1] I ported the functions under test to userspace and linked them with
>     a test program. Then, I ran them under gdb with a script[3] which
>     counted instructions by single stepping.
> [2] https://lore.kernel.org/all/20221027130247.31634-1-ajones at ventanamicro.com/
> [3] https://gist.github.com/jones-drew/487791c956ceca8c18adc2847eec9c60
>
> v6:
>   - Rebased on latest riscv-linux/for-next
>   - Used upper/lower_16_bits() in PATCH_ID_* macros, thanks to Conor
>     for pointing out that they can be improved
>   - Switched to SYM_FUNC_START/END for clear_page and exported the
>     symbol since other building modules which use clear_page was
>     busted [Ben Dooks and Sudip Mukherjee]
>   - Picked up an R-b from Conor
>
> v5:
>   - Rebased on latest for-next which allowed dropping v4's dependencies
>   - Added a new dependency on an alternatives/cpufeatures cleanup series
>   - Replaced "RISC-V: cpufeature: Put vendor_id to work" with "riscv:
>     cpufeatures: Put the upper 16 bits of patch ID to work" since touching
>     vendor_id is probably a bad idea [Conor]
>   - Picked up an r-b from Conor
>
> v4:
>   - Rebased on latest for-next which allowed dropping one dependency
>   - Added "RISC-V: alternatives: Support patching multiple insns in assembly"
>     since I needed to use more than one instruction in an ALTERNATIVE call
>     from assembly. I can post this patch separately as a fix if desired.
>   - Improved the dt-binding patch commit message [Conor]
>   - Picked up some tags from Conor and Rob (I kept Conor's a-b on the
>     clear_page patch, even though there are several changes to it, because
>     I interpreted the a-b as "OK by me to implement a Zicboz clear_page")
>   - Added "RISC-V: cpufeature: Put vendor_id to work", which was necessary
>     for how I wanted to use ALTERNATIVE in clear_page.
>   - Fallback to memset when the Zicboz block size is too big for the
>     Zicboz implementation of clear_page [Palmer]
>   - Use lw without la in clear_page impl [Palmer]
>   - Implement a Duff device for clear_page using the new 'vendor_id'
>     alternatives support [drew]
>
> v3:
>   - CC'ed DT list
>   - Improved commit message of DT bindings patch to point out relationship
>     with cbom-block-size
>   - Picked up an a-b from Conor
>
> v2:
>   - s/blksz/block_size/, improved commit message for "RISC-V: Add Zicboz
>     detection and block size parsing", isa ext sorting [Conor]
>   - Added dt binding patch [Heiko]
>   - Picked up r-b's from Conor, Heiko, and Anup
>   - Moved config symbol and CBO_zero() introduction to "RISC-V: Use Zicboz
>     in clear_page when available" and improved its commit message and
>     implementation (unrolled four times) [drew]
>   - Dropped memset() patches [drew]
>   - Rebased on ae4d39f75308 ("Merge patch "RISC-V: fix incorrect type of
>     ARCH_CANAAN_K210_DTB_SOURCE"") plus the dependencies
>
> Andrew Jones (8):
>   RISC-V: alternatives: Support patching multiple insns in assembly
>   RISC-V: Factor out body of riscv_init_cbom_blocksize loop
>   dt-bindings: riscv: Document cboz-block-size
>   RISC-V: Add Zicboz detection and block size parsing
>   RISC-V: cpufeatures: Put the upper 16 bits of patch ID to work
>   RISC-V: Use Zicboz in clear_page when available
>   RISC-V: KVM: Provide UAPI for Zicboz block size
>   RISC-V: KVM: Expose Zicboz to the guest
>
>  .../devicetree/bindings/riscv/cpus.yaml       |  5 ++
>  arch/riscv/Kconfig                            | 13 ++++
>  arch/riscv/include/asm/alternative-macros.h   |  6 +-
>  arch/riscv/include/asm/alternative.h          |  4 +
>  arch/riscv/include/asm/cacheflush.h           |  3 +-
>  arch/riscv/include/asm/hwcap.h                |  1 +
>  arch/riscv/include/asm/insn-def.h             |  4 +
>  arch/riscv/include/asm/page.h                 |  6 +-
>  arch/riscv/include/uapi/asm/kvm.h             |  2 +
>  arch/riscv/kernel/cpu.c                       |  1 +
>  arch/riscv/kernel/cpufeature.c                | 58 ++++++++++++++-
>  arch/riscv/kernel/setup.c                     |  2 +-
>  arch/riscv/kvm/vcpu.c                         | 11 +++
>  arch/riscv/lib/Makefile                       |  1 +
>  arch/riscv/lib/clear_page.S                   | 74 +++++++++++++++++++
>  arch/riscv/mm/cacheflush.c                    | 64 +++++++++-------
>  16 files changed, 219 insertions(+), 36 deletions(-)
>  create mode 100644 arch/riscv/lib/clear_page.S

