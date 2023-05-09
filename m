From: Conor Dooley <conor@kernel.org>
Date: Tue, 9 May 2023 17:53:17 +0100
Subject: [PATCH -next v19 23/24] riscv: Enable Vector code to be built
In-Reply-To: <CABgGipXvVw8GWeVLTuTJT9Hus-pEPUcgRhO3oovKYOAZK3fAEg@mail.gmail.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-24-andy.chiu@sifive.com>
 <20230509-resilient-lagoon-265e851e5bf8@wendy>
 <CABgGipXvVw8GWeVLTuTJT9Hus-pEPUcgRhO3oovKYOAZK3fAEg@mail.gmail.com>
Message-ID: <20230509-chitchat-elitism-bc4882a8ef8d@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 10, 2023 at 12:04:12AM +0800, Andy Chiu wrote:
> > > +config RISCV_V_DISABLE
> > > +     bool "Disable userspace Vector by default"
> > > +     depends on RISCV_ISA_V
> > > +     default n
> > > +     help
> > > +       Say Y here if you want to disable default enablement state of Vector
> > > +       in u-mode. This way userspace has to make explicit prctl() call to
> > > +       enable Vector, or enable it via sysctl interface.
> >
> > If we are worried about breaking userspace, why is the default for this
> > option not y? Or further,
> >
> > config RISCV_ISA_V_DEFAULT_ENABLE
> >         bool "Enable userspace Vector by default"
> >         depends on RISCV_ISA_V
> >         help
> >           Say Y here to allow use of Vector in userspace by default.
> >           Otherwise, userspace has to make an explicit prctl() call to
> >           enable Vector, or enable it via the sysctl interface.
> >
> >           If you don't know what to do here, say N.
> >
> 
> Yes, expressing the option, where Y means "on", is more direct. But I
> have a little concern if we make the default as "off". Yes, we create
> this option in the worries of breaking userspace. But given that the
> break case might be rare, is it worth making userspace Vector harder
> to use by doing this? I assume in an ideal world that nothing would
> break and programs could just use V without bothering with prctl(), or
> sysctl. But on the other hand, to make a program robust enough, we
> must check the status with the prctl() anyway. So I have no answer
> here.

FWIW my logic was that those who know what they are doing can turn it on
& keep the pieces. I would expect distros and all that lark to be able to
make an educated decision here. But those that do not know what they are
doing should be given the "safe" option by default.
CONFIG_RISCV_ISA_V is default y, so will be enabled for those upgrading
their kernel. With your patch they would also get vector enabled by
default. The chance of a breakage might be small, but it seems easy to
avoid. I dunno...

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20230509/e67b72b1/attachment-0001.sig>
