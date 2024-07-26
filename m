From: Nicholas Piggin <npiggin@gmail.com>
Date: Fri, 26 Jul 2024 14:15:00 +1000
Subject: [kvm-unit-tests PATCH] build: retain intermediate .aux.o
 targets
In-Reply-To: <D1ZLRVNGPWTV.5H76A3E8DJCV@gmail.com>
References: <20240612044234.212156-1-npiggin@gmail.com>
 <20240612082847.GG19790@gate.crashing.org>
 <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
 <20240614010856.GK19790@gate.crashing.org>
 <D1ZLRVNGPWTV.5H76A3E8DJCV@gmail.com>
Message-ID: <D2Z6GP2VFOJ8.2KU7OB25CUXTC@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri Jun 14, 2024 at 6:38 PM AEST, Nicholas Piggin wrote:
> On Fri Jun 14, 2024 at 11:08 AM AEST, Segher Boessenkool wrote:
> > On Fri, Jun 14, 2024 at 10:43:39AM +1000, Nicholas Piggin wrote:
> > > On Wed Jun 12, 2024 at 6:28 PM AEST, Segher Boessenkool wrote:
> > > > On Wed, Jun 12, 2024 at 02:42:32PM +1000, Nicholas Piggin wrote:
> > > > > arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
> > > > > in dependency chains that cause them to be made as intermediate files,
> > > > > which get removed when make finishes. This results in unnecessary
> > > > > partial rebuilds. If make is run again, this time the .aux.o targets
> > > > > are not intermediate, possibly due to being made via different
> > > > > dependencies.
> > > > > 
> > > > > Adding .aux.o files to .PRECIOUS prevents them being removed and solves
> > > > > the rebuild problem.
> > > > > 
> > > > > s390x does not have the problem because .SECONDARY prevents dependancies
> > > > > from being built as intermediate. However the same change is made for
> > > > > s390x, for consistency.
> > > >
> > > > This is exactly what .SECONDARY is for, as its documentation says,
> > > > even.  Wouldn't it be better to just add a .SECONDARY to the other
> > > > targets as well?
> > > 
> > > Yeah we were debating that and agreed .PRECIOUS may not be the
> > > cleanest fix but since we already use that it's okay for a
> > > minimal fix.
> >
> > But why add it to s390x then?  It is not a fix there at all!
>
> Eh, not a big deal. I mentioned that in the changelog it doesn't seem to
> pracicaly fix something. And I rather the makefiles converge as much as
> possible rather than diverge more.
>
> .SECONDARY was added independently and not to fix this problem in
> s390x. And s390x has .SECONDARY slightly wrong AFAIKS. It mentions
> .SECONDARY: twice in a way that looks like it was meant to depend on
> specific targets, it actually gives it no dependencies and the
> resulting semantics are that all intermediate files in the build are
> treated as secondary. So somethig there should be cleaned up. If the
> .SECONDARY was changed to only depend on the .gobj and .hdr.obj then
> suddenly that would break .aux.o if I don't make the change.
>
> So I'm meaning to work out what to do with all that, i.e., whether to
> add blanket .SECONDARY for all and trim or remove the .PRECIOUS files,
> or remove s390x's secondary, or make it more specific, or something
> else. But it takes a while for me to do makefile work.

Hi Thomas,

Ping on this patch?

Thanks,
Nick

