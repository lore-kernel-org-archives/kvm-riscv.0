From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 4 Jan 2024 12:09:35 +0100
Subject: [PATCH v4 11/11] KVM: selftests: Enable tunning of
 err_margin_us in arch timer test
In-Reply-To: <CAJve8o=nTsAwwgSib4vOLXjOWSMV2+J+BFsUZ57OdAK7eW8q8A@mail.gmail.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
 <8734vy832j.wl-maz@kernel.org>
 <CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
 <f98879dc24f948f7a8a7b5374a32bc04@kernel.org>
 <CAJve8ona7g=LxW1YeRB_FqGodF973H=A3b2m8054gmzK=Z7_ww@mail.gmail.com>
 <87zfy5t1qt.wl-maz@kernel.org>
 <CAJve8o=nTsAwwgSib4vOLXjOWSMV2+J+BFsUZ57OdAK7eW8q8A@mail.gmail.com>
Message-ID: <20240104-be1acabe472432f709ee408c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 21, 2023 at 10:58:40AM +0800, Haibo Xu wrote:
> On Wed, Dec 20, 2023 at 9:58?PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Wed, 20 Dec 2023 13:51:24 +0000,
> > Haibo Xu <xiaobo55x@gmail.com> wrote:
> > >
> > > On Wed, Dec 20, 2023 at 5:00?PM Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On 2023-12-20 06:50, Haibo Xu wrote:
> > > > > On Wed, Dec 20, 2023 at 2:22?AM Marc Zyngier <maz@kernel.org> wrote:
> > > > >>
> > > > >> On Tue, 12 Dec 2023 09:31:20 +0000,
> > > > >> Haibo Xu <haibo1.xu@intel.com> wrote:
> > > > >> > diff --git a/tools/testing/selftests/kvm/include/timer_test.h b/tools/testing/selftests/kvm/include/timer_test.h
> > > > >> > index 968257b893a7..b1d405e7157d 100644
> > > > >> > --- a/tools/testing/selftests/kvm/include/timer_test.h
> > > > >> > +++ b/tools/testing/selftests/kvm/include/timer_test.h
> > > > >> > @@ -22,6 +22,7 @@ struct test_args {
> > > > >> >       int nr_iter;
> > > > >> >       int timer_period_ms;
> > > > >> >       int migration_freq_ms;
> > > > >> > +     int timer_err_margin_us;
> > > > >>
> > > > >> ... except that you are storing it as a signed value. Some consistency
> > > > >> wouldn't hurt, really, and would avoid issues when passing large
> > > > >> values.
> > > > >>
> > > > >
> > > > > Yes, it's more proper to use an unsigned int for the non-negative error
> > > > > margin.
> > > > > Storing as signed here is just to keep the type consistent with that
> > > > > of timer_period_ms
> > > > > since there will be '+' operation in other places.
> > > > >
> > > > >         tools/testing/selftests/kvm/aarch64/arch_timer.c
> > > > >         /* Setup a timeout for the interrupt to arrive */
> > > > >          udelay(msecs_to_usecs(test_args.timer_period_ms) +
> > > > >              test_args.timer_err_margin_us);
> > > >
> > > > But that's exactly why using a signed quantity is wrong.
> > > > What does it mean to have a huge *negative* margin?
> > > >
> > >
> > > Hi Marc,
> > >
> > > I agree that negative values are meaningless for the margin.
> > > If I understand correctly, the negative margin should be filtered by
> > > assertion in atoi_non_negative().
> >
> > No. Please.
> >
> > atoi_non_negative() returns a uint32_t, which is what it should do.
> > The bug is squarely in the use of an 'int' to store such value, and it
> > is the *storage* that turns a positive value into a negative one.
> >
> 
> Thanks for the detailed info!
> 
> May I understand that your concern is mainly for a platform with 64bit int type,
> which may trigger the positive to negative convert?
> 
> If so, I think we may need to do a clean up for the test code since
> several other
> places have the same issue.

Yes, I think we should do that cleanup. While there are probably several
offenders scattered throughout kvm selftests, we can keep the scope of
this series focused on arch_timer.c. Let's audit all uses of signed types
and convert them to unsigned as necessary with some separate patch(es)
before splitting the test, so both aarch64 and riscv get the cleanups.

Thanks,
drew

