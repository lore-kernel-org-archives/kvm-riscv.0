From: Conor Dooley <conor@kernel.org>
Date: Thu, 19 Jan 2023 22:13:39 +0000
Subject: [PATCH v3 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
In-Reply-To: <20230119082903.yk3uslfrjtxzassi@orel>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-6-jszhang@kernel.org>
 <2398293.3Lj2Plt8kZ@diego>
 <20230112092136.f2g43hrhmrqouy4y@orel>
 <Y8F2YxMHUt+djhX4@wendy>
 <Y8MRZQENua+wi34T@spud>
 <Y8hqptFcUgjhns4F@spud>
 <20230119082903.yk3uslfrjtxzassi@orel>
Message-ID: <Y8nAk8c/acWf6++5@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Me again!

On Thu, Jan 19, 2023 at 09:29:03AM +0100, Andrew Jones wrote:
> On Wed, Jan 18, 2023 at 09:54:46PM +0000, Conor Dooley wrote:
> > Hey!
> > 
> > I guess here is the right place to follow up on all of this stuff...
> > 
> > On Sat, Jan 14, 2023 at 08:32:37PM +0000, Conor Dooley wrote:

> > Today at [1] we talked a bit about the various bits going on here.
> > I'll attempt to summarise what I remember, but I meant to do this
> > several hours ago and am likely to make a hames of it.
> > 
> > For Zbb/unaligned stuff, the sentiment was along the lines of there
> > needing to be a performance benefit to justify the inclusion.
> > Some of us have HW that is (allegedly) capable of Zbb, and, if that's the

I did some very very basic testing today. Ethernet is still a no-go on
my visionfive 2 board, but the sd card works at least, so I can run w/
Zbb code people want & we can see how it goes!

At the very least, it is capable of executing the instructions that were
used in Appendix A. I didn't try to do anything else, because I am lazy
and if there were some pre-existing test programs I didn't want to go
and write out a bunch of asm myself!

impid appears to be 0x4210427, if that means anything to anyone!

> > case, will give it a go.
> > I think it was similar for unaligned, since there is nothing yet that
> > supports this behaviour, we should wait until a benefit is demonstrable.
> > 
> > On the subject of grouping extension/non-extension capabilities into a
> > single cpufeature, Palmer mentioned that GCC does something similar,
> > for the likes of the Ventana vendor extensions, that are unlikely to be
> > present in isolation.

Jess pointed out on IRC that GCC doesn't support XVentanaCondOps
so maybe there was a mixup there. I don't think that really matters
though, as the point stands regardless of whether it was in GCC or not.

> > Those are (or were?) probed as a group of extensions rather than
> > individually.
> > I think it was said it'd make sense for us to unify extensions that will
> > only ever appear together single psuedo cpufeature too.
> > 
> > For the bitfield approach versus creating pseudo cpufeatures discussion
> > & how to deal with that in alternatives etc, I'm a bit less sure what the
> > outcome was.
> > IIRC, nothing concrete was said about either approach, but maybe it was
> > implied that we should do as GCC does, only grouping things that won't
> > ever been seen apart.
> > Figuring that out seems to have been punted down the road, as the
> > inclusion of our only current example of this (Zbb + unaligned) is
> > dependant on hardware showing up that actually benefits from it.
> > 
> > The plan then seemed to be press ahead with this series & test the
> > benefits of the Zbb str* functions in Zbb capable hardware before making
> > a decision there.
> > 
> > Hopefully I wasn't too far off with that summary...
> 
> This matches my recollection. Thanks for the summary, Conor.

Cool, thanks.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230119/ec5347a2/attachment.sig>
