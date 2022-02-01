From: Guo Ren <guoren@kernel.org>
Date: Wed, 2 Feb 2022 00:16:55 +0800
Subject: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
In-Reply-To: <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
 <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
 <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
Message-ID: <CAJF2gTQj2vE-1LC5iUa594zSqBt1yMFjiw8pBPTbWVYp7YoitA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 2, 2022 at 12:11 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Feb 1, 2022 at 9:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 2/1/22 16:44, Anup Patel wrote:
> > > +Paolo
> > >
> > > On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
> > >>
> > >> From: Guo Ren <guoren@linux.alibaba.com>
> > >>
> > >> Current riscv doesn't support the 32bit KVM API. Let's make it
> > >> clear by not selecting KVM_COMPAT.
> > >>
> > >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > >> Signed-off-by: Guo Ren <guoren@kernel.org>
> > >> Cc: Arnd Bergmann <arnd@arndb.de>
> > >> Cc: Anup Patel <anup@brainfault.org>
> > >
> > > This looks good to me.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
> > Hi Anup,
> >
> > feel free to send this via a pull request (perhaps together with Mark
> > Rutland's entry/exit rework).
>
> Sure, I will do like you suggested.
Great, thx.

>
> Regards,
> Anup
>
> >
> > Paolo
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

