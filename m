From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 26 Nov 2024 09:53:42 -0800
Subject: [PATCH] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU
 overflow bit
In-Reply-To: <CAAQMj+ojdJ3iQ7HHpPudai=yuKwKwhT4VFCdAnrAGA11oSPgcw@mail.gmail.com>
References: <20241124221458.347464-1-michaelneuling@tenstorrent.com>
 <CAAhSdy2Qq61qSLkuFkgiT2o5wXNDp3qO=U40AU1CFkcY6iNYhw@mail.gmail.com> <CAAQMj+ojdJ3iQ7HHpPudai=yuKwKwhT4VFCdAnrAGA11oSPgcw@mail.gmail.com>
Message-ID: <CAHBxVyH+nhZoJtZityYh42wjv7fHHqOQtCv-zJ6n1s8sg2uiaw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 24, 2024 at 8:41?PM Michael Neuling
<MichaelNeuling@tenstorrent.com> wrote:
>
> > > This doesn't cause a problem currently as HVIEN isn't used elsewhere
> > > yet. Found by inspection.
> > >
> >
> > Fixes tag ?
>
> I'll resend in a few days but it's:
>
> Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
>

Thanks for catching this.
Reviewed-by: Atish Patra <atishp@rivosinc.com>

> (I've also added Atish to CC who was the original author)
>
> > > Signed-off-by: Michael Neuling <michaelneuling@tenstorrent.com>
> >
> > Otherwise it looks good to me.
> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Thanks.
>
> Mikey

