From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 20 Dec 2023 07:32:10 +0100
Subject: [PATCH v3 07/13] RISC-V: KVM: Add support for SBI extension
 registers
In-Reply-To: <CAK9=C2XQb3=PbU+Ggpp1jEnDbc-DER+eEY9j=w8w=_6DNjcdDg@mail.gmail.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
 <20231217204019.36492-22-ajones@ventanamicro.com>
 <CAOnJCU+h_ed-x7L5oFwWTWoKAq8M3Vk8XUQo1-jhPPaty5Y7Jg@mail.gmail.com>
 <CAK9=C2XQb3=PbU+Ggpp1jEnDbc-DER+eEY9j=w8w=_6DNjcdDg@mail.gmail.com>
Message-ID: <20231220-b68357fb121f79bec9dd1a24@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 20, 2023 at 11:49:46AM +0530, Anup Patel wrote:
> On Wed, Dec 20, 2023 at 1:28?AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Sun, Dec 17, 2023 at 12:40?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > Some SBI extensions have state that needs to be saved / restored
> > > when migrating the VM. Provide a get/set-one-reg register type
> > > for SBI extension registers. Each SBI extension that uses this type
> > > will have its own subtype. There are currently no subtypes defined.
> > > The next patch introduces the first one.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++
> > >  arch/riscv/include/uapi/asm/kvm.h     |  3 ++
> > >  arch/riscv/kvm/vcpu_onereg.c          | 42 +++++++++++++++++--
> > >  arch/riscv/kvm/vcpu_sbi.c             | 58 +++++++++++++++++++++++++++
> > >  4 files changed, 103 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > index 99c23bb37a37..dd60f73b5c36 100644
> > > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > > @@ -60,6 +60,10 @@ int kvm_riscv_vcpu_set_reg_sbi_ext(struct kvm_vcpu *vcpu,
> > >                                    const struct kvm_one_reg *reg);
> > >  int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
> > >                                    const struct kvm_one_reg *reg);
> > > +int kvm_riscv_vcpu_set_reg_sbi(struct kvm_vcpu *vcpu,
> > > +                              const struct kvm_one_reg *reg);
> > > +int kvm_riscv_vcpu_get_reg_sbi(struct kvm_vcpu *vcpu,
> > > +                              const struct kvm_one_reg *reg);
> > >  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
> > >                                 struct kvm_vcpu *vcpu, unsigned long extid);
> > >  bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
> > > diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> > > index e961d79622fb..30f89a0e855f 100644
> > > --- a/arch/riscv/include/uapi/asm/kvm.h
> > > +++ b/arch/riscv/include/uapi/asm/kvm.h
> > > @@ -242,6 +242,9 @@ enum KVM_RISCV_SBI_EXT_ID {
> > >  #define KVM_REG_RISCV_VECTOR_REG(n)    \
> > >                 ((n) + sizeof(struct __riscv_v_ext_state) / sizeof(unsigned long))
> > >
> > > +/* Registers for specific SBI extensions are mapped as type 10 */
> > > +#define KVM_REG_RISCV_SBI              (0x0a << KVM_REG_RISCV_TYPE_SHIFT)
> > > +
> >
> >
> > nit comment: KVM_REG_RISCV_SBI looks bit odd when we already have
> > KVM_REG_RISCV_SBI_EXT for
> > extension enabling/disabling.
> >
> > How about renaming this to KVM_REG_RISCV_SBI_EXT_STATE or something
> > similar indicate that this
> > for a specific extension state ?
> 
> How about KVM_REG_RISCV_SBI_STATE  ?

Also works for me.

Thanks,
drew

