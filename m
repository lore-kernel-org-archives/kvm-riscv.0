From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 24 Jan 2023 12:41:33 -0800
Subject: [PATCH v2 01/11] RISC-V: Define helper functions expose hpm
 counter width and count
In-Reply-To: <20230113072255.34cnyautbwiy25p5@orel>
References: <20221215170046.2010255-1-atishp@rivosinc.com> <20221215170046.2010255-2-atishp@rivosinc.com>
 <20230112100608.d7tnvhbotjfctlgk@orel> <CAHBxVyESkQ9Krmn-44f-A8hYzMrZBtBfq15fdx-sHDQfkBMtKQ@mail.gmail.com>
 <20230113072255.34cnyautbwiy25p5@orel>
Message-ID: <CAOnJCU+UBG-AouAc1M4J-i9Y_nPE9RfrFZfNyLSxhKbNF55AMQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 12, 2023 at 11:22 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Jan 12, 2023 at 10:18:05AM -0800, Atish Kumar Patra wrote:
> > On Thu, Jan 12, 2023 at 2:06 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Thu, Dec 15, 2022 at 09:00:36AM -0800, Atish Patra wrote:
> ...
> > > > +EXPORT_SYMBOL(riscv_pmu_get_hpm_info);
> > >
> > > EXPORT_SYMBOL_GPL ?
> > >
> >
> > Is that mandatory ? I have seen usage of both in arch/riscv and other
> > places though.
> > I am also not sure if any other non-GPL module should/need access to this.
>
> TBH, I'm not sure what the best policy is, but I presumed we should use
> _GPL when we aren't aware of anything non-GPL and then when a day comes
> that something non-GPL would like this to be exported, the patch that
> flips it will provide the justification in its commit message.
>

Sgtm. Changed it to EXPORT_SYMBOL_GPL for now.

> Thanks,
> drew



-- 
Regards,
Atish

