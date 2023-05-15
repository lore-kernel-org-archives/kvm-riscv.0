From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 15 May 2023 13:04:43 +0100
Subject: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
In-Reply-To: <20230509-mayday-remold-a4421af1f9e1@spud>
References: <20230509-chitchat-elitism-bc4882a8ef8d@spud>
 <mhng-8554b236-c9d4-4590-8941-ed7ca5316d18@palmer-ri-x1c9a>
 <20230509-mayday-remold-a4421af1f9e1@spud>
Message-ID: <20230515-applicant-bagel-57adf89c44f7@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 09, 2023 at 10:06:14PM +0100, Conor Dooley wrote:
> On Tue, May 09, 2023 at 01:59:33PM -0700, Palmer Dabbelt wrote:
> > On Tue, 09 May 2023 09:53:17 PDT (-0700), Conor Dooley wrote:
> > > On Wed, May 10, 2023 at 12:04:12AM +0800, Andy Chiu wrote:
> > > > > > +config RISCV_V_DISABLE
> > > > > > +     bool "Disable userspace Vector by default"
> > > > > > +     depends on RISCV_ISA_V
> > > > > > +     default n
> > > > > > +     help
> > > > > > +       Say Y here if you want to disable default enablement state of Vector
> > > > > > +       in u-mode. This way userspace has to make explicit prctl() call to
> > > > > > +       enable Vector, or enable it via sysctl interface.
> > > > >
> > > > > If we are worried about breaking userspace, why is the default for this
> > > > > option not y? Or further,
> > > > >
> > > > > config RISCV_ISA_V_DEFAULT_ENABLE
> > > > >         bool "Enable userspace Vector by default"
> > > > >         depends on RISCV_ISA_V
> > > > >         help
> > > > >           Say Y here to allow use of Vector in userspace by default.
> > > > >           Otherwise, userspace has to make an explicit prctl() call to
> > > > >           enable Vector, or enable it via the sysctl interface.
> > > > >
> > > > >           If you don't know what to do here, say N.
> > > > >

There's been nothing here from the posting on the distro list. Whichever
way we go here, I would like the word "DEFAULT" added to the config
option to avoid confusion between it & RISC_ISA_V.

Thanks,
Conor.

> > > > 
> > > > Yes, expressing the option, where Y means "on", is more direct. But I
> > > > have a little concern if we make the default as "off". Yes, we create
> > > > this option in the worries of breaking userspace. But given that the
> > > > break case might be rare, is it worth making userspace Vector harder
> > > > to use by doing this? I assume in an ideal world that nothing would
> > > > break and programs could just use V without bothering with prctl(), or
> > > > sysctl. But on the other hand, to make a program robust enough, we
> > > > must check the status with the prctl() anyway. So I have no answer
> > > > here.
> > > 
> > > FWIW my logic was that those who know what they are doing can turn it on
> > > & keep the pieces. I would expect distros and all that lark to be able to
> > > make an educated decision here. But those that do not know what they are
> > > doing should be given the "safe" option by default.
> > > CONFIG_RISCV_ISA_V is default y, so will be enabled for those upgrading
> > > their kernel. With your patch they would also get vector enabled by
> > > default. The chance of a breakage might be small, but it seems easy to
> > > avoid. I dunno...
> > 
> > It's really more of a distro/user question than anything else, I'm not
> > really sure there's a right answer.  I'd lean towards turning V on by
> > default, though: the defconfigs are meant for kernel hackers, so defaulting
> > to the option that's more likely to break something seems like the way to go
> > -- that way we see any possible breakages early and can go figure them out.
> 
> To get my "ackchyually" out of the way, I meant the person doing `make
> olddefconfig` based on their distro's .config etc or using menuconfig
> rather than someone using the in-kernel defconfig.
> We can always set it to the potentially breaking mode explicitly in our
> defconfigs while leaving the defaults for the aforementioned situations
> as the "safe" option, no?
> 
> > Depending on the risk tolerance of their users, distributions might want to
> > turn this off by default.  I posted on sw-dev, which is generally the best
> > way to find the distro folks.


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230515/efeb0b00/attachment.sig>
