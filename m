From: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 13 Jan 2023 15:18:59 +0000
Subject: [PATCH v3 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
In-Reply-To: <20230112092136.f2g43hrhmrqouy4y@orel>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-6-jszhang@kernel.org>
 <2398293.3Lj2Plt8kZ@diego>
 <20230112092136.f2g43hrhmrqouy4y@orel>
Message-ID: <Y8F2YxMHUt+djhX4@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 10:21:36AM +0100, Andrew Jones wrote:
> On Thu, Jan 12, 2023 at 12:29:57AM +0100, Heiko St?bner wrote:
> > Am Mittwoch, 11. Januar 2023, 18:10:19 CET schrieb Jisheng Zhang:
> > > riscv_cpufeature_patch_func() currently only scans a limited set of
> > > cpufeatures, explicitly defined with macros. Extend it to probe for all
> > > ISA extensions.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > ---
> > >  arch/riscv/include/asm/errata_list.h |  9 ++--
> > >  arch/riscv/kernel/cpufeature.c       | 63 ++++------------------------
> > >  2 files changed, 11 insertions(+), 61 deletions(-)
> > 
> > hmmm ... I do see a somewhat big caveat for this.
> > and would like to take back my Reviewed-by for now
> > 
> > 
> > With this change we would limit the patchable cpufeatures to actual
> > riscv extensions. But cpufeatures can also be soft features like
> > how performant the core handles unaligned accesses.
> 
> I agree that this needs to be addressed and Jisheng also raised this
> yesterday here [*]. It seems we need the concept of cpufeatures, which
> may be extensions or non-extensions.
> 
> [*] https://lore.kernel.org/all/Y77xyNPNqnFQUqAx at xhacker/
> 
> > See Palmer's series [0].
> > 
> > 
> > Also this essentially codifies that each ALTERNATIVE can only ever
> > be attached to exactly one extension.
> > 
> > But contrary to vendor-errata, it is very likely that we will need
> > combinations of different extensions for some alternatives in the future.
> 
> One possible approach may be to combine extensions/non-extensions at boot
> time into pseudo-cpufeatures. Then, alternatives can continue attaching to
> a single "feature". (I'm not saying that's a better approach than the
> bitmap, I'm just suggesting it as something else to consider.)


> >         ALTERNATIVE_2("nop",
> >                       "j strcmp_zbb_unaligned", 0, CPUFEATURE_ZBB | CPUFEATURE_FAST_UNALIGNED, 0, CONFIG_RISCV_ISA_ZBB,
> >                       "j variant_zbb", 0, CPUFEATURE_ZBB, CPUFEATURE_FAST_UNALIGNED, CONFIG_RISCV_ISA_ZBB)
> > 
> > [the additional field there models a "not" component]

Since we're discussing theoretical implementations, and it's a little hard
to picture all that they entail in my head, I might be making a fool of
myself here with assumptions...

Heiko's suggestion sounded along the lines of: keep probing individual
"features" as we are now. Features in this case being the presence of
the extension or non-extension capability. And then in the alternative,
make all of the decisions about which to apply.

Drew's suggestion would have significantly more defined CPUFEATURE_FOOs,
but would offload the decision making about which extensions or non-
extension capabilities constitute a feature to regular old cpufeature
code. However, the order of precedence would remain in the alt macro, as
it does now.

I think I am just a wee bit biased, but adding the complexity somewhere
other than alternative macros seems a wise choice, especially as we are
likely to find that complexity increases over time?

The other thing that came to mind, and maybe this is just looking for
holes where they don't exist (or are not worth addressing), is that
order of precedence.
I can imagine that, in some cases, the order of precedence is not a
constant per psuedo-cpufeature, but determined by implementation of
the capabilities that comprise it?

If my assumption/understanding holds, moving decision making out of the
alternative seems like it would better provision for scenarios like
that? I dunno, maybe that is whatever the corollary of "premature
optimisation" is for this discussion.

That's my unsolicited ? 0.02, hopefully I wasn't off-base with the
assumptions I made.

Heiko, I figure you've got some sort of WIP stuff for this anyway since
you're interested in the fast unaligned? How close are you to posting any
of that?

While I think of it, w.r.t. extension versus (pseudo)cpufeature etc
naming, it may make sense to call the functions that this series adds
in patch 6 has_cpufeature_{un,}likely(), no matter what decision gets
made here?
IMO using cpufeature seems to make more sense for a general use API that
may be used later on for the likes of unaligned access, even if
initially it is not used for anything other than extensions.

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230113/e0734ea8/attachment-0001.sig>
