From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Oct 2021 10:17:13 +0530
Subject: [PATCH v20 00/17] KVM RISC-V Support
In-Reply-To: <CAFiDJ5-Pew6311w7pS-_ADWQnP=H7gFEUUuU8MqhsMHEDrofdA@mail.gmail.com>
References: <20210927114016.1089328-1-anup.patel@wdc.com>
 <CAAhSdy1yZ11L=A3g06GXM8tFtonBX0Cj5NDyGHQ1v44vJ8MqSA@mail.gmail.com>
 <CAFiDJ5_--KsNd3aH1gT_cgU32C+wzunzXeSKtn8HTNj_La7n5A@mail.gmail.com>
 <CAAhSdy1un6ab62LN-0ihV=oku8EH3fZ5YzbX1zzUFAEbatVAuQ@mail.gmail.com>
 <CAFiDJ5-Pew6311w7pS-_ADWQnP=H7gFEUUuU8MqhsMHEDrofdA@mail.gmail.com>
Message-ID: <CAAhSdy3a6MqR5bmgA3Znwsn7RXWYhpokWzSP308JV7MQJ0NmWg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 4, 2021 at 7:58 AM Ley Foon Tan <lftan.linux@gmail.com> wrote:
>
> On Fri, Oct 1, 2021 at 6:41 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Fri, Oct 1, 2021 at 2:33 PM Ley Foon Tan <lftan.linux@gmail.com> wrote:
> > >
> > > On Mon, Sep 27, 2021 at 8:01 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > Hi Palmer, Hi Paolo,
> > > >
> > > > On Mon, Sep 27, 2021 at 5:10 PM Anup Patel <anup.patel@wdc.com> wrote:
> > > > >
> > > > > This series adds initial KVM RISC-V support. Currently, we are able to boot
> > > > > Linux on RV64/RV32 Guest with multiple VCPUs.
> > > > >
> > > > > Key aspects of KVM RISC-V added by this series are:
> > > > > 1. No RISC-V specific KVM IOCTL
> > > > > 2. Loadable KVM RISC-V module supported
> > > > > 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> > > > > 4. Both RV64 and RV32 host supported
> > > > > 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> > > > > 6. KVM ONE_REG interface for VCPU register access from user-space
> > > > > 7. PLIC emulation is done in user-space
> > > > > 8. Timer and IPI emuation is done in-kernel
> > > > > 9. Both Sv39x4 and Sv48x4 supported for RV64 host
> > > > > 10. MMU notifiers supported
> > > > > 11. Generic dirtylog supported
> > > > > 12. FP lazy save/restore supported
> > > > > 13. SBI v0.1 emulation for KVM Guest available
> > > > > 14. Forward unhandled SBI calls to KVM userspace
> > > > > 15. Hugepage support for Guest/VM
> > > > > 16. IOEVENTFD support for Vhost
> > > > >
> > > > > Here's a brief TODO list which we will work upon after this series:
> > > > > 1. KVM unit test support
> > > > > 2. KVM selftest support
> > > > > 3. SBI v0.3 emulation in-kernel
> > > > > 4. In-kernel PMU virtualization
> > > > > 5. In-kernel AIA irqchip support
> > > > > 6. Nested virtualizaiton
> > > > > 7. ..... and more .....
> > > > >
> > > > > This series can be found in riscv_kvm_v20 branch at:
> > > > > https//github.com/avpatel/linux.git
> > > > >
> > > > > Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v9 branch
> > > > > at: https//github.com/avpatel/kvmtool.git
> > > > >
> > > > > The QEMU RISC-V hypervisor emulation is done by Alistair and is available
> > > > > in master branch at: https://git.qemu.org/git/qemu.git
> > > > >
> > > > > To play around with KVM RISC-V, refer KVM RISC-V wiki at:
> > > > > https://github.com/kvm-riscv/howto/wiki
> > > > > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
> > > > > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike
> > > > >

<snip>

> Hi Anup
>
> It is able to boot up to kvm guest OS after change to use
> https://github.com/avpatel/qemu.git, riscv_aia_v2 branch.
> Is there dependency to AIA hardware feature for KVM?

No, there is no dependency on AIA hardware and KVM RISC-V
v20 series.

I quickly tried the latest QEMU master with KVM RISC-V v20 and
it worked perfectly fine for me.
(QEMU master commit 30bd1db58b09c12b68c35f041f919014b885482d)

Although, I did see that VS-mode interrupts were broken in the latest
Spike due to some recent merge. I have sent fix PR to Spike for this.
(Refer, https://github.com/riscv-software-src/riscv-isa-sim/pull/822)

With Spike fix PR (above), the KVM RISC-V v20 series works fine
on Spike as well.

>
>
> Log:
>
> [    6.212484] Run /virt/init as init process
> Mounting...
> [    7.202552] random: fast init done
> / # cat /proc/cpuinfo
> processor : 0
> hart : 1
> isa : rv64imafdcsu
> mmu : sv48
>
> processor : 1
> hart : 0
> isa : rv64imafdcsu
> mmu : sv48
>
> / # cat /proc/interrupts
>            CPU0       CPU1
>   1:        355          0  SiFive PLIC   5 Edge      virtio0
>   2:        212          0  SiFive PLIC   6 Edge      virtio1
>   3:         11          0  SiFive PLIC   7 Edge      virtio2
>   4:        155          0  SiFive PLIC   1 Edge      ttyS0
>   5:       1150        942  RISC-V INTC   5 Edge      riscv-timer
> IPI0:        19          5  Rescheduling interrupts
> IPI1:        50        565  Function call interrupts
> IPI2:         0          0  CPU stop interrupts
> IPI3:         0          0  IRQ work interrupts
> IPI4:         0          0  Timer broadcast interrupts
>
>
> Thanks.
>
> Regards
> Ley Foon

Regards,
Anup

