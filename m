From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 4 Apr 2023 13:52:43 +0200
Subject: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
In-Reply-To: <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
 <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
 <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
 <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
Message-ID: <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 03, 2023 at 02:23:01PM +0200, Andrew Jones wrote:
> On Mon, Apr 03, 2023 at 05:34:57PM +0530, Anup Patel wrote:
> > On Mon, Apr 3, 2023 at 5:01?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Mon, Apr 03, 2023 at 03:03:08PM +0530, Anup Patel wrote:
> > > > We implement ONE_REG interface for AIA CSRs as a separate subtype
> > > > under the CSR ONE_REG interface.
> > > >
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > ---
> > > >  arch/riscv/include/uapi/asm/kvm.h | 8 ++++++++
> > > >  arch/riscv/kvm/vcpu.c             | 8 ++++++++
> > > >  2 files changed, 16 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > > > index 182023dc9a51..cbc3e74fa670 100644
> > > > --- a/arch/riscv/include/uapi/asm/kvm.h
> > > > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > > > @@ -79,6 +79,10 @@ struct kvm_riscv_csr {
> > > >       unsigned long scounteren;
> > > >  };
> > > >
> > > > +/* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> > > > +struct kvm_riscv_aia_csr {
> > > > +};
> > > > +
> > > >  /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> > > >  struct kvm_riscv_timer {
> > > >       __u64 frequency;
> > > > @@ -107,6 +111,7 @@ enum KVM_RISCV_ISA_EXT_ID {
> > > >       KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
> > > >       KVM_RISCV_ISA_EXT_ZICBOM,
> > > >       KVM_RISCV_ISA_EXT_ZBB,
> > >
> > > Looks like this patch is also based on "[PATCH] RISC-V: KVM: Allow Zbb
> > > extension for Guest/VM"
> > 
> > Yes, do you want me to change the order of dependency?
> 
> It's probably best if neither depend on each other, since they're
> independent, but otherwise the order doesn't matter. It'd be nice to call
> the order out in the cover letter to give patchwork a chance at automatic
> build testing, though. To call it out, I believe adding
> 
> Based-on: 20230401112730.2105240-1-apatel at ventanamicro.com
> 
> to the cover letter should work.

I also just noticed that this based on "RISC-V: KVM: Add ONE_REG
interface to enable/disable SBI extensions"[1] and it needs to be
in order to pick up the KVM_REG_RISCV_SUBTYPE_MASK and
KVM_REG_RISCV_SUBTYPE_SHIFT defines. It'd be good to call that
patch out with Based-on.

[1]: 20230331174542.2067560-2-apatel at ventanamicro.com

Thanks,
drew

