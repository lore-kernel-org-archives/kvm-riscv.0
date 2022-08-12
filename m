From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Aug 2022 08:58:08 +0530
Subject: [PATCH v7 0/4] Add Sstc extension support
In-Reply-To: <mhng-368a1ddb-43d3-4d61-934b-3916c63005d4@palmer-ri-x1c9>
References: <CAAhSdy2UDwZYK+EaKHPXLxyKUMv-OX02EdaBDBgjNF0jdDJ7xQ@mail.gmail.com>
 <mhng-368a1ddb-43d3-4d61-934b-3916c63005d4@palmer-ri-x1c9>
Message-ID: <CAAhSdy2mb6wyqy0NAn9BcTWKMYEc0Z4zU3s3j7oNqBz6eDQ9sg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Palmer,

On Fri, Aug 12, 2022 at 3:19 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Fri, 22 Jul 2022 21:47:06 PDT (-0700), anup at brainfault.org wrote:
> > Hi Palmer,
> >
> > On Fri, Jul 22, 2022 at 10:20 PM Atish Patra <atishp@rivosinc.com> wrote:
> >>
> >> This series implements Sstc extension support which was ratified recently.
> >> Before the Sstc extension, an SBI call is necessary to generate timer
> >> interrupts as only M-mode have access to the timecompare registers. Thus,
> >> there is significant latency to generate timer interrupts at kernel.
> >> For virtualized enviornments, its even worse as the KVM handles the SBI call
> >> and uses a software timer to emulate the timecomapre register.
> >>
> >> Sstc extension solves both these problems by defining a stimecmp/vstimecmp
> >> at supervisor (host/guest) level. It allows kernel to program a timer and
> >> recieve interrupt without supervisor execution enviornment (M-mode/HS mode)
> >> intervention.
> >>
> >> KVM directly updates the vstimecmp as well if the guest kernel invokes the SBI
> >> call instead of updating stimecmp directly. This is required because KVM will
> >> enable sstc extension if the hardware supports it unless the VMM explicitly
> >> disables it for that guest. The hardware is expected to compare the
> >> vstimecmp at every cycle if sstc is enabled and any stale value in vstimecmp
> >> will lead to spurious timer interrupts. This also helps maintaining the
> >> backward compatibility with older kernels.
> >>
> >> Similary, the M-mode firmware(OpenSBI) uses stimecmp for older kernel
> >> without sstc support as STIP bit in mip is read only for hardware with sstc.
> >>
> >> The PATCH 1 & 2 enables the basic infrastructure around Sstc extension while
> >> PATCH 3 lets kernel use the Sstc extension if it is available in hardware.
> >> PATCH 4 implements the Sstc extension in KVM.
> >>
> >> This series has been tested on Qemu(RV32 & RV64) with additional patches in
> >> Qemu[2]. This series can also be found at [3].
> >>
> >> Changes from v6->v7:
> >> 1. Fixed a compilation error reported by 0-day bot.
> >>
> >> Changes from v5->v6:
> >> 1. Moved SSTC extension enum below SVPBMT.
> >>
> >> Changes from v4->v5:
> >> 1. Added RB tag.
> >> 2. Changed the pr-format.
> >> 3. Rebased on 5.19-rc7 and kvm-queue.
> >> 4. Moved the henvcfg modification from hardware enable to vcpu_load.
> >>
> >> Changes from v3->v4:
> >> 1. Rebased on 5.18-rc6
> >> 2. Unified vstimemp & next_cycles.
> >> 3. Addressed comments in PATCH 3 & 4.
> >>
> >> Changes from v2->v3:
> >> 1. Dropped unrelated KVM fixes from this series.
> >> 2. Rebased on 5.18-rc3.
> >>
> >> Changes from v1->v2:
> >> 1. Separate the static key from kvm usage
> >> 2. Makde the sstc specific static key local to the driver/clocksource
> >> 3. Moved the vstimecmp update code to the vcpu_timer
> >> 4. Used function pointers instead of static key to invoke vstimecmp vs
> >>    hrtimer at the run time. This will help in future for migration of vms
> >>    from/to sstc enabled hardware to non-sstc enabled hardware.
> >> 5. Unified the vstimer & timer to 1 timer as only one of them will be used
> >>    at runtime.
> >>
> >> [1] https://drive.google.com/file/d/1m84Re2yK8m_vbW7TspvevCDR82MOBaSX/view
> >> [2] https://github.com/atishp04/qemu/tree/sstc_v6
> >> [3] https://github.com/atishp04/linux/tree/sstc_v7
> >>
> >> Atish Patra (4):
> >> RISC-V: Add SSTC extension CSR details
> >> RISC-V: Enable sstc extension parsing from DT
> >> RISC-V: Prefer sstc extension if available
> >> RISC-V: KVM: Support sstc extension
> >
> > The PATCH4 is dependent on the KVM patches in queue for 5.20.
> >
> > I suggest you take PATCH1, PATCH2 and PATCH3. I will send
> > PATCH4 in second batch/PR for 5.20 assuming you will send the
> > first three patches in your first PR for 5.20
> >
> > Does this sound okay to you ?
>
> Sorry for being slow here, I just merged the non-KVM ones onto
> riscv/for-next.  LMK if you want me to try and sort out the KVM bits,
> the branch base is at palmer/riscv-sstc assuming that's easier for you
> to just merge in locally.

The KVM RISC-V changes for 5.20 are already merged in Linus's master
so please go ahead and merge the KVM Sstc patch (i.e. PATCH4 of this
series) in riscv/for-next with "Acked-by: Anup Patel <anup@brainfault.org>"

Thanks,
Anup

>
> >
> > Regards,
> > Anup
> >
> >>
> >> arch/riscv/include/asm/csr.h            |   5 +
> >> arch/riscv/include/asm/hwcap.h          |   1 +
> >> arch/riscv/include/asm/kvm_vcpu_timer.h |   7 ++
> >> arch/riscv/include/uapi/asm/kvm.h       |   1 +
> >> arch/riscv/kernel/cpu.c                 |   1 +
> >> arch/riscv/kernel/cpufeature.c          |   1 +
> >> arch/riscv/kvm/vcpu.c                   |   8 +-
> >> arch/riscv/kvm/vcpu_timer.c             | 144 +++++++++++++++++++++++-
> >> drivers/clocksource/timer-riscv.c       |  25 +++-
> >> 9 files changed, 185 insertions(+), 8 deletions(-)
> >>
> >> --
> >> 2.25.1
> >>

