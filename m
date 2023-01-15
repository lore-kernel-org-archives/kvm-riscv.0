From: Jisheng Zhang <jszhang@kernel.org>
Date: Sun, 15 Jan 2023 22:19:36 +0800
Subject: [PATCH v3 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
In-Reply-To: <2398293.3Lj2Plt8kZ@diego>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-6-jszhang@kernel.org>
 <2398293.3Lj2Plt8kZ@diego>
Message-ID: <Y8QLeEECPqnjCS+2@xhacker>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 12:29:57AM +0100, Heiko St?bner wrote:
> Hi Jisheng.

Hi Heiko,

> 
> Am Mittwoch, 11. Januar 2023, 18:10:19 CET schrieb Jisheng Zhang:
> > riscv_cpufeature_patch_func() currently only scans a limited set of
> > cpufeatures, explicitly defined with macros. Extend it to probe for all
> > ISA extensions.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> >  arch/riscv/include/asm/errata_list.h |  9 ++--
> >  arch/riscv/kernel/cpufeature.c       | 63 ++++------------------------
> >  2 files changed, 11 insertions(+), 61 deletions(-)
> 
> hmmm ... I do see a somewhat big caveat for this.
> and would like to take back my Reviewed-by for now
> 
> 
> With this change we would limit the patchable cpufeatures to actual
> riscv extensions. But cpufeatures can also be soft features like
> how performant the core handles unaligned accesses.

Besides Drew's comments and my reply a few minutes ago, here are
what I thought: I agree with you about "cpufeatures can also be soft
features" which I called cpu related features, but currently we
don't have that case in urgent, the SV48 and SV57 are extensions now
as Jessica pointed out[1], so I planed to send a v7 to apply the
alternative mechanism for SV48/SV57, and I think we still have time to
revisit the "expanding cpufeatures to cover soft features". But that
need to be addressed in another improvement series.

[1] https://lore.kernel.org/linux-riscv/391AFCB9-D314-4243-9E35-6D95B81C9400 at jrtc27.com/

> 
> See Palmer's series [0].
> 
> 
> Also this essentially codifies that each ALTERNATIVE can only ever
> be attached to exactly one extension.
> 
> But contrary to vendor-errata, it is very likely that we will need
> combinations of different extensions for some alternatives in the future.
> 
> In my optimization quest, I found that it's actually pretty neat to
> convert the errata-id for cpufeatures to a bitfield [1], because then it's
> possible to just combine extensions into said bitfield [2]:
> 
> 	ALTERNATIVE_2("nop",
> 		      "j strcmp_zbb_unaligned", 0, CPUFEATURE_ZBB | CPUFEATURE_FAST_UNALIGNED, 0, CONFIG_RISCV_ISA_ZBB,
> 		      "j variant_zbb", 0, CPUFEATURE_ZBB, CPUFEATURE_FAST_UNALIGNED, CONFIG_RISCV_ISA_ZBB)
> 
> [the additional field there models a "not" component]
> 
> So I really feel this would limit us quite a bit.
> 
> 
> Heiko
> 
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=riscv-hwprobe-v1&id=510c491cb9d87dcbdc91c63558dc704968723240
> [1] https://github.com/mmind/linux-riscv/commit/f57a896122ee7e666692079320fc35829434cf96
> [2] https://github.com/mmind/linux-riscv/commit/8cef615dab0c00ad68af2651ee5b93d06be17f27#diff-194cb8a86f9fb9b03683295f21c8f46b456a9f94737f01726ddbcbb9e3aace2cR12
> 
> 

