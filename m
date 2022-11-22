From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 21 Nov 2022 16:21:49 -0800
Subject: [RFC 4/9] RISC-V: KVM: Improve privilege mode filtering for perf
In-Reply-To: <Y2uuQ4wH4dU98K2b@curiosity>
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-5-atishp@rivosinc.com>
 <Y2uuQ4wH4dU98K2b@curiosity>
Message-ID: <CAOnJCUJogprsp+D2ZH7yEEPr-LOp801LrYTwjg0EEoKaYfPV-Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 9, 2022 at 5:42 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Atish,
>
> > Currently, the host driver doesn't have any method to identify if the
> > requested perf event is from kvm or bare metal. As KVM runs in HS
> > mode, there are no separate hypervisor privilege mode to distinguish
> > between the attributes for guest/host.
> >
> > Improve the privilege mode filtering by using the event specific
> > config1 field.
>
> ... [snip]
>
> > +static unsigned long pmu_sbi_get_filter_flags(struct perf_event *event)
> > +{
> > +     unsigned long cflags = 0;
> > +     bool guest_events = false;
> > +
> > +     if (event->attr.config1 & RISCV_KVM_PMU_CONFIG1_GUEST_EVENTS)
> > +             guest_events = true;
> > +     if (event->attr.exclude_kernel)
> > +             cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VSINH : SBI_PMU_CFG_FLAG_SET_SINH;
>
> IIUC we should inhibit host counting if we want guest events:
>                 cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_SINH : SBI_PMU_CFG_FLAG_SET_VSINH;
>

guest_events indicate that the user in the guest VM is configured to
exclude the kernel i.e. the guest kernel which
is running in VS mode.
That's why, we have to set  SBI_PMU_CFG_FLAG_SET_VSINH

To inhibit host counting, the user needs to specify exclude_host
and/or exclude_hv which happens below as well.

> > +     if (event->attr.exclude_user)
> > +             cflags |= guest_events ? SBI_PMU_CFG_FLAG_SET_VUINH : SBI_PMU_CFG_FLAG_SET_UINH;
>
> Same here.
>

Same explanation as above.

> > +     if (guest_events && event->attr.exclude_hv)
> > +             cflags |= SBI_PMU_CFG_FLAG_SET_SINH;
> > +     if (event->attr.exclude_host)
> > +             cflags |= SBI_PMU_CFG_FLAG_SET_UINH | SBI_PMU_CFG_FLAG_SET_SINH;
> > +     if (event->attr.exclude_guest)
> > +             cflags |= SBI_PMU_CFG_FLAG_SET_VSINH | SBI_PMU_CFG_FLAG_SET_VUINH;
> > +
> > +     return cflags;
> > +}
>
> Regards,
> Sergey



-- 
Regards,
Atish

