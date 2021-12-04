From: Anup Patel <anup@brainfault.org>
Date: Sat, 4 Dec 2021 09:39:20 +0530
Subject: [PATCH v3] MAINTAINERS: Update Atish's email address
In-Reply-To: <f63e9f1b-4b8e-6c3e-8e21-f9a5f97ca17d@arm.com>
References: <20211202235823.1926970-1-atishp@atishpatra.org>
 <f63e9f1b-4b8e-6c3e-8e21-f9a5f97ca17d@arm.com>
Message-ID: <CAAhSdy2xRwUmdi7Kc7ZokgB5W1LWKZ7YU-doHZ5dfaVKvzRdUg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 3, 2021 at 9:40 PM Steven Price <steven.price@arm.com> wrote:
>
> On 02/12/2021 23:58, Atish Patra wrote:
> > I am no longer employed by western digital. Update my email address to
> > personal one and add entries to .mailmap as well.
> >
> > Signed-off-by: Atish Patra <atishp@atishpatra.org>
> > ---
> >  .mailmap    | 1 +
> >  MAINTAINERS | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/.mailmap b/.mailmap
> > index 6277bb27b4bf..23f6b0a60adf 100644
> > --- a/.mailmap
> > +++ b/.mailmap
> > @@ -50,6 +50,7 @@ Archit Taneja <archit@ti.com>
> >  Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
> >  Arnaud Patard <arnaud.patard@rtp-net.org>
> >  Arnd Bergmann <arnd@arndb.de>
> > +Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com> <atishp@rivosinc.com>
>
> I don't think this does what you expect. You can't list more than one
> email address to replace on the same line. You can use the command "git
> check-mailmap" to test what happens, e.g. with this change applied:
>
>   $ git check-mailmap "<atishp@rivosinc.com>"
>   <atishp@rivosinc.com>
>   $ git check-mailmap "<atish.patra@wdc.com>"
>   Atish Patra <atishp@atishpatra.org>
>   $ git check-mailmap "<atishp@atishpatra.org>"
>   <atishp@atishpatra.org>
>
> So only your @wdc.com address is translated. If you want to translate
> the @rivosinc.com address as well you need a second line. As the file says:

Thanks Steve for noticing this. Even, I realized this while queuing the patch.

I have removed @rivosinc.com email address from the patch in my queue. I
believe Atish currently uses both personal and @rivosinc.com email addresses
on LKML.

Refer,
https://github.com/kvm-riscv/linux/commit/2255b100410179bb8151e99e8396debddea0ef1d
https://github.com/kvm-riscv/linux/commits/riscv_kvm_queue

Regards,
Anup

>
> # For format details, see "MAPPING AUTHORS" in "man git-shortlog".
>
> Steve
>
> >  Axel Dyks <xl@xlsigned.net>
> >  Axel Lin <axel.lin@gmail.com>
> >  Bart Van Assche <bvanassche@acm.org> <bart.vanassche@sandisk.com>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5250298d2817..6c2a34da0314 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10434,7 +10434,7 @@ F:    arch/powerpc/kvm/
> >
> >  KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
> >  M:   Anup Patel <anup.patel@wdc.com>
> > -R:   Atish Patra <atish.patra@wdc.com>
> > +R:   Atish Patra <atishp@atishpatra.org>
> >  L:   kvm at vger.kernel.org
> >  L:   kvm-riscv at lists.infradead.org
> >  L:   linux-riscv at lists.infradead.org
> >
>

