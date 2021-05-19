From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 May 2021 10:40:13 +0530
Subject: [PATCH v18 00/18] KVM RISC-V Support
In-Reply-To: <YKSa48cejI1Lax+/@kroah.com>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <YKSa48cejI1Lax+/@kroah.com>
Message-ID: <CAAhSdy18qySXbUdrEsUe-KtbtuEoYrys0TcmsV2UkEA2=7UQzw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 19, 2021 at 10:28 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 19, 2021 at 09:05:35AM +0530, Anup Patel wrote:
> > From: Anup Patel <anup@brainfault.org>
> >
> > This series adds initial KVM RISC-V support. Currently, we are able to boot
> > Linux on RV64/RV32 Guest with multiple VCPUs.
> >
> > Key aspects of KVM RISC-V added by this series are:
> > 1. No RISC-V specific KVM IOCTL
> > 2. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> > 3. Both RV64 and RV32 host supported
> > 4. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> > 5. KVM ONE_REG interface for VCPU register access from user-space
> > 6. PLIC emulation is done in user-space
> > 7. Timer and IPI emuation is done in-kernel
> > 8. Both Sv39x4 and Sv48x4 supported for RV64 host
> > 9. MMU notifiers supported
> > 10. Generic dirtylog supported
> > 11. FP lazy save/restore supported
> > 12. SBI v0.1 emulation for KVM Guest available
> > 13. Forward unhandled SBI calls to KVM userspace
> > 14. Hugepage support for Guest/VM
> > 15. IOEVENTFD support for Vhost
> >
> > Here's a brief TODO list which we will work upon after this series:
> > 1. SBI v0.2 emulation in-kernel
> > 2. SBI v0.2 hart state management emulation in-kernel
> > 3. In-kernel PLIC emulation
> > 4. ..... and more .....
> >
> > This series can be found in riscv_kvm_v18 branch at:
> > https//github.com/avpatel/linux.git
> >
> > Our work-in-progress KVMTOOL RISC-V port can be found in riscv_v7 branch
> > at: https//github.com/avpatel/kvmtool.git
> >
> > The QEMU RISC-V hypervisor emulation is done by Alistair and is available
> > in master branch at: https://git.qemu.org/git/qemu.git
> >
> > To play around with KVM RISC-V, refer KVM RISC-V wiki at:
> > https://github.com/kvm-riscv/howto/wiki
> > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-QEMU
> > https://github.com/kvm-riscv/howto/wiki/KVM-RISCV64-on-Spike
> >
> > Changes since v17:
> >  - Rebased on Linux-5.13-rc2
> >  - Moved to new KVM MMU notifier APIs
> >  - Removed redundant kvm_arch_vcpu_uninit()
> >  - Moved KVM RISC-V sources to drivers/staging for compliance with
> >    Linux RISC-V patch acceptance policy
>
> What is this new "patch acceptance policy" and what does it have to do
> with drivers/staging?

The Linux RISC-V patch acceptance policy is here:
Documentation/riscv/patch-acceptance.rst

As-per this policy, the Linux RISC-V maintainers will only accept
patches for frozen/ratified RISC-V extensions. Basically, it links the
Linux RISC-V development process with the RISC-V foundation
process which is painfully slow.

The KVM RISC-V patches have been sitting on the lists for almost
2 years now. The requirements for freezing RISC-V H-extension
(hypervisor extension) keeps changing and we are not clear when
it will be frozen. In fact, quite a few people have already implemented
RISC-V H-extension in hardware as well and KVM RISC-V works
on real HW as well.

Rationale of moving KVM RISC-V to drivers/staging is to continue
KVM RISC-V development without breaking the Linux RISC-V patch
acceptance policy until RISC-V H-extension is frozen. Once, RISC-V
H-extension is frozen we will move KVM RISC-V back to arch/riscv
(like other architectures).

>
> What does drivers/staging/ have to do with this at all?  Did anyone ask
> the staging maintainer about this?

Yes, Paolo (KVM maintainer) suggested having KVM RISC-V under
drivers/staging until RISC-V H-extension is frozen and continue the
KVM RISC-V development from there.

>
> Not cool, and not something I'm about to take without some very good
> reasons...

Regards,
Anup

