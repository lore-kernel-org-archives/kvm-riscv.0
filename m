From: Conor Dooley <conor@kernel.org>
Date: Wed, 1 Mar 2023 16:41:27 +0000
Subject: [PATCH -next v14 09/19] riscv: Add task switch support for vector
In-Reply-To: <20230224170118.16766-10-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-10-andy.chiu@sifive.com>
Message-ID: <Y/+AN0e5netDShxx@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hey Andy,

On Fri, Feb 24, 2023 at 05:01:08PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> This patch adds task switch support for vector. It also supports all
> lengths of vlen.
> 
> [guoren at linux.alibaba.com: First available porting to support vector
> context switching]
> [nick.knight at sifive.com: Rewrite vector.S to support dynamic vlen, xlen and
> code refine]
> [vincent.chen at sifive.com: Fix the might_sleep issue in riscv_v_vstate_save,
> riscv_v_vstate_restore]
> [andrew at sifive.com: Optimize task switch codes of vector]
> [ruinland.tsai at sifive.com: Fix the arch_release_task_struct free wrong
> datap issue]
> [vineetg: Fixed lkp warning with W=1 build]
> [andy.chiu: Use inline asm for task switches]

Can we *please* get rid of these silly changelogs in the commit messages?
Either someone did something worthy of being a co-developer on the
patch, or this belongs under the --- line.
It's a bit ridiculous I think to have a 15 word commit message for the
patch, but have like 8 different bits of per-version changelogs...

> Suggested-by: Andrew Waterman <andrew@sifive.com>
> Co-developed-by: Nick Knight <nick.knight@sifive.com>
> Signed-off-by: Nick Knight <nick.knight@sifive.com>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Ruinland Tsai <ruinland.tsai@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
>  arch/riscv/include/asm/processor.h   |  1 +
>  arch/riscv/include/asm/switch_to.h   |  3 ++
>  arch/riscv/include/asm/thread_info.h |  3 ++
>  arch/riscv/include/asm/vector.h      | 43 ++++++++++++++++++++++++++--
>  arch/riscv/kernel/process.c          | 18 ++++++++++++
>  5 files changed, 66 insertions(+), 2 deletions(-)

> @@ -118,6 +154,9 @@ static __always_inline bool has_vector(void) { return false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_setup_vsize()	 do {} while (0)
> +#define riscv_v_vstate_save(task, regs)		do {} while (0)
> +#define riscv_v_vstate_restore(task, regs)	do {} while (0)
> +#define __switch_to_vector(__prev, __next)	do {} while (0)
>  #define riscv_v_vstate_off(regs)		do {} while (0)
>  #define riscv_v_vstate_on(regs)			do {} while (0)

While you're at it, you pay as well tab out all the do {} while (0) so
that they align. That's my OCD showing though.

Other than my complaint about the changelogs, this looks grand.

Thanks,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230301/6c64a154/attachment-0001.sig>
