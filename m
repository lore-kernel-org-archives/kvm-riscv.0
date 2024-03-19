From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 19 Mar 2024 08:38:38 +0100
Subject: [PATCH V4 0/6] Add riscv tests to cover the base extension specs
In-Reply-To: <CAOnJCU+RSy6DXtX6hdnv0deCBzaLoy4rg2vAgvYPvAWqPsZCbw@mail.gmail.com>
References: <20240313215106.325766-1-cem@kernel.org>
 <20240318-4db92d2af2562faffcf9829d@orel>
 <MN6azXWmu4RN5sh5bl52vlPJ_Nb76jpaNYw1rO9A-UkUJHBP08PFYtU55df3GcCLciTll8xHtr5CE8w46eQdxw==@protonmail.internalid>
 <20240318-336372c31d669f9bd3f64794@orel>
 <rbglxx7ebt2l2ax4kgllof5iya7pouwaq2ofwnyrp2ww5jvwdd@d5meuowsa2an>
 <CAOnJCU+RSy6DXtX6hdnv0deCBzaLoy4rg2vAgvYPvAWqPsZCbw@mail.gmail.com>
Message-ID: <20240319-0d42549d8f8228d35b35315f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 18, 2024 at 12:37:46PM -0700, Atish Patra wrote:
> On Mon, Mar 18, 2024 at 11:39?AM Carlos Maiolino <cem@kernel.org> wrote:
> >
> > On Mon, Mar 18, 2024 at 06:27:03PM +0100, Andrew Jones wrote:
> > > On Mon, Mar 18, 2024 at 06:24:09PM +0100, Andrew Jones wrote:
> > > > On Wed, Mar 13, 2024 at 10:50:51PM +0100, cem at kernel.org wrote:
> > > > > From: Carlos Maiolino <cem@kernel.org>
> > > > >
> > > > > Hi,
> > > > >
> > > > > This is a new (V4) version of this series to create tests to cover functions
> > > > > of the riscv's SBI base implementation spec. The series also includes a
> > > > > a few helpers to reduce code duplication.
> > > > >
> > > > > This new version includes updates related to Drew reviews, and rebasing of
> > > > > the patches according to the changes.
> > > > > This new series has also been rebased on TOT, didn't affect the patches,
> > > > > but worth the heads up.
> > > > >
> > > > > Patches tagged with V4 needed modifications from the previous version.
> > > > >
> > > > > Detailed updates are specified on a patch-basis
> > > > >
> > > > >
> > > > > Carlos Maiolino (6):
> > > > >   riscv: Add a wrapper to call sbi_ecall for base extension
> > > > >   riscv: Add test to probe SBI Extension
> > > > >   riscv: Factor out environment variable check and report generation
> > > > >   riscv: Implement test for architecture ID register
> > > > >   riscv: Enable gen_report() to print the wrong value in case of failure
> > > > >   riscv: Test for specific SBI implementation ID
> > > > >
> > > > >  riscv/sbi.c | 81 +++++++++++++++++++++++++++++++++++++++++++++--------
> > > > >  1 file changed, 69 insertions(+), 12 deletions(-)
> > > > >
> > > > > --
> > > > > 2.44.0
> > > > >
> > > >
> > > > Merged to https://gitlab.com/kvm-unit-tests/kvm-unit-tests
> > >
> > > Hi Carlos,
> > >
> > > I just realized you've forgotten to CC tech-prs on v3 and v4.
> >
> > I actually didn't CC them on purpose. The list seems to only accept incoming emails from registered
> > users, so all previous attempts I got a bunch of delivery failure messages, so I thought it was
> > pointless to CC them. I should get myself registered there, but I didn't have time so far to figure
> > it out.
> >
> Here are the details.
> https://lists.riscv.org/g/tech-prs
> 
> IIRC, you also need to be an individual member or employee of a RVI
> member company to subscribe to PRS.
> 
> @Andrew Jones : I don't think it is possible for every contributor for
> kvm-unit-tests to be a member of RVI
> and subscribe to PRS.
> 
> Maybe we should just send periodic updates ?

Periodic updates sounds good to me.

Thanks,
drew

> I am not sure if there is
> a better way to do cross-posting.
> 
> > Carlos.
> >
> > >
> > > drew
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv
> 
> 
> 
> -- 
> Regards,
> Atish

