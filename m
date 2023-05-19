From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 May 2023 20:32:59 +0530
Subject: [PATCH 1/3] RISC-V: KVM: Disable SBI extension when its probe fails
In-Reply-To: <CAAhSdy2_SO5C=aofct0ZYzivcEJmti3e69Pivy0PKEhOyXZ-jw@mail.gmail.com>
References: <20230426171328.69663-1-ajones@ventanamicro.com>
 <20230426171328.69663-2-ajones@ventanamicro.com> <CAAhSdy2_SO5C=aofct0ZYzivcEJmti3e69Pivy0PKEhOyXZ-jw@mail.gmail.com>
Message-ID: <CAAhSdy3fi0vk7fLTL=0kL-nYgTEzQ0iBx=4BBDbeuR4WmJgNFw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 19, 2023 at 8:27?PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Apr 26, 2023 at 10:43?PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > When an SBI extension specific probe function exists and fails, then
> > use the extension_disabled context to disable the extension. This
> > ensures the extension's functions cannot be invoked. Doing the
> > disabling in kvm_vcpu_sbi_find_ext() allows it to be done lazily
> > on its first use. Checking extension_disabled prior to probing
> > ensures the probe is only executed once for disabled extensions.
> > Later patches ensure we only execute probe once for enabled
> > extensions as well.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/kvm/vcpu_sbi.c | 23 +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> > index e52fde504433..aa3c126d2e3c 100644
> > --- a/arch/riscv/kvm/vcpu_sbi.c
> > +++ b/arch/riscv/kvm/vcpu_sbi.c
> > @@ -307,18 +307,25 @@ int kvm_riscv_vcpu_get_reg_sbi_ext(struct kvm_vcpu *vcpu,
> >  const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
> >                                 struct kvm_vcpu *vcpu, unsigned long extid)
> >  {
> > -       int i;
> > -       const struct kvm_riscv_sbi_extension_entry *sext;
> >         struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> > +       const struct kvm_riscv_sbi_extension_entry *entry;
> > +       const struct kvm_vcpu_sbi_extension *ext;
> > +       int i;
> >
> >         for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> > -               sext = &sbi_ext[i];
> > -               if (sext->ext_ptr->extid_start <= extid &&
> > -                   sext->ext_ptr->extid_end >= extid) {
> > -                       if (sext->dis_idx < KVM_RISCV_SBI_EXT_MAX &&
> > -                           scontext->extension_disabled[sext->dis_idx])
> > +               entry = &sbi_ext[i];
> > +               ext = entry->ext_ptr;
> > +
> > +               if (ext->extid_start <= extid && ext->extid_end >= extid) {
> > +                       if (entry->dis_idx >= KVM_RISCV_SBI_EXT_MAX)
> > +                               return ext;
> > +                       if (scontext->extension_disabled[entry->dis_idx])
> > +                               return NULL;
> > +                       if (ext->probe && !ext->probe(vcpu)) {
>
> Calling probe() upon every kvm_vcpu_sbi_find_ext() will simply slow down
> all SBI calls.
>
> How about caching probe return values in "struct kvm_vcpu_sbi_context"
> as an array?
>
> Maybe we can have two arrays:
> 1) probe_done[] : Boolean array to check whether probe was done.
> 2) probe_retval[] : Cached probe() return values.
>
> The SBI_EXT_BASE_PROBE_EXT call should also return the
> cached value.

Ignore this comment. Your PATCH3 does the same thing.

Regards,
Anup

>
> > +                               scontext->extension_disabled[entry->dis_idx] = true;
> >                                 return NULL;
> > -                       return sbi_ext[i].ext_ptr;
> > +                       }
> > +                       return ext;
> >                 }
> >         }
> >
> > --
> > 2.39.2
> >
>
> Regards,
> Anup

