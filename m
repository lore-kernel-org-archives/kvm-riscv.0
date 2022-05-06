From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 6 May 2022 13:14:28 -0700
Subject: [RFC PATCH kvmtool 0/3] Add Sstc extension support
In-Reply-To: <CAAhSdy3Okh8oFZWQYziNNXaxkmF1MsfVYz-nHr=0g4fsYBSbRg@mail.gmail.com>
References: <20220304101023.764631-1-atishp@rivosinc.com>
 <20220506125450.GB22892@willie-the-truck>
 <CAAhSdy3Okh8oFZWQYziNNXaxkmF1MsfVYz-nHr=0g4fsYBSbRg@mail.gmail.com>
Message-ID: <CAOnJCUK_mMcV7WKGitD9O4bzcWb5AaWyNZ3PVA3FEYt_M_OAhw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 6, 2022 at 7:43 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, May 6, 2022 at 6:24 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Mar 04, 2022 at 02:10:20AM -0800, Atish Patra wrote:
> > > This series adds Sstc extension which was ratified recently.
> > >
> > > The first two patches adds the ISA extension framework which allows
> > > to define and update the DT for any multi-letter ISA extensions.
> > >
> > > The last patch just enables Sstc extension specifically if the hardware
> > > supports it.
> > >
> > > The series can also be found at
> > > https://github.com/atishp04/kvmtool/tree/sstc_v1
> > >
> > > The kvm & Qemu patches can be found at
> > >
> > > KVM: https://github.com/atishp04/linux/tree/sstc_v2
> > > OpenSBI: https://github.com/atishp04/opensbi/tree/sstc_v1
> > > Qemu: https://github.com/atishp04/qemu/tree/sstc_v1
> > >
> > > [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
> > >
> > > Atish Patra (3):
> > > riscv: Update the uapi header as per Linux kernel
> > > riscv: Append ISA extensions to the device tree
> > > riscv: Add Sstc extension support
> >
> > These look fine to me. What's the status of the kernel-side changes?
>
> The kernel-side of changes will be merged for 5.19 or 5.20.
>

I will revise the kernel series soon and rebase the kvmtool changes on
the latest.

> I will ping you once kernel-side changes are merged.
>
> Thanks,
> Anup
>
> >
> > Will



-- 
Regards,
Atish

