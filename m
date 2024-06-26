From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Wed, 26 Jun 2024 13:40:52 -0700
Subject: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to hpmevent
 mapping while starting cpus
In-Reply-To: <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com> <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
 <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
 <20240626-eraser-unselect-99e68a1f5a3e@spud> <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
Message-ID: <CAHBxVyEg2uKKdikXib77JDmCKs8qDGJHvj3stsFgCgO0U9omRg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 26, 2024 at 9:39?AM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jun 26, 2024 at 05:37:07PM +0100, Conor Dooley wrote:
> > On Wed, Jun 26, 2024 at 09:18:46AM -0700, Atish Kumar Patra wrote:
> > > On Wed, Jun 26, 2024 at 6:24?AM Samuel Holland
> > > <samuel.holland@sifive.com> wrote:
> > > >
> > > > On 2024-06-26 2:23 AM, Atish Patra wrote:
> > > > > From: Samuel Holland <samuel.holland@sifive.com>
> > > > >
> > > > > Currently, we stop all the counters while a new cpu is brought online.
> > > > > However, the hpmevent to counter mappings are not reset. The firmware may
> > > > > have some stale encoding in their mapping structure which may lead to
> > > > > undesirable results. We have not encountered such scenario though.
> > > > >
> > > >
> > > > This needs:
> > > >
> > > > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> > > >
> > >
> > > Oops. Sorry I missed that.
> > >
> > > @Alexandre Ghiti
> >
> > What's Alex going to be able to do?
> >

He is collecting the fixes patches in the RISC-V tree and pinged for
revision for this patch last week.

> > > @Palmer Dabbelt : Can you add that while picking up
> > > the patch or should I respin a v4 ?
> >
> > b4 should pick the signoff up though. "perf: RISC-V: Check standard
> > event availability" seems to be missing your signoff though...
>
> Huh, this doesn't really make sense. I meant:
>         b4 should pick the signoff up, though "perf: RISC-V: Check standard
>         event availability" seems to be missing your signoff...

Strange. I modified and sent the patch using b4 as well. It's missing
my sign off too.

