From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 May 2022 20:12:57 +0530
Subject: [RFC PATCH kvmtool 0/3] Add Sstc extension support
In-Reply-To: <20220506125450.GB22892@willie-the-truck>
References: <20220304101023.764631-1-atishp@rivosinc.com>
 <20220506125450.GB22892@willie-the-truck>
Message-ID: <CAAhSdy3Okh8oFZWQYziNNXaxkmF1MsfVYz-nHr=0g4fsYBSbRg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 6, 2022 at 6:24 PM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Mar 04, 2022 at 02:10:20AM -0800, Atish Patra wrote:
> > This series adds Sstc extension which was ratified recently.
> >
> > The first two patches adds the ISA extension framework which allows
> > to define and update the DT for any multi-letter ISA extensions.
> >
> > The last patch just enables Sstc extension specifically if the hardware
> > supports it.
> >
> > The series can also be found at
> > https://github.com/atishp04/kvmtool/tree/sstc_v1
> >
> > The kvm & Qemu patches can be found at
> >
> > KVM: https://github.com/atishp04/linux/tree/sstc_v2
> > OpenSBI: https://github.com/atishp04/opensbi/tree/sstc_v1
> > Qemu: https://github.com/atishp04/qemu/tree/sstc_v1
> >
> > [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
> >
> > Atish Patra (3):
> > riscv: Update the uapi header as per Linux kernel
> > riscv: Append ISA extensions to the device tree
> > riscv: Add Sstc extension support
>
> These look fine to me. What's the status of the kernel-side changes?

The kernel-side of changes will be merged for 5.19 or 5.20.

I will ping you once kernel-side changes are merged.

Thanks,
Anup

>
> Will

