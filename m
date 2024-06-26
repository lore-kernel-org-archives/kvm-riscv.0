From: Conor Dooley <conor@kernel.org>
Date: Wed, 26 Jun 2024 23:11:54 +0100
Subject: [PATCH v3 2/3] drivers/perf: riscv: Reset the counter to
 hpmevent mapping while starting cpus
In-Reply-To: <CAHBxVyEg2uKKdikXib77JDmCKs8qDGJHvj3stsFgCgO0U9omRg@mail.gmail.com>
References: <20240626-misc_perf_fixes-v3-0-de3f8ed88dab@rivosinc.com>
 <20240626-misc_perf_fixes-v3-2-de3f8ed88dab@rivosinc.com>
 <96ff4dd2-db66-4653-80e9-97d4f1381581@sifive.com>
 <CAHBxVyHx9hTRPosizV_yn6DUZi-MTNTrAbJdkV3049D-qsDHcw@mail.gmail.com>
 <20240626-eraser-unselect-99e68a1f5a3e@spud>
 <20240626-spyglass-clutter-4ff4d7b26dd4@spud>
 <CAHBxVyEg2uKKdikXib77JDmCKs8qDGJHvj3stsFgCgO0U9omRg@mail.gmail.com>
Message-ID: <20240626-pedigree-retype-dd7f1e54ac2b@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 26, 2024 at 01:40:52PM -0700, Atish Kumar Patra wrote:

> > > > @Palmer Dabbelt : Can you add that while picking up
> > > > the patch or should I respin a v4 ?
> > >
> > > b4 should pick the signoff up though. "perf: RISC-V: Check standard
> > > event availability" seems to be missing your signoff though...
> >
> > Huh, this doesn't really make sense. I meant:
> >         b4 should pick the signoff up, though "perf: RISC-V: Check standard
> >         event availability" seems to be missing your signoff...
> 
> Strange. I modified and sent the patch using b4 as well. It's missing
> my sign off too.

`b4 shazam` should pick up trailers provided on the list, signoffs
included. `b4 shazam -s` will add yours. TBH, I am not sure why that is
not the default behaviour.

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240626/40fd49a6/attachment.sig>
