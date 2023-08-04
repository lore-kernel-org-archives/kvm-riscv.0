From: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 4 Aug 2023 08:59:24 +0100
Subject: [PATCH 01/10] RISC-V: Expand instruction definitions
In-Reply-To: <20230803-master-refactor-instructions-v4-v1-1-2128e61fa4ff@rivosinc.com>
References: <20230803-master-refactor-instructions-v4-v1-0-2128e61fa4ff@rivosinc.com>
 <20230803-master-refactor-instructions-v4-v1-1-2128e61fa4ff@rivosinc.com>
Message-ID: <20230804-barterer-heritage-ed191081bc47@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 03, 2023 at 07:10:26PM -0700, Charlie Jenkins wrote:
> There are many systems across the kernel that rely on directly creating
> and modifying instructions. In order to unify them, create shared
> definitions for instructions and registers.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h            | 2742 +++++++++++++++++++++++++++---

"I did a lot of copy-pasting from the RISC-V spec"

How is anyone supposed to cross check this when there's 1000s of lines
of a diff here? We've had some subtle bugs in some of the definitions in
the past, so I would like to be able to check at this opportune moment
that things are correct.

>  arch/riscv/include/asm/reg.h             |   88 +
>  arch/riscv/kernel/kgdb.c                 |    4 +-
>  arch/riscv/kernel/probes/simulate-insn.c |   39 +-
>  arch/riscv/kernel/vector.c               |    2 +-

You need to at least split this up. I doubt a 2742 change diff for
insn.h was required to make the changes in these 4 files.

Then after that, it would be so much easier to reason about these
changes if the additions to insn.h happened at the same time as the
removals from the affected locations.

I would probably split this so that things are done in more stages,
with the larger patches split between changes that require no new
definitions and changes that require moving things to insn.h

>  5 files changed, 2629 insertions(+), 246 deletions(-)

What you would want to see if this arrived in your inbox as a reviewer?

Don't get me wrong, I do like what you are doing here, the BPF JIT
especially is filled with "uhh okay, I guess those offsets are right",
so I don't mean to be discouraging.

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230804/f593e272/attachment.sig>
