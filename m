From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 2 Dec 2021 15:53:08 -0800
Subject: [PATCH v2] MAINTAINERS: Update Atish's email address
In-Reply-To: <CAAhSdy0bKWCBT+b1w1Z5YO+Vq8xYgyYQoR8yvPK2SuK=VXwWXw@mail.gmail.com>
References: <20211126193111.559874-1-atishp@atishpatra.org>
 <CAAhSdy0bKWCBT+b1w1Z5YO+Vq8xYgyYQoR8yvPK2SuK=VXwWXw@mail.gmail.com>
Message-ID: <CAOnJCU+K=nWQu=6NFAJzjPFE=UYCsr=KWzXZxBXYYji3vSSPVA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 2, 2021 at 12:50 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Nov 27, 2021 at 1:01 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > I am no longer employed by western digital. Update my email address to
> > personal one and add entries to .mailmap as well.
> >
> > Signed-off-by: Atish Patra <atishp@atishpatra.org>
> > ---
> >  .mailmap    | 3 +++
> >  MAINTAINERS | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/.mailmap b/.mailmap
> > index 14314e3c5d5e..5878de9783e4 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -50,6 +50,9 @@ Archit Taneja <archit@ti.com>
> >  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
> >  Arnaud Patard <arnaud.patard@rtp-net.org>
> >  Arnd Bergmann <arnd@arndb.de>
> > +Atish Patra <atish.patra@wdc.com>
> > +Atish Patra <atishp@atishpatra.org>
> > +Atish Patra <atishp@rivosinc.com>
>
> I think you just need one-line entry to map WDC email (OLD) to
> Personal/Rivos email (NEW)
>
> Something like:
> Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com>
>

Well, I saw both kinds of entries (multiline & single line) entries
throughout the .mailmap.
Thus, I assumed both would work fine.

I will send v3 with a single line entry right away.

> Regards,
> Anup
>
> >  Axel Dyks <xl@xlsigned.net>
> >  Axel Lin <axel.lin@gmail.com>
> >  Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7a2345ce8521..b22af4edcd08 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10434,7 +10434,7 @@ F:      arch/powerpc/kvm/
> >
> >  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> >  M:     Anup Patel <anup.patel@wdc.com>
> > -R:     Atish Patra <atish.patra@wdc.com>
> > +R:     Atish Patra <atishp@atishpatra.org>
> >  L:     kvm at vger.kernel.org
> >  L:     kvm-riscv at lists.infradead.org
> >  L:     linux-riscv at lists.infradead.org
> > --
> > 2.33.1
> >
> >
> > --
> > kvm-riscv mailing list
> > kvm-riscv at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv



-- 
Regards,
Atish

