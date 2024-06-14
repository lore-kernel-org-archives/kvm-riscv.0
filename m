From: Segher Boessenkool <segher@kernel.crashing.org>
Date: Thu, 13 Jun 2024 20:08:56 -0500
Subject: [kvm-unit-tests PATCH] build: retain intermediate .aux.o targets
In-Reply-To: <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
References: <20240612044234.212156-1-npiggin@gmail.com> <20240612082847.GG19790@gate.crashing.org> <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
Message-ID: <20240614010856.GK19790@gate.crashing.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 14, 2024 at 10:43:39AM +1000, Nicholas Piggin wrote:
> On Wed Jun 12, 2024 at 6:28 PM AEST, Segher Boessenkool wrote:
> > On Wed, Jun 12, 2024 at 02:42:32PM +1000, Nicholas Piggin wrote:
> > > arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
> > > in dependency chains that cause them to be made as intermediate files,
> > > which get removed when make finishes. This results in unnecessary
> > > partial rebuilds. If make is run again, this time the .aux.o targets
> > > are not intermediate, possibly due to being made via different
> > > dependencies.
> > > 
> > > Adding .aux.o files to .PRECIOUS prevents them being removed and solves
> > > the rebuild problem.
> > > 
> > > s390x does not have the problem because .SECONDARY prevents dependancies
> > > from being built as intermediate. However the same change is made for
> > > s390x, for consistency.
> >
> > This is exactly what .SECONDARY is for, as its documentation says,
> > even.  Wouldn't it be better to just add a .SECONDARY to the other
> > targets as well?
> 
> Yeah we were debating that and agreed .PRECIOUS may not be the
> cleanest fix but since we already use that it's okay for a
> minimal fix.

But why add it to s390x then?  It is not a fix there at all!


Segher

