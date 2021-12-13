From: Rob Herring <robh@kernel.org>
Date: Mon, 13 Dec 2021 17:11:21 -0600
Subject: [RFC 0/6] Sparse HART id support
In-Reply-To: <CAOnJCUKcYeWaDXY6OxQPrNwKV=4t9zbpSjfQLsL70P+3GE7F7A@mail.gmail.com>
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <Ya4sDX974/dVEOQw@robh.at.kernel.org>
 <CAOnJCUKcYeWaDXY6OxQPrNwKV=4t9zbpSjfQLsL70P+3GE7F7A@mail.gmail.com>
Message-ID: <CAL_JsqL_DXTJMdUGVwa1T9HqzcJkae=PS12dBbhFS9A22XK6=w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 13, 2021 at 3:27 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Mon, Dec 6, 2021 at 7:28 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Dec 03, 2021 at 04:20:32PM -0800, Atish Patra wrote:
> > > Currently, sparse hartid is not supported for Linux RISC-V for the following
> > > reasons.
> > > 1. Both spinwait and ordered booting method uses __cpu_up_stack/task_pointer
> > >    which is an array size of NR_CPUs.
> > > 2. During early booting, any hartid greater than NR_CPUs are not booted at all.
> > > 3. riscv_cpuid_to_hartid_mask uses struct cpumask for generating hartid bitmap.
> > > 4. SBI v0.2 implementation uses NR_CPUs as the maximum hartid number while
> > >    generating hartmask.
> > >
> > > In order to support sparse hartid, the hartid & NR_CPUS needs to be disassociated
> > > which was logically incorrect anyways. NR_CPUs represent the maximum logical|
> > > CPU id configured in the kernel while the hartid represent the physical hartid
> > > stored in mhartid CSR defined by the privilege specification. Thus, hartid
> > > can have much greater value than logical cpuid.
> >
> > We already have a couple of architectures with logical to physical CPU
> > id maps. See cpu_logical_map. Can we make that common and use it here?
>
> Yes. We can move the cpu_logical_map(which is a macro) &
> __cpu_logical_map(actual array with NR_CPUS size)
> to common code so that all the architecture can use it instead of
> defining it separately.

IIRC, the macro is what varies by arch and I would move to static
inlines rather than supporting:

cpu_logical_map(cpu) = 0xdeadbeef;

>
> > That would also possibly allow for common populating the map from DT.
> >
>
> I didn't understand this part. The mapping is populated at run time
> [1] as the boot cpu can be any hart in RISC-V.
> That booting hart will be mapped to cpu 0. All others will be mapped
> based on how the cpu node is laid out in the DT.
> Do you mean we can move the 2nd part to common code as well ?

Yes, as the DT platforms just loop thru the cpu nodes and fill the
logical map based on 'reg', I don't think that needs to be per arch
once we have a common map. But not asking for that now.

Rob

