From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Dec 2022 17:11:09 -0800
Subject: [RFC 8/9] RISC-V: KVM: Implement perf support
In-Reply-To: <Y5C/4s7OannaS8+H@google.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com> <20220718170205.2972215-9-atishp@rivosinc.com>
 <Y4oxNbQwOldICdnw@google.com> <CAOnJCU+Eo7do0Rd+S4RBOMYpY+sG8ODqpkqA-Cii92bO-cG5+Q@mail.gmail.com>
 <Y5C/4s7OannaS8+H@google.com>
Message-ID: <CAOnJCULpCy6Mt6EdJBHvH9Uei8OUiOx_dE52At-ZedCgpi283Q@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 7, 2022 at 8:31 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Wed, Dec 07, 2022, Atish Patra wrote:
> > On Fri, Dec 2, 2022 at 9:09 AM Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > On Mon, Jul 18, 2022, Atish Patra wrote:
> > > > RISC-V SBI PMU & Sscofpmf ISA extension allows supporting perf in
> > > > the virtualization enviornment as well. KVM implementation
> > > > relies on SBI PMU extension for most of the part while traps
> > > > & emulates the CSRs read for counter access.
> > >
> > > For the benefit of non-RISCV people, the changelog (and documentation?) should
> > > explain why RISC-V doesn't need to tap into kvm_register_perf_callbacks().
> >
> > As per my understanding, kvm_register_perf_callbacks is only useful
> > during event sampling for guests. Please let me know if I missed
> > something.
> > This series doesn't support sampling and guest counter overflow interrupt yet.
> > That's why kvm_register_perf_callbacks support is missing.
>
> Ah, I missed that connection in the cover letter.
>
> In the future, if a patch adds partial support for a thing/feature, it's very
> helpful to call that out in the lack shortlog and changelog, even for RFCs.  E.g.
> adding a single word in the shortlog and sentence or two in the changelog doesn't
> take much time on your end, and helps avoid cases like this where drive-by reviewers
> like me from cause a fuss about non-issues.
>

Absolutely. I will update the commit text in v2 accordingly.

>  RISC-V: KVM: Implement partial perf support
>
>  ...
>
>  Counter overflow and interrupts are not supported as the relevant
>  architectural specifications are still under discussion.
>
> Thanks!



--
Regards,
Atish

