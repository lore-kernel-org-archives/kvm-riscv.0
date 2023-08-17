From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 16 Aug 2023 17:31:26 -0700
Subject: [PATCH 00/10] RISC-V: Refactor instructions
In-Reply-To: <ZM00UYDzEAz/JT3n@ghost>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
 <20230804-2c57bddd6e87fdebc20ff9d5@orel>
 <ZM00UYDzEAz/JT3n@ghost>
Message-ID: <ZN1qXlLp6qfpBeGF@ghost>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 04, 2023 at 10:24:33AM -0700, Charlie Jenkins wrote:
> On Fri, Aug 04, 2023 at 12:28:28PM +0300, Andrew Jones wrote:
> > On Thu, Aug 03, 2023 at 07:10:25PM -0700, Charlie Jenkins wrote:
> > > There are numerous systems in the kernel that rely on directly
> > > modifying, creating, and reading instructions. Many of these systems
> > > have rewritten code to do this. This patch will delegate all instruction
> > > handling into insn.h and reg.h. All of the compressed instructions, RVI,
> > > Zicsr, M, A instructions are included, as well as a subset of the F,D,Q
> > > extensions.
> > > 
> > > ---
> > > This is modifying code that https://lore.kernel.org/lkml/20230731183925.152145-1-namcaov at gmail.com/
> > > is also touching.
> > > 
> > > ---
> > > Testing:
> > > 
> > > There are a lot of subsystems touched and I have not tested every
> > > individual instruction. I did a lot of copy-pasting from the RISC-V spec
> > > so opcodes and such should be correct
> > 
> > How about we create macros which generate each of the functions an
> > instruction needs, e.g. riscv_insn_is_*(), etc. based on the output of
> > [1]. I know basically nothing about that project, but it looks like it
> > creates most the defines this series is creating from what we [hope] to
> > be an authoritative source. I also assume that if we don't like the
> > current output format, then we could probably post patches to the project
> > to get the format we want. For example, we could maybe propose an "lc"
> > format for "Linux C".
> That's a great idea, I didn't realize that existed!
I have discovered that the riscv-opcodes repository is not in a state
that makes it helpful. If it were workable, it would make it easy to
include a "Linux C" format. I have had a pull request open on the repo
for two weeks now and the person who maintains the repo has not
interacted. At minimum, in order for it to be useful it would need an ability to
describe the bit order of immediates in an instruction and include script
arguments to select which instructions should be included. There is a
"C" format, but it is actually just a Spike format. Nonetheless, it
seems like it is prohibitive to use it.
> > 
> > I'd also recommend only importing the generated defines and generating
> > the functions that will actually have immediate consumers or are part of
> > a set of defines that have immediate consumers. Each consumer of new
> > instructions will be responsible for generating and importing the defines
> > and adding the respective macro invocations to generate the functions.
> > This series can also take that approach, i.e. convert one set of
> > instructions at a time, each in a separate patch.
> Since I was hand-writing everything and copying it wasn't too much
> effort to just copy all of the instructions from a group. However, from
> a testing standpoint it makes sense to exclude instructions not yet in
> use.
> > 
> > [1] https://github.com/riscv/riscv-opcodes
> > 
> > Thanks,
> > drew
> > 
> > 
> > > , but the construction of every
> > > instruction is not fully tested.
> > > 
> > > vector: Compiled and booted
> > > 
> > > jump_label: Ensured static keys function as expected.
> > > 
> > > kgdb: Attempted to run the provided tests but they failed even without
> > > my changes
> > > 
> > > module: Loaded and unloaded modules
> > > 
> > > patch.c: Ensured kernel booted
> > > 
> > > kprobes: Used a kprobing module to probe jalr, auipc, and branch
> > > instructions
> > > 
> > > nommu misaligned addresses: Kernel boots
> > > 
> > > kvm: Ran KVM selftests
> > > 
> > > bpf: Kernel boots. Most of the instructions are exclusively used by BPF
> > > but I am unsure of the best way of testing BPF.
> > > 
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > 
> > > ---
> > > Charlie Jenkins (10):
> > >       RISC-V: Expand instruction definitions
> > >       RISC-V: vector: Refactor instructions
> > >       RISC-V: Refactor jump label instructions
> > >       RISC-V: KGDB: Refactor instructions
> > >       RISC-V: module: Refactor instructions
> > >       RISC-V: Refactor patch instructions
> > >       RISC-V: nommu: Refactor instructions
> > >       RISC-V: kvm: Refactor instructions
> > >       RISC-V: bpf: Refactor instructions
> > >       RISC-V: Refactor bug and traps instructions
> > > 
> > >  arch/riscv/include/asm/bug.h             |   18 +-
> > >  arch/riscv/include/asm/insn.h            | 2744 +++++++++++++++++++++++++++---
> > >  arch/riscv/include/asm/reg.h             |   88 +
> > >  arch/riscv/kernel/jump_label.c           |   13 +-
> > >  arch/riscv/kernel/kgdb.c                 |   13 +-
> > >  arch/riscv/kernel/module.c               |   80 +-
> > >  arch/riscv/kernel/patch.c                |    3 +-
> > >  arch/riscv/kernel/probes/kprobes.c       |   13 +-
> > >  arch/riscv/kernel/probes/simulate-insn.c |  100 +-
> > >  arch/riscv/kernel/probes/uprobes.c       |    5 +-
> > >  arch/riscv/kernel/traps.c                |    9 +-
> > >  arch/riscv/kernel/traps_misaligned.c     |  218 +--
> > >  arch/riscv/kernel/vector.c               |    5 +-
> > >  arch/riscv/kvm/vcpu_insn.c               |  281 +--
> > >  arch/riscv/net/bpf_jit.h                 |  707 +-------
> > >  15 files changed, 2825 insertions(+), 1472 deletions(-)
> > > ---
> > > base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4
> > > change-id: 20230801-master-refactor-instructions-v4-433aa040da03
> > > -- 
> > > - Charlie
> > > 
> > > 
> > > -- 
> > > kvm-riscv mailing list
> > > kvm-riscv at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/kvm-riscv

