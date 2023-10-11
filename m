From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 16:24:28 +0530
Subject: [PATCH 3/6] RISC-V: KVM: Forward SBI DBCN extension to user-space
In-Reply-To: <2023101105-oink-aerospace-989e@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-4-apatel@ventanamicro.com> <2023101048-attach-drift-d77b@gregkh>
 <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com> <2023101105-oink-aerospace-989e@gregkh>
Message-ID: <CAK9=C2V3VzCgaJ_dWExvS3mf3QRgeV5tU9t3LsMaHv7xO3wwzA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 11, 2023 at 12:56?PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 11, 2023 at 12:02:30PM +0530, Anup Patel wrote:
> > On Tue, Oct 10, 2023 at 10:45?PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Oct 10, 2023 at 10:35:00PM +0530, Anup Patel wrote:
> > > > The SBI DBCN extension needs to be emulated in user-space
> > >
> > > Why?
> >
> > The SBI debug console is similar to a console port available to
> > KVM Guest so the KVM user space tool (i.e. QEMU-KVM or
> > KVMTOOL) can redirect the input/output of SBI debug console
> > wherever it wants (e.g.  telnet, file, stdio, etc).
> >
> > We forward SBI DBCN calls to KVM user space so that the
> > in-kernel KVM does not need to be aware of the guest
> > console devices.
>
> Hint, my "Why" was attempting to get you to write a better changelog
> description, which would include the above information.  Please read the
> kernel documentation for hints on how to do this so that we know what
> why changes are being made.

Okay, I will improve the commit description and cover-letter.

>
> > > > so let
> > > > us forward console_puts() call to user-space.
> > >
> > > What could go wrong!
> > >
> > > Why does userspace have to get involved in a console message?  Why is
> > > this needed at all?  The kernel can not handle userspace consoles as
> > > obviously they have to be re-entrant and irq safe.
> >
> > As mentioned above, these are KVM guest console messages which
> > the VMM (i.e. KVM user-space) can choose to manage on its own.
>
> If it chooses not to, what happens?

If KVM user-space chooses not to handle SBI DBCN calls then it can
disable SBI DBCN extension for Guest VCPUs using the ONE_REG
ioctl() interface.

>
> > This is more about providing flexibility to KVM user-space which
> > allows it to manage guest console devices.
>
> Why not use the normal virtio console device interface instead of making
> a riscv-custom one?

The SBI DBCN (or debug console) is only an early console used for
early prints and bootloaders.

Once the proper console (like virtio console) is detected by the Guest
kernel, it will switch the debug console to proper console.

>
> Where is the userspace side of this interface at?  Where are the patches
> to handle this new api you added?

As mentioned in the cover letter, I have implemented it in KVMTOOL first.

The patches can be found in riscv_sbi_dbcn_v1 branch at:
https://github.com/avpatel/kvmtool.git

More precisely, this commit:
https://github.com/avpatel/kvmtool/commit/06a373ee8991f882ef79de3845a4c8d63cb189a6

>
> >
> > >
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
> > > >  arch/riscv/include/uapi/asm/kvm.h     |  1 +
> > > >  arch/riscv/kvm/vcpu_sbi.c             |  4 ++++
> > > >  arch/riscv/kvm/vcpu_sbi_replace.c     | 31 +++++++++++++++++++++++++++
> > > >  4 files changed, 37 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > index 8d6d4dce8a5e..a85f95eb6e85 100644
> > > > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > > @@ -69,6 +69,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> > > > +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> > > >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> > > >
> > > > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > > > index 917d8cc2489e..60d3b21dead7 100644
> > > > --- a/arch/riscv/include/uapi/asm/kvm.h
> > > > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > > > @@ -156,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
> > > >       KVM_RISCV_SBI_EXT_PMU,
> > > >       KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> > > >       KVM_RISCV_SBI_EXT_VENDOR,
> > > > +     KVM_RISCV_SBI_EXT_DBCN,
> > > >       KVM_RISCV_SBI_EXT_MAX,
> > >
> > > You just broke a user/kernel ABI here, why?
> >
> > The KVM_RISCV_SBI_EXT_MAX only represents the number
> > of entries in "enum KVM_RISCV_SBI_EXT_ID" so we are not
> > breaking "enum KVM_RISCV_SBI_EXT_ID" rather appending
> > new ID to existing enum.
>
> So you are sure that userspace never actually tests or sends that _MAX
> value anywhere?  If not, why is it even needed?
>
> thanks,
>
> greg k-h

Regards,
Anup

