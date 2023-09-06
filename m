From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 6 Sep 2023 09:01:51 +0200
Subject: [PATCH v2 2/8] KVM: arm64: selftest: Split arch_timer test code
In-Reply-To: <CAJve8ok-zZAG7T3t5XD-CtJn47tTE867Xaaw_YHYy1XmUL41rw@mail.gmail.com>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <c87337cfd7fb135e2efed589360a78c26a402eac.1693659382.git.haibo1.xu@intel.com>
 <20230904-11e853ffe3d8e9cf9ec6079d@orel>
 <CAJve8onwjBQcbVy75qyOF3A51-T0WyBkmeCV_wOZvzaPcrBVFg@mail.gmail.com>
 <CAJve8ok-zZAG7T3t5XD-CtJn47tTE867Xaaw_YHYy1XmUL41rw@mail.gmail.com>
Message-ID: <20230906-3f0318fa20365f9211998bae@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 06, 2023 at 11:44:26AM +0800, Haibo Xu wrote:
> On Wed, Sep 6, 2023 at 10:14?AM Haibo Xu <xiaobo55x@gmail.com> wrote:
> >
> > On Mon, Sep 4, 2023 at 9:24?PM Andrew Jones <ajones@ventanamicro.com> wrote:
...
> > > > +
> > > > +enum guest_stage {
> > > > +     GUEST_STAGE_VTIMER_CVAL=1,
> > > > +     GUEST_STAGE_VTIMER_TVAL,
> > > > +     GUEST_STAGE_PTIMER_CVAL,
> > > > +     GUEST_STAGE_PTIMER_TVAL,
> > > > +     GUEST_STAGE_MAX,
> > > > +};
> > >
> > > This enum also belongs in aarch64/arch_timer.c
> > >
> >
> > Yes, it should be in aarch64/arch_timer.c
> >
> 
> After moving the above enum definition to aarch64/arch_timer.c, the
> below errors was reported
> while compiling kvm/arch_timer.o
> 
> include/timer_test.h:37:26: error: field ?guest_stage? has incomplete type
>    37 |         enum guest_stage guest_stage;
>         |                                        ^~~~~~~~~~~
> 
> Since kvm/arch_timer.c was independent of kvm/aarch64/arch_timer.c
> during OBJ compiling,
> I think it may be not possible to move the enum definition to
> aarch64/arch_timer.c
> 
> If we keep the definition in this header file, we can enclose it with
> #ifdef __aarch64__ for aarch64 only.
>

Let's change struct test_vcpu_shared_data to

 struct test_vcpu_shared_data {
        int nr_iter;
        int guest_stage;
        uint64_t xcnt;
 };

and then let the aarch64 code treat guest_stage as an enum and the riscv
code can completely ignore it (no need to create an unused enum).

Thanks,
drew

