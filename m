From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 22 May 2023 11:28:58 +0200
Subject: [PATCH 3/3] RISC-V: KVM: Introduce extension_enabled
In-Reply-To: <CAAhSdy0e5Uc0LP3YOy5Lz7hh4G7pSn70pLXSicy7aj6v90C00Q@mail.gmail.com>
References: <20230426171328.69663-1-ajones@ventanamicro.com>
 <20230426171328.69663-4-ajones@ventanamicro.com>
 <CAAhSdy0e5Uc0LP3YOy5Lz7hh4G7pSn70pLXSicy7aj6v90C00Q@mail.gmail.com>
Message-ID: <20230522-4612f847d03e6e281e7ef84f@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 19, 2023 at 08:35:31PM +0530, Anup Patel wrote:
> On Wed, Apr 26, 2023 at 10:43?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > We need three SBI extension status values (uninitialized, enabled,
> > and disabled). Pairing another boolean array, extension_enabled[],
> > with the boolean array extension_disabled[] provides four states.
> > Using a pair of boolean arrays, which may eventually be changed to
> > a pair of bitmaps, is more space efficient than using one enum
> > status field. Apply the new (enabled=1,disabled=0) state, which
> > means either the extension doesn't have a probe function or that
> > its probe was successful, to avoid more than one probe of the
> > extension.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
> >  arch/riscv/kvm/vcpu_sbi.c             | 11 ++++++++++-
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > index 4278125a38a5..e3c5e1d15e93 100644
> > --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> > @@ -16,6 +16,15 @@
> >
> >  struct kvm_vcpu_sbi_context {
> >         int return_handled;
> > +       /*
> > +        * extension_enabled[] and extension_disabled[] provide SBI
> > +        * extensions four status values, of which we need three:
> > +        * (0,0) uninitialized, (1,0) enabled, (0,1) disabled. Using
> > +        * a pair of boolean arrays, which may eventually be changed
> > +        * to a pair of bitmaps, is more space efficient than using
> > +        * one enum status field.
> > +        */
> > +       bool extension_enabled[KVM_RISCV_SBI_EXT_MAX];
> 
> The extension_enabled[] is not an appropriate name.
> 
> How about extension_probe_allowed[] ?

"probe allowed" sounds to me like "we may call probe", but the meaning we
want is "we've already called probe and it succeeded, so the extension
is available" (or that we don't have probe, meaning the extension is
assumed available). I prefer 'available' for extensions over 'enabled',
but we already have 'disabled', so 'enabled' appeared to fit better.
Actually, it's probably best to improve the readability and simplicity,
at the expense of size, by dropping both the extension_enabled and
extension_disabled boolean arrays and switching to an 'extension_status'
enum, where we have SBI_EXT_UNINITIALIZED, SBI_EXT_AVAILABLE, and
SBI_EXT_UNAVAILABLE.

Thanks,
drew


> 
> Any better name ?
> 
> Regards,
> Anup
> 
> >         bool extension_disabled[KVM_RISCV_SBI_EXT_MAX];
> >  };
> >
> > diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> > index a1a82f0fbad2..344d38bbe06a 100644
> > --- a/arch/riscv/kvm/vcpu_sbi.c
> > +++ b/arch/riscv/kvm/vcpu_sbi.c
> > @@ -155,6 +155,12 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
> >         if (!sext)
> >                 return -ENOENT;
> >
> > +       /*
> > +        * We can't set scontext->extension_enabled[] to reg_val since the
> > +        * extension may have a probe() function which needs to confirm
> > +        * enablement first. Only set extension_disabled[] here and leave
> > +        * the extension_enabled[] setting to kvm_vcpu_sbi_find_ext().
> > +        */
> >         scontext->extension_disabled[sext->ext_idx] = !reg_val;
> >
> >         return 0;
> > @@ -317,7 +323,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
> >                 ext = entry->ext_ptr;
> >
> >                 if (ext->extid_start <= extid && ext->extid_end >= extid) {
> > -                       if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX)
> > +                       if (entry->ext_idx >= KVM_RISCV_SBI_EXT_MAX ||
> > +                           scontext->extension_enabled[entry->ext_idx])
> >                                 return ext;
> >                         if (scontext->extension_disabled[entry->ext_idx])
> >                                 return NULL;
> > @@ -325,6 +332,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
> >                                 scontext->extension_disabled[entry->ext_idx] = true;
> >                                 return NULL;
> >                         }
> > +
> > +                       scontext->extension_enabled[entry->ext_idx] = true;
> >                         return ext;
> >                 }
> >         }
> > --
> > 2.39.2
> >

