From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 12:02:30 +0530
Subject: [PATCH 3/6] RISC-V: KVM: Forward SBI DBCN extension to user-space
In-Reply-To: <2023101048-attach-drift-d77b@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-4-apatel@ventanamicro.com> <2023101048-attach-drift-d77b@gregkh>
Message-ID: <CAK9=C2UEcQpHg8WZM3XxLa5yCEZ6wtWJj=8g5_m_0_RkiNMkTA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 10, 2023 at 10:45?PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 10:35:00PM +0530, Anup Patel wrote:
> > The SBI DBCN extension needs to be emulated in user-space
>
> Why?

The SBI debug console is similar to a console port available to
KVM Guest so the KVM user space tool (i.e. QEMU-KVM or
KVMTOOL) can redirect the input/output of SBI debug console
wherever it wants (e.g.  telnet, file, stdio, etc).

We forward SBI DBCN calls to KVM user space so that the
in-kernel KVM does not need to be aware of the guest
console devices.

>
> > so let
> > us forward console_puts() call to user-space.
>
> What could go wrong!
>
> Why does userspace have to get involved in a console message?  Why is
> this needed at all?  The kernel can not handle userspace consoles as
> obviously they have to be re-entrant and irq safe.

As mentioned above, these are KVM guest console messages which
the VMM (i.e. KVM user-space) can choose to manage on its own.

This is more about providing flexibility to KVM user-space which
allows it to manage guest console devices.

>
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  1 +
> >  arch/riscv/include/uapi/asm/kvm.h     |  1 +
> >  arch/riscv/kvm/vcpu_sbi.c             |  4 ++++
> >  arch/riscv/kvm/vcpu_sbi_replace.c     | 31 +++++++++++++++++++++++++++
> >  4 files changed, 37 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > index 8d6d4dce8a5e..a85f95eb6e85 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -69,6 +69,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
> > +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
> >  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
> >
> > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > index 917d8cc2489e..60d3b21dead7 100644
> > --- a/arch/riscv/include/uapi/asm/kvm.h
> > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > @@ -156,6 +156,7 @@ enum KVM_RISCV_SBI_EXT_ID {
> >       KVM_RISCV_SBI_EXT_PMU,
> >       KVM_RISCV_SBI_EXT_EXPERIMENTAL,
> >       KVM_RISCV_SBI_EXT_VENDOR,
> > +     KVM_RISCV_SBI_EXT_DBCN,
> >       KVM_RISCV_SBI_EXT_MAX,
>
> You just broke a user/kernel ABI here, why?

The KVM_RISCV_SBI_EXT_MAX only represents the number
of entries in "enum KVM_RISCV_SBI_EXT_ID" so we are not
breaking "enum KVM_RISCV_SBI_EXT_ID" rather appending
new ID to existing enum.

>
> thanks,
>
> greg k-h

Thanks,
Anup

