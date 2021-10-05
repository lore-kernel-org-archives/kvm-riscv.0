From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Oct 2021 09:47:46 +0530
Subject: [PATCH v20 00/17] KVM RISC-V Support
In-Reply-To: <5cadb0b3-5e8f-110b-c6ed-4adaea033e58@redhat.com>
References: <20210927114016.1089328-1-anup.patel@wdc.com>
 <5cadb0b3-5e8f-110b-c6ed-4adaea033e58@redhat.com>
Message-ID: <CAAhSdy2b-xHSQYhypo9=87mrf82B3Faficc6utW6E6XcYqV=JQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 4, 2021 at 2:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 27/09/21 13:39, Anup Patel wrote:
> > This series adds initial KVM RISC-V support. Currently, we are able to boot
> > Linux on RV64/RV32 Guest with multiple VCPUs.
> >
> > Key aspects of KVM RISC-V added by this series are:
> > 1. No RISC-V specific KVM IOCTL
> > 2. Loadable KVM RISC-V module supported
> > 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> > 4. Both RV64 and RV32 host supported
> > 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> > 6. KVM ONE_REG interface for VCPU register access from user-space
> > 7. PLIC emulation is done in user-space
> > 8. Timer and IPI emuation is done in-kernel
> > 9. Both Sv39x4 and Sv48x4 supported for RV64 host
> > 10. MMU notifiers supported
> > 11. Generic dirtylog supported
> > 12. FP lazy save/restore supported
> > 13. SBI v0.1 emulation for KVM Guest available
> > 14. Forward unhandled SBI calls to KVM userspace
> > 15. Hugepage support for Guest/VM
> > 16. IOEVENTFD support for Vhost
> >
> > Here's a brief TODO list which we will work upon after this series:
> > 1. KVM unit test support
> > 2. KVM selftest support
> > 3. SBI v0.3 emulation in-kernel
> > 4. In-kernel PMU virtualization
> > 5. In-kernel AIA irqchip support
> > 6. Nested virtualizaiton
> > 7. ..... and more .....
>
> Looks good, I prepared a tag "for-riscv" at
> https://git.kernel.org/pub/scm/virt/kvm/kvm.git.  Palmer can pull it and
> you can use it to send me a pull request.

Sure, I have prepared PR for the remaining 16 patches based on the
PATCH1 commit in the KVM tree.

I will send PR today or tomorrow.

>
> I look forward to the test support. :)  Would be nice to have selftest
> support already in 5.16, since there are a few arch-independent
> selftests that cover the hairy parts of the MMU.

I will try my best to send basic kvm-selftest support sooner (preferably
for 5.16).

Regards,
Anup

