From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Wed, 22 Mar 2023 21:19:50 +0100
Subject: [PATCH] riscv: require alternatives framework when selecting FPU support
In-Reply-To: <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
References: <ZBruFRwt3rUVngPu@zx2c4.com> <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel> <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel> <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
Message-ID: <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 22, 2023 at 9:05?PM Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Mar 22, 2023 at 07:44:13PM +0000, Conor Dooley wrote:
> > On Wed, Mar 22, 2023 at 08:26:10PM +0100, Andrew Jones wrote:
> > > On Wed, Mar 22, 2023 at 03:17:13PM +0000, Conor Dooley wrote:
> > > > On Wed, Mar 22, 2023 at 01:46:31PM +0100, Andrew Jones wrote:
> >
> > > > > (It's tempting to just select RISCV_ALTERNATIVE from RISCV, but maybe we
> > > > >  can defer that wedding a bit longer.)
> > > >
> > > > At that point, the config option should just go away entirely, no?
> > >
> > > Ah, yes, and that makes the idea even more attractive, as we could remove
> > > several ifdefs.
> >
> > I went and did the cursory check, it's not compatible with XIP_KERNEL so
> > dropping the option entirely probably isn't a possibility :/
>
> What I said is only now sinking in. We're now going to be disabling FPU
> support on XIP kernels with this patch.
> Well, technically not this patch since it wouldn't have built without
> Jason's changes, but that doesn't seem like the right thing to do...

I suppose you could have riscv_has_extension_*() fall back to
something that doesn't use alternatives on XIP kernels.

