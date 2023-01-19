From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 19 Jan 2023 09:29:03 +0100
Subject: [PATCH v3 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
In-Reply-To: <Y8hqptFcUgjhns4F@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-6-jszhang@kernel.org>
 <2398293.3Lj2Plt8kZ@diego>
 <20230112092136.f2g43hrhmrqouy4y@orel>
 <Y8F2YxMHUt+djhX4@wendy>
 <Y8MRZQENua+wi34T@spud>
 <Y8hqptFcUgjhns4F@spud>
Message-ID: <20230119082903.yk3uslfrjtxzassi@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 18, 2023 at 09:54:46PM +0000, Conor Dooley wrote:
> Hey!
> 
> I guess here is the right place to follow up on all of this stuff...
> 
> On Sat, Jan 14, 2023 at 08:32:37PM +0000, Conor Dooley wrote:
> > On Fri, Jan 13, 2023 at 03:18:59PM +0000, Conor Dooley wrote:
> > > On Thu, Jan 12, 2023 at 10:21:36AM +0100, Andrew Jones wrote:
> > > > On Thu, Jan 12, 2023 at 12:29:57AM +0100, Heiko St?bner wrote:
> > > > > Am Mittwoch, 11. Januar 2023, 18:10:19 CET schrieb Jisheng Zhang:
> > > > > > riscv_cpufeature_patch_func() currently only scans a limited set of
> > > > > > cpufeatures, explicitly defined with macros. Extend it to probe for all
> > > > > > ISA extensions.
> > > > > > 
> > > > > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > > > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > > > > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > > > > ---
> > > > > >  arch/riscv/include/asm/errata_list.h |  9 ++--
> > > > > >  arch/riscv/kernel/cpufeature.c       | 63 ++++------------------------
> > > > > >  2 files changed, 11 insertions(+), 61 deletions(-)
> > > > > 
> > > > > hmmm ... I do see a somewhat big caveat for this.
> > > > > and would like to take back my Reviewed-by for now
> > > > > 
> > > > > 
> > > > > With this change we would limit the patchable cpufeatures to actual
> > > > > riscv extensions. But cpufeatures can also be soft features like
> > > > > how performant the core handles unaligned accesses.
> > > > 
> > > > I agree that this needs to be addressed and Jisheng also raised this
> > > > yesterday here [*]. It seems we need the concept of cpufeatures, which
> > > > may be extensions or non-extensions.
> > > > 
> > > > [*] https://lore.kernel.org/all/Y77xyNPNqnFQUqAx at xhacker/
> > > > 
> > > > > See Palmer's series [0].
> > > > > 
> > > > > 
> > > > > Also this essentially codifies that each ALTERNATIVE can only ever
> > > > > be attached to exactly one extension.
> > > > > 
> > > > > But contrary to vendor-errata, it is very likely that we will need
> > > > > combinations of different extensions for some alternatives in the future.
> > > > 
> > > > One possible approach may be to combine extensions/non-extensions at boot
> > > > time into pseudo-cpufeatures. Then, alternatives can continue attaching to
> > > > a single "feature". (I'm not saying that's a better approach than the
> > > > bitmap, I'm just suggesting it as something else to consider.)
> > > 
> > > 
> > > > >         ALTERNATIVE_2("nop",
> > > > >                       "j strcmp_zbb_unaligned", 0, CPUFEATURE_ZBB | CPUFEATURE_FAST_UNALIGNED, 0, CONFIG_RISCV_ISA_ZBB,
> > > > >                       "j variant_zbb", 0, CPUFEATURE_ZBB, CPUFEATURE_FAST_UNALIGNED, CONFIG_RISCV_ISA_ZBB)
> > > > > 
> > > > > [the additional field there models a "not" component]
> > > 
> > > Since we're discussing theoretical implementations, and it's a little hard
> > > to picture all that they entail in my head, I might be making a fool of
> > > myself here with assumptions...
> > > 
> > > Heiko's suggestion sounded along the lines of: keep probing individual
> > > "features" as we are now. Features in this case being the presence of
> > > the extension or non-extension capability. And then in the alternative,
> > > make all of the decisions about which to apply.
> > > 
> > > Drew's suggestion would have significantly more defined CPUFEATURE_FOOs,
> > > but would offload the decision making about which extensions or non-
> > > extension capabilities constitute a feature to regular old cpufeature
> > > code. However, the order of precedence would remain in the alt macro, as
> > > it does now.
> > > 
> > > I think I am just a wee bit biased, but adding the complexity somewhere
> > > other than alternative macros seems a wise choice, especially as we are
> > > likely to find that complexity increases over time?
> > > 
> > > The other thing that came to mind, and maybe this is just looking for
> > > holes where they don't exist (or are not worth addressing), is that
> > > order of precedence.
> > > I can imagine that, in some cases, the order of precedence is not a
> > > constant per psuedo-cpufeature, but determined by implementation of
> > > the capabilities that comprise it?
> > 
> > Having spent longer than I maybe should've looking at your patches
> > Heiko, given it's a Saturday evening, the precedence stuff is still
> > sticking out to me..
> > 
> > For Zbb & fast unaligned, the order may be non-controversial, but in
> > the general case I don't see how it can be true that the order of
> > precedence for variants is a constant.
> > 
> > Creating pseudo cpufeatures as Drew suggested does seem like a way to
> > extract complexity from the alternatives themselves (which I think is a
> > good thing) but at the expense of eating up cpu_req_feature bits...
> > By itself, it doesn't help with precedence, but it may better allow us
> > to deal with some of the precedence in cpufeature.c, since the
> > alternative would operate based on the pseudo cpufeature rather than on
> > the individual capabilities that the pseudo cpufeature depends on.
> > 
> > I tried to come up with a suggestion for what to do about precedence,
> > but everything I thought up felt a bit horrific tbh.
> > The thing that fits the current model best is just allowing cpu vendors
> > to add, yet more, "errata" that pick the variant that works best for
> > their implementation... Although I'd be worried about ballooning some of
> > these ALT_FOO macros out to a massive degree with that sort of approach.
> > 
> > > If my assumption/understanding holds, moving decision making out of the
> > > alternative seems like it would better provision for scenarios like
> > > that? I dunno, maybe that is whatever the corollary of "premature
> > > optimisation" is for this discussion.
> > > 
> > > That's my unsolicited ? 0.02, hopefully I wasn't off-base with the
> > > assumptions I made.
> > 
> > The order in which an alternative is added to the macro does matter,
> > right? At least, that's how I thought it worked and hope I've not had
> > an incorrect interpretation there all along... I wasn't until I started
> > reading your patch and couldn't understand why you had a construct that
> > looked like
> > 
> > if (zbb && !fast_unaligned)
> > ...
> > else if (zbb && fast_unaligned)
> > ...
> > 
> > rather than just inverting the order and dropping the !fast_unaligned
> > that I realised I might have a gap in my understanding after all..
> > 
> > > Heiko, I figure you've got some sort of WIP stuff for this anyway since
> > > you're interested in the fast unaligned? How close are you to posting any
> > > of that?
> > > 
> > > While I think of it, w.r.t. extension versus (pseudo)cpufeature etc
> > > naming, it may make sense to call the functions that this series adds
> > > in patch 6 has_cpufeature_{un,}likely(), no matter what decision gets
> > > made here?
> > > IMO using cpufeature seems to make more sense for a general use API that
> > > may be used later on for the likes of unaligned access, even if
> > > initially it is not used for anything other than extensions. 
> 
> Today at [1] we talked a bit about the various bits going on here.
> I'll attempt to summarise what I remember, but I meant to do this
> several hours ago and am likely to make a hames of it.
> 
> For Zbb/unaligned stuff, the sentiment was along the lines of there
> needing to be a performance benefit to justify the inclusion.
> Some of us have HW that is (allegedly) capable of Zbb, and, if that's the
> case, will give it a go.
> I think it was similar for unaligned, since there is nothing yet that
> supports this behaviour, we should wait until a benefit is demonstrable.
> 
> On the subject of grouping extension/non-extension capabilities into a
> single cpufeature, Palmer mentioned that GCC does something similar,
> for the likes of the Ventana vendor extensions, that are unlikely to be
> present in isolation.
> Those are (or were?) probed as a group of extensions rather than
> individually.
> I think it was said it'd make sense for us to unify extensions that will
> only ever appear together single psuedo cpufeature too.
> 
> For the bitfield approach versus creating pseudo cpufeatures discussion
> & how to deal with that in alternatives etc, I'm a bit less sure what the
> outcome was.
> IIRC, nothing concrete was said about either approach, but maybe it was
> implied that we should do as GCC does, only grouping things that won't
> ever been seen apart.
> Figuring that out seems to have been punted down the road, as the
> inclusion of our only current example of this (Zbb + unaligned) is
> dependant on hardware showing up that actually benefits from it.
> 
> The plan then seemed to be press ahead with this series & test the
> benefits of the Zbb str* functions in Zbb capable hardware before making
> a decision there.
> 
> Hopefully I wasn't too far off with that summary...

This matches my recollection. Thanks for the summary, Conor.

drew

> 
> Thanks,
> Conor.
> 
> 1 - https://lore.kernel.org/linux-riscv/mhng-775d4068-6c1e-48a4-a1dc-b4a76ff26bb3 at palmer-ri-x1c9a/



