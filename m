From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 20 Dec 2023 14:50:03 +0800
Subject: [PATCH v4 11/11] KVM: selftests: Enable tunning of err_margin_us
 in arch timer test
In-Reply-To: <8734vy832j.wl-maz@kernel.org>
References: <cover.1702371136.git.haibo1.xu@intel.com> <0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
 <8734vy832j.wl-maz@kernel.org>
Message-ID: <CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 20, 2023 at 2:22?AM Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 12 Dec 2023 09:31:20 +0000,
> Haibo Xu <haibo1.xu@intel.com> wrote:
> > > @@ -216,6 +221,9 @@ static bool parse_args(int argc, char *argv[])
> >               case 'm':
> >                       test_args.migration_freq_ms = atoi_non_negative("Frequency", optarg);
> >                       break;
> > +             case 'e':
> > +                     test_args.timer_err_margin_us = atoi_non_negative("Error Margin", optarg);
> > +                     break;
>
> So your error margin is always unsigned...
>

The error margin was supposed to be a non-negative [0, INT_MAX].
(May be need to define a Max for the input, instead of INT_MAX)

> >               case 'o':
> >                       test_args.counter_offset = strtol(optarg, NULL, 0);
> >                       test_args.reserved = 0;
> > diff --git a/tools/testing/selftests/kvm/include/timer_test.h b/tools/testing/selftests/kvm/include/timer_test.h
> > index 968257b893a7..b1d405e7157d 100644
> > --- a/tools/testing/selftests/kvm/include/timer_test.h
> > +++ b/tools/testing/selftests/kvm/include/timer_test.h
> > @@ -22,6 +22,7 @@ struct test_args {
> >       int nr_iter;
> >       int timer_period_ms;
> >       int migration_freq_ms;
> > +     int timer_err_margin_us;
>
> ... except that you are storing it as a signed value. Some consistency
> wouldn't hurt, really, and would avoid issues when passing large
> values.
>

Yes, it's more proper to use an unsigned int for the non-negative error margin.
Storing as signed here is just to keep the type consistent with that
of timer_period_ms
since there will be '+' operation in other places.

        tools/testing/selftests/kvm/aarch64/arch_timer.c
        /* Setup a timeout for the interrupt to arrive */
         udelay(msecs_to_usecs(test_args.timer_period_ms) +
             test_args.timer_err_margin_us);

Thanks,
Haibo

>         M.
>
> --
> Without deviation from the norm, progress is not possible.

