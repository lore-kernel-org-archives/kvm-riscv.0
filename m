From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 11:49:14 +0530
Subject: [PATCH 2/6] RISC-V: KVM: Change the SBI specification version to v2.0
In-Reply-To: <2023101013-overfeed-online-7f69@gregkh>
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-3-apatel@ventanamicro.com> <2023101013-overfeed-online-7f69@gregkh>
Message-ID: <CAK9=C2WbW_WvoU59Ba9VrKf5GbbXmMOhB2jsiAp0a=SJYh3d7w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 10, 2023 at 10:43?PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 10:34:59PM +0530, Anup Patel wrote:
> > We will be implementing SBI DBCN extension for KVM RISC-V so let
> > us change the KVM RISC-V SBI specification version to v2.0.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > index cdcf0ff07be7..8d6d4dce8a5e 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -11,7 +11,7 @@
> >
> >  #define KVM_SBI_IMPID 3
> >
> > -#define KVM_SBI_VERSION_MAJOR 1
> > +#define KVM_SBI_VERSION_MAJOR 2
>
> What does this number mean?  Who checks it?  Why do you have to keep
> incrementing it?

This number is the SBI specification version implemented by KVM RISC-V
for the Guest kernel.

The original sbi_console_putchar() and sbi_console_getchar() are legacy
functions (aka SBI v0.1) which were introduced a few years back along
with the Linux RISC-V port.

The latest SBI v2.0 specification (which is now frozen) introduces a new
SBI debug console extension which replaces legacy sbi_console_putchar()
and sbi_console_getchar() functions with better alternatives.
(Refer, https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/commit-fe4562532a9cc57e5743b6466946c5e5c98c73ca/riscv-sbi.pdf)

This series adds SBI debug console implementation in KVM RISC-V
so the SBI specification version advertised by KVM RISC-V must also be
upgraded to v2.0.

Regarding who checks its, the SBI client drivers in the Linux kernel
will check SBI specification version implemented by higher privilege
mode (M-mode firmware or HS-mode hypervisor) before probing
the SBI extension. For example, the HVC SBI driver (PATCH5)
will ensure SBI spec version to be at least v2.0 before probing
SBI debug console extension.

>
> thanks,
>
> greg k-h

Regards,
Anup

